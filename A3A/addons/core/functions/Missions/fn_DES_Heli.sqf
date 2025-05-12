/*
    Maintainer: Bob Murphy
    Creates a "Destroy the helicopter" type mission in a random location near input marker.

    Arguments:
        <STRING> Marker

	Public: Yes
    Example:
        ["airport"] call A3A_fnc_DES_Heli;
*/
if (!isServer and hasInterface) exitWith{};

private _missionOrigin = _this select 0;
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
private _difficult = if (random 10 < tierWar) then {true} else {false};
private _bonus = if (_difficult) then {2} else {1};
private _missionOriginPos = getMarkerPos _missionOrigin;
private _sideX = if (sidesX getVariable [_missionOrigin,sideUnknown] == Occupants) then {Occupants} else {Invaders};
private _faction = Faction(_sideX);
Debug_3("Origin: %1, Hardmode: %2, Controlling Side: %3", _missionOrigin, _difficult, _sideX);

//finding crash position
private _ang = random 360;
private _countX = 0;
private _dist = if (_difficult) then {2000} else {3000};
private _posCrashOrigin = [];
while {true} do {
    _posCrashOrigin = _missionOriginPos getPos [_dist,_ang];
    private _notOutOfBounds = (_posCrashOrigin select [0,2]) findIf { (_x < 0 + 1000) || (_x > worldSize -1000)} isEqualTo -1; //1k grace for refinement search later
    if ((!surfaceIsWater _posCrashOrigin) and (_posCrashOrigin distance (getMarkerPos respawnTeamPlayer) < 4000) and (_posCrashOrigin distance (getMarkerPos respawnTeamPlayer) > 1000) and _notOutOfBounds) exitWith {};
    _ang = _ang + 1;
    _countX = _countX + 1;
    if (_countX > 360) then
        {
        _countX = 0;
        _dist = _dist - 500;
        };
};

// selecting Aircraft
private _heliPool = (_faction get "vehiclesHelisLight") + (_faction get "vehiclesHelisTransport") + (_faction get "vehiclesHelisAttack") + (_faction get "vehiclesHelisLightAttack");
private _typeVehH = selectRandom (_heliPool select {_x isKindOf "Helicopter"});
if (isNil "_typeVehH") exitWith {
    Error("No aircrafts in arrays vehiclesHelisLight, vehiclesHelisTransport or vehiclesHelisAttack. Reselecting DES mission");
    ["DES"] remoteExec ["A3A_fnc_missionRequest",2];
};
private _isAttackHeli = _typeVehH in ((_faction get "vehiclesHelisAttack") + (_faction get "vehiclesHelisLightAttack"));

//refining crash spawn position, to avoid exploding on spawn or "Armaing" during mission
private _flatPos = [_posCrashOrigin, 0, 1000, 0, 0, 0.1] call BIS_fnc_findSafePos;
private _posCrash = _flatPos findEmptyPosition [0,100,_typeVehH];
if (count _posCrash == 0) then {_posCrash = _posCrashOrigin};//if no pos use _posCrashOrigin
if (!isMultiplayer) then {{ _x hideObject true } foreach (nearestTerrainObjects [_posCrash,["tree","bush", "ROCKS"],50])} else {{[_x,true] remoteExec ["hideObjectGlobal",2]} foreach (nearestTerrainObjects [_posCrash,["tree","bush", "ROCKS"],50])};//clears area of trees and bushes
Debug_2("Crash Location: %1, Aircraft: %2", _posCrash, _typeVehH);

//creating array for cleanup
private _vehicles = [];
private _groups = [];

//creating crashed helicopter
private _crater = "CraterLong" createVehicle _posCrash;
private _heli = createVehicle [_typeVehH, [_posCrash select 0, _posCrash select 1, 0.9], [], 0, "CAN_COLLIDE"];
private _smoke = "test_EmptyObjectForSmoke" createVehicle _posCrash; _smoke attachTo [_heli,[0,1.5,-1]];
_heli setDamage 0.8;
_vehicles append [_heli,_crater];

