#include "..\..\Includes\common.inc"
FIX_LINE_NUMBERS()
params ["_marker", "_patrolMarker", "_flag", "_box"];

if(isNil "_marker") exitWith {Error("No marker given!")};

private ["_side", "_garrison", "_unitX", "_allSoldiers", "_allVehicles", "_allGroups", "_groupX", "_vehicleType", "_crewArray", "_cargoArray", "_skip"];

_side = sidesX getVariable [_marker, sideUnknown];
if(_side == sideUnknown) exitWith {Error("Marker side resulted in sideUnknown!")};

Debug("Spawning in now!");

_garrison = [_marker] call A3A_fnc_getGarrison;
_garCount = [_garrison, false] call A3A_fnc_countGarrison;
_patrolSize = [_patrolMarker] call A3A_fnc_calculateMarkerArea;

[_garrison, "Garrison"] call A3A_fnc_logArray;

_allSoldiers = [];
_allVehicles = [];
_allGroups = [];
private _stayGroups = [];
private _patrolGroups = [];

_lineIndex = 0;
{
  _vehicleType = _x select 0;
  _crewArray = _x select 1;
  _cargoArray = _x select 2;
  _groupX = createGroup _side;
  _allGroups pushBack _groupX;
  private _skip = false;

  if (_vehicleType != "") then
  {
    //Array got a vehicle, spawn it in
    private _spawnParameter = [];
    if(_vehicleType isKindOf "Car") then
    {
      _spawnParameter = [_marker, "Vehicle"] call A3A_fnc_findSpawnPosition;
    };
    if(_vehicleType isKindOf "Helicopter") then
    {
      _spawnParameter = [_marker, "Heli"] call A3A_fnc_findSpawnPosition;
    };
    if(_vehicleType isKindOf "Plane") then
    {
      _spawnParameter = [_marker, "Plane"] call A3A_fnc_findSpawnPosition;
    };
    //_spawnParameter = [getMarkerPos _marker, 0];
    if(_spawnParameter isEqualType []) then
    {
      _vehicle = createVehicle [_vehicleType, _spawnParameter select 0, [], 0 , "CAN_COLLIDE"];
      _vehicle allowDamage false;
      [_vehicle] spawn
      {
        sleep 3;
        (_this select 0) allowDamage true;
      };
      _vehicle setDir (_spawnParameter select 1);
      _allVehicles pushBack _vehicle;
      _groupX addVehicle _vehicle;

      //Should work as a local variable needs testing
      _vehicle setVariable ["UnitIndex", (_lineIndex * 10 + 0)];
      _vehicle setVariable ["UnitMarker", _marker];

      //On vehicle death, remove it from garrison
      _vehicle addEventHandler ["Killed",
        {
          _vehicle = _this select 0;
          _id = _vehicle getVariable "UnitIndex";
          _marker = _vehicle getVariable "UnitMarker";
          [_marker, typeOf _vehicle, _id] call A3A_fnc_addRequested;
        }
      ];
      sleep 0.25;
      //That would work perfectly with the breach script i did a PR for, without it it would just frustrate player
      //_vehicle lock 3;
    }
    else
    {
      _skip = true;
    };
  };

  if(!_skip) then
  {
    _spawnParameter = [getMarkerPos _marker, objNull];
    {
      _unitX = [_groupX, _x, (_spawnParameter select 0), [], 5, "NONE"] call A3A_fnc_createUnit;
      _allSoldiers pushBack _unitX;
        //Should work as a local variable needs testing
      _unitX setVariable ["UnitIndex", (_lineIndex * 10 + 1)];
        _unitX setVariable ["UnitMarker", _marker];

        //On vehicle death, remove it from garrison
        _unitX addEventHandler ["Killed",
          {
            _unitX = _this select 0;
            _id = _unitX getVariable "UnitIndex";
            _marker = _unitX getVariable "UnitMarker";
            [_marker, _unitX getVariable "unitType", _id] call A3A_fnc_addRequested;
          }
        ];
        sleep 0.25;
    } forEach _crewArray;
    [leader _groupX, _marker, "SAFE", "RANDOMUP", "SPAWNED", "NOVEH2", "NOFOLLOW"] execVM "scripts\UPSMON.sqf";


    private _forcePatrol = ((count _allGroups) > ((count _patrolGroups) * 3));
    _groupSoldier = createGroup _side;
    private _counter = 0;
    _allGroups pushBack _groupSoldier;
    _stayGroups pushBack _groupSoldier;
    {
      _unitX = [_groupSoldier, _x, (_spawnParameter select 0), [], 5, "NONE"] call A3A_fnc_createUnit;
      _allSoldiers pushBack _unitX;

      //Should work as a local variable needs testing
      _unitX setVariable ["UnitIndex", (_lineIndex * 10 + 2)];
      _unitX setVariable ["UnitMarker", _marker];

      //On vehicle death, remove it from garrison
      _unitX addEventHandler ["Killed",
        {
          _unitX = _this select 0;
          _id = _unitX getVariable "UnitIndex";
          _marker = _unitX getVariable "UnitMarker";
          [_marker, _unitX getVariable "unitType", _id] call A3A_fnc_addRequested;
        }
      ];
      sleep 0.25;
      _counter = _counter + 1;
      if((_counter >= 2) && {_forcePatrol || {count _cargoArray < 5}}) then
      {
        _groupSoldier = createGroup _side;
        _counter = 0;
        _allGroups pushBack _groupSoldier;
        _patrolGroups pushBack _groupSoldier;
      };
    } forEach _cargoArray;
  };
  _lineIndex = _lineIndex + 1;
} forEach _garrison;


