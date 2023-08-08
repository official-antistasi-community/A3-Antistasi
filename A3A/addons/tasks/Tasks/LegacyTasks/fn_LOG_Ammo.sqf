#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
(_this get "params") params [["_marker", "", [""]]];
if ((getMarkerPos _marker) isEqualTo [0,0,0]) exitWith {
	Error_1("Ammo truck mission started with bad marker name | %1", _this);
};

private _side = sidesX getVariable _marker;
private _faction = Faction(_side);

_this set ["_side", _side];
_this set ["_faction", _faction];
_this set ["_isDifficult", (random 10 < tierWar)];
_this set ["destination", getMarkerPos _marker];
_this set ["marker", _marker];


private _nameDest = [_marker] call A3A_fnc_localizar;
private _timeLimit = if (_this get "_isDifficult") then {30} else {60};
if (A3A_hasIFA) then {_timeLimit = _timeLimit * 2};

private _displayTime = [_timeLimit] call FUNC(minutesFromNow);
private _markerSide = sidesX getVariable [_marker, sideUnknown];


_typeVehX = selectRandom (_faction get "vehiclesAmmoTrucks");

private _road = [getMarkerPos _marker] call A3A_fnc_findNearestGoodRoad;
private _pos = position _road;
_pos = _pos findEmptyPosition [1,60,_typeVehX];

_this set ["_typeVehX", _typeVehX];
_this set ["_pos", _pos];
_this set ["_road", _road];
_this set ["_nameDest", _nameDest];
/*
	Note: the task sets all feedback to players automatically based on the info in the task hm passed to the task
	the modifiable values are:
		description, title, marker, destination, state, priority, showNotification, type, visibleIn3D

	note that TaskID is also available but should only be used when creating sub tasks, and NEVER modified within the task.
	of the afformentioned only title is required, but it is recomended to set:
		description, marker, and destination
	in addition to the title
*/

private _taskName = localize "STR_antistasi_LTasks_LOG_Ammo_title";
private _taskDescription = format [localize "STR_antistasi_LTasks_LOG_Ammo_description",_nameDest,_displayTime];


_this set ["title", _taskName];
_this set ["description", _taskDescription];

_this set ["constructor", { // Type: code | Required | Constructor to run at start of task
	Info("Constructor called");
}];

_this set ["destructor", { // Type: code | Optional | Destructor to run at end of task
	Info("Destructor called");
}];

