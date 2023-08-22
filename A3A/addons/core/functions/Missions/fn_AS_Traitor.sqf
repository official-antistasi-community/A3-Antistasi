//Mission: Assassinate a traitor
if (!isServer and hasInterface) exitWith{};
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
_markerX = _this select 0;

_difficultX = if (random 10 < tierWar) then {true} else {false};
_leave = false;
_contactX = objNull;
_groupContact = grpNull;
_tsk = "";
_tsk1 = "";

_positionX = getMarkerPos _markerX;

_timeLimit = if (_difficultX) then {30} else {60};
if (A3A_hasIFA) then {_timeLimit = _timeLimit * 2};
_dateLimit = [date select 0, date select 1, date select 2, date select 3, (date select 4) + _timeLimit];
_dateLimitNum = dateToNumber _dateLimit;
_dateLimit = numberToDate [date select 0, _dateLimitNum];//converts datenumber back to date array so that time formats correctly
_displayTime = [_dateLimit] call A3A_fnc_dateToTimeString;//Converts the time portion of the date array to a string for clarity in hints

_radiusX = [_markerX] call A3A_fnc_sizeMarker;
_houses = (nearestObjects [_positionX, ["house"], _radiusX]) select {!((typeOf _x) in A3A_buildingBlacklist)};
_posHouse = [];
_houseX = _houses select 0;
while {count _posHouse < 3} do
	{
	_houseX = selectRandom _houses;
	_posHouse = _houseX buildingPos -1;
	if (count _posHouse < 3) then {_houses = _houses - [_houseX]};
	};

_max = (count _posHouse) - 1;
_rnd = floor random _max;
_posTraitor = _posHouse select _rnd;
_posSol1 = _posHouse select (_rnd + 1);
_posSol2 = (_houseX buildingExit 0);

_nameDest = [_markerX] call A3A_fnc_localizar;

_groupTraitor = createGroup Occupants;

_arrayAirports = airportsX select {sidesX getVariable [_x,sideUnknown] == Occupants};
_base = [_arrayAirports, _positionX] call BIS_Fnc_nearestPosition;
_posBase = getMarkerPos _base;

private _traitorIdentity = [A3A_faction_reb, FactionGet(occ,"unitTraitor")] call A3A_fnc_createRandomIdentity;
_traitorIdentity set ["speaker", "NoVoice"];
_traitor = [_groupTraitor, FactionGet(occ,"unitTraitor"), _posTraitor, [], 0, "NONE", _traitorIdentity] call A3A_fnc_createUnit;
_traitor allowDamage false;
_traitor setPos _posTraitor;
_sol1 = [_groupTraitor, FactionGet(occ,"unitBodyguard"), _posSol1, [], 0, "NONE"] call A3A_fnc_createUnit;
_sol2 = [_groupTraitor, FactionGet(occ,"unitBodyguard"), _posSol2, [], 0, "NONE"] call A3A_fnc_createUnit;
_groupTraitor selectLeader _traitor;

_posTsk = (position _houseX) getPos [random 100, random 360];

private _taskId = "AS" + str A3A_taskCount;
[[teamPlayer,civilian],_taskID,[format ["A traitor has scheduled a meeting with %4 in %1. Kill him before he provides enough intel to give us trouble. Do this before %2. We don't where exactly this meeting will happen. You will recognise the building by the nearby Offroad and %3 presence.",_nameDest,_displayTime,FactionGet(occ,"name")],"Kill the Traitor",_markerX],_posTsk,false,0,true,"Kill",true] call BIS_fnc_taskCreate;
[[Occupants],_taskID+"B",[format ["We arranged a meeting in %1 with a %3 contact who may have vital information about their Headquarters position. Protect him until %2.",_nameDest,_displayTime,FactionGet(reb,"name")],"Protect Contact",_markerX],getPos _houseX,false,0,true,"Defend",true] call BIS_fnc_taskCreate;
[_taskId, "AS", "CREATED"] remoteExecCall ["A3A_fnc_taskUpdate", 2];

traitorIntel = false; publicVariable "traitorIntel";

{_nul = [_x,""] call A3A_fnc_NATOinit; _x allowFleeing 0} forEach units _groupTraitor;
_posVeh = [];
_dirVeh = 0;
_roads = [];
_radius = 20;
while {count _roads == 0} do
	{
	_roads = (getPos _houseX) nearRoads _radius;
	_radius = _radius + 10;
	};

_road = _roads select 0;
_posroad = getPos _road;
_roadcon = roadsConnectedto _road; if (count _roadCon == 0) then {
    Error_1("Road has no connection :%1.",position _road);
	};
if (count _roadCon > 0) then
	{
	_posrel = getPos (_roadcon select 0);
	_dirveh = [_posroad,_posrel] call BIS_fnc_DirTo;
	}
else
	{
	_dirVeh = getDir _road;
	};
