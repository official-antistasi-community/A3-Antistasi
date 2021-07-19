#include "..\..\Includes\common.inc"
FIX_LINE_NUMBERS()
#define OccAndInv(VAR) (FactionGet(occ,VAR) + FactionGet(inv,VAR))

//Make sure logLevel is always initialised.
//This should be overridden by the server, as appropriate. Hence the nil check.
if (isNil "logLevel") then { logLevel = 2 };scriptName "initClient.sqf";

Info("initClient started");

call A3A_fnc_installSchrodingersBuildingFix;

if (!isServer) then {
	// get server to send us the current destroyedBuildings list, hide them locally
	"destroyedBuildings" addPublicVariableEventHandler {
		{ hideObject _x } forEach (_this select 1);
	};
	// need to wait until server has loaded the save
	[] spawn {
		waitUntil {(!isNil "serverInitDone")};
		[clientOwner, "destroyedBuildings"] remoteExecCall ["publicVariableClient", 2];
	};
};

// Headless clients install some support functions, register with the server and bail out
if (!hasInterface) exitWith {
	call A3A_fnc_initFuncs;
	call A3A_fnc_initVar;
	call A3A_fnc_loadNavGrid;
    Info_1("Headless client version: %1",localize "STR_antistasi_credits_generic_version_text");
	[clientOwner] remoteExec ["A3A_fnc_addHC",2];
};


waitUntil {!isNull player};
waitUntil {player == player};

//Disable player saving until they're fully ready, and have chosen whether to load their save.
player setVariable ["canSave", false, true];

if (!isServer) then {
	waitUntil {!isNil "initParamsDone"};
	call A3A_fnc_initFuncs;
	call A3A_fnc_initVar;
    Info_1("MP client version: %1",localize "STR_antistasi_credits_generic_version_text");
}
else {
	// SP or hosted, initFuncs/var run in serverInit
	waitUntil {sleep 0.5;(!isNil "serverInitDone")};
};
private _side = side group player;
private _faction = Faction(_side);
private _groupData = FactionGet(reb,"groups");
[] execVM "briefing.sqf";

_isJip = _this select 1;
if (isMultiplayer) then {
	if (side player == teamPlayer) then {
		player setVariable ["eligible",true,true];
	};
	musicON = false;
	disableUserInput true;
	cutText ["Waiting for Players and Server Init","BLACK",0];
    Info("Waiting for server...");
	waitUntil {(!isNil "serverInitDone")};
	cutText ["Starting Mission","BLACK IN",0];
	Info("Server loaded!");
    Info_1("JIP client: %1",_isJIP);
	if (A3A_hasTFAR || A3A_hasTFARBeta) then {
		[] execVM "orgPlayers\radioJam.sqf";
	};
	if (!isNil "placementDone") then {_isJip = true};//workaround for BIS fail on JIP detection
}
else {
	player setVariable ["eligible",true];
	theBoss = player;
	groupX = group player;
	if (worldName == "Tanoa") then {groupX setGroupId ["Pulu","GroupColor4"]} else {groupX setGroupId ["Stavros","GroupColor4"]};
	player setIdentity "protagonista";
	player setUnitRank "COLONEL";
	player hcSetGroup [group player];		// why?
	player setUnitTrait ["medic", true];
	player setUnitTrait ["engineer", true];
	waitUntil {!isNil "serverInitDone"};
};

[] spawn A3A_fnc_ambientCivs;

disableUserInput false;
player setVariable ["spawner",true,true];

if (isMultiplayer && {playerMarkersEnabled}) then {
	[] spawn A3A_fnc_playerMarkers;
};

[player] spawn A3A_fnc_initRevive;		// with ACE medical, only used for helmet popping & TK checks
[] spawn A3A_fnc_outOfBounds;
[] spawn A3A_fnc_darkMapFix;

if (!A3A_hasACE) then {
	[] spawn A3A_fnc_tags;
};

// Placeholders, should get replaced globally by the server
player setVariable ["score",0];
player setVariable ["moneyX",0];
player setVariable ["rankX",rank player];

player setVariable ["owner",player,true];
player setVariable ["punish",0,true];

stragglers = creategroup teamPlayer;
(group player) enableAttack false;
player setUnitTrait ["camouflageCoef",0.8];
player setUnitTrait ["audibleCoef",0.8];

//Give the player the base loadout.
[player] call A3A_fnc_dress;