_stages = [
	createHashMapFromArray [
		["Init", { //Type: code | Optional | only stage 2 and beyond can use a stage init function
			Info("Stage 1 init called");
		}],
		["action", { //Type: code | Required | Action to be done in that stage
			Info("Stage 1 action called");
			private _faction = (_this get "_faction");
			private _difficultX = (_this get "_isDifficult");
			private _side = (_this get "_side");
			private _pos = (_this get "_pos");
			private _markerX = (_this get "marker");

			waitUntil {sleep 1; ((spawner getVariable _markerX != 2) and !(sidesX getVariable [_markerX,sideUnknown] == teamPlayer))};
			
			//create truck
			private _truckX = (_this get "_typeVehX") createVehicle _pos;
			_truckX setDir (getDir (_this get "_road"));

			_this set ["truckX", _truckX];

			//fill the truck with loot
			[_truckX] spawn A3A_fnc_fillLootCrate;
			[_truckX, _side] call A3A_fnc_AIVEHinit;

			//upsmon stuff
			private _mrk = createMarkerLocal [format ["%1patrolarea", floor random 100], _pos];
			_mrk setMarkerShapeLocal "RECTANGLE";
			_mrk setMarkerSizeLocal [20,20];
			_mrk setMarkerTypeLocal "hd_warning";
			_mrk setMarkerColorLocal "ColorRed";
			_mrk setMarkerBrushLocal "DiagGrid";
			if (!debug) then {_mrk setMarkerAlphaLocal 0};

			private _typeGroup = if (_difficultX) then {selectRandom (_faction get "groupsSquads")} else {_faction get "groupSentry"};
			private _groupX = [_pos,_side, _typeGroup] call A3A_fnc_spawnGroup;

			sleep 1;
			if (random 10 < 33) then
			{
				_dog = [_groupX, "Fin_random_F",(_this get "destination"),[],0,"FORM"] call A3A_fnc_createUnit;
				[_dog] spawn A3A_fnc_guardDog;
			};
			_nul = [leader _groupX, _mrk, "SAFE","SPAWNED", "NOVEH2"] spawn UPSMON_fnc_UPSMON;

			_groupX1 = [_pos,_side,_typeGroup] call A3A_fnc_spawnGroup;
			sleep 1;
			_nul = [leader _groupX1, _mrk, "SAFE","SPAWNED", "NOVEH2"] spawn UPSMON_fnc_UPSMON;

			{[_x,""] call A3A_fnc_NATOinit} forEach units _groupX;
			{[_x,""] call A3A_fnc_NATOinit} forEach units _groupX1;

			_truckX setVariable ["ammoTruckLocation", _this get "_nameDest"];
			_truckX addEventHandler ["GetIn", {
				params ["_vehicle", "_role", "_unit", "_turret"];
		
				private _owningSide = (_vehicle getVariable "originalSide");		// set by AIVEHinit
		
				if (_unit getVariable ["spawner",false]) then {
					["TaskFailed", ["", format ["Ammotruck Stolen in an %1",(_vehicle getVariable ["ammoTruckLocation", ""])]]] remoteExec ["BIS_fnc_showNotification",_owningSide];
				};
		
				_vehicle removeEventHandler ["GetIn", _thisEventHandler];
			}];

		}],
		["condition", { //Type: code | Required | Return type: bool | Condition to compleate the stage
			((not alive (_this get "truckX")) or (((_this get "truckX") distanceSqr posHQ) < 10000))
		}],
		["required", true], //Type: bool | Optional | if the task needs the stage to succeed
		["reward", { //Type: code | Optional | the reward given for completing the stage
			Info("Stage 1 reward called");
			private _bonus = if (_this get "_isDifficult") then {2} else {1};
			private _positionX =(_this get "destination");
			private _markerX =(_this get "marker");
			private _side = _this get "_side";
			private _truckX = (_this get "truckX");

			// OKAY TASK IS GOOD
			if (((_this get "state") isEqualTo "SUCCEEDED") and (alive (_this get "truckX"))) then
			{
				[petros,"hint",(localize "STR_antistasi_LTasks_LOG_Ammo_captured"), "Logistics Mission"] remoteExec ["A3A_fnc_commsMP",[teamPlayer,civilian]];
				private _allPlayers = (allPlayers - (entities "HeadlessClient_F"));
				private _playersInRange =  _allPlayers inAreaArray [posHQ, 250, 250];
				{[10*_bonus * tierWar,_x] call A3A_fnc_playerScoreAdd} forEach _playersInRange;
				[5*_bonus * tierWar,theBoss] call A3A_fnc_playerScoreAdd;
				[0,200 * _bonus * tierWar] remoteExec ["A3A_fnc_resourcesFIA",2];
			};
			if (((_this get "state") isEqualTo "SUCCEEDED") and (not alive (_this get "truckX"))) then
			{
				[petros,"hint",(localize "STR_antistasi_LTasks_LOG_Ammo_destroyed_description"), "Logistics Mission"] remoteExec ["A3A_fnc_commsMP",[teamPlayer,civilian]];
				private _allPlayers = (allPlayers - (entities "HeadlessClient_F"));
				private _playersInRange =  _allPlayers inAreaArray [_positionX, 250, 250];
				{[5*_bonus * tierWar,_x] call A3A_fnc_playerScoreAdd} forEach _playersInRange;
				[5*_bonus * tierWar,theBoss] call A3A_fnc_playerScoreAdd;
				[0,200 * _bonus * tierWar] remoteExec ["A3A_fnc_resourcesFIA",2];
			};
			if ((_this get "state") isNotEqualTo "SUCCEEDED") then
			{
				[-10 * _bonus,theBoss] call A3A_fnc_playerScoreAdd;
			};
		}],
		["rewardInstant", false], //Type: bool | Optional | if the reward should be given instantly on compleation of stage
		["timeout", _timeLimit * 60] //Type: number | Optional | Time limit for the stage before auto fail
	]
];
_this set ["stages", _stages];
