/*
	Description:
	Releases the vehicle arsenal lock a client holds on a container (see jn_fnc_arsenal_requestOpen). This command needs to be excuted on the server!

	Parameter(s):
	ID clientOwner

	Returns:
	NOTHING
*/

if(!isServer)exitWith{};
params ["_clientOwner"];

if (isNil "jna_containerLocks") then { jna_containerLocks = createHashMap };
private _container = jna_containerLocks deleteAt _clientOwner;
if (isNil "_container" || {isNull _container}) exitWith {};

// Another client may have opened the same container since
if ((_container getVariable ["jna_lockedBy", -1]) == _clientOwner) then { _container setVariable ["jna_lockedBy", nil] };
