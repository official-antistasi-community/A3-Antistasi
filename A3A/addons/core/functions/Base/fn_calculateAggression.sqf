params [["_silent", false]];

/*  Calculates the current aggression values and levels

    Execution on: Server

    Scope: Internal

    Params:
        None

    Returns:
        Nothing
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

//Calculate the new values from the stacks
private _newOccupantsValue = 0;
{
    _newOccupantsValue = _newOccupantsValue + (_x select 0);
} forEach aggressionStackOccupants;

private _newInvadersValue = 0;
{
    _newInvadersValue = _newInvadersValue + (_x select 0);
} forEach aggressionStackInvaders;

//Limit them to 0 - 100
_newOccupantsValue = round ((_newOccupantsValue min 100) max 0);
_newInvadersValue = round ((_newInvadersValue min 100) max 0);

aggressionOccupants = _newOccupantsValue;
aggressionInvaders = _newInvadersValue;
publicVariable "aggressionOccupants";
publicVariable "aggressionInvaders";

private _levelBoundsOccupants = [((aggressionLevelOccupants - 1) * 20) - 2.5, aggressionLevelOccupants * 20 + 2.5];
private _levelBoundsInvaders = [((aggressionLevelInvaders - 1) * 20) - 2.5, aggressionLevelInvaders * 20 + 2.5];

private _notificationText = "";
private _levelsChanged = false;
if(_newOccupantsValue < (_levelBoundsOccupants select 0)) then
{
    aggressionLevelOccupants = ((ceil (_newOccupantsValue / 20)) min 5) max 1;
    publicVariable "aggressionLevelOccupants";
    _notificationText = format [localize "STR_A3A_fn_base_caclaggro_occ_red", FactionGet(occ,"name"), [aggressionLevelOccupants] call A3A_fnc_getAggroLevelString];
    _levelsChanged = true;
}
else
{
    if(_newOccupantsValue > (_levelBoundsOccupants select 1)) then
    {
        aggressionLevelOccupants = ((ceil (_newOccupantsValue / 20)) min 5) max 1;
        publicVariable "aggressionLevelOccupants";
        _notificationText = format [localize "STR_A3A_fn_base_caclaggro_occ_inc", FactionGet(occ,"name"), [aggressionLevelOccupants] call A3A_fnc_getAggroLevelString];
        _levelsChanged = true;
    };
};

if(_newInvadersValue < (_levelBoundsInvaders select 0)) then
{
    aggressionLevelInvaders = ((ceil (_newInvadersValue / 20)) min 5) max 1;
    publicVariable "aggressionLevelInvaders";
    _notificationText = format [localize "STR_A3A_fn_base_caclaggro_inv_red", _notificationText, FactionGet(inv,"name"), [aggressionLevelInvaders] call A3A_fnc_getAggroLevelString];
    _levelsChanged = true;
}
else
{
    if(_newInvadersValue > (_levelBoundsInvaders select 1)) then
    {
        aggressionLevelInvaders = ((ceil (_newInvadersValue / 20)) min 5) max 1;
        publicVariable "aggressionLevelInvaders";
        _notificationText = format [localize "STR_A3A_fn_base_caclaggro_inv_inc", _notificationText, FactionGet(inv,"name"), [aggressionLevelInvaders] call A3A_fnc_getAggroLevelString];
        _levelsChanged = true;
    };
};

if(_levelsChanged) then
{
    //Updating HUDs of players
    [] remoteExec ["A3A_fnc_statistics", [teamPlayer, civilian]];
    if(!_silent) then
    {
        //If not load progress, show message for everyone
        _notificationText = format ["<t size='0.6' color='#C1C0BB'>" + localize "STR_A3A_fn_base_caclaggro_levelchange" + "<br/> <t size='0.5' color='#C1C0BB'><br/>%1", _notificationText];
        [petros, "income", _notificationText] remoteExec ["A3A_fnc_commsMP", [teamPlayer, civilian]];
    };
};
