/*
 * File: fn_GSMission.sqf
 * Function: 
 * Author: <author>
 * Function description
 * Implements a mission that spawns the gunshop
 * Public: No
 */


#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

if (!isServer) exitWith {};

params ["_city"];

private _nameDest = [_city] call A3A_fnc_localizar;
private _textX = format [localize "STR_A3A_fn_mission_gunshop_text_meet", _nameDest];
private _taskState = "CREATED";
private _taskTitle = localize "STR_A3A_fn_mission_gunshop_title";
private _taskIcon = "meet";
private _taskState1 = "CREATED";

private _taskId = "LOG" + str A3A_taskCount;
[[teamPlayer,civilian],_taskId,[_textX,_taskTitle,""],_city,false,0,true,_taskIcon,true] call BIS_fnc_taskCreate;


// Build the gunshop data in advance
[] remoteExec ["A3A_GUI_fnc_gatherGunShopLists", 2];
A3A_shoppingList = nil;
A3A_shoppingCart = nil;
publicVariable "A3A_shoppingCart";      // Need to clear the cart because the gun shop lists are different

// spawn a petros look alike
private _identity = createHashMapFromArray [
    ["firstName", "Solomon"],
    ["lastName", "Maru"],
    ["face", "GreekHead_A3_01"], 
    ["speaker", "Male06GRE"],
    ["pitch", 1.1]
];

private _coolerPetros = [createGroup [teamPlayer, true], FactionGet(reb,"unitPetros"), getMarkerPos _city, [], 10, "NONE", _identity] call A3A_fnc_createUnit;
// copy his drip. 
private _notCoolPetrosLoadout = getUnitLoadout petros;
_coolerPetros setUnitLoadout _notCoolPetrosLoadout;

// place inside like a garrison.
private _buildingPlaces = [_city, 200, 1] call A3A_fnc_patrolGetBuildingPlaces;
private _garrisonGroups = [group _coolerPetros, _buildingPlaces] call A3A_fnc_patrolGroupGarrison;
[[teamPlayer,civilian],_taskId,[_textX,_taskTitle,""],getPosATL _coolerPetros,false,0,true,_taskIcon,true] call BIS_fnc_taskCreate;
[_taskId, "LOG", "CREATED"] remoteExecCall ["A3A_fnc_taskUpdate", 2];

_coolerPetros setCaptive true;		// don't let him get shot for now
_coolerPetros disableAI "ALL";

_coolerPetros addEventHandler ["killed", {
    params ["_victim", "_killer"];
    [_victim] remoteExec ["A3A_fnc_postmortem", 2];

    // In case he bled to death, or weird damage sources
    _killer = _victim getVariable ["A3A_downedBy", _killer];
    _killer = _victim getVariable ["ace_medical_lastDamageSource", _killer];

    // Punish rebels if they killed Solomon
    if ((isPlayer _killer) and (side _killer == teamPlayer)) then {
        [Occupants, 20, 60] remoteExecCall ["A3A_fnc_addAggression", 2];
    };
}];

private _conditionCode = "(isPlayer _this) and (_this == _this getVariable ['owner',objNull]) and (side (group _this) == teamPlayer) and (_this == theBoss)";

private _addActionCode = {
    params ["_coolerPetros", "_conditionCode"];
    _coolerPetros addAction [localize "STR_A3A_fn_mission_gunshop_title", {
        params ["_target", "_caller"];
        [_target, false] remoteExec ["setCaptive", _target];			// Solomon is now suspicious
        createDialog "A3A_gunShop";
    },nil,0,false,true,"",_conditionCode, 4];
};

// do this global, because any one can become the commander
[[_coolerPetros, _conditionCode], _addActionCode] remoteExec ["call", 0, _coolerPetros];


// Create a wandering patrol
private _spawnPosition = [markerPos _city, 0, 200, 2, 0, -1, 0] call A3A_fnc_getSafePos;
if (_spawnPosition isEqualTo [0,0]) exitWith {
    ServerDebug("Unable to find spawn position for patrol unit.");
};

private _patrolTypes = A3A_faction_occ get (["groupsSmall", "groupSpecOpsRandom"] select (tierWar > random 12));
private _patrolGroup = [_spawnPosition, Occupants, selectRandom _patrolTypes, false, true] call A3A_fnc_spawnGroup;
{[_x, ""] call A3A_fnc_NATOinit} forEach units _patrolGroup;

