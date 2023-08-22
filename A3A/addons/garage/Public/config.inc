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
HR_GRG_isCmdClient = {
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

//Lock on garaged vehicles ( Values: [{""}, { getPlayerUID player }] )
HR_GRG_dLock = {""};

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
HR_GRG_fnc_Hint = {
    params ["_key", ["_arguments", []]];
    ["Garage",
        if (_arguments isEqualTo []) then {localize _key} else {format ( [localize _key] + _arguments )}
    ] call A3A_fnc_customHint;
};
HR_GRG_fnc_vehInit = {
    if (_this isKindOf "StaticWeapon") then {
        // Add to garrison if placed within one
        ["", _this] remoteExecCall ["A3A_fnc_addVehicleToGarrison", 2];
    };
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

    ["HR_GRG_dLock", "CHECKBOX", ["Lock on garage", "Lock vehicles when garaged"], [HR_GRG_Prefix,"Garage"], (HR_GRG_dLock isEqualTo {getPlayerUID player}), false, {
        HR_GRG_dLock = [{""}, { getPlayerUID player }] select _this;
    }] call CBA_fnc_addSetting;

    ["HR_GRG_Pylons_Enabled", "CHECKBOX", ["Allow pylon editing", "Allows player to configure pylons in the garage"], [HR_GRG_Prefix,"Garage"], true, true, {
        HR_GRG_Pylons_Enabled = _this;
    }] call CBA_fnc_addSetting;

    //Service disablers
    ["HR_GRG_ServiceDisabled_Rearm", "CHECKBOX", ["Disable garage rearm feature", "Prevent vehicles from being rearmed on ungarage"], [HR_GRG_Prefix,"Garage"], false, true, {
        HR_GRG_ServiceDisabled_Rearm = _this;
    }] call CBA_fnc_addSetting;
    ["HR_GRG_ServiceDisabled_Refuel", "CHECKBOX", ["Disable garage refuel feature", "Prevent vehicles from being refueled on ungarage"], [HR_GRG_Prefix,"Garage"], false, true, {
        HR_GRG_ServiceDisabled_Refuel = _this;
    }] call CBA_fnc_addSetting;
    ["HR_GRG_ServiceDisabled_Repair", "CHECKBOX", ["Disable garage repair feature", "Prevent vehicles from being repaired on ungarage"], [HR_GRG_Prefix,"Garage"], false, true, {
        HR_GRG_ServiceDisabled_Repair = _this;
    }] call CBA_fnc_addSetting;

    ["HR_GRG_PoolBase", "SLIDER", ["Base Capacity", "Garage base capacity"], [HR_GRG_Prefix,"Garage"], [0, 50, HR_GRG_PoolBase, 0], true, {
        HR_GRG_PoolBase = round _this;
    }] call CBA_fnc_addSetting;

    ["HR_GRG_PoolIncr", "SLIDER", ["Capacity increase", "Capacity increase per war level"], [HR_GRG_Prefix,"Garage"], [0, 10, HR_GRG_PoolIncr, 0], true, {
        HR_GRG_PoolIncr = round _this;
    }] call CBA_fnc_addSetting;

    ["HR_GRG_renderPlacementRays", "CHECKBOX", ["Render placement rays", "Render the debug placement rays when placing vehicles"], [HR_GRG_Prefix,"Garage"], false, false, {
        HR_GRG_renderPlacementRays = _this;
    }] call CBA_fnc_addSetting;

};
