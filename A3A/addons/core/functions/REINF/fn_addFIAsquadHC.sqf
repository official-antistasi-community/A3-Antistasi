#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
private _titleStr = localize "STR_A3A_fn_reinf_addSqdHC_title";

params ["_typeGroup", ["_withBackpck", ""], ["_spawnVeh", ""]];

if (player != theBoss) exitWith {[_titleStr, localize "STR_A3A_fn_reinf_addSqdHC_no_commander"] call A3A_fnc_customHint;};
if (markerAlpha respawnTeamPlayer == 0) exitWith {[_titleStr, localize "STR_A3A_fn_reinf_addSqdHC_no_movehq"] call A3A_fnc_customHint;};
if (!([player] call A3A_fnc_hasRadio)) exitWith {if !(A3A_hasIFA) then {[_titleStr, localize "STR_A3A_fn_reinf_addSqdHC_no_radio"] call A3A_fnc_customHint;} else {[_titleStr, localize "STR_A3A_fn_reinf_addSqdHC_no_radio2"] call A3A_fnc_customHint;}};
if ([getPosATL petros] call A3A_fnc_enemyNearCheck) exitWith {[_titleStr, localize "STR_A3A_fn_reinf_addSqdHC_no_enemy"] call A3A_fnc_customHint;};

private _maxGroups = [6,10] select (player call A3A_fnc_isMember);
if (count hcAllGroups player >= _maxGroups) exitWith {
    [_titleStr, localize "STR_A3A_fn_reinf_addSqdHC_no_many"] call A3A_fnc_customHint;
};

private _exit = false;
if (_typeGroup isEqualType "") then {
	if (_typeGroup == "") then {_exit = true; [_titleStr, localize "STR_A3A_fn_reinf_addSqdHC_no_notsupp"] call A3A_fnc_customHint;};
	if (A3A_hasIFA and ((_typeGroup in FactionGet(reb,"staticMortars")) or (_typeGroup in FactionGet(reb,"staticMGs"))) and !debug) then {_exit = true; [_titleStr, localize "STR_A3A_fn_reinf_addSqdHC_no_notsupp"] call A3A_fnc_customHint;};
};
if (_exit) exitWith {};

private _isInfantry = false;
private _typeVehX = "";
private _costs = 0;
private _costHR = 0;
private _formatX = [];
private _format = "Squd-";

private _hr = server getVariable "hr";
private _resourcesFIA = server getVariable "resourcesFIA";

