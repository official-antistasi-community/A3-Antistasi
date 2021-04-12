params ["_sleepTime", "_timerIndex", "_airport", "_supportPos", "_supportName"];

private _fileName = "SUP_gunshipRoutineNATO";

while {_sleepTime > 0} do
{
    sleep 1;
    _sleepTime = _sleepTime - 1;
    if((spawner getVariable _airport) != 2) exitWith {};
};

private _gunshipData = [Occupants, _airport, _timerIndex, "B_T_VTOL_01_armed_F", NATOPilot, _supportPos] call A3A_fnc_SUP_gunshipSpawn;
_gunshipData params ["_gunship", "_strikeGroup"];

//Prepare crew units and spawn them in
private _crew = objNull;

private _mainGunner = objNull;
private _heavyGunner = objNull;

for "_i" from 1 to 2 do
{
    _crew = [_strikeGroup, NATOPilot, getPos _gunship] call A3A_fnc_createUnit;
    if(_i == 1) then
    {
        _crew moveInTurret [_gunship, [1]];
        _heavyGunner = _crew;
    }
    else
    {
        _crew moveInTurret [_gunship, [2]];
        _mainGunner = _crew;
    };
};

_gunship addEventHandler
[
    "Fired",
    {
        params ["_gunship", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_gunner"];

        private _mainTarget = _gunship getVariable ["currentTargetMainGunner", objNull];
        private _heavyTarget = _gunship getVariable ["currentTargetHeavyGunner", objNull];
        private _target = [];

        if(_weapon == "autocannon_40mm_VTOL_01") then
        {
            if(isNull _mainTarget) exitWith {};
            _target = getPosASL _mainTarget;
            _target = (_target vectorAdd [0,0,15]) apply {_x + (random 10) - 5};
        };
        if(_weapon == "gatling_20mm_VTOL_01") then
        {
            if(isNull _heavyTarget) exitWith {};
            _target = getPosASL _heavyTarget;
            _target = (_target vectorAdd [0,0,30]) apply {_x + (random 15) - 7.5};
        };
        if(_weapon == "cannon_105mm_VTOL_01") then
        {
            if(isNull _heavyTarget) exitWith {};
            _target = getPosASL _heavyTarget;
            _target = (_target vectorAdd [0,0,10]) apply {_x + (random 2) - 1};
            _gunship setWeaponReloadingTime [_gunner, _weapon, 0.3];
        };

        private _speed = (speed _projectile)/3.6;
        private _dir = vectorNormalized (_target vectorDiff (getPosASL _projectile));
        _projectile setVelocity (_dir vectorMultiply _speed);
        _projectile setVectorDir _dir;
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
_textMarker setMarkerColor colorOccupants;
_textMarker setMarkerAlpha 0;
[_reveal, _supportPos, Occupants, "GUNSHIP", format ["%1_coverage", _supportName], _textMarker] spawn A3A_fnc_showInterceptedSupportCall;

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
private _heavyGunnerList = [];

//Fire loop for 40mm cannon gunner
[_gunship, _mainGunnerList, _mainGunner, _supportName] spawn
{
    params ["_gunship", "_mainGunnerList", "_mainGunner", "_supportName"];

    private _fnc_executeFireOrder =
    {
        [3, format ["Fireorder %1 recieved", _this], "ExecuteFireOrder_Main"] call A3A_fnc_log;
        params ["_gunner", "_target", "_gunshots", "_belt"];
        private _gunship = vehicle _gunner;

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

        _gunship setVariable ["currentTargetMainGunner", _target];

        _gunner reveal [_target, 3];
        _gunner doTarget _target;
        _gunner doWatch _target;

        //Simulate targeting time (cause the fucking AI does not targets for real)
        sleep 0.3;

        for "_i" from 1 to _gunshots do
        {
            private _muzzle = if(_belt select ((_i - 1) % 3)) then {"HE"} else {"AP"};
            _gunner forceWeaponFire [_muzzle, "close"];
            sleep 0.25;
        };

        _gunner doTarget objNull;
        _gunner doWatch objNull;
        _gunship setVariable ["currentTargetMainGunner", nil];
    };

    while {_gunship getVariable ["IsActive", false]} do
    {
        if(isNull (_gunship getVariable ["currentTargetMainGunner", objNull])) then
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
                    ((_target distance2D (getMarkerPos _supportMarker)) < 450) &&
                    {(_target isKindOf "Man" && {[_target] call A3A_fnc_canFight}) ||
                    {(_target isKindOf "AllVehicles") && (alive _target)}}
                ) then
                {
                    //Target active
                    if(_target isKindOf "LandVehicle") then
                    {
                        if(_target isKindOf "Tank") then
                        {
                            [_mainGunner, _target, 12, [false, false, false]] call _fnc_executeFireOrder;
                        }
                        else
                        {
                            [_mainGunner, _target, 12, [false, true, false]] call _fnc_executeFireOrder;
                        };
                    }
                    else
                    {
                        [_mainGunner, _target, 6, [true, true, true]] call _fnc_executeFireOrder;
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
                    _targetParams params ["_target", "_gunshots", "_belt"];
                    if
                    (
                        (_target isKindOf "Man" && {[_target] call A3A_fnc_canFight}) ||
                        {_target isKindOf "AllVehicles" && (alive _target)}
                    ) then
                    {
                        [_mainGunner, _target, _gunshots, _belt] call _fnc_executeFireOrder;
                    };
                };
            };
        };
        sleep 1;
    };
};

//Fire loop for howitzer and minigun gunner
[_gunship, _heavyGunnerList, _heavyGunner, _supportName] spawn
{
    params ["_gunship", "_mainGunnerList", "_heavyGunner", "_supportName"];

    private _fnc_executeFireOrder =
    {
        [3, format ["Fireorder %1 recieved", _this], "ExecuteFireOrder_Heavy"] call A3A_fnc_log;
        params ["_gunner", "_target", "_minigunShots", "_howitzerShots"];
        private _gunship = vehicle _gunner;

        private _howitzerLeft = _gunship getVariable ["Howitzer_Ammo", 0];
        _howitzerLeft = _howitzerLeft - _howitzerShots;
        _gunship setVariable ["Howitzer_Ammo", _howitzerLeft];

        private _minigunLeft = _gunship getVariable ["Minigun_Ammo", 0];
        _minigunLeft = _minigunLeft - _minigunShots;
        _gunship setVariable ["Minigun_Ammo", _minigunLeft];

        if(_minigunLeft <= 0 || _howitzerLeft <= 0) then
        {
            _gunship setVariable ["OutOfAmmo", true];
        };

        _gunship setVariable ["currentTargetHeavyGunner", _target];

        _gunner reveal [_target, 3];
        _gunner doTarget _target;
        _gunner doWatch _target;

        //Cooldown included
        private _steps = _minigunShots max (1 + (100 * _howitzerShots));

        //Simulate targeting time (cause the fucking AI does not targets for real)
        sleep 0.3;

        for "_i" from 1 to _steps do
        {
            if(_minigunShots > 0) then
            {
                _gunner forceWeaponFire ["gatling_20mm_VTOL_01", "manual"];
                _minigunShots = _minigunShots - 1;
            };
            if(((_i - 1) % 100 == 0) && (_howitzerShots > 0)) then
            {
                _gunner forceWeaponFire ["cannon_105mm_VTOL_01", "player"];
                _howitzerShots = _howitzerShots - 1;
            };
            sleep 0.03;
        };

        _gunner doTarget objNull;
        _gunner doWatch objNull;
        _gunship setVariable ["currentTargetHeavyGunner", nil];
    };

    while {_gunship getVariable ["IsActive", false]} do
    {
        if(isNull (_gunship getVariable ["currentTargetHeavyGunner", objNull])) then
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
                    ((_target distance2D (getMarkerPos _supportMarker)) < 450) &&
                    {(_target isKindOf "Man" && {[_target] call A3A_fnc_canFight}) ||
                    {(_target isKindOf "AllVehicles") && (alive _target)}}
                ) then
                {
                    //Target active
                    if(_target isKindOf "LandVehicle") then
                    {
                        if(_target isKindOf "Tank") then
                        {
                            [_heavyGunner, _target, 25, 0] call _fnc_executeFireOrder;
                        }
                        else
                        {
                            [_heavyGunner, _target, 100, 2] call _fnc_executeFireOrder;
                        };
                    }
                    else
                    {
                        [_heavyGunner, _target, 50, 0] call _fnc_executeFireOrder;
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
                    private _targetParams = _mainGunnerList deleteAt 0;
                    _targetParams params ["_target", "_minigunShots", "_howitzerShots"];
                    if
                    (
                        (_target isKindOf "Man" && {[_target] call A3A_fnc_canFight}) ||
                        {_target isKindOf "AllVehicles" && (alive _target)}
                    ) then
                    {
                        [_heavyGunner, _target, _minigunShots, _howitzerShots] call _fnc_executeFireOrder;
                    };
                };
            };
        };
        sleep 1;
    };
};

