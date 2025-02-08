/*
    Author: [Håkon]
    [Description]
        This is the config file for the garage, everything that is meant to be adjustable can be changed here.

    Arguments:

    Return Value:

    Scope: Any
    Environment: Any
    Public: [No]
    Dependencies:

    Example:

    License: MIT
*/
HR_GRG_Prefix = "Antistasi";

// Condition for whether the player can override garage locks
HR_GRG_canOverrideLock = {
    (isServer && hasInterface && _this isEqualTo player) //Lan host
    || {admin owner _this > 0} //admin
    || {_this isEqualTo theBoss && _this call A3A_fnc_isMember } //member-commander
};

//condition to automatically close garage/placement as if canceled
HR_GRG_CP_closeCnd = {
    (!([player] call A3A_fnc_canFight))
    || {(!isNull HR_GRG_accessPoint)
        && {player distance HR_GRG_accessPoint > 25}
    }
};

HR_GRG_Cnd_canAccessAir = {
    count (airportsX select {(sidesX getVariable [_x,sideUnknown] == teamPlayer) and (HR_GRG_accessPoint inArea _x)}) > 0
};

// Return lock limit for specified player
HR_GRG_getLockLimit = {
    [HR_GRG_LockLimit_Guest, HR_GRG_LockLimit_Member] select (_this call A3A_fnc_isMember);
};

//Lock on garaged vehicles ( Values: [{""}, { getPlayerUID player }] )
HR_GRG_dLock = {""};

//Member & guest lock limits
if (isNil "HR_GRG_LockLimit_Member") then { HR_GRG_LockLimit_Member = 3 };
if (isNil "HR_GRG_LockLimit_Guest") then { HR_GRG_LockLimit_Guest = 2 };

HR_GRG_renderPlacementRays = false;

//garage pool cap
if (isNil "HR_GRG_PoolBase") then { HR_GRG_PoolBase = 20 }; //can be overwritten by CBA settings
if (isNil "HR_GRG_PoolIncr") then { HR_GRG_PoolIncr = 4 }; //can be overwritten by CBA settings
HR_GRG_VehCap = { HR_GRG_PoolBase + tierWar * HR_GRG_PoolIncr };

//Pylon config
if (isNil "HR_GRG_Pylons_Enabled") then { HR_GRG_Pylons_Enabled = true }; //can be overwritten by CBA settings
if (isNil "HR_GRG_ServiceDisabled_Rearm") then {HR_GRG_ServiceDisabled_Rearm = false};
if (isNil "HR_GRG_ServiceDisabled_Refuel") then {HR_GRG_ServiceDisabled_Refuel = false};
if (isNil "HR_GRG_ServiceDisabled_Repair") then {HR_GRG_ServiceDisabled_Repair = false};

//camo blacklist (display name, case sensitive)
HR_GRG_blackListCamo = ["IDAP", "African Desert Extremists", "African Desert Extremists 01", "African Desert Extremists 02",
"African Desert Extremists Alt", "Middle East Extremists", "Middle East Extremists Alt", "Middle East Extremists 1", "Middle East Extremists 2",
"Middle East Extremists 3", "Middle East Extremists 4", "Middle East Extremists 5", "Middle East Extremists 6",
"Middle East Extremists 01", "Middle East Extremists 02", "Middle East Extremists 03", "Middle East Extremists 04", "Middle East Extremists 05", "Middle East Extremists 06"];
//proxies"Middle East Extremists 01"

// Banned vehicles. These will be deleted instead of being added to the garage. Internal name, case sensitive
HR_GRG_blacklistVehicles = ["rhs_rhino_trigger","ACE_I_SpottingScope","ACE_O_SpottingScope","ACE_O_T_SpottingScope","ACE_B_SpottingScope","ACE_B_T_SpottingScope","ACE_SpottingScopeObject"];

HR_GRG_fnc_Hint = {
    params ["_key", ["_arguments", []]];
    ["Garage",
        if (_arguments isEqualTo []) then {localize _key} else {format ( [localize _key] + _arguments )}
    ] call A3A_fnc_customHint;
};
HR_GRG_fnc_vehInit = {
    if (_this isKindOf "StaticWeapon") then {staticsToSave pushBack _this; publicVariable "staticsToSave"};
    _this setVariable ["ownerX",getPlayerUID player,true];
    [_this, TeamPlayer] call A3A_fnc_AIVEHinit;
}; //is passed vehicle as _this
HR_GRG_onOpenEvent = {
    //hide Antistasi's top information string as it has no use in the Garage
    ["GARAGE", true] call A3A_fnc_disableInfoBar;
    player setCaptive false;
};
HR_GRG_onCloseEvent = {
    //show Antistasi's top information string
    ["GARAGE", false] call A3A_fnc_disableInfoBar;
};