player setvariable ["compromised",0];
player addEventHandler ["FiredMan", {
	_player = _this select 0;
	if (captive _player) then {
		//if ({((side _x== Invaders) or (side _x== Occupants)) and (_x knowsAbout player > 1.4)} count allUnits > 0) then
		if ({if (((side _x == Occupants) or (side _x == Invaders)) and (_x distance player < 300)) exitWith {1}} count allUnits > 0) then {
			[_player,false] remoteExec ["setCaptive",0,_player];
			_player setCaptive false;
		}
		else {
			_city = [citiesX,_player] call BIS_fnc_nearestPosition;
			_size = [_city] call A3A_fnc_sizeMarker;
			_dataX = server getVariable _city;
			if (random 100 < _dataX select 2) then {
				if (_player distance getMarkerPos _city < _size * 1.5) then {
					[_player,false] remoteExec ["setCaptive",0,_player];
					_player setCaptive false;
					if (vehicle _player != _player) then {
						{if (isPlayer _x) then {[_x,false] remoteExec ["setCaptive",0,_x]; _x setCaptive false}} forEach ((assignedCargo (vehicle _player)) + (crew (vehicle _player)) - [player]);
					};
				};
			};
		};
	};
}];
player addEventHandler ["InventoryOpened", {
	private ["_playerX","_containerX","_typeX"];
	_control = false;
	_playerX = _this select 0;
	if (captive _playerX) then {
		_containerX = _this select 1;
		_typeX = typeOf _containerX;
		if (((_containerX isKindOf "Man") and (!alive _containerX)) or (_typeX isEqualTo OccAndInv("ammoBox"))) then {
			if ({if (((side _x== Invaders) or (side _x== Occupants)) and (_x knowsAbout _playerX > 1.4)) exitWith {1}} count allUnits > 0) then{
				[_playerX,false] remoteExec ["setCaptive",0,_playerX];
				_playerX setCaptive false;
			}
			else {
				_city = [citiesX,_playerX] call BIS_fnc_nearestPosition;
				_size = [_city] call A3A_fnc_sizeMarker;
				_dataX = server getVariable _city;
				if (random 100 < _dataX select 2) then {
					if (_playerX distance getMarkerPos _city < _size * 1.5) then {
						[_playerX,false] remoteExec ["setCaptive",0,_playerX];
						_playerX setCaptive false;
					};
				};
			};
		};
	};
	_control
}];
/*
player addEventHandler ["InventoryClosed", {
	_control = false;
	_uniform = uniform player;
	_typeSoldier = getText (configfile >> "CfgWeapons" >> _uniform >> "ItemInfo" >> "uniformClass");
	_sideType = getNumber (configfile >> "CfgVehicles" >> _typeSoldier >> "side");
	if ((_sideType == 1) or (_sideType == 0) and (_uniform != "")) then {
		if !(player getVariable ["disguised",false]) then {
			hint "You are wearing an enemy uniform, this will make the AI attack you. Beware!";
			player setVariable ["disguised",true];
			player addRating (-1*(2001 + rating player));
		};
	}
	else {
		if (player getVariable ["disguised",false]) then {
			hint "You removed your enemy uniform";
			player addRating (rating player * -1);
		};
	};
	_control
}];
*/
player addEventHandler ["HandleHeal", {
	_player = _this select 0;
	if (captive _player) then {
		if ({((side _x== Invaders) or (side _x== Occupants)) and (_x knowsAbout player > 1.4)} count allUnits > 0) then {
			[_player,false] remoteExec ["setCaptive",0,_player];
			_player setCaptive false;
		}
		else {
			_city = [citiesX,_player] call BIS_fnc_nearestPosition;
			_size = [_city] call A3A_fnc_sizeMarker;
			_dataX = server getVariable _city;
			if (random 100 < _dataX select 2) then {
				if (_player distance getMarkerPos _city < _size * 1.5) then {
					[_player,false] remoteExec ["setCaptive",0,_player];
					_player setCaptive false;
				};
			};
		};
	};
}];

// notes:
// Static weapon objects are persistent through assembly/disassembly
// The bags are not persistent, object IDs change each time
// Static weapon position seems to follow bag1, but it's not an attached object
// Can use objectParent to identify backpack of static weapon

player addEventHandler ["WeaponAssembled", {
	private _veh = _this select 1;
	[_veh, teamPlayer] call A3A_fnc_AIVEHinit;		// will flip/capture if already initialized
	if (_veh isKindOf "StaticWeapon") then {
		if (not(_veh in staticsToSave)) then {
			staticsToSave pushBack _veh;
			publicVariable "staticsToSave";
		};
		_markersX = markersX select {sidesX getVariable [_x,sideUnknown] == teamPlayer};
		_pos = position _veh;
		[_veh] call A3A_fnc_logistics_addLoadAction;
		if (_markersX findIf {_pos inArea _x} != -1) then {["Static Deployed", "Static weapon has been deployed for use in a nearby zone, and will be used by garrison militia if you leave it here the next time the zone spawns"] call A3A_fnc_customHint;};
	};
}];

