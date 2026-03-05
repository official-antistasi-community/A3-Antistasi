// should only go on player and their personal squad AI

params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_vehicle"];

private _currentVeh = vehicle _unit;

if (isPlayer _unit && (captive _unit)) then {
    //if ({((side _x== Invaders) or (side _x== Occupants)) and (_x knowsAbout player > 1.4)} count allUnits > 0) then
    if ({if (((side _x == Occupants) or (side _x == Invaders)) and (_x distance player < 300)) exitWith {1}} count allUnits > 0) then {
        _unit setCaptive false;
    } else {
        _city = [citiesX,_unit] call BIS_fnc_nearestPosition;
        _size = [_city] call A3A_fnc_sizeMarker;
        _cityData = A3A_cityData getVariable _city;
        if (random 100 > _cityData select 1 && {_unit distance getMarkerPos _city < _size * 1.5}) then {            // reb support
            _unit setCaptive false;
            if (_currentVeh isEqualTo _unit) then {
                {if (isPlayer _x) then {[_x,false] remoteExec ["setCaptive",_x]}} forEach ((assignedCargo _currentVeh) + (crew _currentVeh) - [player]);
            };
        };
    };
};

if (!isNull _vehicle) then {
    private _currentTime = _currentVeh getVariable ["A3A_lastFiredTime", 0];
    if ((time - _currentTime) < 20) exitWith {};
    _currentVeh setVariable ["A3A_lastFiredTime", time, true];
};

