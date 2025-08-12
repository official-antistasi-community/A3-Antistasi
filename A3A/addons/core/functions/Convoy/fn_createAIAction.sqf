#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
params ["_destination", "_type", "_side", ["_arguments", []]];

/*  Handles the creation of any AI Action
*   Params
*     _destination : MARKER or POS; the marker or position the AI should take AI on
*     _type : STRING; (not case sensitive) one of "ATTACK", "PATROL", "REINFORCE", "CONVOY", "AIRSTRIKE" more to add
*     _side : SIDE; the side of the AI forces to send
*     _arguments : ARRAY; any further argument needed for the operation
*        -here should be some manual for each _type, but it is currently unfinished
*   Returns:
*     Nothing
*/
private _faction = Faction(_side);

if(!serverInitDone) then
{
    Debug("CreateAIAction: Waiting for server init to be completed!");
  waitUntil {sleep 1; serverInitDone};
};

if(isNil "_destination") exitWith {Error("CreateAIAction: No destination given for AI Action");};
_acceptedTypes = ["attack", "patrol", "reinforce", "convoy", "airstrike"];
if(isNil "_type" || {!((toLower _type) in _acceptedTypes)}) exitWith {Error("CreateAIAction: Type is not in the accepted types")};
if(isNil "_side" || {!(_side == Occupants || _side == Invaders)}) exitWith {Error("CreateAIAction: Can only create AI for Inv and Occ")};

_convoyID = round (random 1000);
_IDinUse = server getVariable [format ["Con%1", _convoyID], false];
sleep 0.1;
while {_IDinUse} do
{
  _convoyID = round (random 1000);
  _IDinUse = server getVariable [format ["Con%1", _convoyID], false];
};
server setVariable [format ["Con%1", _convoyID], true, true];

_convoyID spawn
{
  sleep (30 * 60);
  server setVariable [format ["Con%1", _this], nil, true];
};

_type = toLower _type;
_isMarker = _destination isEqualType "";
_targetString = if(_isMarker) then {_destination} else {str _destination};
Debug_3("CreateAIAction[%1]: Started creation of %2 action to %3", _convoyID, _type, _targetString);

_nearestMarker = if(_isMarker) then {_destination} else {[markersX,_destination] call BIS_fnc_nearestPosition};
if ([_nearestMarker,false] call A3A_fnc_fogCheck < 0.3) exitWith
{
    Debug_2("CreateAIAction[%1]: AI Action on %2 cancelled because of heavy fog", _convoyID, _targetString);
  server setVariable [format ["Con%1", _convoyID], nil, true];
};

_abort = false;
_attackDistance = distanceSPWN2;
if (_isMarker) then
{
  if(_destination in attackMrk) then {_abort = true};
}
else
{
  if(count attackPos != 0) then
  {
    _nearestAttack = [attackPos, _destination] call BIS_fnc_nearestPosition;
    if ((_nearestAttack distance _destination) < _attackDistance) then {_abort = true;};
  }
  else
  {
    if(count attackMrk != 0) then
    {
      _nearestAttack = [attackMrk, _destination] call BIS_fnc_nearestPosition;
      if (getMarkerPos _nearestAttack distance _destination < _attackDistance) then {_abort = true};
    };
  };
};
if(_abort) exitWith
{
    Debug_1("CreateAIAction[%1]: Aborting creation of AI action because, there is already a action close by!", _convoyID);
  server setVariable [format ["Con%1", _convoyID], nil, true];
};

//TODO rebalance that somehow
/*
_allUnits = {(local _x) and (alive _x)} count allUnits;
_allUnitsSide = 0;
_maxUnitsSide = maxUnits;

if (gameMode <3) then
{
	_allUnitsSide = {(local _x) and (alive _x) and (side group _x == _side)} count allUnits;
	_maxUnitsSide = round (maxUnits * 0.7);
};
if ((_allUnits + 4 > maxUnits) or (_allUnitsSide + 4 > _maxUnitsSide)) then {_abort = true};

if (_abort) exitWith {Debug_2("CreateAIAction[%1]: AI action cancelled because of reaching the maximum of units on attacking %2", _convoyID, _destination)};
*/


