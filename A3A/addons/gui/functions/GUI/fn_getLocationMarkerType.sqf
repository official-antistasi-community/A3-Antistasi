/*
Maintainer: Tiny-DM
    Utility function to grab marker type

Arguments:
    <STRING> Marker to get type of

Return Value:
    <STRING> Marker type

Scope: Any
Environment: Any
Public: Yes
Dependencies:
    <ARRAY> airportsX
    <ARRAY> resourcesX
    <ARRAY> factories
    <ARRAY> outposts
    <ARRAY> seaports
    <ARRAY> citiesX
    <ARRAY> outpostsFIA

Example:
    resourcesX#0 call A3A_GUI_fnc_getLocationMarkerType; //  Returns "resource"
    "airport_1" call A3A_GUI_fnc_getLocationMarkerType; //  Returns "airbase"


License: APL-ND

*/

params ["_marker"];

private _mrkText = switch (true) do {
    case (_marker in airportsX): { "airbase"};
    case (_marker in outposts): { "outpost"};
    case (_marker in resourcesX): { "resource" };
    case (_marker in factories): { "factory" };
    case (_marker in seaports): { "seaport" };
    case (_marker in citiesX): { "city" };
    case (_marker == "Synd_HQ") : { "hq" };
    case (_marker in outpostsFIA): {
        if (isOnRoad (getMarkerPos _marker)) then
        {
            "roadblock"
        } else {
            "watchpost"
        };
    };
    default {""};
};

_mrkText;
