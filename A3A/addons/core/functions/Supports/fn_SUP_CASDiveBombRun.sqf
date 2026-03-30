/*  CAS routine to perform a dive bombing attack run

Environment: Server, scheduled, internal

Arguments:
    <OBJECT> Aircraft object to use
    <OBJECT> Target object for attack run
    <STRING> Name of support (for debug logging)
    <ARRAY> Waypoint to use for approach
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_plane", "_target", "_supportName", "_waypoint"];
private _group = group driver _plane;

(_plane getVariable "diveParams") params ["_startAlt", "_endAlt", "_diveSpeed", "_diveAngle", "_turnRate", "_bombDrag"];
//_plane setVariable ["A3A_diveSpeed", _diveSpeed];       // used for bomb correction

// Reduce accuracy against foot troops
private _targetOffset = [0,0,0];
if (_target isKindOf "Man") then { _targetOffset getPos [random 100, random 360]; _targetOffset set [2, 0] };

// Delay on loop until we're in the correct position
private _inPosition = false;
while {true} do {
    if (!alive _target or !canMove _plane or isNull driver _plane) exitWith {
        Debug_1("Divebomb pre-dive for %1 terminated before completion", _supportName);
    };

    // Target lead calc
    private _timeToTarget = 1.1 * (_plane distance _target) / _diveSpeed;
    private _targetPos = eyePos _target vectorAdd (velocity _target vectorMultiply _timeToTarget);        // posASL
    _targetPos = _targetPos vectorAdd _targetOffset;

    private _targDirFwd = getPosASL _plane vectorFromTo _targetPos;
    _targDirFwd = vectorNormalized [_targDirFwd#0, _targDirFwd#1, 0];

    _waypoint setWaypointPosition [_targetPos vectorAdd (_targDirFwd vectorMultiply 1000), -1];
    _plane flyInHeight _startAlt;
    _group setCurrentWaypoint _waypoint;

    private _horizDist = _plane distance2d _targetPos;
    private _diveDist = (getPosATL _plane#2) / tan _diveAngle;      //_cpHorizDist + 
    private _remDist = _horizDist - _diveDist;

    //Debug_3("HorizDist %1, diveDist %2, heading %3", _horizDist, _diveDist, _targDirFwd vectorDotProduct vectorDir _plane);

    if (_remDist < -25) exitWith { Debug_1("Divebomb pre-dive for %1 terminated due to overshoot", _supportName) };
    if (_remDist < 25 and _targDirFwd vectorDotProduct vectorDir _plane > 0.9) exitWith { _inPosition = true };

    private _sleepTime = 0.1 max (_remDist / (1.2 * vectorMagnitude velocity _plane)) min 1;
    sleep _sleepTime;
};

if (!_inPosition) exitWith { false };
Debug_1("Divebomb dive started for %1", _supportName);


// Remove weapon & plane sim inaccuracy from bombs
private _firedEH = _plane addEventHandler ["Fired", {
    params ["_plane", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_gunner"];

    private _dir = _plane getVariable "A3A_diveLastDir";
    //Debug_3("Correcting bomb trajectory: old %1, new %2, plane %3", asin -(vectorDir _projectile#2), asin -(_dir#2), asin -(vectorDir _plane#2));
    _projectile setVelocity (velocity _plane);
    _projectile setVectorDir (vectorDir _plane);

// Apparently bombs drop before the false simulation update happens, so this isn't required
//    _projectile setVelocity (_dir vectorMultiply (_plane getVariable "A3A_diveSpeed"));
//    _projectile setVectorDir (_dir);        //vectorDir _plane);
}];

driver _plane disableAI "All";
_plane setVariable ["A3A_diveLastDir", vectorDir _plane];
_plane setVariable ["A3A_diveLastPos", getPosASL _plane];

private _ehID = addMissionEventHandler ["EachFrame", {
    _thisArgs params ["_plane", "_target", "_endAlt", "_diveSpeed", "_turnRate", "_bombDrag", "_targetOffset"];

    if (!alive _target or !canMove _plane or isNull driver _plane) exitWith {
        Debug("EachFrame handler abandoned due to target or plane damage");
        removeMissionEventHandler ["EachFrame", _thisEventHandler];
        driver _plane enableAI "All";
    };

    private _dir = _plane getVariable "A3A_diveLastDir";   //vectorDir _plane;
    private _bombOffset = vectorNormalized [_dir#0, _dir#1, 0] vectorMultiply (_bombDrag#0);
    private _bombOffset = _bombOffset vectorAdd (vectorNormalized [_dir#1, -(_dir#0), 0] vectorMultiply (_bombDrag#1));
    //Debug_1("Bomb offset = %1", _bombOffset);

    private _timeToTarget = (_plane distance _target) / _diveSpeed;
    private _targetPos = getPosASL _target vectorAdd (velocity _target vectorMultiply _timeToTarget) vectorAdd _bombOffset;
    _targetPos = _targetPos vectorAdd _targetOffset;
    private _targetDir = getPosASL _plane vectorFromTo _targetPos;

    // heading adjustment
    private _rotVec = _dir vectorCrossProduct _targetDir;
    private _rotAng = asin vectorMagnitude _rotVec;
    private _maxAng = diag_deltaTime * _turnRate;
    if (_rotAng < _maxAng) then {
        _dir = _targetDir;
    } else {
        // Rodrigues' formula
        private _rotDir = vectorNormalized _rotVec;
        private _newDir = (_dir vectorMultiply cos _maxAng) vectorAdd ((_rotDir vectorCrossProduct _dir) vectorMultiply sin _maxAng);
        _dir = _newDir vectorAdd (_rotDir vectorMultiply ((_rotDir vectorDotProduct _dir) * (1 - cos _maxAng)));
    };
    //Debug_3("Old dir %1, new dir %2, alt %3", asin -(vectorDir _plane#2), asin -(_dir#2), getPosASL _plane#2 - getPosASL _target#2);

    // Need to force position for "airplanex" simulation. "airplane" is fine without it.
    private _nextPos = (_plane getVariable "A3A_diveLastPos") vectorAdd (_dir vectorMultiply _diveSpeed*diag_deltaTime);
    _plane setVariable ["A3A_diveLastDir", _dir];
    _plane setVariable ["A3A_diveLastPos", _nextPos];

// Seems to have identical behaviour, still doesn't suppress extra simulation at least with "airplane"
//    private _velocity = _dir vectorMultiply _diveSpeed;
//    private _updir = _dir vectorCrossProduct [0,0,1] vectorCrossProduct _dir;
//    _plane setVelocityTransformation [_nextPos, _nextPos, _velocity, _velocity, _dir, _dir, _updir, _updir, 0];

    _plane setPosASL _nextPos;
    _plane setVectorDirAndUp [_dir, _dir vectorCrossProduct [0,0,1] vectorCrossProduct _dir];
    _plane setVelocity (_dir vectorMultiply _diveSpeed);

    if (_plane getVariable ["bombsDropped", false]) exitWith {
        Debug("Exiting bomb run loop");
        removeMissionEventHandler ["EachFrame", _thisEventHandler];
        driver _plane enableAI "All";
    };

    if (getPosASL _plane#2 - getPosASL _target#2 < _endAlt) exitWith {
        if (_targetDir vectorDotProduct vectorDir _plane < 0.9) exitWith {
            Debug("Bomb drop abandoned due to bad heading");
            _plane setVariable ["bombsDropped", false];
        };
        Debug("Dropping bombs...");
        //Debug_3("Plane dir %1, velocity %2, altitude %3", vectorDir _plane, velocity _plane, getPosASL _plane#2 - getPosASL _target#2);
        {
            private _bombMags = getArray (configFile >> "CfgWeapons" >> _x >> "magazines");
            private _ammoCount = 0;
            {
                if (_x in _bombMags) then { _ammoCount = _ammoCount + getNumber (configFile >> "CfgMagazines" >> _x >> "count") };
            } forEach (_plane getVariable "loadout");

            private _weaponState = weaponState [_plane, [-1], _x];
            for "_i" from 1 to _ammoCount do {
                driver _plane forceWeaponFire [_weaponState#1, _weaponState#2];
            };
        } forEach (_plane getVariable "bombRacks");
        _plane setVariable ["bombsDropped", true];
    };

}, [_plane, _target, _endAlt, _diveSpeed, _turnRate, _bombDrag, _targetOffset]];

waitUntil { sleep 1; !(getEventHandlerInfo ["EachFrame", _ehID] # 0) };

_plane removeEventHandler ["Fired", _firedEH];

// return true if bombs were dropped
(_plane getVariable ["bombsDropped", false]);

