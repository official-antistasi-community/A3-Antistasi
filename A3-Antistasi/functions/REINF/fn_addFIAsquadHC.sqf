#include "..\..\Includes\common.inc"
FIX_LINE_NUMBERS()
private _groupData = FactionGet(reb, "groups");
private ["_typeGroup","_esinf","_typeVehX","_costs","_costHR","_exit","_formatX","_pos","_hr","_resourcesFIA","_groupX","_roads","_road","_truckX","_vehicle","_mortarX","_morty"];

if (player != theBoss) exitWith {["Recruit Squad", "Only the Commander has access to this function"] call A3A_fnc_customHint;};

if (markerAlpha respawnTeamPlayer == 0) exitWith {["Recruit Squad", "You cannot recruit a new squad while you are moving your HQ"] call A3A_fnc_customHint;};

if (!([player] call A3A_fnc_hasRadio)) exitWith {if !(A3A_hasIFA) then {["Recruit Squad", "You need a radio in your inventory to be able to give orders to other squads"] call A3A_fnc_customHint;} else {["Recruit Squad", "You need a Radio Man in your group to be able to give orders to other squads"] call A3A_fnc_customHint;}};

private _enemyNear = false;

{
	if (((side _x == Invaders) or (side _x == Occupants)) and (_x distance petros < 500) and ([_x] call A3A_fnc_canFight) and !(isPlayer _x)) exitWith {_enemyNear = true};
} forEach allUnits;

if (_enemyNear) exitWith {["Recruit Squad", "You cannot recruit squads with enemies near your HQ"] call A3A_fnc_customHint;};

_typeGroup = _this select 0;
_exit = false;

if (_typeGroup isEqualType "") then {
	if (_typeGroup == "not_supported") then {_exit = true; ["Recruit Squad", "The group or vehicle type you requested is not supported in your modset"] call A3A_fnc_customHint;};
	if (A3A_hasIFA and ((_typeGroup == FactionGet(reb,"staticMortar")) or (_typeGroup == FactionGet(reb,"staticMG"))) and !debug) then {_exit = true; ["Recruit Squad", "The group or vehicle type you requested is not supported in your modset"] call A3A_fnc_customHint;};
};

if (A3A_hasRHS) then {
	if (_typeGroup isEqualType objNull) then {
		if (_typeGroup == FactionGet(reb,"staticAT")) then {["Recruit Squad", "AT Trucks are disabled in RHS - GREF"] call A3A_fnc_customHint; _exit = true};
	};
};

if (_exit) exitWith {};
_esinf = false;
_typeVehX = "";
_costs = 0;
_costHR = 0;
_formatX = [];
_format = "Squd-";

_hr = server getVariable "hr";
_resourcesFIA = server getVariable "resourcesFIA";

private _withBackpck = "";
if (_typeGroup isEqualType []) then {
	{
		private _typeUnit = if (random 20 <= skillFIA) then {_x select 1} else {_x select 0};
		_formatX pushBack _typeUnit;
		_costs = _costs + (server getVariable _typeUnit); _costHR = _costHR +1
	} forEach _typeGroup;

	if (count _this > 1) then {
		_withBackpck = _this select 1;
		if (_withBackpck == "MG") then {_costs = _costs + ([FactionGet(reb,"staticMG")] call A3A_fnc_vehiclePrice)};
		if (_withBackpck == "Mortar") then {_costs = _costs + ([FactionGet(reb,"staticMortar")] call A3A_fnc_vehiclePrice)};
	};
	_esinf = true;

} else {
	_costs = _costs + (2*(server getVariable (_groupData get "staticCrew"))) + ([_typeGroup] call A3A_fnc_vehiclePrice);
	_costHR = 2;

	if ((_typeGroup == FactionGet(reb,"staticMortar")) or (_typeGroup == FactionGet(reb,"staticMG"))) then {
		_esInf = true;
		_formatX = [(_groupData get "staticCrew"),(_groupData get "staticCrew")];
	} else {
		_costs = _costs + ([FactionGet(reb,"vehicleTruck")] call A3A_fnc_vehiclePrice)
	};
};

if ((_withBackpck != "") and A3A_hasIFA) exitWith {["Recruit Squad", "Your current modset doesn't support packing/unpacking static weapons"] call A3A_fnc_customHint;};

