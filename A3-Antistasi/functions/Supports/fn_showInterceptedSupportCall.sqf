params ["_reveal", "_position", "_side", "_supportType", "_marker", "_textMarker"];

/*  Shows the intercepted radio message to the players

    Execution on: Server

    Scope: Internal

    Parameters:
        _reveal: NUMBER : Decides how much of the info will be revealed
        _position: POSITION : The position where the support is called to
        _side: SIDE : The side which called in the support
        _supportType: NAME : The name of the support (not the callsign!!)
        _marker: MARKER : The marker which covers the area of the attack
        _textMarker: MARKER : The marker which is holding the text of the support

    Returns:
        Nothing
*/

//If you have found a key before, you get the full message if it is somewhere around your HQ
if(_position distance2D (getMarkerPos "Synd_HQ") < distanceMission) then
{
    if(_side == Occupants) then
    {
        if(occupantsRadioKeys > 0) then
        {
            occupantsRadioKeys = occupantsRadioKeys - 1;
            publicVariable "occupantsRadioKeys";
            _reveal = 1;
        };
    }
    else
    {
        if(occupantsRadioKeys > 0) then
        {
            invaderRadioKeys = invaderRadioKeys - 1;
            publicVariable "occupantsRadioKeys";
            _reveal = 1;
        };
    };
};

//Nothing will be revealed
if(_reveal <= 0.2) exitWith {};

private _text = "";
private _sideName = if(_side == Occupants) then {nameOccupants} else {nameInvaders};
if (_reveal <= 0.5) then
{
    //Side and call is reveal
    _text = format ["%1 is executing an unknown support now", _sideName];
}
else
{
    switch (_supportType) do
    {
        case ("QRF"):
        {
            _text = format ["A %1 QRF just arrived", _sideName];
        };
        case ("AIRSTRIKE"):
        {
            _text = format ["%1 is about to execute an airstrike", _sideName];
        };
        case ("MORTAR"):
        {
            _text = format ["A %1 mortar has opened fire", _sideName];
        };
        case ("ORBSTRIKE"):
        {
            _text = format ["A %1 satellite has fired the orbital strike", _sideName];
        };
        case ("MISSILE"):
        {
            _text = format ["%1 cruise missile launched", _sideName];
        };
        case ("SAM"):
        {
            _text = format ["%1 SAM missile launched", _sideName];
        };
        case ("CARPETBOMB"):
        {
            _text = format ["%1 bomber started to lay down a carpet bombing", _sideName];
        };
        case ("ASF"):
        {
            _text = format ["%1 fighter started chasing a target", _sideName];
        };
        case ("CAS"):
        {
            _text = format ["A %1 CAS bomber has locked onto a target", _sideName];
        };
        case ("GUNSHIP"):
        {
            _text = format ["A %1 heavy gunship started cycling the area", _sideName];
        };
        default
        {
            _text = format ["%1 is executing %2 support now", _sideName, _supportType];
        };
    };
    if(_reveal > 0.8) then
    {
        //Side, type, call and marker revealed
        _text = format ["%1. Target marked on map!", _text];
        _marker setMarkerAlpha 0.75;
        _textMarker setMarkerAlpha 1;
    };
};

//Broadcast message to nearby players
private _nearbyPlayers = allPlayers select {(_x distance2D _position) <= 2000};
if(count _nearbyPlayers > 0) then
{
    ["RadioIntercepted", [_text]] remoteExec ["BIS_fnc_showNotification",_nearbyPlayers];
};
