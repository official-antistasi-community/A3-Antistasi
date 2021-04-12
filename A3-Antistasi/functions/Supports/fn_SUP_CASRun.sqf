params ["_strikePlane", "_target", "_supportName"];

private _fileName = "SUP_CASRun";
//Take over control
[3, format ["%1 has started gun run", _supportName], _fileName] call A3A_fnc_log;
_strikePlane setVariable ["OnRun", true];
private _supportMarker = format ["%1_coverage", _supportName];

//When reached, update run path
private _targetPos = (getPosASL _target) vectorAdd [0, 0, 2];
private _targetVector = [400, 0];
private _dir = (_strikePlane getDir _target) + 90;
_targetVector = [_targetVector, -_dir] call BIS_fnc_rotateVector2D;
private _sideVector = [_targetVector, -_dir + 90] call BIS_fnc_rotateVector2D;
_sideVector set [2, 0];

_enterRunPos = getPosASL _strikePlane;
private _exitRunPos = _targetPos vectorAdd _targetVector;
private _forward = _exitRunPos vectorDiff _enterRunPos;
private _upVector = (_forward vectorCrossProduct _sideVector) vectorMultiply -1;
private _forwardSpeed = (velocityModelSpace _strikePlane) select 1;
private _timeForRun = 1620 / _forwardSpeed;
private _speedVector = (vectorNormalized _forward) vectorMultiply _forwardSpeed;

private _interval = 0;
private _realTime = 0;

