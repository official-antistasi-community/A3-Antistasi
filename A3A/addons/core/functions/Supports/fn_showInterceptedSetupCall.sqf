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
    _text = format ["%1 is setting up an unknown support", _sideName]; //TODO: Localize
}
else
{
    switch (toupper _supportType) do
    {
        case ("MAJORATTACK"):
        {
            _text = format ["%1 just sent a major attack wave", _sideName]; //TODO: Localize
        };
        case ("COUNTERATTACK"):
        {
            _text = format ["%1 just sent a counterattack force", _sideName]; //TODO: Localize
        };
        case ("QRFAIR"):
        {
            _text = format ["%1 just sent an airborne QRF", _sideName]; //TODO: Localize
        };
        case ("QRFLAND"):
        {
            _text = format ["%1 just sent a land QRF", _sideName]; //TODO: Localize
        };
        case ("AIRSTRIKE"):
        {
            _text = format ["%1 is preparing an airstrike", _sideName]; //TODO: Localize
        };
        case ("MORTAR"):
        {
            _text = format ["%1 is setting up a mortar position", _sideName]; //TODO: Localize
        };
        case ("ARTILLERY"):
        {
            _text = format ["%1 is preparing an artillery position", _sideName]; //TODO: Localize
        };
        case ("ORBITALSTRIKE"):
        {
            _text = format ["A %1 satellite is preparing an orbital strike", _sideName]; //TODO: Localize
        };
        case ("CRUISEMISSILE"):
        {
            _text = format ["A %1 cruiser is readying a cruise missile", _sideName]; //TODO: Localize
        };
        case ("SAM"):
        {
            _text = format ["%1 is setting up a SAM launcher", _sideName]; //TODO: Localize
        };
        case ("CARPETBOMBS"):
        {
            _text = format ["A %1 heavy bomber is on the way", _sideName]; //TODO: Localize
        };
        case ("ASF"):
        {
            _text = format ["%1 is readying an air superiority fighter", _sideName]; //TODO: Localize
        };
        case ("CAS"):
        {
            _text = format ["%1 is readying a CAS bomber", _sideName]; //TODO: Localize
        };
        case ("GUNSHIP"):
        {
            _text = format ["%1 is loading up a heavy gunship", _sideName]; //TODO: Localize
        };
        case ("UAV"):
        {
            _text = format ["%1 is sending a spotting UAV", _sideName]; //TODO: Localize
        };
        default
        {
            _text = format ["%1 is setting up %2 support", _sideName, _supportType]; //TODO: Localize
        };
    };
};

// Randomise setup time less with higher reveal value
_setupTime = _setupTime * (_reveal + random (2 - 2*_reveal));
private _timeStr = if(_setupTime < 60) then { "&lt;1" } else { str round (_setupTime / 60) };

if(_reveal >= 0.8) then
{
    if(toupper _supportType in ["QRFLAND", "QRFAIR", "COUNTERATTACK", "MAJORATTACK"]) then
    {
        _text = format ["%1. Estimated arrival in %2 minutes", _text, _timeStr]; //TODO: Localize
    }
    else
    {
        _text = format ["%1. Estimated setup: %2 minutes", _text, _timeStr]; //TODO: Localize
    };
};

//Broadcast message to nearby players
private _nearbyPlayers = allPlayers select {(_x distance2D _position) <= 2000};
if(count _nearbyPlayers > 0) then
{
    ["RadioIntercepted", [_text]] remoteExec ["BIS_fnc_showNotification",_nearbyPlayers];
};
