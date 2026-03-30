/*
    Function to get troop quality for site at current war level

    Environment: Any

    Arguments:
    <STRING> Site type of garrison (eg. "city", "airport")
    <STRING> Marker name of garrison (only used for siteType == "city")
    <SIDE> Side of garrison.
    <NUMBER> Optional: Quality adjustment. Default random 0.2.

    Copyright 2025 John Jordan. All Rights Reserved.
    Used and distributed by the Antistasi Community project with permission.
*/

params ["_siteType", "_marker", "_side", ["_mod", random 0.2]];

// +0.8 to 1.0 at max war tier, with typical random 0.2 input
private _qMod = _mod + tierWar/16 + ([0, 0.2] select (_side == Invaders));
call {
    if (_siteType == "city") exitWith {
        if (_marker in destroyedSites) exitWith {3};
        (-0.1 + _qMod) max 0;
    };
    if (_siteType == "airport") exitWith {(1.6 + _qMod) min 2};
    if (_siteType == "outpost") exitWith {(1.4 + _qMod) min 2};
    if (_siteType == "seaport") exitWith {(1.2 + _qMod) min 2};
    if (_siteType == "camp") exitWith {if (_side == Invaders) then {(2 + _qMod) min 3} else {(1 + 2*_qMod) min 3}};
    (1 + _qMod) min 2;              // resource, factory or roadblock
};
