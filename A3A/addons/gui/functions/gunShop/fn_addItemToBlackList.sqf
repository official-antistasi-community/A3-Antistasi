/*
 * File: fnc_addItemToBlackList.sqf
 * Function: 
 * Author: <author>
 * Function description
 *  add/s item to the blacklist this is intended for QOL only. I.E. admins.
 * Arguments:
 * 0: ClassName <string> or ClassNames <array>
 *
 * Public: No
 */
#include "..\..\script_component.hpp"

if(isNil "A3A_GS_adminBlockedItems") then {A3A_GS_adminBlockedItems = [];};

if((_this#0) isEqualType []) then {
    {A3A_GS_adminBlockedItems pushBackUnique _x;} forEach (_this#0);
} 
else {
    A3A_GS_adminBlockedItems pushBackUnique (_this#0);
};

publicVariable "A3A_GS_adminBlockedItems";
// update the list again, this only should be called if the theBoss is a member.
if(theBoss call A3A_fnc_isMember) then {
    [] remoteExec ["A3A_GUI_fnc_gatherGunShopLists", theBoss, false];
};
