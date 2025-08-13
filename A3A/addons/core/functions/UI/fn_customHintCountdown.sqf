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

private _lastMessage = [];

while {true} do
{
    // Timer expired, remove message and exit
    if (_endTime < serverTime) exitWith {
        A3A_customHint_MSGs deleteAt (A3A_customHint_MSGs find _lastMessage);
    };

    // Outside zone, remove last countdown message if present and then wait a bit
    if (!isNil "_showCenter" and {player distance2d _showCenter > _showRadius}) then {
        A3A_customHint_MSGs deleteAt (A3A_customHint_MSGs find _lastMessage);
        sleep 1; continue;
    };

    // Ff message has been replaced by another with the same title, cancel
    private _index = A3A_customHint_MSGs findIf { _x#0 == _headerText and !(_x isEqualRef _lastMessage) };
    if (_index != -1) exitWith {};

    // Add/update the countdown message
    isNil {
        private _str = format [_bodyText, round (_endTime - serverTime)];
        [_headerText, _str, true] call A3A_fnc_customHint;
        _lastMessage = A3A_customHint_MSGs # (A3A_customHint_MSGs findIf { _x#0 == _headerText });        // Guaranteed to exist, because we just added it
    };

    // Attempt to run on exact seconds, more or less
    sleep (0.1 + (_endTime - serverTime) % 1);
};
