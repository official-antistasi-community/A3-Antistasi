#include "..\..\dialogues\ids.inc"
#include "..\..\dialogues\defines.hpp"
#include "..\..\dialogues\textures.inc"
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_control", "_button"];

if (debug) exitWith {
    _control ctrlShow _doShow;
    _control ctrlEnable _doShow;
};

private _doShow = if (!isClass (missionConfigFile/"A3A") ) then {
    false;
} else {
    switch (_button) do {
        case ("options"): { true };
        case ("community"): { (!isNil "A3A_isCommunityServer" && {A3A_isCommunityServer > 0})};
        default { true };
    };
};

_control ctrlShow _doShow;
_control ctrlEnable _doShow;
