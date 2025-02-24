#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

//Make sure logLevel is always initialised.
//This should be overridden by the server, as appropriate. Hence the nil check.
if (isNil "logLevel") then { logLevel = 2; A3A_logDebugConsole = 1 };

Info("initClient started");
A3A_clientVersion = QUOTE(VERSION);
Info_1("Client version: %1", QUOTE(VERSION_FULL));

// *************************** Client pre-setup init *******************************

if (!requiredVersion QUOTE(REQUIRED_VERSION)) exitWith { Error("Arma version is out of date") };
if (call A3A_fnc_modBlacklist) exitWith {};

//Disables rabbits and snakes, because they cause the log to be filled with "20:06:39 Ref to nonnetwork object Agent 0xf3b4a0c0"
//Can re-enable them if we find the source of the bug.
enableEnvironment [false, true];

// TODO: May need to strip players?
// TODO: May need to disable damage, but tricky if we're not sure when the player exists?

if !(isServer) then {
    call A3A_fnc_initVarCommon;

    [] execVM QPATHTOFOLDER(Scripts\fn_advancedTowingInit.sqf);

    Info("Running client JNA preload");
    ["Preload"] call jn_fnc_arsenal;

    // Headless client navgrid init
    if (!hasInterface) then {
        Info("HC Initialising PATCOM Variables");
        [] call A3A_fnc_patrolInit;

        call A3A_fnc_loadNavGrid;
        waitUntil { sleep 0.1; !isNil "serverInitDone" };			// addNodesNearMarkers needs marker lists
        call A3A_fnc_addNodesNearMarkers;
    };

    if ((isClass (configfile >> "CBA_Extended_EventHandlers")) && (
        isClass (configfile >> "CfgPatches" >> "lambs_danger"))) then {
        // disable lambs danger fsm entrypoint
        ["CAManBase", "InitPost", {
            params ["_unit"];
            (group _unit) setVariable ["lambs_danger_disableGroupAI", true];
            _unit setVariable ["lambs_danger_disableAI", true];
        }] call CBA_fnc_addClassEventHandler;
    };
};

// Server/client version check
waitUntil { sleep 0.1; !isNil "initZonesDone" };
if (isNil "A3A_serverVersion") then { A3A_serverVersion = "pre-3.3" };
if (A3A_clientVersion != A3A_serverVersion) exitWith {
    private _errorStr = format [localize "STR_A3A_feedback_serverinfo_mismatch", A3A_serverVersion, A3A_clientVersion];
    [localize "STR_A3A_feedback_serverinfo", _errorStr] call A3A_fnc_customHint;
};

// Show server startup state hints
if (isNil "A3A_startupState") then { A3A_startupState = "waitserver" };
while {true} do {
    if (dialog) then { sleep 0.1; continue };           // don't spam hints while the setup dialog is open
    private _stateStr = localize ("STR_A3A_feedback_serverinfo_" + A3A_startupState);
    isNil { [localize "STR_A3A_feedback_serverinfo", _stateStr, true] call A3A_fnc_customHint };         // not re-entrant, apparently
    //if (A3A_startupState == "completed") exitWith {};
    if (!isNil "serverInitDone") exitWith {};           // speculative init order fix
    sleep 0.1;
};

//****************************************************************

Info("Server started, continuing with client init");

call A3A_fnc_installSchrodingersBuildingFix;

if (!isServer) then {
    // get server to send us the current destroyedBuildings list, hide them locally
    "destroyedBuildings" addPublicVariableEventHandler {
        { hideObject _x } forEach (_this select 1);
    };
    [clientOwner, "destroyedBuildings"] remoteExecCall ["publicVariableClient", 2];

    boxX call jn_fnc_arsenal_init;
    if (A3A_hasACEMedical) then { call A3A_fnc_initACEUnconsciousHandler };
};

// Headless clients register with server and bail out at this point
if (!isServer and !hasInterface) exitWith {
    player setPosATL (markerPos respawnTeamPlayer vectorAdd [-100, -100, 0]);
    [clientOwner] remoteExecCall ["A3A_fnc_addHC",2];
};

waitUntil {local player};

[] spawn A3A_fnc_briefing;

// Placeholders, should get replaced globally by the server
player setVariable ["score",0];
player setVariable ["moneyX",0];
player setVariable ["rankX",rank player];

player setVariable ["owner",player,true];
player setVariable ["punish",0,true];