player addEventHandler ["WeaponDisassembled", {
	private _bag1 = _this select 1;
	private _bag2 = _this select 2;
	//_bag1 = objectParent (_this select 1);
	//_bag2 = objectParent (_this select 2);
	[_bag1] remoteExec ["A3A_fnc_postmortem", 2];
	[_bag2] remoteExec ["A3A_fnc_postmortem", 2];
}];

player addEventHandler ["GetInMan", {
	private ["_unit","_veh"];
	_unit = _this select 0;
	_veh = _this select 2;
	_exit = false;
	if (isMultiplayer) then {
		if !([player] call A3A_fnc_isMember) then {
			_owner = _veh getVariable "ownerX";
			if (!isNil "_owner") then {
				if (_owner isEqualType "") then {
					if ({getPlayerUID _x == _owner} count (units group player) == 0) then {
						["Warning", "You cannot board other player vehicle if you are not in the same group"] call A3A_fnc_customHint;
						moveOut _unit;
						_exit = true;
					};
				};
			};
		};
	};
	if (!_exit) then {
		if ((typeOf _veh) in undercoverVehicles) then {
			if (!(_veh in reportedVehs)) then {
				[] spawn A3A_fnc_goUndercover;
			};
		};
	};
}];

call A3A_fnc_initUndercover;

if (isMultiplayer) then {
	["InitializePlayer", [player]] call BIS_fnc_dynamicGroups;//Exec on client
	if (membershipEnabled) then {
		if !([player] call A3A_fnc_isMember) then {
			private _isMember = false;
			if (isServer) then {
				_isMember = true;
			};
			if (serverCommandAvailable "#logout") then {
				_isMember = true;
				["General Info", "You are not in the member's list, but as you are Server Admin, you have been added. Welcome!"] call A3A_fnc_customHint;
			};

			if (_isMember) then {
				membersX pushBack (getPlayerUID player);
				publicVariable "membersX";
			} else {
				_nonMembers = {(side group _x == teamPlayer) and !([_x] call A3A_fnc_isMember)} count (call A3A_fnc_playableUnits);
				if (_nonMembers >= (playableSlotsNumber teamPlayer) - bookedSlots) then {["memberSlots",false,1,false,false] call BIS_fnc_endMission};
				if (memberDistance != 16000) then {[] execVM "orgPlayers\nonMemberDistance.sqf"};

				["General Info", "Welcome Guest<br/><br/>You have joined this server as guest"] call A3A_fnc_customHint;
			};
		};
	};
};

// Make player group leader, because if they disconnected with AI squadmates, they may not be
// In this case, the group will also no longer be local, so we need the remoteExec
if !(isPlayer leader group player) then {
	[group player, player] remoteExec ["selectLeader", groupOwner group player];
};

[] remoteExec ["A3A_fnc_assignBossIfNone", 2];

if (_isJip) then { Info("Joining In Progress (JIP)") } else { Info("Not Joining in Progress (JIP)") };

[] spawn A3A_fnc_modBlacklist;

//Move this
//HC_commanderX synchronizeObjectsAdd [player];
//player synchronizeObjectsAdd [HC_commanderX];
A3A_customHintEnable = true; // Was false in initVarCommon to allow debug progress  hints to flow in and overwrite each other.