//creating cover
private _typeVeh = "Land_BagFence_01_long_green_F"; // ToDo: should be moved to template under mission objects
private _counterLimit = round (random[2,3,4]*_bonus);
private _counter = 0;
private _angle = random 360;
while {_counter != _counterLimit} do {
    _counter = _counter + 1;
    _angle = _angle + 45 + round random 90;
    private _pos = _posCrash getPos [10,_angle];
    if !(isOnRoad _pos) then {
    private _cov = _typeVeh createVehicle _pos;
    private _dir = _posCrash getDir _pos;
    _cov setDir _dir;
    _vehicles pushBack _cov;
    } else {_counter = _counter -1};
};

//creating ammobox if not armed
_ammoBox = objNull;
if (!_isAttackHeli) then {
    _ammoBox = [_faction get "ammobox", _posCrash, 10, 5, true] call A3A_fnc_safeVehicleSpawn; // Allegedly there's alternative syntax that allows you to check which classnames can be slingloaded
    // For that alternative syntax, no results are accurate for the ammoboxes we use so I'm spawning it to test it
    if !(_heli canSlingLoad _ammoBox) exitWith {
    	deleteVehicle _ammoBox;
    };
    // Otherwise when destroyed, ammoboxes sink 100m underground and are never cleared up
    _ammoBox addEventHandler ["Killed", { [_this#0] spawn { sleep 10; deleteVehicle (_this#0) } }];
    [_ammoBox] spawn A3A_fnc_fillLootCrate;
    [_ammoBox] call A3A_Logistics_fnc_addLoadAction;
};

//creating mission marker near crash site
private _posCrashMrk = [0,0,0];
private _crashMarkAttempt = 1;
private _isWater = true;
private _isInRange = false;

while {_crashMarkAttempt < 10 && (_isWater || !_isInRange)} do {
    Debug_1("Searching for marker position, attempt %1",_crashMarkAttempt);
    _posCrashMrk = _heli getRelPos [random 500,random 360];
    _isWater = surfaceIsWater _posCrashMrk;
    _isInRange = (_posCrashMrk select [0,2]) findIf { (_x < 300) || (_x > worldSize - 300)} isEqualTo -1;
    _crashMarkAttempt = _crashMarkAttempt + 1;
};

if (_crashMarkAttempt isEqualTo 10) then {Debug("Failed to find suitable position for marker, assigning to heli pos"); _posCrashMrk = getPos _heli;};
private _taskMrk = createMarker [format ["DES%1", random 100],_posCrashMrk];
_taskMrk setMarkerShape "ICON";

//finding timelimit for mission
private _timeLimit = 120;
private _dateLimit = [date select 0, date select 1, date select 2, date select 3, (date select 4) + _timeLimit];
private _dateLimitNum = dateToNumber _dateLimit;

//creating mission
Info("Creating Helicopter Down mission");
private _location = [_missionOrigin] call A3A_fnc_localizar;
private _taskId = "DES" + str A3A_taskCount;
private _text = format [localize "STR_A3A_fn_mission_des_heli_text",_location];
[[teamPlayer,civilian],_taskId,[_text,localize "STR_A3A_fn_mission_des_heli_titel",_taskMrk],_posCrashMrk,false,0,true,"Destroy",true] call BIS_fnc_taskCreate;
[_taskId, "DES", "CREATED"] remoteExecCall ["A3A_fnc_taskUpdate", 2];

////////////////
//convoy spawn//
////////////////

//finding road
private _radiusX = 100;
private _roads = [];
while {true} do {
    _roads = _missionOriginPos nearRoads _radiusX;
    if (count _roads > 1) exitWith {};
    _radiusX = _radiusX + 50;
};
private _roadE = _roads select 1;
private _roadR = _roads select 0;
sleep 1;

//Spawning escort
_typeVeh = selectRandom (_faction get "vehiclesLightUnarmed");
private _vehicleDataE = [position _roadE, 0,_typeVeh, _sideX] call A3A_fnc_spawnVehicle;
private _vehE = _vehicleDataE select 0;
_vehE limitSpeed 50;
[_vehE,"Escort"] spawn A3A_fnc_inmuneConvoy;
private _vehCrew = crew _vehE;
{[_x] call A3A_fnc_NATOinit} forEach _vehCrew;
[_vehE, _sideX] call A3A_fnc_AIVEHinit;
private _groupVeh = _vehicleDataE select 2;
_groups pushBack _groupVeh;
_vehicles pushBack _vehE;

Debug_2("Crash Location: %1, Lite Vehicle: %2", _posCrash, _typeVeh);

//spawning escort inf
private _typeGroup = _faction get "groupSentry";
private _groupX = [_missionOriginPos, _sideX, _typeGroup] call A3A_fnc_spawnGroup;
{_x assignAsCargo _vehE; _x moveInCargo _vehE; [_x] join _groupVeh; [_x] call A3A_fnc_NATOinit} forEach units _groupX;
deleteGroup _groupX;

//moving to crash site
private _escortWP = _groupVeh addWaypoint [_posCrash, 0];
//_escortWP setWaypointType "GETOUT";
_escortWP setWaypointStatements ["true", "if !(local this) exitWith {}; (group this) leaveVehicle (assignedVehicle this)"];
_escortWP setWaypointBehaviour "SAFE";
Debug_2("Placed Group: %1 in Lite Vehicle and set waypoint %2", _typeGroup, _posCrash);

//creating repair vehicle
_typeVeh = selectRandom (_faction get "vehiclesRepairTrucks");
private _vehicleDataR = [position _roadR, 0,_typeVeh, _sideX] call A3A_fnc_spawnVehicle;
private _vehR = _vehicleDataR select 0;
_vehR limitSpeed 50;
[_vehR, _sideX] call A3A_fnc_AIVEHinit;
sleep 1;
[_vehR,"Repair Truck"] spawn A3A_fnc_inmuneConvoy;
private _groupVehR = _vehicleDataR select 2;
private _vehCrewR = units _groupVehR;
{[_x] call A3A_fnc_NATOinit} forEach _vehCrewR;
_groups pushBack _groupVehR;
_vehicles pushBack _vehR;

//moving to crash site
_reapirTruckWP = _groupVehR addWaypoint [_posCrash, 0];
_reapirTruckWP setWaypointType "MOVE";
_reapirTruckWP setWaypointBehaviour "SAFE";
Debug_3("Transport Vehicle: %1, Crew: %2, Waypoint: %3", _typeVeh, _vehCrewR, _posCrash);
Debug_3("Waiting until %1 is destroyed or %2 has reached %1, or mission expires at: %3", _heli, _vehR, _dateLimit);

///////////////////////////
//Helicopter Crew & Guard//
///////////////////////////

//creating local for spawning heli crew/cuard
_mrkCrash = createMarkerLocal [format ["%1patrolarea", floor random 100], _posCrash];
_mrkCrash setMarkerShapeLocal "RECTANGLE";
_mrkCrash setMarkerSizeLocal [20,20];
_mrkCrash setMarkerTypeLocal "hd_warning";
_mrkCrash setMarkerColorLocal "ColorRed";
_mrkCrash setMarkerBrushLocal "DiagGrid";
if (!debug) then {_mrkCrash setMarkerAlphaLocal 0};

//creating guard
private ["_guard", "_guardWP", "_vehGuard"];
_typeGroup = selectRandom (_faction get "groupsSquads");
//if not patrol heli
if !(_typeVehH in (_faction get "vehiclesHelisLight")) then {
    //spawning guard inf
    _guard = [_posCrash, _sideX, _typeGroup] call A3A_fnc_spawnGroup;
    {[_x] call A3A_fnc_NATOinit} forEach units _guard;
    _groups pushBack _guard;

    //tell guard group to guard heli
    _guardWP = [_guard, _posCrash, 10] call BIS_fnc_taskPatrol;

    Debug_1("Location: %1, Guard Squad spawned", _posCrash);
    if (_isAttackHeli) then {
        //if attack helicopter
        //creating transport vehicle
        _typeVeh = selectRandom (_faction get "vehiclesTrucks");
        private _posVehHT = _posCrash findEmptyPosition [15, 30 ,_typeVeh];
        if (_posVehHT isEqualTo []) then {_posVehHT = _posCrash findEmptyPosition [15, 100 ,_typeVeh]}; //if it fails to find a pos expand and try again
        if (_posVehHT isEqualTo []) exitWith { _vehGuard = _heli};
        _vehGuard = _typeVeh createVehicle _posVehHT;
        [_vehGuard, _sideX] call A3A_fnc_AIVEHinit;
        _vehicles pushBack _vehGuard;
    };
};

//spawning pilots
_typeGroup = [_faction get "unitPilot", _faction get "unitPilot"];
_pilots = [_posCrash,_sideX,_typeGroup] call A3A_fnc_spawnGroup;
{[_x,""] call A3A_fnc_NATOinit} forEach units _pilots;
_groups pushBack _pilots;
[_heli, _sideX] call A3A_fnc_AIVEHinit;

//tell pilots to hide at heli
private _pilotsWP = _pilots addWaypoint [_posCrash, 0];
_pilotsWP setWaypointType "HOLD";
_pilotsWP setWaypointBehaviour "STEALTH";

// Remove undercover from players that approach the crash site
[_heli] spawn {
    params ["_heli"];

    private _undercoverBreakDistance = 50;
    private _initialHeliPosition = getPosATL _heli;

    while {alive _heli && { _heli getVariable "ownerSide" != teamPlayer } } do {
        private _nearbyPlayers = allPlayers inAreaArray [_initialHeliPosition, _undercoverBreakDistance, _undercoverBreakDistance];
        { if (captive _x) then { [_x, false] remoteExec ["setCaptive", _x] } } forEach _nearbyPlayers;
        sleep 5;
    };
};

Debug_3("Waiting until %1 reaches origin or rebel base, gets destroyed, timer expires at %3 or %2 reaches %1", _heli, _vehR, _dateLimit);
waitUntil
{
    sleep 1;
    (not alive _heli) ||
    {(_vehR distance _heli < 50) ||
    ((_heli distance (getMarkerPos respawnTeamPlayer)) < 100) &&
    isPlayer (driver _heli) ||
    {(dateToNumber date > _dateLimitNum)}}
};

//////////////////////
//EI Recovering Heli//
//////////////////////
if (_vehR distance _heli < 50) then {
    Debug_2("Repair %1 has reached %2, starting repair...", _vehR, _heli);
    _vehR doMove position _heli;
    sleep 300; //time to repair
    if (alive _heli && alive _vehR && _vehR distance2D _heli < 50) then {
        //repair complete remove crater and fix helicopter
        _heli setDamage 0.2;
        _heli setFuel 0.4;
        private _emitterArray = _smoke getVariable "effects"; //get rid of smoke effects spawned by smoke obj & smoke obj
        {deleteVehicle _x} forEach _emitterArray;
        deleteVehicle _smoke;
        deleteVehicle _crater;

        Debug_4("%1 has repaired %2, %3 is heading back to %4", _sideX,_heli,_vehR,_missionOriginPos);

        //Guards & pilots stop patrolling
        for "_i" from (count (waypoints _guard)) to 0 step -1 do {
            deleteWaypoint [_guard, _i];
        };
        for "_i" from (count (waypoints _pilots)) to 0 step -1 do {
            deleteWaypoint [_pilots, _i];
        };

        //Repair truck & escort RTB
        _reapirTruckWP = _groupVehR addWaypoint [_missionOriginPos, 1];
        _reapirTruckWP setWaypointType "MOVE";
        _reapirTruckWP setWaypointBehaviour "SAFE";

        _escortWP = _groupVeh addWaypoint [_posCrash, 0];
        _escortWP setWaypointType "GETIN";
        _escortWP setWaypointBehaviour "SAFE";

        _escortWP = _groupVeh addWaypoint [_missionOriginPos, 2];
        _escortWP setWaypointType "MOVE";
        _escortWP setWaypointBehaviour "SAFE";

        Debug("Pilots and Guard are RTB");

        _pilots addVehicle _heli;
        (units _pilots) orderGetIn true;
        sleep 1;
        private _notAlivePilots = true;
        {if ([_x] call A3A_fnc_canFight) exitWith {_notAlivePilots = false}}forEach units _pilots;

        if (!isNull _ammoBox && _ammoBox distance _heli < 50) then {Debug("Crate is alive recovering now"); _heli setSlingLoad _ammoBox;};

        if (_typeVehH in ( (_faction get "vehiclesHelisLight") + (_faction get "vehiclesHelisTransport") )) then {
            if !(_typeVehH in (_faction get "vehiclesHelisLight")) then {
                //guard move in back of heli, pilots wait for them to load
                if (_notAlivePilots) then {_guard addVehicle _heli} else {{_x assignAsCargo _heli}forEach units _guard};
                (units _guard) orderGetIn true;
                sleep 1;
            };
            if (_notAlivePilots && !(_typeVehH in (_faction get "vehiclesHelisLight"))) then {
                _pilotsWP = _guard addWaypoint [_missionOriginPos, 3];
                _pilotsWP setWaypointType "MOVE";
                _pilotsWP setWaypointBehaviour "AWARE";
                _pilotsWP setWaypointSpeed "FULL";
            } else {
                _pilotsWP = _pilots addWaypoint [_missionOriginPos, 3];
                _pilotsWP setWaypointType "MOVE";
                _pilotsWP setWaypointBehaviour "AWARE";
                _pilotsWP setWaypointSpeed "FULL";
            };
        } else {
            //guard mount in own vehicle and RTB
            _guard addVehicle _vehGuard;
            if (_notAlivePilots) then {_guard addVehicle _heli};
            (units _guard) orderGetIn true;
            sleep 1;
            _guardWP = _guard addWaypoint [_missionOriginPos, 1];
            _guardWP setWaypointType "MOVE";
            _guardWP setWaypointBehaviour "AWARE";
            _guardWP setWaypointSpeed "FULL";
            _guard setCurrentWaypoint [_guard, 1];
            _pilotsWP = _pilots addWaypoint [_missionOriginPos, 3];
            _pilotsWP setWaypointType "MOVE";
            _pilotsWP setWaypointBehaviour "AWARE";
            _pilotsWP setWaypointSpeed "FULL";
        };
    };
};

////////////////
//Mission done//
////////////////
Debug_2("Waiting until %1 reaches origin or rebel base, gets destroyed or timer expires at %2", _heli, _dateLimit);
waitUntil
{
    sleep 1;
    (not alive _heli) ||
    ((_heli distance _missionOriginPos) < 300) &&
    !isPlayer (driver _heli) ||
    ((_heli distance (getMarkerPos respawnTeamPlayer)) < 100) &&
    isPlayer (driver _heli) ||
    (dateToNumber date > _dateLimitNum)
};

//Reward & completing task
if ((not alive _heli) || (_heli distance (getMarkerPos respawnTeamPlayer) < 100) && isPlayer (driver _heli) ) then {
    if (alive _heli) then {
        Debug_1("%1 was captured", _heli);
    } else {
        Debug_1("%1 was captured", _heli);
    };
    [_taskId, "DES", "SUCCEEDED"] call A3A_fnc_taskSetState;
    [0,300*_bonus] remoteExec ["A3A_fnc_resourcesFIA",2];
    [600*_bonus, _sideX] remoteExec ["A3A_fnc_timingCA",2];
    {if (_x distance _heli < 500) then {[10*_bonus,_x] call A3A_fnc_playerScoreAdd}} forEach (allPlayers - (entities "HeadlessClient_F"));
    [10*_bonus,theBoss] call A3A_fnc_playerScoreAdd;
} else {
    Debug_2("%1 was successfully recovered by %2, mission failed", _heli, _sideX);
    [_taskId, "DES", "FAILED"] call A3A_fnc_taskSetState;
    [-200, _sideX] remoteExec ["A3A_fnc_timingCA",2];
    [-10*_bonus,theBoss] call A3A_fnc_playerScoreAdd;
    if (_isAttackHeli) then {[-200, _sideX] remoteExec ["A3A_fnc_timingCA",2]};
};
Info("Downed Heli mission completed");
////////////
//Clean up//
////////////
//get rid of smoke effects spawned by smoke obj & smoke obj, if still there
if (!isNull _smoke) then {
    private _emitterArray = _smoke getVariable "effects";
    {deleteVehicle _x} forEach _emitterArray;
    deleteVehicle _smoke;
};

//delete task and markers
[_taskId, "DES", 1200] spawn A3A_fnc_taskDelete;
deleteMarker _taskMrk;
deleteMarker _mrkCrash;

//delete units, vehicles and groups
if (!isNull _ammoBox && (getSlingLoad _heli == _ammoBox) && (_ammoBox distance _missionOriginPos < 400)) then {deleteVehicle _ammoBox;};
{[_x] spawn A3A_fnc_vehDespawner} forEach _vehicles;
{[_x] spawn A3A_fnc_groupDespawner} forEach _groups;

Debug("Downed Heli clean up complete");
