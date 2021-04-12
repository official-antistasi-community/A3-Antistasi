params ["_side", "_timerIndex", "_sleepTime", "_airport", "_supportName", "_setupPos"];

private _fileName = "SUP_ASFRoutine";

private _plane = if (_side == Occupants) then {vehNATOPlaneAA} else {vehCSATPlaneAA};
private _crewUnits = if(_side == Occupants) then {NATOPilot} else {CSATPilot};
private _timerArray = if(_side == Occupants) then {occupantsASFTimer} else {invadersASFTimer};

//Sleep to simulate preparetion time
while {_sleepTime > 0} do
{
    sleep 1;
    _sleepTime = _sleepTime - 1;
    if((spawner getVariable _airport) != 2) exitWith {};
};

//No runway on this airport, use airport position
//Not sure if I should go with 150 or 1000 here, players might be only 1001 meters away
//While technically 1000 meter height is technically visible from a greater distance
//150 is more likely to be in the actual viewcone of a player
private _spawnPos = (getMarkerPos _airport);
private _strikePlane = createVehicle [_plane, _spawnPos, [], 0, "FLY"];
_strikePlane setDir (_spawnPos getDir _setupPos);

//Put it in the sky
_strikePlane setPosATL (_spawnPos vectorAdd [0, 0, 1000]);

//Hide the hovering airplane from players view
_strikePlane setVelocityModelSpace [0, 150, 0];

private _strikeGroup = createGroup _side;
private _pilot = [_strikeGroup, _crewUnits, getPos _strikePlane] call A3A_fnc_createUnit;
_pilot moveInDriver _strikePlane;

//_strikePlane disableAI "TARGET";
_strikePlane disableAI "AUTOTARGET";



_strikePlane setVariable ["TimerArray", _timerArray, true];
_strikePlane setVariable ["TimerIndex", _timerIndex, true];
_strikePlane setVariable ["supportName", _supportName, true];

//Setting up the EH for support destruction
_strikePlane addEventHandler
[
    "Killed",
    {
        params ["_strikePlane"];
        ["TaskSucceeded", ["", "Fighter Destroyed"]] remoteExec ["BIS_fnc_showNotification", teamPlayer];
        private _timerArray = _strikePlane getVariable "TimerArray";
        private _timerIndex = _strikePlane getVariable "TimerIndex";
        _timerArray set [_timerIndex, (_timerArray select _timerIndex) + 7200];
        [_strikePlane] spawn A3A_fnc_postMortem;
    }
];

_strikePlane addEventHandler
[
    "IncomingMissile",
    {
        params ["_plane", "_ammo", "_vehicle"];
        if !(_vehicle isKindOf "Man") then
        {
            //Vehicle fired a missile against the plane, add to target list if ground, no warning for players as this is an internal decision of the pilot
            if(_vehicle isKindOf "Air") then
            {
                private _supportName = _plane getVariable "supportName";
                [_supportName, [_vehicle, 3], 0] spawn A3A_fnc_addSupportTarget;
            }
            else
            {
                //Send support against ground based vehicles, retreat
                [_vehicle, 4, ["SEAD", "CAS", "MISSILE"], side group (driver _plane), random 1] spawn A3A_fnc_sendSupport;
                _plane setVariable ["Retreat", true, true];
            };
        };
        //Else case handled in client init
    }
];

_strikePlane addEventHandler
[
    "HandleDamage",
    {
        params ["_plane", "_selection", "_damage", "_vehicle", "_projectile"];
        //Check if bullet, we dont care about missiles, as these are handled above
        if(_projectile isKindOf "BulletCore") then
        {
            //Plane is getting hit by bullets, check if fired by unit or vehicle
            if(!(isNull (objectParent _vehicle)) || (_vehicle isKindOf "AllVehicles")) then
            {
                //Getting hit by a vehicle
                private _supportName = _plane getVariable "supportName";
                private _vehicle = if(_vehicle isKindOf "AllVehicles") then {_vehicle} else {objectParent _vehicle};
                if(_vehicle isKindOf "Air") then
                {
                    //Air based dogfight
                    [_supportName, [_vehicle, 3], 0] spawn A3A_fnc_addSupportTarget;
                }
                else
                {
                    //Send support against ground based vehicles, retreat
                    [_vehicle, 4, ["SEAD", "CAS", "MISSILE"], side group (driver _plane), random 1] spawn A3A_fnc_sendSupport;
                    _plane setVariable ["Retreat", true, true];
                };
            };
        };
    }
];

