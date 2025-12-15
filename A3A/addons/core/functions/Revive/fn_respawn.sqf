params ["_unit"];

if (!local _unit) exitWith {};
if (_unit getVariable "respawning") exitWith {};
if (_unit != _unit getVariable ["owner",_unit]) exitWith {};
if (!isPlayer _unit) exitWith {};

_unit setVariable ["respawning",true];
removeAllUserActionEventHandlers ["A3A_core_respawn", "Activate"];
removeAllUserActionEventHandlers ["A3A_core_selfRevive", "Activate"];
private _layer = ["A3A_infoCenter"] call BIS_fnc_rscLayer;
["Respawning",0,0,15,0,0,_layer] spawn bis_fnc_dynamicText;

if (captive _unit) then {_unit setCaptive false};
if (isMultiplayer) exitWith {_unit setVariable ["respawning",false]; _unit setDamage 1;};

_unit spawn {
    sleep 15;
    _group = group _this;
    _newPlayer = [_group, "a3a_unit_player", getMarkerPos "respawn_guerrila", [],0, "NONE"] call A3A_fnc_createUnit;
    selectPlayer _newPlayer;
    [_this] joinSilent grpNull;
    [_newPlayer, _this] call A3A_fnc_onPlayerRespawn;
    _this setDamage 1;
    _this setVariable ["respawning",false];
};
