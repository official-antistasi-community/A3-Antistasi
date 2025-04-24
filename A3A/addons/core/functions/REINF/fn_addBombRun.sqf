_veh = cursortarget;
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
#define OccAndInv(VEH) (FactionGet(occ, VEH) + FactionGet(inv, VEH))
private _titleStr = localize "STR_A3A_fn_reinf_bombrun_title";
private _owner = _veh getVariable "ownerX";
private _wrongOwner = !(isNil "_owner" || {getPlayerUID player isEqualTo _owner});   //Returns false if no owner, false if is owner, true if is not owner
private _typeX = typeOf _veh;

private _exitReason = switch (true) do {
	case (isNull _veh):                                         {"looking"};
	case (!alive _veh):                                         {"destr"};
	case (_veh getVariable ["A3A_locked",false]):               {"locked"};
	case (_wrongOwner):                                         {"owner"}; 
	case (player isNotEqualTo vehicle player):                  {"inVehicle"};
	case (player distance _veh > 25):                           {"distance"};
	case ([getPosATL player] call A3A_fnc_enemyNearCheck):      {"nearby"};
	case !(_veh isKindOf "Air"):                                {"airveh"};
	case (count crew _veh > 0):                                 {"empty"};
	default {""};
};

if (_exitReason isNotEqualTo "") exitWith {
    private _exitMessage =  ["STR_A3A_fn_reinf_bombrun_no_",_exitReason] joinString "";
    [_titleStr, localize _exitMessage] call A3A_fnc_customHint;
    false;
};

private _validMarks = (["Synd_HQ"] + airportsX) select {sidesX getVariable [_x,sideUnknown] isEqualTo teamplayer};
private _inArea = _validMarks findIf { count ([player, _veh] inAreaArray _x) > 1 };
if !(_inArea > -1) exitWith {
    [_titleStr, format [localize "STR_A3A_fn_reinf_bombrun_no_area",FactionGet(reb,"name")]] call A3A_fnc_customHint;
    false;
}; // not near airbase or HQ

if (isClass (configfile >> "CfgVehicles" >> typeOf _veh >> "assembleInfo") && {count getArray (configfile >> "CfgVehicles" >> typeOf _veh >> "assembleInfo" >> "dissasembleTo") > 0}) exitWith {[_titleStr, localize "STR_A3A_fn_reinf_bombrun_no_drone"] call A3A_fnc_customHint;};
private _cfgAssembleInto = configfile >> "CfgVehicles" >> typeOf _veh >> "assembleInfo";
if (
    isClass _cfgAssembleInto &&
    {getArray (_cfgAssembleInto >> "dissasembleTo") isNotEqualTo []}
) exitWith {
    [_titleStr, localize "STR_A3A_fn_reinf_bombrun_no_drone"] call A3A_fnc_customHint;
    false;
};

_pointsX = 2;

if (_typeX in (FactionGet(all,"vehiclesHelisAttack") + FactionGet(all,"vehiclesHelisLightAttack"))) then {_pointsX = 5};
if (_typeX in (OccAndInv("vehiclesPlanesCAS") + OccAndInv("vehiclesPlanesAA"))) then {_pointsX = 10};
deleteVehicle _veh;
[_titleStr, format [localize "STR_A3A_fn_reinf_bombrun_increased",_pointsX]] call A3A_fnc_customHint;
bombRuns = bombRuns + _pointsX;
publicVariable "bombRuns";
[] remoteExec ["A3A_fnc_statistics",theBoss];