_pilot setVariable ["Plane", _strikePlane, true];
_pilot addEventHandler
[
    "Killed",
    {
        params ["_unit"];
        ["TaskSucceeded", ["", "ASF crew killed"]] remoteExec ["BIS_fnc_showNotification", teamPlayer];
        private _strikePlane = _unit getVariable "Plane";
        private _timerArray = _strikePlane getVariable "TimerArray";
        private _timerIndex = _strikePlane getVariable "TimerIndex";
        _timerArray set [_timerIndex, (_timerArray select _timerIndex) + 3600];
        [_unit] spawn A3A_fnc_postMortem;
    }
];
_strikeGroup deleteGroupWhenEmpty true;

_strikePlane flyInHeight 1000;

//Decrease time if aggro is low
private _sideAggression = if(_side == Occupants) then {aggressionOccupants} else {aggressionInvaders};
private _timeAlive = 600;
private _possibleKills = 3;//[_strikePlane, 0] call A3A_fnc_countMissiles;

if(_sideAggression < (30 + (random 40))) then
{
    _timeAlive = 300;
    //Plane needs to have at least 6 missiles in all cases
    _possibleKills = 2;
};

[_strikePlane, "AA"] call A3A_fnc_setPlaneLoadout;

_strikePlane setVariable ["InArea", false, true];
_strikePlane setVariable ["CurrentlyAttacking", false, true];

private _dir = (getPos _strikePlane) getDir _setupPos;
_strikePlane setDir _dir;

/*
//Calculate loiter entry point
private _distance = _strikePlane distance2D _setupPos;
private _angle = asin (1500/_distance);
private _lenght = cos (_angle) * _distance;

private _height = (ATLToASL _supportPos) select 2;
_height = _height + 500;

private _entryPos = _setupPos getPos [_lenght, _dir + _angle];
[3, format ["Entry Pos: %1", _entryPos], _fileName] call A3A_fnc_log;
_entryPos set [2, _height];

private _areaWP = _strikeGroup addWaypoint [_entryPos, 50];
_areaWP setWaypointCombatMode "GREEN";
_areaWP setWaypointSpeed "FULL";
_areaWP setWaypointType "Move";
_areaWP setWaypointStatements ["true", "(vehicle this) setVariable ['InArea', true, true]; [3, 'ASF plane has arrived', 'ASFRoutine'] call A3A_fnc_log"];
*/

private _loiterWP = _strikeGroup addWaypoint [_setupPos, 2];
_loiterWP setWaypointSpeed "NORMAL";
_loiterWP setWaypointType "Loiter";
_loiterWP setWaypointLoiterRadius 2000;

private _time = time;
sleep 15;
_strikePlane setVariable ["InArea", true, true];

//waitUntil {sleep 1; !(alive _strikePlane) || (_strikePlane getVariable ["InArea", false])};

if !(alive _strikePlane) exitWith
{
    [_supportName, _side] call A3A_fnc_endSupport;
};

//_timeAlive = _timeAlive - (time - _time);

