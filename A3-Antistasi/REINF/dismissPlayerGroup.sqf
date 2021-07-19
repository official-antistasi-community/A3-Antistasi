#include "..\Includes\common.inc"
FIX_LINE_NUMBERS()
private _groupData = FactionGet(reb,"groups");
#define GROUP(VAR) (_groupData get VAR)
//if (!isServer) exitWith{};

if (player != leader group player) exitWith {["Dismiss Group", "You cannot dismiss anyone if you are not the squad leader"] call A3A_fnc_customHint;};

private ["_units","_hr","_resourcesFIA","_unit","_newGroup"];

_units = _this select 0;
_units = _units - [player];
_units = _units select { !(isPlayer _x) && { !(_x == petros) } };
if (_units isEqualTo []) exitWith {};
if (_units findIf {!([_x] call A3A_fnc_canFight)} != -1) exitWith {["Dismiss Group", "You cannot disband supressed, undercover or unconscious units"] call A3A_fnc_customHint;};
player globalChat "Get out of my sight you useless scum!";

_newGroup = createGroup teamPlayer;
//if ({isPlayer _x} count units group player == 1) then {_ai = true; _newGroup = createGroup teamPlayer};

{
if ((_x getVariable "unitType") != GROUP("Unarmed")) then
	{
	[_x] join _newGroup;
	if !(A3A_hasIFA) then {arrayids = arrayids + [name _x]};
	};
} forEach _units;

if (recruitCooldown < time) then {recruitCooldown = time + 60} else {recruitCooldown = recruitCooldown + 60};


_LeaderX = leader _newGroup;

{_x domove getMarkerPos respawnTeamPlayer} forEach units _newGroup;

_timeX = time + 120;

waitUntil {sleep 1; (time > _timeX) or ({(_x distance getMarkerPos respawnTeamPlayer < 50) and (alive _x)} count units _newGroup == {alive _x} count units _newGroup)};

_hr = 0;
_resourcesFIA = 0;
_items = [];
_ammunition = [];
_weaponsX = [];

{_unit = _x;
if ([_unit] call A3A_fnc_canFight) then
	{
	_resourcesFIA = _resourcesFIA + (server getVariable (_unit getVariable "unitType"));
	_hr = _hr +1;
	{if (not(([_x] call BIS_fnc_baseWeapon) in unlockedWeapons)) then {_weaponsX pushBack ([_x] call BIS_fnc_baseWeapon)}} forEach weapons _unit;
	{if (not(_x in unlockedMagazines)) then {_ammunition pushBack _x}} forEach magazines _unit;
	_items = _items + (items _unit) + (primaryWeaponItems _unit) + (assignedItems _unit) + (secondaryWeaponItems _unit) + [(hmd _unit),(headGear _unit),(vest _unit)];
	};
deleteVehicle _x;
} forEach units _newGroup;
if (!isMultiplayer) then {_nul = [_hr,_resourcesFIA] remoteExec ["A3A_fnc_resourcesFIA",2];} else {_nul = [_hr,0] remoteExec ["A3A_fnc_resourcesFIA",2]; [_resourcesFIA] call A3A_fnc_resourcesPlayer};
{boxX addWeaponCargoGlobal [_x,1]} forEach _weaponsX;
{boxX addMagazineCargoGlobal [_x,1]} forEach _ammunition;
{boxX addItemCargoGlobal [_x,1]} forEach _items;
deleteGroup _newGroup;