_posVeh = [_posroad, 3, _dirveh + 90] call BIS_Fnc_relPos;
_veh = ((FactionGet(reb,"vehiclesLightUnarmed")) # 0) createVehicle _posVeh;
_veh allowDamage false;
_veh setDir _dirVeh;
sleep 15;
_veh allowDamage true;
_traitor allowDamage true;
[_veh, Occupants] call A3A_fnc_AIVEHinit;
{_x disableAI "MOVE"; _x setUnitPos "UP"} forEach units _groupTraitor;

_mrk = createMarkerLocal [format ["%1patrolarea", floor random 100], getPos _houseX];
_mrk setMarkerShapeLocal "RECTANGLE";
_mrk setMarkerSizeLocal [50,50];
_mrk setMarkerTypeLocal "hd_warning";
_mrk setMarkerColorLocal "ColorRed";
_mrk setMarkerBrushLocal "DiagGrid";
_mrk setMarkerAlphaLocal 0;

_typeGroup = if (random 10 < tierWar) then {selectRandom FactionGet(occ,"groupsSquads")} else {FactionGet(occ,"groupPoliceSquad")};
_groupX = [_positionX,Occupants, _typeGroup] call A3A_fnc_spawnGroup;
sleep 1;
if (random 10 < 2.5) then
	{
	_dog = [_groupX, "Fin_random_F",_positionX,[],0,"FORM"] call A3A_fnc_createUnit;
	[_dog] spawn A3A_fnc_guardDog;
	};

[_groupX, "Patrol_Area", 25, 50, 100, false, [], false] call A3A_fnc_patrolLoop;

{[_x,""] call A3A_fnc_NATOinit} forEach units _groupX;

waitUntil {sleep 1; (traitorIntel) || {(dateToNumber date > _dateLimitNum) or {(not alive _traitor) or {({_traitor knowsAbout _x > 1.4} count ([500,0,_traitor,teamPlayer] call A3A_fnc_distanceUnits) > 0)}}}};

if ({_traitor knowsAbout _x > 1.4} count ([500,0,_traitor,teamPlayer] call A3A_fnc_distanceUnits) > 0) then
	{
	{_x enableAI "MOVE"} forEach units _groupTraitor;
	_traitor assignAsDriver _veh;
	[_traitor] orderGetin true;
	_wp0 = _groupTraitor addWaypoint [_posVeh, 0];
	_wp0 setWaypointType "GETIN";
	_wp1 = _groupTraitor addWaypoint [_posBase,1];
	_wp1 setWaypointType "MOVE";
	_wp1 setWaypointBehaviour "CARELESS";
	_wp1 setWaypointSpeed "FULL";
	};

waitUntil  {sleep 1; (traitorIntel) || {(dateToNumber date > _dateLimitNum) or {(not alive _traitor) or {(_traitor distance _posBase < 20)}}}};

if (not alive _traitor || traitorIntel) then
{
	[_taskId, "AS", "SUCCEEDED", true] call A3A_fnc_taskSetState;
	if(traitorIntel && (alive _traitor)) then
	{
		{[petros,"hint","Someone found some intel on the traitors family, he will not cause any problems any more!"] remoteExec ["A3A_fnc_commsMP",_x]} forEach ([500,0,_traitor,teamPlayer] call A3A_fnc_distanceUnits);

		moveOut _traitor;
		_traitor join grpNull;
		_traitor setCaptive true;
		_traitor stop true;
		_traitor setUnitPos "UP";
		_traitor playMoveNow "AmovPercMstpSnonWnonDnon_AmovPercMstpSsurWnonDnon";

		_wp1 = _groupTraitor addWaypoint [_posBase];
		_wp1 setWaypointType "MOVE";
		_wp1 setWaypointBehaviour "CARELESS";
		_wp1 setWaypointSpeed "FULL";
	};

	_factor = 1;
	if(_difficultX) then {_factor = 2;};
    Debug("aggroEvent | Rebels won a traitor mission");
	[Occupants, 15 * _factor, 120] remoteExec ["A3A_fnc_addAggression",2];
	[0,300 * _factor] remoteExec ["A3A_fnc_resourcesFIA",2];
	{
		if (!isPlayer _x) then
		{
			_skill = skill _x;
			_skill = _skill + 0.1;
			_x setSkill _skill;
		}
		else
		{
			[10 * _factor,_x] call A3A_fnc_playerScoreAdd;
		};
	} forEach ([_radiusX,0,_positionX,teamPlayer] call A3A_fnc_distanceUnits);
	[5 * _factor,theBoss] call A3A_fnc_playerScoreAdd;
}
else
{
	[_taskId, "AS", "FAILED", true] call A3A_fnc_taskSetState;
	if (_difficultX) then {[-10,theBoss] call A3A_fnc_playerScoreAdd} else {[-10,theBoss] call A3A_fnc_playerScoreAdd};
	if (dateToNumber date > _dateLimitNum) then
	{
		_hrT = server getVariable "hr";
		_resourcesFIAT = server getVariable "resourcesFIA";
		[-1*(round(_hrT/3)),-1*(round(_resourcesFIAT/3))] remoteExec ["A3A_fnc_resourcesFIA",2];
	}
	else
	{
		// Add some rebel HQ info to occupants. Must be done on server.
		{ A3A_curHQInfoOcc = A3A_curHQInfoOcc + 0.25 + random 0.5 } remoteExecCall ["call", 2];
	};

/*		if (isPlayer theBoss) then
		{
			if !("DEF_HQ" in A3A_activeTasks) then
			{
				[[Occupants],"A3A_fnc_attackHQ"] remoteExec ["A3A_fnc_scheduler",2];
			};
		}
		else
		{
			_minesFIA = allmines - (detectedMines Occupants) - (detectedMines Invaders);
			if (count _minesFIA > 0) then
			{
				{if (random 100 < 30) then {Occupants revealMine _x;}} forEach _minesFIA;
			};
		};
	};
*/
};

traitorIntel = false; publicVariable "traitorIntel";
[_taskId, "AS", 1200, true] spawn A3A_fnc_taskDelete;

[_groupX] spawn A3A_fnc_groupDespawner;
[_groupTraitor] spawn A3A_fnc_groupDespawner;
[_veh] spawn A3A_fnc_vehDespawner;
