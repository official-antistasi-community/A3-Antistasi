params
[
    ["_reveal", 0, [0]],
    ["_side", sideEnemy, [sideEnemy]],
    ["_supportType", "", [""]],
    ["_position", [], [[]]],
    ["_minSetupTime", 60, [0]],
    ["_maxSetupTime", 400, [0]]
];

/*  Shows the intercepted radio setup message to the players

    Execution on: Server

    Scope: Internal

    Parameters:
        _reveal: NUMBER : Decides how much of the info will be revealed
        _side: SIDE : The side which called in the support
        _supportType: NAME : The name of the support (not the callsign!!)

    Returns:
        Nothing
*/

_fn_getTimeString =
{
    params
    [
        ["_time", 0, [0]],
        ["_isLower", true, [true]]
    ];

    _time = _time / 60;

    private _result = "";
    if(_time < 1) then
    {
        _result = "&lt;1";
    }
    else
    {
        _time = _time - 0.49;
        if(_isLower) then
        {
            _result = format ["%1", round _time];
        }
        else
        {
            _result = format ["%1", (round _time) + 1];
        };
    };

    _result;
};

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
        if(invaderRadioKeys > 0) then
        {
            invaderRadioKeys = invaderRadioKeys - 1;
            publicVariable "invaderRadioKeys";
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
    //Side and setup is revealed
    _text = format [localize "STR_antistasi_notification_setupCall_noRevealed", _sideName];
}
else
{
    switch (_supportType) do
    {
        case ("QRF"):
        {
            _text = format [localize "STR_antistasi_notification_setupCall_QRF", _sideName];
        };
        case ("AIRSTRIKE"):
        {
            _text = format [localize "STR_antistasi_notification_setupCall_AIRSTRIKE", _sideName];
        };
        case ("MORTAR"):
        {
            _text = format [localize "STR_antistasi_notification_setupCall_MORTAR", _sideName];
        };
        case ("ORBSTRIKE"):
        {
            _text = format [localize "STR_antistasi_notification_setupCall_ORBSTRIKE", _sideName];
        };
        case ("MISSILE"):
        {
            _text = format [localize "STR_antistasi_notification_setupCall_MISSILE", _sideName];
        };
        case ("SAM"):
        {
            _text = format [localize "STR_antistasi_notification_setupCall_SAM", _sideName];
        };
        case ("CARPETBOMB"):
        {
            _text = format [localize "STR_antistasi_notification_setupCall_CARPETBOMB", _sideName];
        };
        case ("ASF"):
        {
            _text = format [localize "STR_antistasi_notification_setupCall_ASF", _sideName];
        };
        case ("CAS"):
        {
            _text = format [localize "STR_antistasi_notification_setupCall_CAS", _sideName];
        };
        case ("GUNSHIP"):
        {
            _text = format [localize "STR_antistasi_notification_setupCall_GUNSHIP", _sideName];
        };
        default
        {
            _text = format [localize "STR_antistasi_notification_setupCall_default", _sideName, _supportType];
        };
    };
};

if(_reveal >= 0.8) then
{
    if(_supportType == "QRF") then
    {
        _text = format [localize "STR_antistasi_notification_setupCall_arrival", _text, [_minSetupTime, true] call _fn_getTimeString, [_maxSetupTime, false] call _fn_getTimeString];
    }
    else
    {
        _text = format [localize "STR_antistasi_notification_setupCall_setup", _text, [_minSetupTime, true] call _fn_getTimeString, [_maxSetupTime, false] call _fn_getTimeString];
    };
};

//Broadcast message to nearby players
private _nearbyPlayers = allPlayers select {(_x distance2D _position) <= 2000};
if(count _nearbyPlayers > 0) then
{
    ["RadioIntercepted", [_text]] remoteExec ["BIS_fnc_showNotification",_nearbyPlayers];
};
