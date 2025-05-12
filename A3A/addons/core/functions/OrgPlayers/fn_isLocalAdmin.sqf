/*
Maintainer: Caleb Serafin
    Similar to BIS_fnc_admin except that it recognises localhost as admin and skips checking if voted or logged admin.
    https://community.bistudio.com/wiki/serverCommandAvailable

Return Value:
    <BOOL> true if player is localhost, voted admin or logged-in admin. false if not.

Scope: Clients
Environment: Any
Public: Yes

Example:
    [] call A3A_fnc_isLocalAdmin; // false
*/

(isServer && hasInterface) || serverCommandAvailable "#logout";
