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
#include "..\..\Includes\common.inc"
FIX_LINE_NUMBERS()
private _possible = [] call A3A_fnc_canMoveHQ;
if !(_possible#0) exitWith {};

[petros,"remove"] remoteExec ["A3A_fnc_flagaction",0];
private _groupData = FactionGet(reb,"groups");
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
        ["Garrison", "HQ Garrison will stay here and distract the enemy"] call A3A_fnc_customHint;
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
                    if (_unitType in (_groupData get "soldiers")) then
                    {
                        if (_unitType == (_groupData get "staticCrew")) then
                        {
                            _costs = _costs - ([FactionGet(reb,"staticMortar")] call A3A_fnc_vehiclePrice)
                        };
                        _hr = _hr - 1;
                        _costs = _costs - (server getVariable (_unitType));
                    };
                };
                if (typeOf (vehicle _x) == FactionGet(reb,"staticMortar")) then
                {
                    deleteVehicle vehicle _x
                };
                deleteVehicle _x;
            };
        } forEach allUnits;
    };
    {
        if (_x == (_groupData get "staticCrew")) then
        {
            _costs = _costs + ([FactionGet(reb,"staticMortar")] call A3A_fnc_vehiclePrice)
        };
        _hr = _hr + 1;
        _costs = _costs + (server getVariable _x);
    } forEach _garrison;
    [_hr,_costs] remoteExec ["A3A_fnc_resourcesFIA",2];
    garrison setVariable ["Synd_HQ",[],true];
    ["Garrison", format ["Garrison removed<br/><br/>Recovered Money: %1 €<br/>Recovered HR: %2",_costs,_hr]] call A3A_fnc_customHint;
};

sleep 5;

petros addAction ["Build HQ here", A3A_fnc_buildHQ, nil, 0, false, true];
