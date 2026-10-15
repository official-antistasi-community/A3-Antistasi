/*
	Author: Jeroen Notenbomer

	Description:
	Removes to client from the servers list so it doesnt get called when the arsenal gets updated. This command needs to be excuted on the server!

	Parameter(s):
	ID clientOwner

	Returns:
	NOTHING, well it sends a command which contains the JNA_datalist
*/

if(!isServer)exitWith{};
params ["_clientOwner"];

_temp = server getVariable ["jna_playersInArsenal",[]];
_temp = _temp - [_clientOwner];
server setVariable ["jna_playersInArsenal",_temp,true];

[_clientOwner] call jn_fnc_arsenal_releaseContainer;