//Creating the startpoint for the fire EH loop
private _fnc_executeWeaponFire =
{
    params ["_strikePlane", "_fireParams"];
    _fireParams params ["_armed", "_mainGunShots", "_rocketShots", "_missileShots"];
    private _ammoCount = _strikePlane getVariable "ammoCount";

    if(_mainGunShots > 0) then
    {
        //Fire main gun with selected mode
        private _weapon = _strikePlane getVariable ["mainGun", ""];
        private _modes = getArray (configFile >> "cfgweapons" >> _weapon >> "modes");
        private _mode =  _modes select 0;
        if (_mode == "this") then
        {
            _mode = _weapon;
        }
        else
        {
            if ("close" in _modes) then
            {
                _mode = "close";
            };
        };

        //Force weapon fire
        _strikePlane setVariable ["mainGunShots", (_mainGunShots - 1)];
        (driver _strikePlane) forceWeaponFire [_weapon, _mode];
    };
    if(_rocketShots > 0) then
    {
        //Select rocket weapon for use
        private _weapons = _strikePlane getVariable ["rocketLauncher", []];
        private _selectedWeapon = objNull;
        if(count _weapons > 1) then
        {

            private _currentHighest = 0;
            {
                private _weapon = _x;
                private _index = _ammoCount findIf {_x select 0 == _weapon};
                if ((_selectedWeapon == "") || {_ammoCount#_index#1 > _currentHighest}) then
                {
                    _selectedWeapon = _weapon;
                    _currentHighest = _ammoCount#_index#1;
                };
                //Weapon with more shots then needed found, using it
                if(_currentHighest >= _rocketShots) exitWith {};
            } forEach _weapons;
            if(_currentHighest < _rocketShots) then
            {
                _strikePlane setVariable ["OutOfAmmo", true];
            };
        }
        else
        {
            if(count _weapons == 1) then
            {
                _selectedWeapon = _weapons#0;
                private _index = _ammoCount findIf {_x select 0 == _selectedWeapon};
                if(_ammoCount#_index#1 < _rocketShots) then
                {
                    _strikePlane setVariable ["OutOfAmmo", true];
                };
            };
        };

        //If weapon available fire it
        if(_selectedWeapon isEqualType "") then
        {
            //Select fire mode for weapon
            private _modes = (getArray (configFile >> "cfgweapons" >> _selectedWeapon >> "modes"));
            private _mode = _modes select 0;
            if (_mode == "this") then
            {
                _mode = _selectedWeapon;
            }
            else
            {
                if ("Close_AI" in _modes) then
                {
                    _mode = "Close_AI";
                };
                if("Single" in _modes) then
                {
                    _mode = "Single";
                };
            };

            //Force weapon fire
            _strikePlane setVariable ["rocketShots", (_rocketShots - 1)];
            (driver _strikePlane) forceWeaponFire [_selectedWeapon, _mode];
        };
    };
    if(_missileShots > 0) then
    {
        //Select missile weapon
        private _weapons = _strikePlane getVariable ["missileLauncher", []];
        private _selectedWeapon = "";
        if(count _weapons > 1) then
        {
            private _currentHighest = 0;
            {
                private _weapon = _x;
                private _index = _ammoCount findIf {_x select 0 == _weapon};
                if ((_selectedWeapon == "") || {_ammoCount#_index#1 > _currentHighest}) then
                {
                    _selectedWeapon = _weapon;
                    _currentHighest = _ammoCount#_index#1;
                };
                //Weapon with more shots then needed found, using it
                if(_currentHighest >= _missileShots) exitWith {};
            } forEach _weapons;
            if(_currentHighest < _missileShots) then
            {
                _strikePlane setVariable ["OutOfAmmo", true];
            };
        }
        else
        {
            if(count _weapons == 1) then
            {
                _selectedWeapon = _weapons#0;
                private _index = _ammoCount findIf {_x select 0 == _selectedWeapon};
                if(_ammoCount#_index#1 < _missileShots) then
                {
                    _strikePlane setVariable ["OutOfAmmo", true];
                };
            };
        };

        //Fire weapon if one is selected (guided weapons only gets fired when they have a lockon possibility on the target)
        if(_selectedWeapon isEqualType "") then
        {
            _strikePlane fireAtTarget [_strikePlane getVariable "currentTarget", _selectedWeapon];
            _strikePlane setVariable ["missileShots", (_missileShots - 1)];
        };
    };
};

/*
private _fireParams =
[
    //[armed, main gun shots, rocket shots, missile shots]
    [true, 20, 3, 1],
    [true, 30, 5, 1],
    [true, 40, 7, 0]
];
*/
private _fireParams = +(_strikePlane getVariable "fireParams");

while {_interval < 0.95 && alive _strikePlane && {!(isNull (driver _strikePlane))}} do
{
    if(!(alive _target) || {!(_strikePlane getVariable ["InArea", false]) || {!(getPos _target inArea _supportMarker)}}) exitWith
    {
        [3, format ["%1 target eliminated or escaped, returning to loitering", _supportName], _fileName] call A3A_fnc_log;
        _strikePlane setVariable ["currentTarget", objNull];
    };

    if(_realTime > 0.5) then
    {
        //Update course of plane
        _realTime = 0;
        _targetPos = (getPosASL _target) vectorAdd [0, 0, 2];
        _targetVector = [400, 0];
        _dir = (_strikePlane getDir _target) + 90;
        _sideVector = [_targetVector, -_dir + 90] call BIS_fnc_rotateVector2D;
        _targetVector = [_targetVector, -_dir] call BIS_fnc_rotateVector2D;
        _targetVector pushBack 100;
        _sideVector pushBack 0;
        _exitRunPos = _targetPos vectorAdd _targetVector;

        private _strikePlanePos = getPosASL _strikePlane;
        private _way = _strikePlanePos vectorDiff _exitRunPos;

        _enterRunPos = _exitRunPos vectorAdd (_way vectorMultiply (1/(1-_interval)));
        _forward = _exitRunPos vectorDiff _enterRunPos;
        _speedVector = (vectorNormalized _forward) vectorMultiply _forwardSpeed;
        _upVector = (_forward vectorCrossProduct _sideVector) vectorMultiply -1;

        if(terrainIntersect [getPosASL _strikePlane, _targetPos]) exitWith
        {
            [3, format ["%1 gun way is blocked, recalculating", _supportName], _fileName] call A3A_fnc_log;
            _strikePlane setVariable ["needsRecalculation", true];
        };
    };

    if(_strikePlane getVariable ["needsRecalculation", false]) exitWith {};

    _strikePlane setVelocityTransformation
    [
        _enterRunPos, _exitRunPos,
        _speedVector, _speedVector,
        _forward, _forward,
        _upVector, _upVector,
        _interval
    ];

    sleep 0.05;
    _interval = _interval + (0.05 / _timeForRun);
    _realTime = _realTime + 0.05;

    //FIRE MECHANISM
    //First burst
    if(_interval > 0.25 && (_fireParams#0#0)) then
    {
        //Execute fire params
        [_strikePlane, _fireParams#0] spawn _fnc_executeWeaponFire;
        (_fireParams#0) set [0, false];
    };
    //Second burst
    if(_interval > 0.5 && (_fireParams#1#0)) then
    {
        //Execute fire params
        [_strikePlane, _fireParams#1] spawn _fnc_executeWeaponFire;
        (_fireParams#1) set [0, false];
    };
    //Third burst
    if(_interval > 0.75 && (_fireParams#2#0)) then
    {
        //Execute fire params
        [_strikePlane, _fireParams#2] spawn _fnc_executeWeaponFire;
        (_fireParams#2) set [0, false];
    };
    //FIRE MECHANISM END
};

//Plane died, exit
if(!(alive _strikePlane) || (isNull driver _strikePlane)) exitWith {};

if(_strikePlane getVariable ["InArea", false]) then
{
    //Plane is alive, set new circle waypoint
    private _group = group driver _strikePlane;
    for "_i" from (count waypoints _group - 1) to 0 step -1 do
    {
    	deleteWaypoint [_group, _i];
    };

    private _loiterWP = (group driver _strikePlane) addWaypoint [(getMarkerPos _supportMarker), 0];
    _loiterWP setWaypointSpeed "NORMAL";
    _loiterWP setWaypointType "Loiter";
    _loiterWP setWaypointLoiterRadius 2000;
};

//Await until the plane arrived at a specific height until breaking control
waitUntil
{
    private _velocity = velocity _strikePlane;
    _velocity set [2, (_velocity select 2) + 0.5];
    _strikePlane setVelocity _velocity;
    sleep 0.5;
    ((getPos _strikePlane) select 2) > 450
};
[3, format ["Gun run for %1 finished, returning control", _supportName], _fileName] call A3A_fnc_log;
_strikePlane setVariable ["OnRun", false];
_strikePlane setVariable ["needsRecalculation", true];