_destinationPos = if(_isMarker) then {getMarkerPos _destination} else {_destination};
_originPos = [];
_origin = "";
_units = [];
_vehicleCount = 0;
_cargoCount = 0;
if(_type == "patrol") then
{
  //TODO rework the origin selection!!
  _threatEvalLand = [_destinationPos, _side] call A3A_fnc_landThreatEval;
	_airportsX = airportsX select {(sidesX getVariable [_x,sideUnknown] == _side) and ([_x,true] call A3A_fnc_airportCanAttack) and (getMarkerPos _x distance2D _destinationPos < distanceForAirAttack)};
	if (A3A_hasIFA and (_threatEvalLand <= 15)) then {_airportsX = _airportsX select {(getMarkerPos _x distance2D _destinationPos < distanceForLandAttack)}};
	_outposts = if (_threatEvalLand <= 15) then {outposts select {(sidesX getVariable [_x,sideUnknown] == _side) and ([_destinationPos, getMarkerPos _x] call A3A_fnc_arePositionsConnected) and (getMarkerPos _x distance _destinationPos < distanceForLandAttack)  and ([_x,true] call A3A_fnc_airportCanAttack)}} else {[]};
	_airportsX = _airportsX + _outposts;
  if (_isMarker) then
	{
		if (_markerX in blackListDest) then
		{
			_airportsX = _airportsX - outposts;
		};
		_airportsX = _airportsX - [_markerX];
		_airportsX = _airportsX select {({_x == _markerX} count (killZones getVariable [_x,[]])) < 3};
	}
	else
	{
		if (!_super) then
		{
			_siteX = [(resourcesX + factories + airportsX + outposts + seaports),_posDestination] call BIS_fnc_nearestPosition;
			_airportsX = _airportsX select {({_x == _siteX} count (killZones getVariable [_x,[]])) < 3};
		};
	};
	if (_airportsX isEqualTo []) then
	{
		_exit = true;
	}
	else
	{
		_origin = [_airportsX,_posDestination] call BIS_fnc_nearestPosition;
		_originPos = getMarkerPos _origin;
	};
  if (!_exit) then
  {
    //This line detects air or land attack
    _isLand =
    (
      (_threatEvalLand <= 15) &&
      {(_originPos distance _destinationPos < distanceForLandAttack) &&
      {([_originPos, _destinationPos] call A3A_fnc_arePositionsConnected)}}
    );
    if(_isLand) then
    {
      if (_origin in outposts) then {[_origin, 10] call A3A_fnc_addTimeForIdle} else {[_origin, 5] call A3A_fnc_addTimeForIdle};
      _count = 1;
      _vehPool = [];
      //Select vehicle count and pool
      switch (true) do
      {
        case (tierWar < 3):
        {
          _count = 1;
          _vehPool = (_faction get "vehiclesLightArmed") + (_faction get "vehiclesLightUnarmed");
        };
        case (tierWar < 6 && {tierWar > 2}):
        {
          _count = 2 + (round (random 1));
          _vehPool = (_faction get "vehiclesLightArmed") + (_faction get "vehiclesAPCs");
        };
        case (tierWar > 5):
        {
          _count = 3 + (round (random 2));
          _vehPool = (_faction get "vehiclesAPCs") + (_faction get "vehiclesTanks");
        };
      };

      for "_i" from 1 to _count do
      {
        _veh = [_vehPool, _side] call A3A_fnc_selectAndCreateVehicle;
        _vehPool = _veh select 1;
        _units pushBack (_veh select 0);
        _vehicleCount = _vehicleCount + 1;
        _cargoCount = _cargoCount + count ((_veh select 0) select 1) + count ((_veh select 0) select 2);
      };
    }
    else
    {
      [_origin, 10] call A3A_fnc_addTimeForIdle;
      _count = if(_isMarker) then {1 + (round (random 1))} else {1};
      _vehPool = [];
      switch (true) do
      {
        case (tierWar < 3):
        {
          _vehPool = _faction get "vehiclesHelisLight";
        };
        case (tierWar > 2 && tierWar < 7):
        {
          _vehPool = (_faction get "vehiclesHelisLight") + (_faction get "vehiclesHelisTransport");
        };
        case (tierWar > 6):
        {
          _vehPool = _faction get "vehiclesHelisAttack";
        };
      };
      for "_i" from 1 to _count do
      {
        _veh = [_vehPool, _side, true] call A3A_fnc_selectAndCreateVehicle;
        _vehPool = _veh select 1;
        _units pushBack (_veh select 0);
        _vehicleCount = _vehicleCount + 1;
        _cargoCount = _cargoCount + count ((_veh select 0) select 1) + count ((_veh select 0) select 2);
      };
    };
  }
  else
  {
      Debug_1("CreateAIAction[%1]: Patrol aborted as no base is available!", _convoyID);
    _abort = true;
  };
};
if(_type == "reinforce") then
{
  _arguments params ["_canReinf"];
  _possibleBases = _canReinf select {[_x, _destination] call A3A_fnc_shouldReinforce};
  if((count _possibleBases) != 0) then
  {

    _selectedBase = [_possibleBases, _destination] call BIS_fnc_nearestPosition;
    //Found base to reinforce, selecting units now
    _units = [_selectedBase, _destination] call A3A_fnc_selectReinfUnits;

    if(_units isEqualTo []) then
    {
      Error_1("CreateAIAction[%1]: No units given for reinforcements!", _convoyID);
      _abort = true;
    }
    else
    {
      _origin = _selectedBase;
      _originPos = getMarkerPos _origin;

      _countUnits = [_units, false] call A3A_fnc_countGarrison;

      _vehicleCount = _vehicleCount + (_countUnits select 0);
      _cargoCount = _cargoCount + (_countUnits select 1) + (_countUnits select 2);

      //For debug is direct placement
      //Trace_2("Reinforce %1 from %2", _target, _selectedBase);
      //VerboseArray("Reinf units", _units);
      //[_target, _units] call A3A_fnc_addGarrison;
    };
  }
  else
  {
      Debug_1("CreateAIAction[%1]: Reinforcement aborted as no base is available!", _convoyID);
    _abort = true;
  };
};
if(_type == "attack") then
{

};
if(_type == "airstrike") then
{
  _airport = [_destination, _side] call A3A_fnc_findAirportForAirstrike;
  if(_airport != "") then
  {
    _friendlies = if (_side == Occupants) then
    {
      allUnits select
      {
        (alive _x) &&
        {((side (group _x) == _side) || (side (group _x) == civilian)) &&
        {_x distance _destinationPos < 200}}
      };
    }
    else
    {
      allUnits select
      {
        (side (group _x) == _side) &&
        {(_x distance _destinationPos < 100) &&
        {[_x] call A3A_fnc_canFight}}
      };
    };
    //NATO accepts 2 casulties, CSAT does not really care
    if((_side == Occupants && {count _friendlies < 3}) || {_side == Invaders && {count _friendlies < 8}}) then
    {
      _plane = selectRandom (_faction get "vehiclesPlanesCAS");
      _crewUnits = _faction get "unitPilot";
    	if ([_plane] call A3A_fnc_vehAvailable) then
    	{
        _bombType = "";
        if(count _arguments != 0) then
        {
          _bombType = _arguments select 0;
        }
        else
        {
          _distanceSpawn2 = distanceSPWN2;
          _enemies = allUnits select
          {
            (alive _x) &&
            {(_x distance _destinationPos < _distanceSpawn2) &&
            {(side (group _x) != _side) and (side (group _x) != civilian)}}
          };
          if(isNil "napalmEnabled") then
          {
            //This seems to be a merge bug
            Error("CreateAIAction: napalmEnabled does not contains a value, assuming false!");
            napalmEnabled = false;
          };
          _bombType = if (napalmEnabled) then {"NAPALM"} else {"CLUSTER"};
    			{
    			  if (vehicle _x isKindOf "Tank") then
    				{
    				   _bombType = "HE" //Why should it attack tanks with HE?? TODO find better solution
    				}
    			  else
    				{
    				  if (vehicle _x != _x) then
    					{
    					  if !(vehicle _x isKindOf "StaticWeapon") then {_bombType = "CLUSTER"}; //TODO test if vehicle _x isKindOf Static is not also vehicle _x != _x
    					};
    				};
    			  if (_bombTypeX == "HE") exitWith {};
    			} forEach _enemies;
        };
        if (!_isMarker) then {airstrike pushBack _destinationPos};
        Debug_3("CreateAIAction[%1]: Selected airstrike of bombType %2 from %3",_convoyID, _bombType, _airport);
        _origin = _airport;
        _originPos = getMarkerPos _airport;
        _units pushBack [_plane, [_crewUnits],[]];
        _vehicleCount = 1;
        _cargoCount = 1;
      }
      else
      {
          Debug_1("CreateAIAction[%1]: Aborting airstrike as the airplane is currently not available", _convoyID);
        _abort = true;
      };
    }
    else
    {
        Debug_1("CreateAIAction[%1]: Aborting airstrike, cause there are too many friendly units in the area", _convoyID);
      _abort = true;
    };
  }
  else
  {
      Debug_1("CreateAIAction[%1]: Aborting airstrike due to no avialable airport", _convoyID);
    _abort = true;
  };
};
if(_type == "convoy") then
{
  //Heavy will call in more and better vehicles
  _isHeavy = if (random 10 < tierWar) then {true} else {false};
  //Easy will call in only FIA (police) vehicles (We really have to rename this)
  _isEasy = if (!(_isHeavy) && {_side == Occupants && {random 10 >= tierWar}}) then {true} else {false};
  _sideCheck = sidesX getVariable [_destination, sideUnknown];
  if(_sideCheck == _side) then
  {
    _origin = [_destination] call A3A_fnc_findBasesForConvoy;
    _originPos = getMarkerPos _origin;
    if(!_abort && !(_origin isEqualTo "")) then
    {
      _typeConvoy = [];
      if ((_destination in airportsX) or (_destination in outposts)) then
      {
      	_typeConvoy = ["Ammunition","Armor"];
        /* Reinforcement convoys will be standard not a special mission
      	if (_destination in outposts) then
        {
          //That doesn't make sense, or am I wrong? Can someone double check this logic?
          if (((count (garrison getVariable [_destination, []]))/2) >= [_destinationX] call A3A_fnc_garrisonSize) then
          {
            _typeConvoy pushBack "Reinforcements";
          };
        };
        */
      }
      else
      {
      	if (_destination in citiesX) then
      	{
          _typeConvoy = ["Supplies"];
      	}
      	else
      	{
      		if ((_destinationX in resourcesX) or (_destinationX in factories)) then
          {
            _typeConvoy = ["Money"];
          }
          else
          {
            _typeConvoy = ["Prisoners"];
          };
          //Same here, not sure about it
      		if (((count (garrison getVariable [_destinationX, []]))/2) >= [_destinationX] call A3A_fnc_garrisonSize) then
          {
            _typeConvoy pushBack "Reinforcements"
          };
      	};
    	};
      _selectedType = selectRandom _typeConvoy;

      private ["_timeLimit", "_dateLimitNum", "_displayTime", "_nameDest", "_nameOrigin" ,"_timeToFinish", "_dateFinal"];
      //The time the convoy will wait before starting
      _timeLimit = if (_isHeavy) then {0} else {round random 10};// timeX for the convoy to come out, we should put a random round 15

      _timeToFinish = 120;
      _dateTemp = date;
      _dateFinal = [_dateTemp select 0, _dateTemp select 1, _dateTemp select 2, _dateTemp select 3, (_dateTemp select 4) + _timeToFinish];
      _dateLimit = [_dateTemp select 0, _dateTemp select 1, _dateTemp select 2, _dateTemp select 3, (_dateTemp select 4) + _timeLimit];
      _dateLimitNum = dateToNumber _dateLimit;
      _dateLimit = numberToDate [_dateTemp select 0, _dateLimitNum];//converts datenumber back to date array so that time formats correctly when put through the function
      _displayTime = [_dateLimit] call A3A_fnc_dateToTimeString;//Converts the time portion of the date array to a string for clarity in hints

      _nameDest = [_destination] call A3A_fnc_localizar;
      _nameOrigin = [_origin] call A3A_fnc_localizar;
      [_origin, 30] call A3A_fnc_addTimeForIdle;

      private ["_text", "_taskState", "_taskTitle", "_taskIcon", "_taskState1", "_typeVehEsc", "_typeVehObj", "_typeVehLead"];

      _text = "";
      _taskState = "CREATED";
      _taskTitle = "";
      _taskIcon = "";
      _taskState1 = "CREATED";

      _typeVehLead = "";
      _typeVehEsc = "";
      _typeVehObj = "";

      switch (_selectedType) do
      {
      	case "Ammunition":
      	{
      		_text = format [localize "STR_A3A_fn_convoy_craiact_ammo_text",_nameOrigin,_displayTime,_nameDest];
      		_taskTitle = localize "STR_A3A_fn_convoy_craiact_ammo_title";
      		_taskIcon = "rearm";
      		_typeVehObj = selectRandom (_faction get "vehiclesAmmoTrucks");
      	};
      	case "Armor":
      	{
      		_text = format [localize "STR_A3A_fn_convoy_craiact_armored_text",_nameOrigin,_displayTime,_nameDest];
      		_taskTitle = localize "STR_A3A_fn_convoy_craiact_armored_title";
      		_taskIcon = "Destroy";
      		_typeVehObj = selectRandom (_faction get "vehiclesAA");
      	};
      	case "Prisoners":
      	{
      		_text = format [localize "STR_A3A_fn_convoy_craiact_prison_text",_nameOrigin,_displayTime,_nameDest];
      		_taskTitle = localize "STR_A3A_fn_convoy_craiact_prison_title";
      		_taskIcon = "run";
      		_typeVehObj = selectRandom (_faction get "vehiclesTrucks");
      	};
      	case "Reinforcements":
      	{
      		_text = format [localize "STR_A3A_fn_convoy_craiact_reinf_text",_nameOrigin,_displayTime,_nameDest];
      		_taskTitle = localize "STR_A3A_fn_convoy_craiact_reinf_title";
      		_taskIcon = "run";
      		_typeVehObj = selectRandom (_faction get "vehiclesTrucks");
      	};
      	case "Money":
      	{
      		_text = format [localize "STR_A3A_fn_convoy_craiact_money_text",_nameOrigin,_displayTime,_nameDest];
      		_taskTitle = localize "STR_A3A_fn_convoy_craiact_money_title";
      		_taskIcon = "move";
      		_typeVehObj = selectRandom (FactionGet(reb, "vehiclesCivSupply"));
      	};
      	case "Supplies":
      	{
      		_text = format [localize "STR_A3A_fn_convoy_craiact_supply_text",_nameOrigin,_displayTime,_nameDest,FactionGet(reb,"name")];
      		_taskTitle = localize "STR_A3A_fn_convoy_craiact_supply_title";
      		_taskIcon = "heal";
      		_typeVehObj = selectRandom (FactionGet(reb, "vehiclesCivSupply"));
      	};
        default
        {
            Debug_2("CreateAIAction[%1]: Aborting convoy, selected type not found, type was %2", _convoyID, _selectedType);
          _abort = true;
        };
      };
      if(!_abort) then
      {
        //Deactivated, cause you can't win this mission currently
//      [[teamPlayer,civilian],"CONVOY",[_text,_taskTitle,_destination], _destinationPos,false,0,true,_taskIcon,true] call BIS_fnc_taskCreate;
//      [[_side],"CONVOY1",[format ["A convoy from %1 to %3, it's about to depart at %2. Protect it from any possible attack.",_nameOrigin,_displayTime,_nameDest],"Protect Convoy",_destination],_destinationPos,false,0,true,"run",true] call BIS_fnc_taskCreate;
//      missionsX pushBack ["CONVOY","CREATED"]; publicVariable "missionsX";

        sleep (_timeLimit * 60);
        _crewUnits = _faction get "unitCrew";

        //Creating convoy lead vehicle
        _typeVehLead = if (_side == Occupants && _isEasy) then {_faction get "vehiclesPolice"} else {selectRandom (_faction get "vehiclesLightArmed")};
        _crew = [_typeVehLead, _crewUnits] call A3A_fnc_getVehicleCrew;
        _units pushBack [_typeVehLead, _crew, []];
        _vehicleCount = _vehicleCount + 1;
        _cargoCount = _cargoCount + (count _crew);
        //Convoy lead created

        //Prepared vehicle pool
        private _count = 1;
        if (_isHeavy) then
        {
          _count = 3;
        }
        else
        {
          if ([_destination] call A3A_fnc_isFrontline) then
          {
            _count = (round random 2) + 1;
          };
        };

        _vehPool = if (_side == Occupants && !_isEasy) then
        {
            (_faction get "vehiclesMilitiaLightArmed")
            + (_faction get "vehiclesMilitiaTrucks")
            + (_faction get "vehiclesMilitiaCars")
        }
        else
        {
          (_faction get "vehiclesAPCs") + (_faction get "vehiclesTanks")
        };

        //Delete MBT from array if aggro is not high enough
        if (!_isEasy) then
        {
            if (random 100 > ([aggressionOccupants, aggressionInvaders] select (_side isEqualTo Invaders)) ) then {
                _vehPool = _vehPool - (_faction get "vehiclesTanks");
            };
        	if (count _vehPool == 0) then {_vehPool = _faction get "vehiclesTrucks"};
        };
        //Vehicle pool prepared

        //Select escort vehicles and their groups
        for "_i" from 1 to _count do
        {
          _veh = [_vehPool, _side] call A3A_fnc_selectAndCreateVehicle;
          _vehPool = _veh select 1;
          _units pushBack (_veh select 0);
          _vehicleCount = _vehicleCount + 1;
          _cargoCount = _cargoCount + count ((_veh select 0) select 1) + count ((_veh select 0) select 2);
        };
        //Escorts and groups added

        //Add objective vehicle and cargo
        _typeGroup = [];
        if(_selectedType == "Reinforcements") then
        {
          _typeGroup = [_typeVehObj,_side] call A3A_fnc_cargoSeats;
        };
        if(_selectedType == "Prisoners") then
        {
          for "_i" from 1 to (1 + round (random 11)) do
          {
            _typeGroup pushBack FactionGet(reb,"unitUnarmed");
          };
        };
        _crew = [_typeVehObj, _crewUnits] call A3A_fnc_getVehicleCrew;
        _units pushBack [_typeVehObj, _crew, _typeGroup];
        _vehicleCount = _vehicleCount + 1;
        _cargoCount = _cargoCount + (count _typeGroup) + (count _crew);
        //Objective and its cargo added

        //Last escort vehicle
        _veh = [_vehPool, _side] call A3A_fnc_selectAndCreateVehicle;
        _vehPool = _veh select 1;
        _units pushBack (_veh select 0);
        _vehicleCount = _vehicleCount + 1;
        _cargoCount = _cargoCount + count ((_veh select 0) select 1) + count ((_veh select 0) select 2);
        //Last escrot vehicle added
      };
    }
    else
    {
        Debug_1("CreateAIAction[%1]: Aborting convoy, as no base is available to send a convoy", _convoyID);
      _abort = true;
    };
  }
  else
  {
      Debug_1("CreateAIAction[%1]: Side of convoy does not match side of destination, aborting!", _convoyID);
    _abort = true;
  };
};

if(_abort) exitWith
{
  server setVariable [format ["Con%1", _convoyID], nil, true];
  false
};

_target = if(_destination isEqualType "") then {_destination} else {str _destination};
Info_6("CreateAIAction[%1]: Created AI action to %2 from %3 to %4 with %5 vehicles and %6 units", _convoyID, _type, _origin, _targetString, _vehicleCount , _cargoCount);

[_convoyID, _units, _originPos, _destinationPos, [_origin, if(_isMarker) then {_destination} else {""}], _type, _side] spawn A3A_fnc_createConvoy;
true;
