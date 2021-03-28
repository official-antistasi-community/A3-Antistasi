private _unit = _this select 0;
private _playerX = _this select 1;
private _recruiting = _this select 3;

[_unit,"remove"] remoteExec ["A3A_fnc_flagaction",[teamPlayer,civilian],_unit];

if (!alive _unit) exitWith {};

private _sideX = side (group _unit);
private _interrogated = _unit getVariable ["interrogated", false];

private _modAggroOcc = [0, 0];
private _modAggroInv = [0, 0];
private _modHR = false;
private _response = "";
private _fleeSide = _sideX;

if (_recruiting) then {
	_playerX globalChat localize "STR_antistasi_chat_joinEnemy";

	private _chance = 0;
	if (_sideX == Occupants) then
    {
        _modAggroOcc = [1, 30];
		if ("militia_" in (_unit getVariable "unitType")) then { _chance = 60;}
		else { _chance = 20;};
	}
	else
    {
        _modAggroInv = [1, 30];
		if ("militia_" in (_unit getVariable "unitType")) then { _chance = 60;}
		else { _chance = 40;};
	};
	if (_interrogated) then { _chance = _chance / 2 };

	if (random 100 < _chance) then
    {
		_response = localize "STR_antistasi_chat_joinEnemy_yes";
		_modHR = true;
		_fleeSide = teamPlayer;
	}
	else
    {
		_response = localize "STR_antistasi_chat_joinEnemy_no";
		_modAggroOcc = [0, 0];
		_modAggroInv = [0, 0];
	};
}
else {
	_playerX globalChat localize "STR_antistasi_chat_captureX";
	_response = selectRandom [
		localize "STR_antistasi_chat_captureX_random1",
		localize "STR_antistasi_chat_captureX_random2",
		localize "STR_antistasi_chat_captureX_random3"
	];

	if (_sideX == Occupants) then
    {
        _modAggroOcc = [-3, 30];
	}
	else
    {
        _modAggroInv = [-3, 30];
	};
};


sleep 2;
_unit globalChat _response;

[_unit, _fleeSide] remoteExec ["A3A_fnc_fleeToSide", _unit];

private _group = group _unit;		// Group should be surrender-specific now
sleep 100;
if (alive _unit && {!(_unit getVariable ["incapacitated", false])}) then
{
	[_modAggroOcc,_modAggroInv] remoteExec ["A3A_fnc_prestige",2];
	if (_modHR) then { [1,0] remoteExec ["A3A_fnc_resourcesFIA",2] };
};

deleteVehicle _unit;
deleteGroup _group;
