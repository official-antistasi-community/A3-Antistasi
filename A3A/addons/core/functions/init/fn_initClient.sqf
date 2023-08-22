#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

//Make sure logLevel is always initialised.
//This should be overridden by the server, as appropriate. Hence the nil check.
if (isNil "logLevel") then { logLevel = 2; A3A_logDebugConsole = 1 };

Info("initClient started");
A3A_clientVersion = QUOTE(VERSION);
Info_1("Client version: %1", QUOTE(VERSION_FULL));

// *************************** Client pre-setup init *******************************

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
    if (A3A_startupState == "completed") exitWith {};
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
    A3A_activeGarrison = createHashMap;
    A3A_garrisonOps = [];
    0 spawn A3A_fnc_garrisonOpLoop;
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

// Install the non respawn-persistent client event handlers
call A3A_fnc_installClientEH;

// These are respawn-persistent so we install them here
player addEventHandler ["GetInMan", {
    private ["_unit","_veh"];
    _unit = _this select 0;
    _veh = _this select 2;
    _exit = false;
    if !([player] call A3A_fnc_isMember) then {
        if (!isNil {_veh getVariable "A3A_locked"}) then {
            _owner = _veh getVariable "ownerX";
            if ({getPlayerUID _x == _owner} count (units group player) == 0) then {
                ["Warning", "This Vehicle is locked, ask the Owner to unlock it."] call A3A_fnc_customHint;
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
    };
}];

// Prevent players getting shot by their own AIs. EH is respawn-persistent
player addEventHandler ["HandleRating", {0}];

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
        ["General Info", "You are not in the member's list, but as you are Server Admin, you have been added. Welcome!"] call A3A_fnc_customHint;
    };

    if (_isMember) then {
        membersX pushBack (getPlayerUID player);				// potential race condition, but there's only one admin so chance of hitting this is low
        publicVariable "membersX";
    } else {
        private _nonMembers = {_x call A3A_fnc_isMember} count (call A3A_fnc_playableUnits);
        if (_nonMembers >= (playableSlotsNumber teamPlayer) - bookedSlots) then {["memberSlots",false,1,false,false] call BIS_fnc_endMission};
        [] spawn A3A_fnc_playerLeash;

        ["General Info", "Welcome Guest<br/><br/>You have joined this server as guest."] call A3A_fnc_customHint;
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
        [A3A_hasTFAR || A3A_hasTFARBeta,"TFAR","Players will use TFAR radios. Unconscious players' radios will be muted."],
        [A3A_hasACRE,"ACRE","Players will use ACRE radios. Unconscious players' radios will be muted."],
        [A3A_hasACE,"ACE 3","ACE items added to arsenal and ammo-boxes."],
        [A3A_hasACEMedical,"ACE 3 Medical","Default revive system will be disabled."]
    ] select {_x#0};

    private _loadedTemplateInfoXML = A3A_loadedTemplateInfoXML apply {[true,_x#0,_x#1]};	// Remove and simplify when the list above is empty and can be deleted.
    _modsAndLoadText append _loadedTemplateInfoXML;

    if (count _modsAndLoadText isEqualTo 0) exitWith {};
    private _textXML = "<t align='left'>" + ((_modsAndLoadText apply { "<t color='#f0d498'>" + _x#1 + ":</t>" + _x#2 }) joinString "<br/>") + "</t>";
    ["Loaded Mods",_textXML] call A3A_fnc_customHint;
};

// uh, what's this for exactly? What are we doing that needs the main display?
waituntil {!isnull (finddisplay 46)};
GVAR(keys_battleMenu) = false; //initilize key flags to false


boxX allowDamage false;			// hmm...
boxX addAction ["Transfer Vehicle cargo to Ammobox", {[] spawn A3A_fnc_empty;}, 4];
boxX addAction ["Move this asset", A3A_fnc_moveHQObject,nil,0,false,true,"","(_this == theBoss)", 4];
flagX allowDamage false;
flagX addAction ["Unit Recruitment", {if ([getPosATL player] call A3A_fnc_enemyNearCheck) then {["Recruit Unit", "You cannot recruit units while there are enemies near you."] call A3A_fnc_customHint;} else { [] spawn A3A_fnc_unit_recruit; }},nil,0,false,true,"","(isPlayer _this) and (_this == _this getVariable ['owner',objNull]) and (side (group _this) == teamPlayer)"];
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
vehicleBox addAction [localize "STR_A3A_actions_restore_units", A3A_fnc_vehicleBoxRestore,nil,0,false,true,"","(isPlayer _this) and (_this == _this getVariable ['owner',objNull]) and (side (group _this) == teamPlayer)", 4];
vehicleBox addAction ["Vehicle Arsenal", JN_fnc_arsenal_handleAction, [], 0, true, false, "", "alive _target && vehicle _this != _this", 10];
[vehicleBox] call HR_GRG_fnc_initGarage;

vehicleBox addAction ["Buy Vehicle", {
    if ([getPosATL player] call A3A_fnc_enemyNearCheck) then {
        ["Purchase Vehicle", "You cannot buy vehicles while there are enemies near you."] call A3A_fnc_customHint;
    } else {
        createDialog "A3A_BuyVehicleDialog";
    }
},nil,0,false,true,"","(isPlayer _this) and (_this == _this getVariable ['owner',objNull]) and (side (group _this) == teamPlayer)", 4];

call A3A_fnc_dropObject;

vehicleBox addAction ["Move this asset", A3A_fnc_moveHQObject,nil,0,false,true,"","(_this == theBoss)", 4];

fireX allowDamage false;
[fireX, "fireX"] call A3A_fnc_flagaction;

mapX allowDamage false;
mapX addAction ["Game Options", {
    [
        "Game Options",
        "Version: "+ QUOTE(VERSION_FULL) +
        "<br/><br/>Enemy resource balance: "+ (A3A_enemyBalanceMul / 10 toFixed 1) + "x" +
        "<br/>Unlock Weapon Number: "+ str minWeaps +
        "<br/>Limited Fast Travel: "+ (["No","Yes"] select limitedFT) +
        "<br/>Spawn Distance: "+ str distanceSPWN + "m" +
        "<br/>Civilian Limit: "+ str globalCivilianMax +
        "<br/>Time since GC: " + ([[serverTime-A3A_lastGarbageCleanTime] call A3A_fnc_secondsToTimeSpan,1,0,false,2,false,true] call A3A_fnc_timeSpan_format)
    ] call A3A_fnc_customHint;
#ifdef UseDoomGUI
    ERROR("Disabled due to UseDoomGUI Switch.")
#else
    CreateDialog "game_options";
#endif
    nil;
},nil,0,false,true,"","(isPlayer _this) and (_this == _this getVariable ['owner',objNull]) and (side (group _this) == teamPlayer)", 4];
mapX addAction ["Map Info", A3A_fnc_cityinfo,nil,0,false,true,"","(isPlayer _this) and (_this == _this getVariable ['owner',objNull]) and (side (group _this) == teamPlayer)", 4];
mapX addAction ["Move this asset", A3A_fnc_moveHQObject,nil,0,false,true,"","(_this == theBoss)", 4];
if (isMultiplayer) then {mapX addAction ["AI Load Info", { [] remoteExec ["A3A_fnc_AILoadInfo",2];},nil,0,false,true,"","((_this == theBoss) || (serverCommandAvailable ""#logout""))"]};

[] spawn A3A_fnc_unitTraits;


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

[allCurators] remoteExecCall ["A3A_fnc_initZeusLogging",0];

initClientDone = true;
Info("initClient completed");

if(!isMultiplayer) then
{
    [] spawn A3A_fnc_singlePlayerBlackScreenWarning;
};
