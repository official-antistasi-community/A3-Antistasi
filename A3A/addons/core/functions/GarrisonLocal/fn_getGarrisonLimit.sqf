/*
Author: Socrates
Description:
    Returns garrison limit for an outpost.

Arguments:
   <STRING> Marker type.

Return Value: In

Scope: Clients
Environment: Any
Public: No
Dependencies:

Example: [_marker] call A3A_fnc_getGarrisonLimit;

License: MIT License
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params [
    ["_marker", "", [""]]
];

if (_marker isEqualTo "") exitWith {
    Error("Marker name is empty.");
};

if (A3A_rebelGarrisonLimit == -1) exitWith {-1};

private _limit = switch (true) do {
    case (_marker in citiesX): {
        private _cityLimit = 2 * round (sqrt (A3A_cityPop get _marker) / 2);
        // Militia post town upgrade raises the town's limit
        if (!isNil "A3A_townUpgradeHM" and {[_marker, "militia"] call A3A_fnc_townUpgradeHas}) then {
            _cityLimit = round (_cityLimit * ((A3A_townUpgradeHM get "militia") # 4));
        };
        _cityLimit;
    };
    case (_marker in airportsX): {
        round (A3A_rebelGarrisonLimit * 1.5)
    };
    // Site upgrade levels add 20% of the base limit each
    case (_marker in factories || {_marker in resourcesX}): {
        round (A3A_rebelGarrisonLimit * 0.5 * (1 + 0.2 * ([_marker] call A3A_fnc_siteLevel)))
    };
    case (_marker in seaports): {
        round (A3A_rebelGarrisonLimit * (1 + 0.2 * ([_marker] call A3A_fnc_siteLevel)))
    };
    case (_marker in outpostsFIA): {
        round (A3A_rebelGarrisonLimit * 0.33)
    };
    default {
        A3A_rebelGarrisonLimit
    };
};

_limit
