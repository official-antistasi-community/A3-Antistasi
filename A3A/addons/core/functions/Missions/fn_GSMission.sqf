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


if (!isServer and hasInterface) exitWith {};

private _possibleLocationsOfSpawn = citiesX select {(getMarkerPos _x) distance (getMarkerPos respawnTeamPlayer) < distanceMission + 3000 };
{
	private _site = _x;
	if ((getMarkerPos _site) distance (getMarkerPos respawnTeamPlayer) > distanceMission) then {continue};
	if (sidesX getVariable [_site, teamPlayer] == teamPlayer) then {continue};

} forEach _possibleLocationsOfSpawn;

private _posDest = selectRandom _possibleLocationsOfSpawn;

private _nameDest = [_posDest] call A3A_fnc_localizar;

private _textX = format [localize "STR_A3A_fn_mission_gunshop_met_text", _nameDest];
private _taskState = "CREATED";
private _taskTitle = localize "STR_A3A_fn_mission_gunshop_met_title";
private _taskIcon = "meet";
private _taskState1 = "CREATED";

private _taskId = "LOG" + str A3A_taskCount;
[[teamPlayer,civilian],_taskId,[_textX,_taskTitle,""],_posDest,false,0,true,_taskIcon,true] call BIS_fnc_taskCreate;

// spawn a petros look alike
private _identity = createHashMapFromArray [
    ["firstName", "Pet"],
	["lastName", "Ros"],
    ["face", "GreekHead_A3_01"], 
    ["speaker", "Male06GRE"],
    ["pitch", 1.1]
];

private _conditionCode = "(isPlayer _this) and (_this == _this getVariable ['owner',objNull]) and (side (group _this) == teamPlayer) and (_this == theBoss)";

if(!A3A_GS_allowGuestCommander) then {
	_conditionCode + "and theBoss call A3A_fnc_isMember";
}; 


private _coolerPetros = [createGroup teamPlayer, FactionGet(reb,"unitPetros"), getMarkerPos _posDest, [], 10, "NONE", _identity] call A3A_fnc_createUnit;
// copy his drip. 
private _notCoolPetrosLoadout = getUnitLoadout petros;
_coolerPetros setUnitLoadout _notCoolPetrosLoadout;

// place inside like a garrison.
private _garrisonGroups = [group _coolerPetros, getMarkerPos _posDest, 200] call A3A_fnc_patrolGroupGarrison;
[[teamPlayer,civilian],_taskId,[_textX,_taskTitle,""],getPosATL _coolerPetros,false,0,true,_taskIcon,true] call BIS_fnc_taskCreate;
[_taskId, "LOG", "CREATED"] remoteExecCall ["A3A_fnc_taskUpdate", 2];

_coolerPetros disableAI "ALL";

private _addActionCode = {
	params ["_coolerPetros", "_conditionCode"];
	_coolerPetros addAction [localize "STR_A3A_fn_init_initclient_addact_gunshop", {
    if ([getPosATL player] call A3A_fnc_enemyNearCheck) then {
        [localize "STR_A3A_fn_init_initclient_addact_gunshop", localize "STR_A3A_fn_init_initclient_buyveh_enemy"] call A3A_fnc_customHint;
    } else {
        createDialog "A3A_gunShop";
    }
},nil,0,false,true,"",_conditionCode, 4];
};

// do this global, because any one can become the commander
[[_coolerPetros, _conditionCode], _addActionCode] remoteExec ["call", 0, _coolerPetros];

private _timeout = time + 3600;

waitUntil{sleep 1; !isNil "A3A_shoppingList" || (time > _timeout) || (!alive _coolerPetros) };

if((time > _timeout) || (!alive _coolerPetros)) exitWith {
	
	[_taskId, "LOG", "FAILED"] call A3A_fnc_taskSetState; 
	[_taskId, "LOG", 600, true] spawn A3A_fnc_taskDelete; 
	
}; 


[_taskId, "LOG", "SUCCEEDED"] call A3A_fnc_taskSetState;
[_taskId, "LOG", 600, true] spawn A3A_fnc_taskDelete;

[_coolerPetros, 0] remoteExec ["removeAction", 0, _coolerPetros];

A3A_shoppingList params ["_totalCost", "_gunshopList"];

// do they get a crate or are they fucked?

// if they spend 348,000 or more, they will always have a convoy mission.
private _noCrate = (floor random 12 ) + (floor random 12) + (floor random 12) > ceil (29 - tierWar - (_totalCost/12000));

//oof
if(_noCrate) exitWith 
{
	private _possibleMarkers = [];
	private _markers = (airportsX + resourcesX + factories + seaports + outposts - blackListDest);
	private _possibleBases = (airportsX + seaports + outposts) select { (getMarkerPos _x) distance (getMarkerPos respawnTeamPlayer) < distanceMission + 10000 };
	private _convoyPairs = [];
	{
		private _site = _x;
		if ((getMarkerPos _site) distance (getMarkerPos respawnTeamPlayer) > distanceMission) then {continue};
		if (sidesX getVariable [_site, teamPlayer] == teamPlayer) then {continue};
		private _base = [_site, _possibleBases] call A3A_fnc_findBasesForConvoy;
		if (_base != "") then {
			_possibleMarkers pushBack _site;
			_convoyPairs pushBack [_site, _base];
		};
	} forEach _markers;
	if (count _possibleMarkers == 0) then
	{
		[_coolerPetros,"globalChat",localize "STR_A3A_fn_mission_request_noConvoy"] remoteExec ["A3A_fnc_commsMP",theBoss];
	} else {
		private _args = selectRandom _convoyPairs;
		private _pick1Distance = (getMarkerPos (_args#0)) distance (getMarkerPos (_args#1)); 
 	 	// pick the longest 
 	 	{ 
 	  		private _posDest1 = getMarkerPos (_x#0); 
 	  		private _posDest2 = getMarkerPos (_x#1); 
 	  		private _newDistance = (_posDest1 distance _posDest2); 

 	  		if( _newDistance > _pick1Distance) then  
 	  		{ 
				_args = _x; 
				_pick1Distance = _newDistance; 
 	  		}; 
	
	
 	 	} forEach _convoyPairs; 
		
		_args append ["GunShop","legacy",-1, _totalCost, _gunshopList];
		[_args,"A3A_fnc_convoy"] remoteExec ["A3A_fnc_scheduler",2];
	};
	ServerInfo_1("_possibleMarkers %1",_possibleMarkers);

	// delete list
	A3A_shoppingList = nil;
};

private _pos = getPosASL _coolerPetros findEmptyPosition [0, 50, "B_supplyCrate_F"];

private _crate = createVehicle ["B_supplyCrate_F", [0,0,0]];
clearMagazineCargoGlobal _crate;
clearWeaponCargoGlobal _crate;
clearItemCargoGlobal _crate;
clearBackpackCargoGlobal _crate;

// add items.
{
    private _key = _x#0;
    private _amount = _x#1;
    _crate addItemCargoGlobal [_key, _amount];
    
    // sleep here encase someone buys 1000 of something.
    sleep 0.01;
} forEach _gunshopList;



_crate setPosASL _pos;

[group _coolerPetros] spawn A3A_fnc_groupDespawner;

A3A_shoppingList = nil;