//CBA settings
if (isClass (configfile >> "CBA_Extended_EventHandlers")) then {

    ["HR_GRG_dLock", "CHECKBOX", [localize "STR_A3A_inc_public_config_lockOnGarageTitle", localize "STR_A3A_inc_public_config_lockOnGarageLong"], [HR_GRG_Prefix,"Garage"], (HR_GRG_dLock isEqualTo {getPlayerUID player}), false, {
        HR_GRG_dLock = [{""}, { getPlayerUID player }] select _this;
    }] call CBA_fnc_addSetting;

    ["HR_GRG_LockLimit_Member", "SLIDER", [localize "STR_A3A_inc_public_config_memberLimitTitle", localize "STR_A3A_inc_public_config_memberLimitLong"], [HR_GRG_Prefix,"Garage"],
        [0, 10, HR_GRG_LockLimit_Member, 0], true] call CBA_fnc_addSetting;
    ["HR_GRG_LockLimit_Guest", "SLIDER", [localize "STR_A3A_inc_public_config_guestLimitTitle", localize "STR_A3A_inc_public_config_guestLimitLong"], [HR_GRG_Prefix,"Garage"],
        [0, 10, HR_GRG_LockLimit_Guest, 0], true] call CBA_fnc_addSetting;

    ["HR_GRG_Pylons_Enabled", "CHECKBOX", [localize "STR_A3A_inc_public_config_pylonEditingTitle", localize "STR_A3A_inc_public_config_pylonEditingLong"], [HR_GRG_Prefix,"Garage"], true, true, {
        HR_GRG_Pylons_Enabled = _this;
    }] call CBA_fnc_addSetting;

    //Service disablers
    ["HR_GRG_ServiceDisabled_Rearm", "CHECKBOX", [localize "STR_A3A_inc_public_config_disableRearmTitle", localize "STR_A3A_inc_public_config_disableRearmLong"], [HR_GRG_Prefix,"Garage"], false, true, {
        HR_GRG_ServiceDisabled_Rearm = _this;
    }] call CBA_fnc_addSetting;
    ["HR_GRG_ServiceDisabled_Refuel", "CHECKBOX", [localize "STR_A3A_inc_public_config_disableRefuelTitle", localize "STR_A3A_inc_public_config_disableRefuelLong"], [HR_GRG_Prefix,"Garage"], false, true, {
        HR_GRG_ServiceDisabled_Refuel = _this;
    }] call CBA_fnc_addSetting;
    ["HR_GRG_ServiceDisabled_Repair", "CHECKBOX", [localize "STR_A3A_inc_public_config_disableRepairTitle", localize "STR_A3A_inc_public_config_disableRepairLong"], [HR_GRG_Prefix,"Garage"], false, true, {
        HR_GRG_ServiceDisabled_Repair = _this;
    }] call CBA_fnc_addSetting;

    ["HR_GRG_PoolBase", "SLIDER", [localize "STR_A3A_inc_public_config_baseCapTitle", localize "STR_A3A_inc_public_config_baseCapLong"], [HR_GRG_Prefix,"Garage"], [0, 50, HR_GRG_PoolBase, 0], true, {
        HR_GRG_PoolBase = round _this;
    }] call CBA_fnc_addSetting;

    ["HR_GRG_PoolIncr", "SLIDER", [localize "STR_A3A_inc_public_config_capIncTitle", localize "STR_A3A_inc_public_config_capIncLong"], [HR_GRG_Prefix,"Garage"], [0, 10, HR_GRG_PoolIncr, 0], true, {
        HR_GRG_PoolIncr = round _this;
    }] call CBA_fnc_addSetting;

    ["HR_GRG_renderPlacementRays", "CHECKBOX", [localize "STR_A3A_inc_public_config_placeRaysTitle", localize "STR_A3A_inc_public_config_placeRaysLong"], [HR_GRG_Prefix,"Garage"], false, false, {
        HR_GRG_renderPlacementRays = _this;
    }] call CBA_fnc_addSetting;

};

// sell button
HR_GRG_disableSellButton = false;

HR_GRG_addResources = {
    params ["_money"];
    [0,_money] call A3A_fnc_resourcesFIA;
};

HR_GRG_canSell = {_this isEqualTo theBoss};

HR_GRG_getVehicleSellPrice = {
    private _disableSale = false;
    if (_disableSale) exitWith {0};
    params ["_veh"];
    [_veh] call A3A_fnc_getVehicleSellPrice;
};



