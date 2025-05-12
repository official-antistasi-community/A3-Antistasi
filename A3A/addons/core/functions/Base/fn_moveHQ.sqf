/*
Maintainer: Wurzel0701
    Starts the HQ moving process if possible

Arguments:
    <NIL>

Return Value:
    <NIL>

Scope: Local
Environment: Scheduled
Public: Yes
Dependencies:
    <OBJECT> petros
    <OBJECT> theBoss
    <OBJECT> fireX
    <STRING> respawnTeamPlayer
    <SIDE> teamPlayer
    <NAMESPACE> garrison
    <SIDE> Occupants
    <SIDE> Invaders
    <NAMESPACE> server
    <Hashmap> A3A_faction_reb

Example:
[] call A3A_fnc_moveHQ;
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
private _possible = [] call A3A_fnc_canMoveHQ;
private _titleStr = localize "STR_A3A_fn_base_movehq_garrison";

if !(_possible#0) exitWith {};

private _groupPetros = group petros;
[petros] join theBoss;
deleteGroup _groupPetros;

petros setBehaviour "AWARE";
petros enableAI "MOVE";
petros enableAI "AUTOTARGET";

fireX inflame false;

[respawnTeamPlayer, 0, teamPlayer] call A3A_fnc_setMarkerAlphaForSide;
[respawnTeamPlayer, 0, civilian] call A3A_fnc_setMarkerAlphaForSide;

private _garrison = garrison getVariable ["Synd_HQ", []];
private _posHQ = getMarkerPos "Synd_HQ";

if (count _garrison > 0) then
{
    private _costs = 0;
    private _hr = 0;
    if (allUnits findIf {(alive _x) && (!captive _x) && ((side (group _x) == Occupants) || (side (group _x) == Invaders)) && {_x distance2D _posHQ < 500}} != -1) then
    {
        [_titleStr, localize "STR_A3A_fn_base_movehq_stay"] call A3A_fnc_customHint;
        //Is there a despawn routine attached to them?
        //Why are they getting refunded if they stay?
    }
    else
    {
        private _size = ["Synd_HQ"] call A3A_fnc_sizeMarker;
        {
            if ((side (group _x) == teamPlayer) && (!(_x getVariable ["spawner",false])) && (_x distance2D _posHQ < _size) && (_x != petros)) then
            {
                if (!alive _x) then
                {
                    private _unitType = _x getVariable "unitType";
                    if (_unitType in FactionGet(reb,"unitsSoldiers")) then
                    {
                        if (_unitType == FactionGet(reb,"unitCrew")) then
                        {
                            _costs = _costs - ([(FactionGet(reb,"staticMortars")) # 0] call A3A_fnc_vehiclePrice)
                        };
                        _hr = _hr - 1;
                        _costs = _costs - (server getVariable (_unitType));
                    };
                };
                if (typeOf (vehicle _x) in FactionGet(reb,"staticMortars")) then
                {
                    deleteVehicle vehicle _x
                };
                deleteVehicle _x;
            };
        } forEach allUnits;
    };
    {
        if (_x == FactionGet(reb,"unitCrew")) then
        {
            _costs = _costs + ([(FactionGet(reb,"staticMortars")) # 0] call A3A_fnc_vehiclePrice)
        };
        _hr = _hr + 1;
        _costs = _costs + (server getVariable _x);
    } forEach _garrison;
    [_hr,_costs] remoteExec ["A3A_fnc_resourcesFIA",2];
    garrison setVariable ["Synd_HQ",[],true];
    [_titleStr, format [localize "STR_A3A_fn_base_movehq_removed",_costs,_hr]] call A3A_fnc_customHint;
};

sleep 5;