private _targetObj = objNull;
while {_timeAlive > 0} do
{
    if !(_strikePlane getVariable "CurrentlyAttacking") then
    {
        //[3, format ["Searching new target for %1", _supportName], _fileName] call A3A_fnc_log;
        //Plane is currently not attacking a target, search for new order
        private _targetList = server getVariable [format ["%1_targets", _supportName], []];
        if (count _targetList > 0) then
        {
            //New target active, read in
            private _target = _targetList deleteAt 0;
            server setVariable [format ["%1_targets", _supportName], _targetList, true];

            [3, format ["Next target for %2 is %1", _target, _supportName], _fileName] call A3A_fnc_log;

            //Parse targets
            private _targetParams = _target select 0;
            private _reveal = _target select 1;

            _targetObj = _targetParams select 0;
            private _precision = _targetParams select 1;
            private _targetPos = getPos _targetObj;

            _strikeGroup reveal [_targetObj, _precision];
            _strikePlane flyInHeight 250;

            //Show target to players if change is high enough
            private _textMarker = createMarker [format ["%1_text", _supportName], getPos _targetObj];
            _textMarker setMarkerShape "ICON";
            _textMarker setMarkerType "mil_objective";
            _textMarker setMarkerText "ASF Target";

            if(_side == Occupants) then
            {
                _textMarker setMarkerColor colorOccupants;
            }
            else
            {
                _textMarker setMarkerColor colorInvaders;
            };
            _textMarker setMarkerAlpha 0;

            [_textMarker, _targetObj, _strikePlane] spawn
            {
                params ["_textMarker", "_targetObj", "_strikePlane"];
                while {!(isNull _targetObj) && (alive _targetObj)} do
                {
                    _textMarker setMarkerPos (getPos _targetObj);

                    if((isNull _strikePlane) || !(alive _strikePlane)) exitWith {};

                    sleep 0.5;
                };
                deleteMarker _textMarker;
            };

            [_reveal, getPos _targetObj, _side, "ASF", "", _textMarker] spawn A3A_fnc_showInterceptedSupportCall;
            _strikePlane setVariable ["CurrentlyAttacking", true, true];

            private _attackWP = _strikeGroup addWaypoint [_targetPos, 3];
            _attackWP setWaypointType "DESTROY";
            _attackWP waypointAttachObject _targetObj;
            _attackWP setWaypointSpeed "FULL";
            _strikeGroup setCurrentWaypoint _attackWP;

            _strikeGroup setBehaviour "COMBAT";
            _strikeGroup setCombatMode "RED";
        };
    }
    else
    {
        if(isNull _targetObj || {!(alive _targetObj) || {(_targetObj distance2D _setupPos) > 8000}}) then
        {
            if(isNull _targetObj || {!(alive _targetObj)}) then
            {
                _possibleKills = _possibleKills - 1;
                [3, format ["Target destroyed, %1 returns to cycle mode", _supportName], _fileName] call A3A_fnc_log;
            }
            else
            {
                [3, format ["Target evaded, %1 returns to cycle mode", _supportName], _fileName] call A3A_fnc_log;
            };

            //Target destroyed
            _strikePlane setVariable ["CurrentlyAttacking", false, true];

            for "_i" from count waypoints _strikeGroup - 1 to 0 step -1 do
            {
                deleteWaypoint [_strikeGroup, _i];
            };

            private _loiterWP = _strikeGroup addWaypoint [_setupPos, 2];
            _loiterWP setWaypointSpeed "NORMAL";
            _loiterWP setWaypointType "Loiter";
            _loiterWP setWaypointLoiterRadius 2000;
            _strikeGroup setCurrentWaypoint _loiterWP;

            _strikeGroup setBehaviour "AWARE";
            _strikeGroup setCombatMode "GREEN";

            _strikePlane flyInHeight 1000;
        };
    };

    //Plane somehow destroyed
    if
    (
        !(alive _strikePlane) ||
        {({alive _x} count (units _strikeGroup)) == 0}
    ) exitWith
    {
        [2,format ["%1 has been destroyed or crew killed, aborting routine", _supportName],_fileName] call A3A_fnc_log;
        if(_side == Occupants) then
        {
            [[20, 45], [0, 0]] remoteExec ["A3A_fnc_prestige", 2];
        }
        else
        {
            [[0, 0], [20, 45]] remoteExec ["A3A_fnc_prestige", 2];
        };
    };

    //No missiles left
    if (!(_strikePlane getVariable "CurrentlyAttacking") && (_possibleKills <= 0)) exitWith
    {
        [2,format ["%1 has no more missiles left to fire, aborting routine", _supportName],_fileName] call A3A_fnc_log;
    };

    //Retreating
    if(_strikePlane getVariable ["Retreat", false]) exitWith
    {
        [2,format ["%1 met heavy resistance, retreating", _supportName], _fileName] call A3A_fnc_log;
    };

    sleep 5;
    _timeAlive = _timeAlive - 5;
};

//Have the plane fly back home
if (alive _strikePlane && {!(isNull (driver _strikePlane)) && {[driver _strikePlane] call A3A_fnc_canFight}}) then
{
    for "_i" from (count waypoints _strikeGroup - 1) to 0 step -1 do
    {
	       deleteWaypoint [_strikeGroup, _i];
    };
    private _wpBase = _strikeGroup addWaypoint [getMarkerPos _airport, 0];
    _wpBase setWaypointType "MOVE";
    _wpBase setWaypointBehaviour "CARELESS";
    _wpBase setWaypointSpeed "FULL";
    _wpBase setWaypointStatements ["", "deleteVehicle (vehicle this); {deleteVehicle _x} forEach thisList"];
    _strikeGroup setCurrentWaypoint _wpBase;

    waitUntil {sleep 0.5;_strikePlane distance2D (getMarkerPos _airport) < 100};
    {
        deleteVehicle _x;
    } forEach (units _strikeGroup);
    deleteVehicle _strikePlane;
};

//Deleting all the support data here
[_supportName, _side] call A3A_fnc_endSupport;