if (isServer || player isEqualTo theBoss || (call BIS_fnc_admin) > 0) then {  // Local Host || Commander || Dedicated Admin
	private _modsAndLoadText = [
		[A3A_hasTFAR || A3A_hasTFARBeta,"TFAR","Players will use TFAR radios. Unconscious players' radios will be muted."],
		[A3A_hasACRE,"ACRE","Players will use ACRE radios. Unconscious players' radios will be muted."],
		[A3A_hasACE,"ACE 3","ACE items added to arsenal and ammo-boxes."],
		[A3A_hasACEMedical,"ACE 3 Medical","Default revive system will be disabled"],
		[A3A_hasRHS,"RHS","All factions will be replaced by RHS (AFRF &amp; USAF &amp; GREF)."],
		[A3A_has3CBFactions,"3CB Factions","All Factions will be Replaced by 3CB Factions."],
		[A3A_has3CBBAF,"3CB BAF","Occupant Faction will be Replaced by British Armed forces."],
		[A3A_hasFFAA,"FFAA","Occupant faction will be replaced by Spanish Armed Forces"],
		[A3A_hasIvory,"Ivory Cars","Mod cars will be added to civilian car spawns."]
	] select {_x#0};

	private _loadedTemplateInfoXML = A3A_loadedTemplateInfoXML apply {[true,_x#0,_x#1]};	// Remove and simplify when the list above is empty and can be deleted.
	_modsAndLoadText append _loadedTemplateInfoXML;

	if (count _modsAndLoadText isEqualTo 0) exitWith {};
	private _textXML = "<t align='left'>" + ((_modsAndLoadText apply { "<t color='#f0d498'>" + _x#1 + ":</t>" + _x#2 }) joinString "<br/>") + "</t>";
	["Loaded Mods",_textXML] call A3A_fnc_customHint;
};

waituntil {!isnull (finddisplay 46)};
gameMenu = (findDisplay 46) displayAddEventHandler ["KeyDown",A3A_fnc_keys];
//removeAllActions boxX;

//if ((!isServer) and (isMultiplayer)) then {boxX call jn_fnc_arsenal_init};


if (A3A_hasACE) then
{
	if (isNil "ace_interact_menu_fnc_compileMenu" || isNil "ace_interact_menu_fnc_compileMenuSelfAction") exitWith {
        Error("ACE non-public functions have changed, rebel group join/leave actions will not be removed");
	};
	// Remove group join action from all rebel unit types
	// Need to compile the menus first, because ACE delays creating menus until a unit of that class is created
	private _playerUnits = ["I_G_soldier_F", "I_G_Soldier_TL_F", "I_G_Soldier_AR_F", "I_G_medic_F", "I_G_engineer_F", "I_G_Soldier_GL_F" /*greenfor*/,
		"B_G_soldier_F", "B_G_Soldier_TL_F", "B_G_Soldier_AR_F", "B_G_medic_F", "B_G_engineer_F", "B_G_Soldier_GL_F" /*bluefor*/];
	{
		[_x] call ace_interact_menu_fnc_compileMenu;
		[_x] call ace_interact_menu_fnc_compileMenuSelfAction;
		[_x, 1,["ACE_SelfActions", "ACE_TeamManagement", "ACE_LeaveGroup"]] call ace_interact_menu_fnc_removeActionFromClass;
		[_x, 0,["ACE_MainActions", "ACE_JoinGroup"]] call ace_interact_menu_fnc_removeActionFromClass;
	} forEach (
        _playerUnits
        + (_groupData get "squadEng") // SL, GL, militia, mg, exp, lat, eng, medic
        + (_groupData get "sniper")
        + [_groupData get "unarmed", _groupData get "staticCrew", _groupData get "Petros"]
    );
};

boxX allowDamage false;
boxX addAction ["Transfer Vehicle cargo to Ammobox", {[] spawn A3A_fnc_empty;}, 4];
boxX addAction ["Move this asset", A3A_fnc_moveHQObject,nil,0,false,true,"","(_this == theBoss)", 4];
if (A3A_hasACE) then { [boxX, boxX] call ace_common_fnc_claim;};	//Disables ALL Ace Interactions
flagX allowDamage false;
flagX addAction ["Unit Recruitment", {if ([player,300] call A3A_fnc_enemyNearCheck) then {["Recruit Unit", "You cannot recruit units while there are enemies near you"] call A3A_fnc_customHint;} else { [] spawn A3A_fnc_unit_recruit; }},nil,0,false,true,"","(isPlayer _this) and (_this == _this getVariable ['owner',objNull]) and (side (group _this) == teamPlayer)"];
flagX addAction ["Move this asset", A3A_fnc_moveHQObject,nil,0,false,true,"","(_this == theBoss)", 4];

//Adds a light to the flag
private _flagLight = "#lightpoint" createVehicle (getPos flagX);
_flagLight setLightDayLight true;
_flagLight setLightColor [1, 1, 0.9];
_flagLight setLightBrightness 0.2;
_flagLight setLightAmbient [1, 1, 0.9];
_flagLight lightAttachObject [flagX, [0, 0, 4]];
_flagLight setLightAttenuation [7, 0, 0.5, 0.5];

vehicleBox allowDamage false;
vehicleBox addAction ["Heal nearby units", A3A_fnc_vehicleBoxHeal,nil,0,false,true,"","(isPlayer _this) and (_this == _this getVariable ['owner',objNull]) and (side (group _this) == teamPlayer)", 4];
vehicleBox addAction ["Vehicle Arsenal", JN_fnc_arsenal_handleAction, [], 0, true, false, "", "alive _target && vehicle _this != _this", 10];
[vehicleBox] call HR_GRG_fnc_initGarage;
if (A3A_hasACE) then { [vehicleBox, VehicleBox] call ace_common_fnc_claim;};	//Disables ALL Ace Interactions
vehicleBox addAction ["Buy Vehicle", {if ([player,300] call A3A_fnc_enemyNearCheck) then {["Purchase Vehicle", "You cannot buy vehicles while there are enemies near you"] call A3A_fnc_customHint;} else {nul = createDialog "vehicle_option"}},nil,0,false,true,"","(isPlayer _this) and (_this == _this getVariable ['owner',objNull]) and (side (group _this) == teamPlayer)", 4];
vehicleBox addAction ["Move this asset", A3A_fnc_moveHQObject,nil,0,false,true,"","(_this == theBoss)", 4];

if (LootToCrateEnabled) then {
	vehicleBox addAction ["Buy loot box for 10€", {player call A3A_fnc_spawnCrate},nil,0,false,true,"","true", 4];
	call A3A_fnc_initLootToCrate;
};

fireX allowDamage false;
[fireX, "fireX"] call A3A_fnc_flagaction;

mapX allowDamage false;
mapX addAction ["Game Options", {
	[
		"Game Options",
		"Version: "+ antistasiVersion +
		"<br/><br/>Difficulty: "+ ( ["Easy","Normal","Hard"] select ((skillMult-1) min 2) ) +
		"<br/>Unlock Weapon Number: "+ str minWeaps +
		"<br/>Limited Fast Travel: "+ (["No","Yes"] select limitedFT) +
		"<br/>AI Limit: "+ str maxUnits +
		"<br/>Spawn Distance: "+ str distanceSPWN + "m" +
		"<br/>Civilian Limit: "+ str civPerc
	] call A3A_fnc_customHint;
	CreateDialog "game_options";
	nil;
},nil,0,false,true,"","(isPlayer _this) and (_this == _this getVariable ['owner',objNull]) and (side (group _this) == teamPlayer)", 4];
mapX addAction ["Map Info", A3A_fnc_cityinfo,nil,0,false,true,"","(isPlayer _this) and (_this == _this getVariable ['owner',objNull]) and (side (group _this) == teamPlayer)", 4];
mapX addAction ["Move this asset", A3A_fnc_moveHQObject,nil,0,false,true,"","(_this == theBoss)", 4];
if (isMultiplayer) then {mapX addAction ["AI Load Info", { [] remoteExec ["A3A_fnc_AILoadInfo",2];},nil,0,false,true,"","((_this == theBoss) || (serverCommandAvailable ""#logout""))"]};
[] execVM "OrgPlayers\unitTraits.sqf";

// only add petros actions if he's static
if (petros == leader group petros) then {
	group petros setGroupId ["Petros","GroupColor4"];
	[petros,"remove"] call A3A_fnc_flagaction;		// in case we already created them in initserver
	[petros,"mission"] call A3A_fnc_flagaction;
};
petros setIdentity "friendlyX";
if (worldName == "Tanoa") then {petros setName "Maru"} else {petros setName "Petros"};

disableSerialization;
//1 cutRsc ["H8erHUD","PLAIN",0,false];
_layer = ["statisticsX"] call bis_fnc_rscLayer;
_layer cutRsc ["H8erHUD","PLAIN",0,false];
[] spawn A3A_fnc_statistics;

//Check if we need to relocate HQ
if (isNil "placementDone") then {
	if (isNil "playerPlacingHQ" || {!(playerPlacingHQ in (call A3A_fnc_playableUnits))}) then {
		playerPlacingHQ = player;
		publicVariable "playerPlacingHQ";
		call A3A_fnc_placementSelection;
	};
};

//Load the player's personal save.
if (isMultiplayer) then {
	[] spawn A3A_fnc_createDialog_shouldLoadPersonalSave;
}
else
{
	// just do this directly, because playerHasSave doesn't work without moneyX
	private _loadout = [getPlayerUID player, "loadoutPlayer"] call A3A_fnc_retrievePlayerStat;
	if (!isNil "_loadout") then { player setUnitLoadout _loadout };
	player setVariable ["canSave", true];
};


//Move the player to HQ now they're initialised.
player setPos (getMarkerPos respawnTeamPlayer);

//Disables rabbits and snakes, because they cause the log to be filled with "20:06:39 Ref to nonnetwork object Agent 0xf3b4a0c0"
//Can re-enable them if we find the source of the bug.
enableEnvironment [false, true];

Info("initClient completed");

if(!isMultiplayer) then
{
    [] spawn A3A_fnc_singlePlayerBlackScreenWarning;
};