if (_typeGroup isEqualType []) then {
    _formatX = _typeGroup;
	{ _costs = _costs + (server getVariable _x); _costHR = _costHR +1 } forEach _typeGroup;

	if (_withBackpck == "MG") then {_costs = _costs + ([(FactionGet(reb,"staticMGs")) # 0] call A3A_fnc_vehiclePrice)};
	if (_withBackpck == "Mortar") then {_costs = _costs + ([(FactionGet(reb,"staticMortars")) # 0] call A3A_fnc_vehiclePrice)};
	_isInfantry = true;

} else {
    private _typeCrew = FactionGet(reb,"unitCrew");
	_costs = 2*(server getVariable _typeCrew) + ([_typeGroup] call A3A_fnc_vehiclePrice);
	if (_typeGroup in FactionGet(reb,"staticAA")) then { _costs = _costs + ([(FactionGet(reb,"vehiclesTruck")) # 0] call A3A_fnc_vehiclePrice) };
    _formatX = [_typeCrew, _typeCrew];
	_costHR = 2;

	if ((_typeGroup in FactionGet(reb,"staticMortars")) or (_typeGroup in FactionGet(reb,"staticMGs"))) exitWith { _isInfantry = true };
};

if ((_withBackpck != "") and A3A_hasIFA) exitWith {[_titleStr, localize "STR_A3A_fn_reinf_addSqdHC_no_modset"] call A3A_fnc_customHint;};

if (_hr < _costHR) then {_exit = true; [_titleStr, format [localize "STR_A3A_fn_reinf_addSqdHC_no_hr",_costHR]] call A3A_fnc_customHint;};

if (_resourcesFIA < _costs) then {_exit = true; [_titleStr, format [localize "STR_A3A_fn_reinf_addSqdHC_no_money",_costs]] call A3A_fnc_customHint;};

if (_exit) exitWith {};

private _mounts = [];
private _vehType = switch true do {
    case (!_isInfantry && {_typeGroup in FactionGet(reb,"staticAA")}): {
        if (FactionGet(reb,"vehiclesAA") isEqualTo []) exitWith {_mounts pushBack [(FactionGet(reb,"staticAA")) # 0,-1,[[1],[],[]]]; (FactionGet(reb,"vehiclesTruck")) # 0};
        (FactionGet(reb,"vehiclesAA")) # 0
    };
    case (!_isInfantry): {_typeGroup};
    case (count _formatX isEqualTo 2): {(FactionGet(reb,"vehiclesBasic")) # 0};
    case (count _formatX > 4): {(FactionGet(reb,"vehiclesTruck")) # 0};
    default {(FactionGet(reb,"vehiclesLightUnarmed")) # 0};
};
private _idFormat = switch true do {
    case (_typeGroup isEqualTo (FactionGet(reb,"groupMedium"))): {"Tm-"};
    case (_typeGroup isEqualTo (FactionGet(reb,"groupAT"))): {"AT-"};
    case (_typeGroup isEqualTo (FactionGet(reb,"groupSniper"))): {"Snpr-"};
    case (_typeGroup isEqualTo (FactionGet(reb,"groupSentry"))): {"Stry-"};
    case (_typeGroup in (FactionGet(reb,"staticMortars"))): {"Mort-"};
    case (_typeGroup in (FactionGet(reb,"staticMGs"))): {"MG-"};
    case (_typeGroup in (FactionGet(reb,"vehiclesAT"))): {"M.AT-"};
    case (_typeGroup in (FactionGet(reb,"staticAA"))): {"M.AA-"};
    default {
        switch _withBackpck do {
            case "MG": {"SqMG-"};
            case "Mortar": {"Mortar"};
            default {"Squd-"};
        };
    };
};
private _special = if (_isInfantry) then {
    if (_typeGroup isEqualType []) then { _withBackpck } else {"staticAutoT"};
} else {
    if (_mounts isNotEqualTo []) exitWith {"BuildAA"};
    "VehicleSquad"
};

private _fnc_placeCheck = {
    params ["_vehicle"];
    [getMarkerPos respawnTeamPlayer distance _vehicle > 50, localize "STR_A3A_fn_reinf_addSqdHC_no_distance"];
};
private _fnc_placed = {
    params ["_vehicle", "_formatX", "_idFormat", "_special"];
    [_formatX, _idFormat, _special, _vehicle] spawn A3A_fnc_spawnHCGroup;
};

private _vehiclePlacementMethod = if (getMarkerPos respawnTeamPlayer distance player > 50) then { { _this spawn A3A_fnc_spawnHCVeh } } else { HR_GRG_fnc_confirmPlacement };

if (!_isInfantry) exitWith { [_vehType, _fnc_placed, _fnc_placeCheck, [_formatX, _idFormat, _special], _mounts] call _vehiclePlacementMethod };

private _vehCost = [_vehType] call A3A_fnc_vehiclePrice;
if (_isInfantry and (_costs + _vehCost) > server getVariable "resourcesFIA") exitWith {
    [_titleStr, format [localize "STR_A3A_fn_reinf_addSqdHC_no_money2",_vehCost]] call A3A_fnc_customHint;
    [_formatX, _idFormat, _special, objNull] spawn A3A_fnc_spawnHCGroup;
};

#ifdef UseDoomGUI
    ERROR("Disabled due to UseDoomGUI Switch.")
#else
     if (_spawnVeh isEqualType "") then {_spawnVeh = false; createDialog "veh_query"};
#endif
sleep 1;
disableSerialization;
private _display = findDisplay 100;

if (str (_display) != "no display") then {
	private _ChildControl = _display displayCtrl 104;
	_ChildControl  ctrlSetTooltip format [localize "STR_A3A_fn_reinf_addSqdHC_buyveh", _vehCost];
	_ChildControl = _display displayCtrl 105;
	_ChildControl  ctrlSetTooltip "Barefoot Infantry";
};

waitUntil {(!dialog) or (!isNil "vehQuery")};
if ((!dialog) and (isNil "vehQuery") and !(_spawnVeh)) exitWith { [_formatX, _idFormat, _special, objNull] spawn A3A_fnc_spawnHCGroup }; //spawn group call here

vehQuery = nil;
[_vehType, _fnc_placed, _fnc_placeCheck, [_formatX, _idFormat, _special], _mounts] call _vehiclePlacementMethod;
