// Extracted from fn_addFIAsquadHC

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_squadType"];
if !(_squadType isEqualType []) then {_squadType = [0,0]}; // 2 man team

private _vehType = switch true do {
    case (count _squadType isEqualTo 2): {(FactionGet(reb,"vehiclesBasic")) # 0};
    case (count _squadType > 4): {(FactionGet(reb,"vehiclesTruck")) # 0};
    default {(FactionGet(reb,"vehiclesLightUnarmed")) # 0};
};

_vehType;
