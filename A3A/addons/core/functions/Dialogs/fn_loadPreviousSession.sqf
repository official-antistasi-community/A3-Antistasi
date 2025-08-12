//TODO: add header

params ["_load"];

if (_load) then {
	[getPlayerUID player, player] remoteExecCall ["A3A_fnc_loadPlayer", 2];
	previousSessionLoaded = true;
} else {
	[getPlayerUID player, player] remoteExecCall ["A3A_fnc_resetPlayer", 2];
	previousSessionLoaded = false;
};
