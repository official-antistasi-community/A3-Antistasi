// Local
params ["_flag","_access"];

private _flipTime = _flag getVariable ["A3A_flagFlipTime",-99999]; // default unlocked? yeah, dont trust jip
private _timeSinceFlip = serverTime - _flipTime;
private _flagAccessBlockTime = A3A_flagGarageBlock * 60;
private _remainingTime = _flagAccessBlockTime - _timeSinceFlip; 
if (_remainingTime > 0) exitWith {
    private _prettyTime = [_remainingTime,1,1,false,2,false,true] call A3A_fnc_timeSpan_format;
    private _menus = createHashMapFromArray [
        ["garage", "Garage"],
        ["buy", "Buy Vehicle"],
        ["unit", "Unit Recruitment"]
    ];
    ["Service Access", format ["The rebel transport network is still connecting this location to the PetrosNet.<br/><br/>You can access the %1 menu in %2.",_menus get _access, _prettyTime]] call A3A_fnc_customHint;
};

switch (_access) do {
    case ("garage"): {createDialog 'HR_GRG_VehicleSelect'};
    case ("buy"): {createDialog "A3A_BuyVehicleDialog"};
    case ("unit"): {[] spawn A3A_fnc_unit_recruit;};
};