_sizePerUnit = 0;
if(count _allSoldiers != 0) then
{
  _sizePerUnit = _patrolSize / (count _allSoldiers);
};

Debug_3("The size is %1/ Unit count is %2/ Per Unit is %3", _patrolSize, count _allSoldiers, _sizePerUnit);

//Every unit can search a area of 12500 m^2, if the unit is bigger, reduce patrol area
_patrolMarkerSize = getMarkerSize _patrolMarker;
if(_sizePerUnit > 12500) then
{
    Debug("The area is to large, make it smaller");
  _patrolMarkerSize set [0, (_patrolMarkerSize select 0) * (12500/_sizePerUnit)];
  _patrolMarkerSize set [1, (_patrolMarkerSize select 1) * (12500/_sizePerUnit)];
};

_mainMarkerSize = getMarkerSize _marker;
if(((_patrolMarkerSize select 0) < (_mainMarkerSize select 0)) || {(_patrolMarkerSize select 1) < (_mainMarkerSize select 1)}) then
{
    Debug("Resizing to marker size");
  _patrolMarkerSize = _mainMarkerSize;
};
_patrolMarker setMarkerSizeLocal _patrolMarkerSize;

{
  [leader _x, _marker, "SAFE", "SPAWNED", "RANDOM", "NOFOLLOW", "NOVEH"] execVM "scripts\UPSMON.sqf";
} forEach _stayGroups;

{
  [leader _x, _patrolMarker, "SAFE", "SPAWNED", "RANDOM","NOVEH2"] execVM "scripts\UPSMON.sqf";
} forEach _patrolGroups;

/*
waitUntil {sleep 5; (spawner getVariable _marker == 2)};

[_marker] call A3A_fnc_freeSpawnPositions;

deleteMarker _patrolMarker;

{
	if (alive _x) then
	{
		deleteVehicle _x;
	};
} forEach _allSoldiers;

{
	deleteGroup _x
} forEach _allGroups;

{
	if (!(_x in staticsToSave)) then
	{
		if ((!([distanceSPWN, 1, _x, teamPlayer] call A3A_fnc_distanceUnits))) then
		{
			deleteVehicle _x;
		};
	};
} forEach _allVehicles;
*/
