/*
    Function to get troop quality for site at current war level

    Environment: Any

    Arguments:
    <STRING> Site type of garrison (eg. "city", "airport")
    <SIDE> Side of garrison.
    <NUMBER> Quality adjustment, may be random.

    Copyright 2025 John Jordan. All Rights Reserved.
    Used and distributed by the Antistasi Community project with permission.
*/

// Same code as buildEnemyGarrison but uses siteType for speed

params ["_siteType", "_side", "_mod"];

private _qMod = tierWar/20 + _mod;
call {
    if (_siteType == "city") exitWith {if (_side == Invaders) then {3} else {0.1 + _qMod}};
    if (_side == Invaders) then {_qMod = _qMod + 0.4};
    if (_siteType == "airport") exitWith {(1.5 + _qMod) min 2};
    if (_siteType == "outpost") exitWith {(1.4 + _qMod) min 2};
    if (_siteType == "seaport") exitWith {(1.2 + _qMod) min 2};
    if (_siteType == "camp") exitWith {if (_side == Invaders) then {(2 + _qMod) min 3} else {(1 + 2*_qMod) min 3}};
    (1 + _qMod) min 2;              // resource, factory or roadblock
};
