params ["_sleepTime", "_timerIndex", "_airport", "_supportPos", "_supportName"];

private _fileName = "SUP_gunshipRoutineCSAT";

while {_sleepTime > 0} do
{
    sleep 1;
    _sleepTime = _sleepTime - 1;
    if((spawner getVariable _airport) != 2) exitWith {};
};

private _gunshipData = [Invaders, _airport, _timerIndex, "O_T_VTOL_02_vehicle_dynamicLoadout_F", CSATPilot, _supportPos] call A3A_fnc_SUP_gunshipSpawn;
_gunshipData params ["_gunship", "_strikeGroup"];

{
    _gunship setPylonLoadout [_forEachIndex + 1, _x, true];
} forEach ["PylonRack_19Rnd_Rocket_Skyfire","PylonRack_19Rnd_Rocket_Skyfire","PylonRack_19Rnd_Rocket_Skyfire","PylonRack_19Rnd_Rocket_Skyfire"];

//Prepare crew units and spawn them in
private _mainGunner = [_strikeGroup, CSATPilot, getPos _gunship] call A3A_fnc_createUnit;
_mainGunner moveInAny _gunship;

_gunship addEventHandler
[
    "Fired",
    {
        params ["_gunship", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_gunner"];

        private _target = _gunship getVariable ["currentTarget", objNull];
        if(_target isEqualTo objNull) exitWith {};

        if(_target isEqualType objNull) then
        {
            _target = getPosASL _target;
        };

        if(_weapon == "rockets_Skyfire") then
        {
            _target = _target apply {_x + (random 50) - 25};
            [_projectile, _target] spawn
            {
                params ["_projectile", "_target"];
                sleep 0.25;
                private _speed = (speed _projectile)/3.6;
                while {!(isNull _projectile) && {alive _projectile}} do
                {
                    /*
                    The missile will do a sharp 90 degree turn to hit its target

                    A smoother path is a bit more complex and not worth the work or computing time but here is the general idea
                    Take the normalised current dir and the normalised target vector and split transform them as follows
                    THIS IS NOT GUARANTEED TO BE RIGHT!!! CHECK BEFORE USING IT

                    private _alpha = atan (y/x)
                    private _beta = asin (z)

                    Now you got the vectors in polar form, and you are now able to calculate the degree diff between them

                    private _alphaDiff = (_alphaTarget - _alphaDir) % 180
                    private _betaDiff = (_betaTarget - _betaDir) % 180

                    To get a fixed turn rate, calculate the angle these two diff vectors are creating

                    private _turnAngle = atan (_alphaDiff/_betaDiff)

                    Now recalculate the actual lenght based on the turn limit (in degree)

                    private _limitAlpha = cos (_turnAngle) * TURN_LIMIT
                    private _limitBeta = sin (_turnAngle) * TURN_LIMIT

                    Check if _limitAlpha and _limitBeta are bigger than their diff values, if so, continue with diff values

                    Now create the new dir vector out of the data (make sure the _limit values has the right sign)

                    private _newAlpha = _alphaDir + _limitAlpha
                    private _newBeta = _betaDir + _limitBeta

                    private _newVectorZ = sin (_newBeta)
                    private _planeLength = cos (_newBeta)

                    private _newVectorX = cos (_newAlpha) * _planeLength
                    private _newVectorY = sin (_newAlpha) * _planeLength

                    private _newDir = [_newVectorX, _newVectorY, _newVectorZ]

                    This is the new dir vector which is also exact 1 long and therefor normalised

                    This useless code part was sponsored by ComboTombo
                    */
                    sleep 0.25;
                    private _dir = vectorNormalized (_target vectorDiff (getPosASL _projectile));
                    _projectile setVelocity (_dir vectorMultiply _speed);
                    _projectile setVectorDir _dir;
                };
            };
        };
        if(_weapon == "gatling_30mm_VTOL_02") then
        {
            _target = (_target vectorAdd [0,0,20]) apply {_x + (random 10) - 5};
            private _speed = (speed _projectile)/3.6;
            private _dir = vectorNormalized (_target vectorDiff (getPosASL _projectile));
            _projectile setVelocity (_dir vectorMultiply _speed);
            _projectile setVectorDir _dir;
        };
    }
];

private _targetList = server getVariable [format ["%1_targets", _supportName], []];
private _reveal = _targetList select 0 select 1;

private _supportMarker = format ["%1_coverage", _supportName];
private _supportPos = getMarkerPos _supportMarker;

private _textMarker = createMarker [format ["%1_text", _supportName], _supportPos];
_textMarker setMarkerShape "ICON";
_textMarker setMarkerType "mil_dot";
_textMarker setMarkerText "Gunship";
_textMarker setMarkerColor colorInvaders;
_textMarker setMarkerAlpha 0;
[_reveal, _supportPos, Invaders, "GUNSHIP", format ["%1_coverage", _supportName], _textMarker] spawn A3A_fnc_showInterceptedSupportCall;

waitUntil
{
    sleep 1;
    (isNull _gunship) ||
    {!(alive _gunship) ||
    (_gunship getVariable ["InArea", false])}
};

if !(_gunship getVariable ["InArea", false]) exitWith
{
    [3, format ["%1 has been destroyed before reaching the area", _supportName], _fileName] call A3A_fnc_log;
    //Gunship destroyed before reaching the area
};

_gunship setVariable ["IsActive", true];

//Define the belts used against targets, true means HE round, false means AP round
private _antiInfBelt = [true, true, true];
private _antiLightVehicleBelt = [true, false, true];
private _antiAPCBelt = [false, true, false];
private _antiTankBelt = [false, false, false];

private _mainGunnerList = [];
[_gunship, _mainGunnerList, _mainGunner, _supportName] spawn
{
    params ["_gunship", "_mainGunnerList", "_mainGunner", "_supportName"];

    private _fnc_executeFireOrder =
    {
        [3, format ["Fireorder %1 recieved", _this], "ExecuteFireOrder"] call A3A_fnc_log;
        params ["_gunner", "_target", "_gunshots", "_belt", "_rocketShots"];
        private _gunship = vehicle _gunner;
        private _steps = _gunshots max _rocketShots;

        //Calculate used ammo
        private _rocketsLeft = _gunship getVariable ["Rockets", 0];
        _rocketsLeft = _rocketsLeft - _rocketShots;
        if(_rocketsLeft <= 0) then {_gunship setVariable ["OutOfAmmo", true]};
        _gunship setVariable ["Rockets", _rocketsLeft];

        private _HEUsed = {_x} count _belt;
        private _APUsed = 3 - _HEUsed;

        private _APLeft = _gunship getVariable ["AP_Ammo", 0];
        _APLeft = _APLeft - ((_APUsed/3) * _gunshots);
        _gunship setVariable ["AP_Ammo", _APLeft];

        private _HELeft = _gunship getVariable ["HE_Ammo", 0];
        _HELeft = _HELeft - ((_HEUsed/3) * _gunshots);
        _gunship setVariable ["HE_Ammo", _HELeft];

        if(_HELeft <= 0 || _APLeft <= 0) then
        {
            _gunship setVariable ["OutOfAmmo", true];
        };

        _gunship setVariable ["currentTarget", _target];

        _gunner reveal [_target, 3];
        _gunner doTarget _target;
        _gunner doWatch _target;

        //Simulate targeting time (cause the fucking AI does not targets for real)
        sleep 0.3;

        for "_i" from 1 to _steps do
        {
            if(_gunshots > 0) then
            {
                private _muzzle = if(_belt select ((_i - 1) % 3)) then {"HE"} else {"AP"};
                _gunner forceWeaponFire [_muzzle, "close"];
                _gunshots = _gunshots - 1;
            };
            if(_rocketShots > 0) then
            {
                _gunner forceWeaponFire ["rockets_Skyfire", "Burst"];
                _rocketShots = _rocketShots - 1;
            };
            sleep 0.1;
        };

        _gunner doTarget objNull;
        _gunner doWatch objNull;
        _gunship setVariable ["currentTarget", nil];
    };

    while {_gunship getVariable ["IsActive", false]} do
    {
        if(isNull (_gunship getVariable ["currentTarget", objNull])) then
        {
            //Currently not firing
            private _targetList = server getVariable [format ["%1_targets", _supportName], []];
            if(count _targetList > 0) then
            {
                [3, "Using priority list", "Gunship"] call A3A_fnc_log;
                //Priority target, execute first
                private _target = _targetList#0#0#0;
                private _supportMarker = format ["%1_coverage", _supportName];
                if
                (
                    ((_target distance2D (getMarkerPos _supportMarker)) < 350) &&
                    {(_target isKindOf "Man" && {[_target] call A3A_fnc_canFight}) ||
                    {(_target isKindOf "AllVehicles") && (alive _target)}}
                ) then
                {
                    //Target active
                    if(_target isKindOf "LandVehicle") then
                    {
                        if(_target isKindOf "Tank") then
                        {
                            [_mainGunner, _target, 24, [false, false, false], 0] call _fnc_executeFireOrder;
                        }
                        else
                        {
                            [_mainGunner, _target, 24, [false, true, false], 8] call _fnc_executeFireOrder;
                        };
                    }
                    else
                    {
                        [_mainGunner, _target, 24, [true, true, true], 4] call _fnc_executeFireOrder;
                    };
                }
                else
                {
                    //Target eliminated, remove from list
                    _targetList deleteAt 0;
                    server setVariable [format ["%1_targets", _supportName], _targetList, true];
                };
            }
            else
            {
                if(count _mainGunnerList > 0) then
                {
                    [3, "Using target list", "Gunship"] call A3A_fnc_log;
                    private _targetParams = _mainGunnerList deleteAt 0;
                    _targetParams params ["_target", "_gunshots", "_belt", "_rocketShots"];
                    if
                    (
                        (_target isKindOf "Man" && {[_target] call A3A_fnc_canFight}) ||
                        {_target isKindOf "AllVehicles" && (alive _target)}
                    ) then
                    {
                        [_mainGunner, _target, _gunshots, _belt, _rocketShots] call _fnc_executeFireOrder;
                    };
                }
                else
                {
                    _gunship setVariable ["CurrentlyFiring", false];
                };
            };
        };
        sleep 1;
    };
};

_gunship setVariable ["AP_Ammo", 250];
_gunship setVariable ["HE_Ammo", 250];
_gunship setVariable ["Rockets", 76];

private _supportMarker = format ["%1_coverage", _supportName];
private _supportPos = getMarkerPos _supportMarker;

//_strikeGroup setCombatMode "YELLOW";

private _lifeTime = 300;
while {_lifeTime > 0} do
{
    if !(_gunship getVariable ["CurrentlyFiring", false]) then
    {
        private _targets = _supportPos nearEntities [["Man", "LandVehicle", "Helicopter"], 250];
        _targets = _targets select
        {
            if(_x isKindOf "Man") then
            {
                ((side group _x) != Invaders) && {[_x] call A3A_fnc_canFight}
            }
            else
            {
                (alive _x) && {(isNull driver _x) || {side group driver _x != Invaders}}
            }
        };
        [3, format ["%1 found %2 targets in its area", _supportName, count _targets], _fileName] call A3A_fnc_log;


        if(count _targets > 0) then
        {
            {
                private _target = _x;
                if(_target isKindOf "Helicopter") then
                {
                    //Fast moving helicopter, use minigun against it
                    _mainGunnerList pushBack [_target, 12, _antiLightVehicleBelt, 0];
                }
                else
                {
                    if(_target isKindOf "LandVehicle") then
                    {
                        if(_target isKindOf "Tank") then
                        {
                            //MBT, breach with AP ammo
                            _mainGunnerList pushBack [_target, 24, _antiTankBelt, 0];
                        }
                        else
                        {
                            if(_target in vehAPCs) then
                            {
                                //APC, use mainly AP and rarely rockets
                                _mainGunnerList pushBack [_target, 18, _antiAPCBelt, 4];
                            }
                            else
                            {
                                //Any kind of light vehicle, destroy with rockets and mixed belt
                                _mainGunnerList pushBack [_target, 12, _antiLightVehicleBelt, 8];
                            };
                        };
                    }
                    else
                    {
                        //Infantry, if crowded use rockets too
                        private _nearUnits = _targets select {(_x isKindOf "Man") && ([_x] call A3A_fnc_canFight) && {(_x distanceSqr _target) < 100}};
                        private _rockets = 0;
                        if(count _nearUnits > 2) then {_rockets = 4};
                        _mainGunnerList pushBack [_target, 6, _antiInfBelt, _rockets];
                    };
                };
            } forEach _targets;
            _gunship setVariable ["CurrentlyFiring", true];
        };
    };

    //No ammo left
    if(_gunship getVariable ["OutOfAmmo", false]) exitWith
    {
        [2, format ["%1 run out of ammo, returning to base", _supportName], _fileName] call A3A_fnc_log;
        _gunship setVariable ["currentTarget", objNull];
    };

    //Retreating
    if(_gunship getVariable ["Retreat", false]) exitWith
    {
        [2,format ["%1 met heavy resistance, retreating", _supportName], _fileName] call A3A_fnc_log;
        _gunship setVariable ["currentTarget", objNull];
    };

    //Gunship died
    if !(alive _gunship) then
    {
        [2, format ["%1 has been destroyed while in the area", _supportName], _fileName] call A3A_fnc_log;
        _gunship setVariable ["currentTarget", objNull];
    };

    sleep 10;
    _lifeTime = _lifeTime - 10;
};

_gunship setVariable ["IsActive", false];

//Have the plane fly back home
if (alive _gunship) then
{
    private _wpBase = _strikeGroup addWaypoint [(getMarkerPos _airport) vectorAdd [0, 0, 1000], 0];
    _wpBase setWaypointType "MOVE";
    _wpBase setWaypointBehaviour "CARELESS";
    _wpBase setWaypointSpeed "FULL";
    _wpBase setWaypointStatements ["", "deleteVehicle (vehicle this); {deleteVehicle _x} forEach thisList"];
    _strikeGroup setCurrentWaypoint _wpBase;
    _gunship flyInHeight 1000;

    waitUntil {!(alive _gunship) || ((getMarkerPos _airport) distance2D _gunship) < 100};
    if(alive _gunship) then
    {
        {
            deleteVehicle _x;
        } forEach (crew _gunship);
        deleteVehicle _gunship;
    };
};

//Deleting all the support data here
[_supportName, Invaders] call A3A_fnc_endSupport;