player setVariable ["eligible",player call A3A_fnc_isMember,true];
player setVariable ["A3A_playerUID",getPlayerUID player,true];			// Mark so that commander routines know for remote-controlling

musicON = false;
recruitCooldown = 0;			//Prevents units being recruited too soon after being dismissed.
incomeRep = false;
autoHeal = true;				//Should AI in player squad automatically heal teammates

player switchMove ""; // kick the player out of any animation before teleporting
player setPos (getMarkerPos respawnTeamPlayer);
player setVariable ["spawner",true,true];

if (A3A_hasTFAR || A3A_hasTFARBeta || A3A_hasACRE) then {
    [] spawn A3A_fnc_radioJam;
};

if (isMultiplayer && {playerMarkersEnabled}) then {
    [] spawn A3A_fnc_playerMarkers;
};

[player] spawn A3A_fnc_initRevive;		// with ACE medical, only used for helmet popping & TK checks
[] spawn A3A_fnc_outOfBounds;
[] spawn A3A_fnc_darkMapFix;
[] spawn A3A_fnc_clientIdleChecker;

if (!A3A_hasACE) then {
    [] spawn A3A_fnc_tags;
};


stragglers = creategroup teamPlayer;
(group player) enableAttack false;

if (isNil "ace_noradio_enabled" or {!ace_noradio_enabled}) then {
    [player, createHashMapFromArray [["speaker", selectRandom (A3A_faction_reb get "voices")]]] call A3A_fnc_setIdentity
};
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
        if (((_containerX isKindOf "Man") and (!alive _containerX)) or (_typeX in [A3A_faction_occ get "ammobox", A3A_faction_inv get "ammobox"])) then {
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
        [_veh] call A3A_Logistics_fnc_addLoadAction;
        if (_markersX findIf {_pos inArea _x} != -1) then {[localize "STR_A3A_fn_init_initclient_statdepl", localize "STR_A3A_fn_init_initclient_statdepl_confirm"] call A3A_fnc_customHint;};
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
    params ["_unit", "_role", "_veh", "_turret"];
    _exit = false;
    if !([player] call A3A_fnc_isMember) then {
        if (!isNil {_veh getVariable "A3A_locked"}) then {
            _owner = _veh getVariable "ownerX";
            if ({getPlayerUID _x == _owner} count (units group player) == 0) then {
                [localize "STR_A3A_fn_init_initclient_warning", localize "STR_A3A_fn_init_initclient_vehlocked"] call A3A_fnc_customHint;
                moveOut _unit;
                _exit = true;
            };
        };
    };
    if (!_exit) then {
        if ((typeOf _veh) in undercoverVehicles) then {
            if !(_veh getVariable ["A3A_reported", false]) then {
                [] spawn A3A_fnc_goUndercover;
            };
        };
        if (_veh isKindOf "Air") then {
            Debug_2("Installing airspace control for player %1, vehicle %2", _unit, typeof _veh);
            private _handle = [_unit, _veh] spawn A3A_fnc_airspaceControl;
            _unit setVariable ["airspaceControlHandle", _handle];
        };
    };
}];

player addEventHandler ["GetOutMan", {
    params ["_unit", "_role", "_veh", "_turret"];
    Debug_2("Terminating airspace control for player %1, vehicle %2", _unit, typeof _veh);
    private _handle = _unit getVariable ["airspaceControlHandle", scriptNull];
    if (!isNull _handle) then { terminate _handle };
}];

// Prevent players getting shot by their own AIs. EH is respawn-persistent
player addEventHandler ["HandleRating", {0}];

// Prevent squad icons showing in 3d display in high command
addMissionEventHandler ["CommandModeChanged", {
    params ["_isHighCommand", "_isForced"];
    if (_isHighCommand) then { setGroupIconsVisible [true, false] };
}];

call A3A_fnc_initUndercover;

["InitializePlayer", [player]] call BIS_fnc_dynamicGroups;//Exec on client
if (membershipEnabled) then {
    if (player call A3A_fnc_isMember) exitWith {};

    private _isMember = false;
    if (isServer) then {
        _isMember = true;
    };
    if (serverCommandAvailable "#logout") then {
        _isMember = true;
        [localize "STR_A3A_fn_init_initclient_geninfo", localize "STR_A3A_fn_init_initclient_member_admin"] call A3A_fnc_customHint;
    };

    if (_isMember) then {
        membersX pushBack (getPlayerUID player);				// potential race condition, but there's only one admin so chance of hitting this is low
        publicVariable "membersX";
    } else {
        private _nonMembers = {_x call A3A_fnc_isMember} count (call A3A_fnc_playableUnits);
        if (_nonMembers >= (playableSlotsNumber teamPlayer) - bookedSlots) then {["memberSlots",false,1,false,false] call BIS_fnc_endMission};
        [] spawn A3A_fnc_playerLeash;

        [localize "STR_A3A_fn_init_initclient_geninfo", localize "STR_A3A_fn_init_initclient_member_guest"] call A3A_fnc_customHint;
    };
};

