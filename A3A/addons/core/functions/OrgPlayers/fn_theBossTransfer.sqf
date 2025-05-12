if !(isServer) exitWith {};
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
params [["_newBoss", objNull], ["_silent", false]];

if (!isNull theBoss) then
{
    Debug_1("Removing %1 from Boss roles.", name theBoss);

	bossHCGroupsTransfer = hcAllGroups theBoss;
	hcRemoveAllGroups theBoss;

	theBoss synchronizeObjectsRemove [HC_commanderX];
	HC_commanderX synchronizeObjectsRemove [theBoss];
};

theBoss = _newBoss;
publicVariable "theBoss";

if (isNull _newBoss) exitWith {
	[_silent] spawn {
		params ["_silent"];
		sleep 5;
		private _textX = format [localize "STR_A3A_fn_orgp_tBTransfer_noEligible"];
		if (!_silent) then {[petros,"hint",_textX, localize "STR_A3A_fn_orgp_tBTransfer_newCommTitle"] remoteExec ["A3A_fnc_commsMP", 0]};
		[] remoteExec ["A3A_fnc_statistics",[teamPlayer,civilian]];
	};
};

[group theBoss, theBoss] remoteExec ["selectLeader", groupOwner group theBoss];

theBoss synchronizeObjectsAdd [HC_commanderX];
HC_commanderX synchronizeObjectsAdd [theBoss];

if (!isNil "bossHCGroupsTransfer") then
{
    Debug("Found previous HC groups, transferring.");
	{
		theBoss hcSetGroup [_x];
		_x setGroupOwner owner theBoss;
	} forEach bossHCGroupsTransfer;
	bossHCGroupsTransfer = nil;
}
else {
	// Boss got lost somewhere, try to find HC groups by scanning
    Debug("No previous HC groups found, scanning all groups.");
	{
		if ((leader _x getVariable ["spawner",false]) and (!isPlayer leader _x) and (side _x == teamPlayer)) then
		{
			theBoss hcSetGroup [_x];
			_x setGroupOwner owner theBoss;
		};
	} forEach allGroups;
};

Debug_1("New boss %1 set.", name theBoss);

[_silent] spawn {
	params ["_silent"];
	sleep 5;
	private _textX = format [localize "STR_A3A_fn_orgp_tBTransfer_newCommLong", name theBoss];
	if (!_silent) then {[petros,"hint",_textX, localize "STR_A3A_fn_orgp_tBTransfer_newCommTitle"] remoteExec ["A3A_fnc_commsMP", 0]};
	[] remoteExec ["A3A_fnc_statistics",[teamPlayer,civilian]];
};
