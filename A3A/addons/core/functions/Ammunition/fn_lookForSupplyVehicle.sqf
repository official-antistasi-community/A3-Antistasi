params ["_vehType", "_targPos", "_range"];
if (_targPos isEqualType objNull) then {_targPos = getPosATL _targPos};

private _nearVehicles = (nearestObjects [_targPos, ["LandVehicle", "ThingX"], _range]) select {
    alive _x && {(side group _x) in [sideUnknown, teamPlayer] && {speed _x < 1}}
};

if (_vehType isEqualTo "pylon") then {_vehType = "rearm"};
private _index = _nearVehicles findIf {([_x, _vehType] call A3A_fnc_getResourceCargo) > -1};
if (_index isEqualTo -1) exitWith {[objNull, -1]};
private _selVeh = _nearVehicles#_index;
private _finalCargo = [_selVeh, _vehType] call A3A_fnc_getResourceCargo;

[_selVeh, _finalCargo]
