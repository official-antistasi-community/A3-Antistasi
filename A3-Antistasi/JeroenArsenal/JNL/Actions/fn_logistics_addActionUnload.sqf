params ["_vehicle"];

private _unloadActionID = _vehicle getVariable ["jnl_unloadActionID", Nil];

//Check if action exists already
if(!isnil "_unloadActionID") then
{
	_vehicle removeAction _unloadActionID;
};

//add action
_unloadActionID = _vehicle addAction [
	"Unload",
	{
		//(_this select 0) call jn_fnc_logistics_unLoad
		[_this select 0] remoteexec ["jn_fnc_logistics_unload", 2];
	}, Nil, 1, true, false, "", "vehicle player == player && !(_target getVariable ['jnl_isUnloading',false]);", 5, false, ""
];
_vehicle setUserActionText [
	_unloadActionID,
	localize "STR_antistasi_logistics_loadCargo",
	"<t size='2'><img image='\A3\ui_f\data\IGUI\Cfg\Actions\arrow_down_gs.paa'/></t>"
];
_vehicle setVariable ["jnl_unloadActionID", _unloadActionID, false];
