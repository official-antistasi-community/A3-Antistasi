/*
Maintainer: Caleb Serafin
    Tests if passed in player is localhost or admin.
    Does not work from a client's machine!
    There is not solution for a client discovering admin status of another client at the moment.

Arguments:
    <OBJECT> Player to test if admin.

Return Value:
    <BOOL> true if player is server, localhost or voted admin or logged-in admin. false if not.

Scope: Server
Environment: Any
Public: Yes

Example:
    [_player] call A3A_fnc_isClientAdmin; // true for logged in, voted, localhost admin.
*/

params ["_player"];

((admin owner _player) > 0)
    || (_player isEqualTo player); // checks if server or localhost.