if (_hr < _costHR) then {_exit = true; ["Recruit Squad", format ["You do not have enough HR for this request (%1 required)",_costHR]] call A3A_fnc_customHint;};

if (_resourcesFIA < _costs) then {_exit = true; ["Recruit Squad", format ["You do not have enough money for this request (%1 € required)",_costs]] call A3A_fnc_customHint;};

if (_exit) exitWith {};

[- _costHR, - _costs] remoteExec ["A3A_fnc_resourcesFIA",2];

_pos = getMarkerPos respawnTeamPlayer;

_road = [_pos] call A3A_fnc_findNearestGoodRoad;
_roadDirection = _road call A3A_fnc_getRoadDirection;

_bypassAI = false;
if (_esinf) then {
	_pos = [(getMarkerPos respawnTeamPlayer), 30, random 360] call BIS_Fnc_relPos;
	if (_typeGroup isEqualType []) then {
		_groupX = [_pos, teamPlayer, _formatX,true] call A3A_fnc_spawnGroup;
		if (_typeGroup isEqualTo (_groupData get "medium")) then {_format = "Tm-"};
		if (_typeGroup isEqualTo (_groupData get "AT")) then {_format = "AT-"};
		if (_typeGroup isEqualTo (_groupData get "groupsSnipers")) then {_format = "Snpr-"};
		if (_typeGroup isEqualTo (_groupData get "groupsSentry")) then {_format = "Stry-"};
		if (_withBackpck == "MG") then {
			_format = "SqMG-";
            private _backPacks = getArray (configFile/"CfgVehicles"/FactionGet(reb,"staticMG")/"AssembleInfo"/"dissasembleTo");
            ((units _groupX) select ((count (units _groupX)) - 2)) addBackpackGlobal (_backPacks#1); //base
            ((units _groupX) select ((count (units _groupX)) - 1)) addBackpackGlobal (_backPacks#0); //turret
		} else {
			if (_withBackpck == "Mortar") then {
				_format = "SqMort-";
                private _backPacks = getArray (configFile/"CfgVehicles"/FactionGet(reb,"staticMortar")/"AssembleInfo"/"dissasembleTo");
                ((units _groupX) select ((count (units _groupX)) - 2)) addBackpackGlobal (_backPacks#1); //base
                ((units _groupX) select ((count (units _groupX)) - 1)) addBackpackGlobal (_backPacks#0); //turret
			};
  	    };
	} else {
		_groupX = [_pos, teamPlayer, _formatX,true] call A3A_fnc_spawnGroup;
		_groupX setVariable ["staticAutoT",false,true];
		if (_typeGroup == (_groupData get "staticMortar")) then {_format = "Mort-"};
		if (_typeGroup == (_groupData get "staticMG")) then {_format = "MG-"};
		[_groupX,_typeGroup] spawn A3A_fnc_MortyAI;
		_bypassAI = true;
	};
	_format = format ["%1%2",_format,{side (leader _x) == teamPlayer} count allGroups];
	_groupX setGroupIdGlobal [_format];
} else {
	_truckX = objNull;
	_groupX = grpNull;

	// workaround for weird bug where AI vehicles with attachments refuse to drive when placed close to road objects
	_pos = position _road vectorAdd [4 * (sin _roadDirection), 4 * (cos _roadDirection), 0];
	_pos = _pos findEmptyPosition [0, 40, FactionGet(reb,"vehicleTruck")];

	if (_typeGroup == FactionGet(reb,"staticAA")) then
	{
		private _vehType = if (FactionGet(reb,"vehicleAA") != "not_supported") then {FactionGet(reb,"vehicleAA")} else {FactionGet(reb,"vehicleTruck")}; //ToDo get rid of not_supported syntax
		_truckX = createVehicle [_vehType, _pos, [], 0, "NONE"];
		_truckX setDir _roadDirection;

		_groupX = createGroup teamPlayer;
		private _driver = [_groupX, _groupData get "staticCrew", _pos, [], 5, "NONE"] call A3A_fnc_createUnit;
		private _gunner = [_groupX, _groupData get "staticCrew", _pos, [], 5, "NONE"] call A3A_fnc_createUnit;
		_driver moveInDriver _truckX;
		_driver assignAsDriver _truckX;

		if (FactionGet(reb,"vehicleAA") == "not_supported") then //maybe switch to logistic load
		{
			private _lpos = _pos vectorAdd [0,0,1000];
			private _launcher = createVehicle [FactionGet(reb,"staticAA"), _lpos, [], 0, "CAN_COLLIDE"];
			_launcher attachTo [_truckX, [0,-2.2,0.3]];
			_launcher setVectorDirAndUp [[0,-1,0], [0,0,1]];
			_gunner moveInGunner _launcher;
			_gunner assignAsGunner _launcher;
//			[_launcher] call A3A_fnc_AIVEHinit;			// don't need separate despawn/killed handlers
		} else {
			_gunner moveInGunner _truckX;
			_gunner assignAsGunner _truckX;
		};
	} else {
		private _veh = [_pos, _roadDirection,_typeGroup, teamPlayer] call A3A_fnc_spawnVehicle;
		_truckX = _veh select 0;
		_groupX = _veh select 2;
	};

	if (_typeGroup == FactionGet(reb,"vehicleAT")) then {_groupX setGroupIdGlobal [format ["M.AT-%1",{side (leader _x) == teamPlayer} count allGroups]]};
	if (_typeGroup == FactionGet(reb,"staticAA")) then {_groupX setGroupIdGlobal [format ["M.AA-%1",{side (leader _x) == teamPlayer} count allGroups]]};

	driver _truckX action ["engineOn", _truckX];
	[_truckX, teamPlayer] call A3A_fnc_AIVEHinit;
	[_truckX] spawn A3A_fnc_vehDespawner;
	_bypassAI = true;
};

{[_x] call A3A_fnc_FIAinit} forEach units _groupX;
theBoss hcSetGroup [_groupX];
petros directSay "SentGenReinforcementsArrived";
["Recruit Squad", format ["Group %1 at your command.<br/><br/>Groups are managed from the High Command bar (Default: CTRL+SPACE)<br/><br/>If the group gets stuck, use the AI Control feature to make them start moving. Mounted Static teams tend to get stuck (solving this is WiP)<br/><br/>To assign a vehicle for this group, look at some vehicle, and use Vehicle Squad Mngmt option in Y menu", groupID _groupX]] call A3A_fnc_customHint;
if (!_esinf) exitWith {};
if !(_bypassAI) then {_groupX spawn A3A_fnc_attackDrillAI};

if (count _formatX == 2) then {
	_typeVehX = FactionGet(reb,"vehicleBasic");
} else {
	if (count _formatX > 4) then {
		_typeVehX = FactionGet(reb,"vehicleTruck");
	} else {
		_typeVehX = FactionGet(reb,"vehicleLightUnarmed");
	};
};

_costs = [_typeVehX] call A3A_fnc_vehiclePrice;
if (_costs > server getVariable "resourcesFIA") exitWith {};

createDialog "veh_query";

sleep 1;
disableSerialization;

private _display = findDisplay 100;

if (str (_display) != "no display") then {
	private _ChildControl = _display displayCtrl 104;
	_ChildControl  ctrlSetTooltip format ["Buy a vehicle for this squad for %1 €",_costs];
	_ChildControl = _display displayCtrl 105;
	_ChildControl  ctrlSetTooltip "Barefoot Infantry";
};

waitUntil {(!dialog) or (!isNil "vehQuery")};
if ((!dialog) and (isNil "vehQuery")) exitWith {};

vehQuery = nil;

_pos = position _road findEmptyPosition [1,30,"B_G_Van_01_transport_F"];
private _purchasedVehicle = _typeVehX createVehicle _pos;
_purchasedVehicle setDir _roadDirection;
[_purchasedVehicle, teamPlayer] call A3A_fnc_AIVEHinit;
[_purchasedVehicle] spawn A3A_fnc_vehDespawner;
_groupX addVehicle _purchasedVehicle;
_purchasedVehicle setVariable ["owner",_groupX,true];
[0, - _costs] remoteExec ["A3A_fnc_resourcesFIA",2];
leader _groupX assignAsDriver _purchasedVehicle;
{[_x] orderGetIn true; [_x] allowGetIn true} forEach units _groupX;
["Recruit Squad", "Vehicle Purchased"] call A3A_fnc_customHint;
petros directSay "SentGenBaseUnlockVehicle";
