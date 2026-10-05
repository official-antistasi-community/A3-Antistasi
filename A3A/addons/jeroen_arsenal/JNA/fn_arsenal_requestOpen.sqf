/*
	Author: Jeroen Notenbomer

	Description:
	Sends a command to the client to open the arsenal. It also adds the client to the serverlist so it knows with players need to be updated if a item gets removed/added. This command needs to be excuted on the server!

	Parameter(s):
	ID clientOwner
	OBJECT container the vehicle arsenal is opened on (optional)

	Returns:
	NOTHING, well it sends a command which contains the JNA_datalist
*/

if(!isServer)exitWith{};
params ["_clientOwner", ["_container", objNull]];

_temp = server getVariable ["jna_playersInArsenal",[]];
_temp pushBackUnique _clientOwner;
server setVariable ["jna_playersInArsenal",_temp,true];

// Lock the container before the client reads and empties it. Server-side transfers (garage, ammo transfer)
// skip locked containers, as the client holds that cargo and puts it back on close
[_clientOwner] call jn_fnc_arsenal_releaseContainer;
if (!isNull _container) then {
	_container setVariable ["jna_lockedBy", _clientOwner];
	jna_containerLocks set [_clientOwner, _container];
};

diag_log ["_open arsenal for: clientOwner ",_clientOwner];
["Open",[jna_dataList]] remoteExecCall ["jn_fnc_arsenal", _clientOwner];