_gunship setVariable ["AP_Ammo", 160];
_gunship setVariable ["HE_Ammo", 240];
_gunship setVariable ["Howitzer_Ammo", 100];
_gunship setVariable ["Minigun_Ammo", 4000];

//_strikeGroup setCombatMode "YELLOW";

private _lifeTime = 300;

while {_lifeTime > 0} do
{
    if
    (
        isNull (_gunship getVariable ["currentTargetMainGunner", objNull]) ||
        isNull (_gunship getVariable ["currentTargetHeavyGunner", objNull])
    ) then
    {
        private _targets = _supportPos nearEntities [["Man", "LandVehicle", "Helicopter"], 400];
        _targets = _targets select
        {
            if(_x isKindOf "Man") then
            {
                ((side group _x) in [teamPlayer, Occupants]) && {[_x] call A3A_fnc_canFight}
            }
            else
            {
                (alive _x) && {(isNull driver _x) || {(side group driver _x) in [teamPlayer, Occupants]}}
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
                    _mainGunnerList pushBack [_target, 12, _antiLightVehicleBelt];
                    _heavyGunnerList pushBack [_target, 50, 0];
                }
                else
                {
                    if(_target isKindOf "LandVehicle") then
                    {
                        if(_target isKindOf "Tank") then
                        {
                            //MBT, breach with AP ammo
                            _mainGunnerList pushBack [_target, 18, _antiTankBelt];
                        }
                        else
                        {
                            if(_target in vehAPCs) then
                            {
                                //APC, use mainly AP and rarely rockets
                                _mainGunnerList pushBack [_target, 12, _antiAPCBelt];
                                _heavyGunnerList pushBack [_target, 100, 2];
                            }
                            else
                            {
                                //Any kind of light vehicle, destroy with rockets and mixed belt
                                _mainGunnerList pushBack [_target, 6, _antiLightVehicleBelt];
                                _heavyGunnerList pushBack [_target, 100, 1];
                            };
                        };
                    }
                    else
                    {
                        //Infantry, if crowded use rockets too
                        private _nearUnits = _targets select {(_x isKindOf "Man") && ([_x] call A3A_fnc_canFight) && {(_x distanceSqr _target) < 100}};
                        private _gunshots = 50;
                        if(count _nearUnits > 2) then {_gunshots = 100};
                        _heavyGunnerList pushBack [_target, _gunshots, 0];
                        _mainGunnerList pushBack [_target, 3, _antiInfBelt];
                    };
                };
            } forEach _targets;
        };
    };

    //No ammo left
    if(_gunship getVariable ["OutOfAmmo", false]) exitWith
    {
        [2, format ["%1 run out of ammo, returning to base", _supportName], _fileName] call A3A_fnc_log;
        _gunship setVariable ["currentTargetMainGunner", objNull];
        _gunship setVariable ["currentTargetHeavyGunner", objNull];
    };

    //Retreating
    if(_gunship getVariable ["Retreat", false]) exitWith
    {
        [2,format ["%1 met heavy resistance, retreating", _supportName], _fileName] call A3A_fnc_log;
        _gunship setVariable ["currentTargetMainGunner", objNull];
        _gunship setVariable ["currentTargetHeavyGunner", objNull];
    };

    //Gunship died
    if !(alive _gunship) then
    {
        [2, format ["%1 has been destroyed while in the area", _supportName], _fileName] call A3A_fnc_log;
        _gunship setVariable ["currentTargetMainGunner", objNull];
        _gunship setVariable ["currentTargetHeavyGunner", objNull];
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
[_supportName, Occupants] call A3A_fnc_endSupport;