[_patrolGroup, "Patrol_Area", 0, 200, 200, true, markerPos _city] call A3A_fnc_patrolLoop;


private _timeout = time + 3600;

waitUntil{sleep 1; !isNil "A3A_shoppingList" || (time > _timeout) || (!alive _coolerPetros) };

if((time > _timeout) || (!alive _coolerPetros)) exitWith {
    [_taskId, "LOG", "FAILED"] call A3A_fnc_taskSetState; 
    [_taskId, "LOG", 600, true] spawn A3A_fnc_taskDelete;
};

[_coolerPetros, 0] remoteExec ["removeAction", 0, _coolerPetros];


// Now we delay for a couple of minutes for immersion
private _nearPlayers = units teamPlayer inAreaArray [getPosATL _coolerPetros, 100, 100] select { isPlayer _x };
[_coolerPetros, localize "STR_A3A_fn_mission_gunshop_wait"] remoteExec ["globalChat", _nearPlayers];
[_taskId, [localize "STR_A3A_fn_mission_gunshop_text_wait", _taskTitle, ""]] call BIS_fnc_taskSetDescription;

[_taskId, "LOG", "SUCCEEDED"] call A3A_fnc_taskSetState;
[_taskId, "LOG", 600, true] spawn A3A_fnc_taskDelete;

sleep (60 + random 60);


// do they get a crate or are they fucked?
// Tier 8, cheap basket: 21% chance of convoy mission
// Tier 8, 20k basket: 50% chance of convoy mission
A3A_shoppingList params ["_totalCost", "_gunshopList"];
private _noCrate = (floor random 12 ) + (floor random 12) + (floor random 12) > ceil (29 - tierWar - (_totalCost/5000));

private _convoyPair = [];
if(_noCrate) then
{
    // Need to check whether there's a valid convoy here. Otherwise players get a freebie
    private _markers = (airportsX + resourcesX + factories + seaports + outposts - blackListDest);
    private _maxDist = 0;
    {
        private _site = _x;
        if (sidesX getVariable _site != Occupants) then {continue};
        if (markerPos _site distance2d markerPos respawnTeamPlayer > distanceMission+1000) then {continue};

        private _suppMarkers = [_site, false] call A3A_fnc_findLandSupportMarkers;
        {
            _x params ["_base", "_dist"];
            if (spawner getVariable _base == 0) then {continue};
            if (sidesX getVariable _base != Occupants) then {continue};
            if (_dist > _maxDist) then { _convoyPair = [_site, _base]; _maxDist = _dist };

        } forEach _suppMarkers;

    } forEach _markers;
};

if (_noCrate and _convoyPair isNotEqualTo []) exitWith
{
    // Send a chat message to nearby players so they know what's up
    [_coolerPetros, localize "STR_A3A_fn_mission_gunshop_intercept"] remoteExec ["globalChat", _nearPlayers];
    
    sleep 5;
    private _args = _convoyPair + ["GunShop","legacy",-1, _gunshopList];
    [_args, "A3A_fnc_convoy"] remoteExec ["A3A_fnc_scheduler", 2];

    _coolerPetros enableAI "ALL";
    [group _coolerPetros] spawn A3A_fnc_groupDespawner;
    [_patrolGroup] spawn A3A_fnc_enemyReturnToBase;
};


// Try to find a position that isn't on water or near houses
private _dropPos = getPosATL _coolerPetros;
for "_i" from 1 to 10 do {
    private _testPos = _dropPos getPos [random 400 + 400, random 360];
    if (surfaceIsWater _testPos) then { continue };
    private _nearHouses = _testPos nearObjects ["House", 50];
    if (_nearHouses isEqualTo []) exitWith { _dropPos = _testPos };
};

// Send a chat message to nearby players so they know what's up
[_coolerPetros, localize "STR_A3A_fn_mission_gunshop_airdrop"] remoteExec ["globalChat", _nearPlayers];

// Create the supply drop
sleep 5;
[_dropPos, _gunshopList, _patrolGroup] spawn A3A_fnc_supplyDrop;

_coolerPetros enableAI "ALL";

// Custom despawner because it's a weird case. Solomon vanishes back into the shadows once players are gone.
while {true} do {
    sleep 10;
    private _players = allPlayers - entities "HeadlessClient_F";
    if (_players inAreaArray [getPosATL _coolerPetros, 200, 200] isEqualTo []) exitWith { deleteVehicle _coolerPetros };
};
