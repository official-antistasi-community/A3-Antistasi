// Local
params ["_flag","_access"];

private _flipTime = _flag getVariable ["A3A_flagFlipTime",-99999]; // default unlocked? yeah, dont trust jip
private _timeSinceFlip = serverTime - _flipTime;
private _flagAccessBlockTime = A3A_flagGarageBlock * 60;
private _remainingTime = _flagAccessBlockTime - _timeSinceFlip; 
if (_remainingTime > 0) exitWith {
    private _prettyTime = [_remainingTime,1,1,false,2,false,true] call A3A_fnc_timeSpan_format;
    private _menus = createHashMapFromArray [
        ["garage", localize "STR_A3A_fn_base_flagaction_garage"],
        ["buy", localize "STR_A3A_fn_base_flagaction_buyveh"],
        ["unit", localize "STR_A3A_fn_base_flagaction_recruit"]
    ];
    [localize "STR_A3A_fn_base_manageFlagAccess_title", format [localize "STR_A3A_fn_base_manageFlagAccess_main",_menus get _access, _prettyTime]] call A3A_fnc_customHint;
};

switch (_access) do {
    case ("garage"): {createDialog 'HR_GRG_VehicleSelect'};
    case ("buy"): {createDialog "A3A_BuyVehicleDialog"};
    case ("unit"): {createDialog "A3A_RecruitDialog"};
};

