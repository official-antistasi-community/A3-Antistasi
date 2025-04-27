/*
Maintainer: Tiny-DM
    Utility function to grab marker UI name

Arguments:
    <STRING> Marker to get name of

Return Value:
    <STRING> Marker name

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
    resourcesX#0 call A3A_GUI_fnc_getLocationMarkerName; //  Returns "Resources"
    "airport_1" call A3A_GUI_fnc_getLocationMarkerName; //  Returns "Airbase"

License: APL-ND

*/

params ["_marker"];

private _mrkText = switch (true) do {
    case (_marker in airportsX): { "Airbase"};
    case (_marker in outposts): { "Outpost"};
    case (_marker in resourcesX): { "Resources" };
    case (_marker in factories): { "Factory" };
    case (_marker in seaports): { "Seaport" };
    case (_marker in citiesX): { _marker };
    case (_marker == "Synd_HQ") : { "HQ" };
    case (_marker in outpostsFIA): {
        if (isOnRoad (getMarkerPos _marker)) then
        {
            "Roadblock"
        } else {
            "Watchpost"
        };
    };
    default {""};
};

_mrkText;
