/*
    A3A_fnc_customHintCountdown
    Adds and maintains message with client-side timer countdown timer in hint queue
    Disable by sending another customHint with the same header

Environment: Scheduled, client-local

Parameters:
    <STRING> Heading of your notification.
    <STRING> Body of your notification. Should have a %1 in it for the time in seconds.
    <NUMBER> Server time completion time.
    <OBJECT|POSITION> Object or position to display notification when near (optional)
    <NUMBER> Notification radius around object (optional)

*/

params ["_headerText", "_bodyText", "_endTime", "_showCenter", "_showRadius"];

private _fnc_removeMessage = {
    isNil {
        private _index = A3A_customHint_MSGs findIf { _x#1 == _this }
        A3A_customHint_MSGs deleteAt _index;
    };
};

private _lastText = "";

while {true} do
{
    // Timer expired, remove message and exit
    if (_endTime < serverTime) exitWith {
        _lastText call _fnc_removeMessage;
    };

    // Outside zone, remove last countdown message if present and then wait a bit
    if (!isNil "_showCenter" and {player distance2d _showCenter > _showRadius}) then {
        _lastText call _fnc_removeMessage;
        sleep 5; continue;
    };

    // Check if message has been replaced by another with the same title
    private _index = A3A_customHint_MSGs findIf { _x#0 == _headerText };
    if (_index != -1 and { A3A_customHint_MSGs#_index#1 != _lastText }) exitWith {};

    // Now build the message
    _lastText = format [_bodyText, round (_endTime - serverTime)];
    isNil { [_headerText, _lastText, true] call A3A_fnc_customHint };

    // Attempt to run on exact seconds, more or less
    sleep (0.1 + (_endTime - serverTime) % 1);
};