// Make player group leader, because if they disconnected with AI squadmates, they may not be
// In this case, the group will also no longer be local, so we need the remoteExec
if !(isPlayer leader group player) then {
    [group player, player] remoteExec ["selectLeader", groupOwner group player];
};

[] remoteExecCall ["A3A_fnc_assignBossIfNone", 2];


if (isServer || player isEqualTo theBoss || (call BIS_fnc_admin) > 0) then {  // Local Host || Commander || Dedicated Admin
    private _modsAndLoadText = [
        [A3A_hasTFAR || A3A_hasTFARBeta,"TFAR",localize "STR_A3A_fn_init_initclient_mods_tfar"],
        [A3A_hasACRE,"ACRE",localize "STR_A3A_fn_init_initclient_mods_acre"],
        [A3A_hasACE,"ACE 3",localize "STR_A3A_fn_init_initclient_mods_ace"],
        [A3A_hasACEMedical,"ACE 3 Medical",localize "STR_A3A_fn_init_initclient_mods_ace_revive"]
    ] select {_x#0};

    private _loadedTemplateInfoXML = A3A_loadedTemplateInfoXML apply {[true,_x#0,_x#1]};	// Remove and simplify when the list above is empty and can be deleted.
    _modsAndLoadText append _loadedTemplateInfoXML;

    if (count _modsAndLoadText isEqualTo 0) exitWith {};
    private _textXML = "<t align='left'>" + ((_modsAndLoadText apply { "<t color='#f0d498'>" + _x#1 + ": </t>" + _x#2 }) joinString "<br/>") + "</t>";
    [localize "STR_A3A_fn_init_initclient_mods_loaded",_textXML] call A3A_fnc_customHint;
};

// uh, what's this for exactly? What are we doing that needs the main display?
waituntil {!isnull (finddisplay 46)};
GVAR(keys_battleMenu) = false; //initilize key flags to false


{
    _x addAction [localize "STR_A3A_fn_init_initclient_addact_move", A3A_fnc_carryItem, 
        nil,0,false,true,"", "(_this == theBoss) and (isNull objectParent _this) and !(call A3A_fnc_isCarrying)", 4];
} forEach [boxX, flagX, vehicleBox, fireX, mapX];

boxX allowDamage false;			// hmm...
boxX addAction [localize "STR_A3A_fn_init_initclient_addact_transfer", {[] spawn A3A_fnc_empty;}, 4,1.5,true,true,"","!unitIsUAV _this"];
flagX allowDamage false;
flagX addAction [localize "STR_A3A_fn_init_initclient_addact_recruit", {if ([getPosATL player] call A3A_fnc_enemyNearCheck) then {[localize "STR_A3A_fn_init_initclient_recunit", localize "STR_A3A_fn_init_initclient_recunit_no"] call A3A_fnc_customHint;} else { [] spawn A3A_fnc_unit_recruit; }},nil,0,false,true,"","(isPlayer _this) and (_this == _this getVariable ['owner',objNull]) and (side (group _this) == teamPlayer)"];

//Adds a light to the flag
private _flagLight = "#lightpoint" createVehicle (getPos flagX);
_flagLight setLightDayLight true;
_flagLight setLightColor [1, 1, 0.9];
_flagLight setLightBrightness 0.2;
_flagLight setLightAmbient [1, 1, 0.9];
_flagLight lightAttachObject [flagX, [0, 0, 4]];
_flagLight setLightAttenuation [7, 0, 0.5, 0.5];

vehicleBox allowDamage false;
vehicleBox addAction [localize "STR_A3A_actions_restore_units", A3A_fnc_vehicleBoxRestore,nil,0,false,true,"","(isPlayer _this) and (_this == _this getVariable ['owner',objNull]) and (side (group _this) == teamPlayer) and !A3A_removeRestore", 4];
vehicleBox addAction [localize "STR_A3A_fn_init_initclient_addact_arsenal", JN_fnc_arsenal_handleAction, [], 0, true, false, "", "alive _target && vehicle _this != _this && _this == _this getVariable ['owner',objNull]", 10];
[vehicleBox] call HR_GRG_fnc_initGarage;

vehicleBox addAction [localize "STR_A3A_fn_init_initclient_addact_buyveh", {
    if ([getPosATL player] call A3A_fnc_enemyNearCheck) then {
        [localize "STR_A3A_fn_init_initclient_buyveh", localize "STR_A3A_fn_init_initclient_buyveh_enemy"] call A3A_fnc_customHint;
    } else {
        createDialog "A3A_BuyVehicleDialog";
    }
},nil,0,false,true,"","(isPlayer _this) and (_this == _this getVariable ['owner',objNull]) and (side (group _this) == teamPlayer)", 4];

fireX allowDamage false;
[fireX, "fireX"] call A3A_fnc_flagaction;

mapX allowDamage false;
mapX addAction [localize "STR_A3A_fn_init_initclient_addact_gameOpt", {
    [
        localize "STR_A3A_fn_init_initclient_gameOpt_title",
        localize "STR_A3A_fn_init_initclient_gameOpt_version"+" "+ QUOTE(VERSION_FULL) +"<br/><br/>"+
        localize "STR_A3A_fn_init_initclient_gameOpt_resoBal"+" "+ (A3A_enemyBalanceMul / 10 toFixed 1) + "x" +"<br/>"+
        localize "STR_A3A_fn_init_initclient_gameOpt_unlockNo"+" "+ str minWeaps +"<br/>"+
        localize "STR_A3A_fn_init_initclient_gameOpt_limFT"+" "+ ([localize "STR_antistasi_dialogs_generic_button_no_text",localize "STR_antistasi_dialogs_generic_button_yes_text"] select limitedFT) +"<br/>"+
        localize "STR_A3A_fn_init_initclient_gameOpt_spawnDist"+" "+ str distanceSPWN + "m" +"<br/>"+
        localize "STR_A3A_fn_init_initclient_gameOpt_civLim"+" "+ str globalCivilianMax +"<br/>"+
        localize "STR_A3A_fn_init_initclient_gameOpt_timeGC"+" "+ ([[serverTime-A3A_lastGarbageCleanTime] call A3A_fnc_secondsToTimeSpan,1,0,false,2,false,true] call A3A_fnc_timeSpan_format)
    ] call A3A_fnc_customHint;
#ifdef UseDoomGUI
    ERROR("Disabled due to UseDoomGUI Switch.")
#else
    CreateDialog "game_options";
#endif
    nil;
},nil,0,false,true,"","(isPlayer _this) and (_this == _this getVariable ['owner',objNull]) and (side (group _this) == teamPlayer)", 4];
mapX addAction [localize "STR_A3A_fn_init_initclient_addact_mapinfo", A3A_fnc_cityinfo,nil,0,false,true,"","(isPlayer _this) and (_this == _this getVariable ['owner',objNull]) and (side (group _this) == teamPlayer)", 4];
if (isMultiplayer) then {mapX addAction [localize "STR_A3A_fn_init_initclient_addact_ailoadinfo", { [] remoteExec ["A3A_fnc_AILoadInfo",2];},nil,0,false,true,"",""]}; // should be no reason to restrict the aiLoadInfo to anyone

[] call A3A_fnc_unitTraits;

// Get list of buildable objects, has map (and template?) dependency
call A3A_fnc_initBuildableObjects;

// Start cursorObject monitor loop for adding removeStructure actions
// Note: unitTraits must run first to add engineer trait to default commander
0 spawn A3A_fnc_initBuilderMonitors;



disableSerialization;
//1 cutRsc ["H8erHUD","PLAIN",0,false];
_layer = ["statisticsX"] call bis_fnc_rscLayer;
#ifdef UseDoomGUI
    ERROR("Disabled due to UseDoomGUI Switch.")
#else
    _layer cutRsc ["H8erHUD","PLAIN",0,false];
#endif
[] spawn A3A_fnc_statistics;

//Load the player's personal save.
[] spawn A3A_fnc_createDialog_shouldLoadPersonalSave;

if (A3A_hasACE) then {call A3A_fnc_initACE};

[allCurators] call A3A_fnc_initZeusLogging;

initClientDone = true;
Info("initClient completed");

if(!isMultiplayer) then
{
    [] spawn A3A_fnc_singlePlayerBlackScreenWarning;
};
