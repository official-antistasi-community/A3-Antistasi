#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

/*  Shows the intercepted radio setup message to the players

    Execution on: Server

    Scope: Internal

    Parameters:
        _reveal: NUMBER : 0-1, determines how much info to revealed
        _side: SIDE : The side which called in the support
        _supportType: STRING : The type of the support
        _position: ARRAY : Target position of support
        _setupTime : NUMBER : Approximate setup time in seconds

    Returns:
        Nothing
*/

// TODO: add source/setup position?

params ["_reveal", "_side", "_supportType", "_position", "_setupTime"];

//Nothing will be revealed
if(_reveal <= 0.2) exitWith {};

private _text = "";
private _sideName = Faction(_side) get "name";
if (_reveal <= 0.5) then
{
    //Side and setup is revealed
    _text = format [localize "STR_A3A_fn_support_showIntStpCll_unknown", _sideName];
}
else
{
    _text = format [localize format ["STR_A3A_fn_support_showIntStpCll_%1", toUpper _supportType], _sideName];
    if (_text isEqualTo "") then {_text = format [localize "STR_A3A_fn_support_showIntStpCll_default", _sideName, _supportType]};
};

// Randomise setup time less with higher reveal value
_setupTime = _setupTime * (_reveal + random (2 - 2*_reveal));
private _timeStr = if(_setupTime < 60) then { "&lt;1" } else { str round (_setupTime / 60) };

if(_reveal >= 0.8) then
{
    if(toupper _supportType in ["QRFLAND", "QRFAIR", "COUNTERATTACK", "MAJORATTACK", "TANK"]) then
    {
        _text = [_text,format[localize "STR_A3A_fn_support_showIntStpCll_arrivalTime",_timeStr]] joinString " ";
    }
    else
    {
        _text = [_text,format[localize "STR_A3A_fn_support_showIntStpCll_setupTime",_timeStr]] joinString " ";
    };
};

//Broadcast message to nearby players
private _nearbyPlayers = allPlayers select {(_x distance2D _position) <= 2000};
if(count _nearbyPlayers > 0) then
{
    ["RadioIntercepted", [_text]] remoteExec ["BIS_fnc_showNotification",_nearbyPlayers];
};
