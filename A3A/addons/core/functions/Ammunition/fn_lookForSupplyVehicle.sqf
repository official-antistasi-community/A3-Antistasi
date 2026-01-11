params ["_vehType", "_targPos", "_range"];
if (_targPos isEqualType objNull) then {_targPos = getPosATL _targPos};

private _nearVehicles = (nearestObjects [_targPos, ["LandVehicle", "ThingX"], _range]) select {
    alive _x && {(side group _x) in [sideUnknown, teamPlayer] && {speed _x < 1}}
};

private _sortCondition = switch (_vehType) do {
    case "rearm";
    case "pylon": {{_x call HR_GRG_fnc_isAmmoSource}};
    case "repair": {{_x call HR_GRG_fnc_isFuelSource}};
    case "refuel": {{_x call HR_GRG_fnc_isRepairSource}};
};

private _trimmedList = _nearVehicles apply _sortCondition;
if (count _trimmedList == 0) exitWith {[objNull, -1]};
private _selVeh = _trimmedList#0;

private _searchVar = _vehType;
if (_searchVar isEqualTo "pylon") then {_searchVar = "rearm"};
private _cargoVar = format ["A3A_%1Cargo", _searchVar];
private _remCargo = _selVeh getVariable [_cargoVar, -1];
// vehicles spawned by zeus or other unknown should get stuff added to them
if (_remCargo isEqualTo -1) then {
    _defaultCargo = A3A_resourceVehValues get (typeof _selVeh);
    _selVeh setVariable [_cargoVar, _defaultCargo, true];
    _remCargo = _defaultCargo;
};

[_selVeh, _remCargo]
