params ["_vehicle","_object"];

private _getInGunnerActionID = _vehicle getVariable ["jnl_getInGunnerActionID", nil];

//Check if action exists already
if(!isnil "_getInGunnerActionID") then
{
	_vehicle removeAction _getInGunnerActionID;
};

_getInGunnerActionID = _vehicle addAction [
	localize "STR_A3A_JNL_text_getinstatic",
	{
		private _vehicle = _this select 0;
		player moveInGunner ([_vehicle] call jn_fnc_logistics_getCargo select 0);
	}, Nil, 0, true, false, "", "vehicle player == player", 5, false, ""
];
_vehicle setUserActionText [
	_getInGunnerActionID,
	"Get in "+(getText(configFile>>"cfgVehicles">>typeof _object>>"DisplayName")),
	"<t size='2'><img image='\A3\ui_f\data\IGUI\Cfg\Actions\getingunner_ca.paa'/></t>"
];
_vehicle setVariable ["jnl_getInGunnerActionID", _getInGunnerActionID, false];
