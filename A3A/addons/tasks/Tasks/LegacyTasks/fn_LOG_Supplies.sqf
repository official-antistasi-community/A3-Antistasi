#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

(_this get "params") params [["_marker", "", [""]]];
if ((getMarkerPos _marker) isEqualTo [0,0,0]) exitWith {
    Error_1("Supply mission started with bad marker name | %1", _this);
};

private _side = sidesX getVariable _marker;
private _faction = Faction(_side);

_this set ["_side", _side];
_this set ["_faction", _faction];
_this set ["_isDifficult", (random 10 < tierWar)];
_this set ["destination", getMarkerPos _marker];
_this set ["marker", _marker];
_this set ["timer", 120];


private _nameDest = [_marker] call A3A_fnc_localizar;
private _timeLimit = if (_this get "_isDifficult") then {30} else {60};
if (A3A_hasIFA) then {_timeLimit = _timeLimit * 2};

private _displayTime = [_timeLimit] call FUNC(minutesFromNow);
private _markerSide = sidesX getVariable [_marker, sideUnknown];


private _pos = (getMarkerPos respawnTeamPlayer) findEmptyPosition [1,50,"C_Van_01_box_F"];
private _truckX = "Land_FoodSacks_01_cargo_brown_F" createVehicle _pos;
_truckX enableRopeAttach true;
_truckX allowDamage false;
[_truckX] call A3A_Logistics_fnc_addLoadAction;
[_truckX, teamPlayer] call A3A_fnc_AIVEHinit;
//{_x reveal _truckX} forEach (allPlayers - (entities "HeadlessClient_F"));
[_truckX,"Supply Box"] spawn A3A_fnc_inmuneConvoy;

_this set ["truckX", _truckX];
/*
    Note: the task sets all feedback to players automaticly based on the info in the task hm passed to the task
    the modifyable values are:
        description, title, marker, destination, state, priority, showNotification, type, visibleIn3D

    note that TaskID is also available but should only be used when creating sub tasks, and NEVER modified within the task.
    of the afformentioned only title is required, but it is recomended to set:
        description, marker, and destination
    in addition to the title
*/

private _holdTime = if(_this get "_isDifficult") then {4} else {2};
private _taskName = localize "STR_antistasi_LTasks_LOG_Supplies_title";
private _taskDescription = format [localize "STR_antistasi_LTasks_LOG_Supplies_description",_nameDest,_displayTime, _holdTime];


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
			waitUntil {sleep 1; (((_this get "truckX") distance (_this get "destination") < 40) and (isNull attachedTo (_this get "truckX")) and (isNull ropeAttachedTo (_this get "truckX")))};

			while {(((_this get "timer") isNotEqualTo 0) and (((allPlayers - (entities "HeadlessClient_F")) inAreaArray [getPosATL (_this get "truckX"), 80, 80]) findIf {!([_x] call A3A_fnc_canFight)} isEqualTo -1))} do 
			{
                _formatX = format [localize "STR_antistasi_LTasks_LOG_Supplies_distributing_supplies", (_this get "timer")];
			    {[petros,"hint",_formatX,"Logistics Mission"] remoteExec ["A3A_fnc_commsMP",_x]} forEach ((allPlayers - (entities "HeadlessClient_F")) inAreaArray [getPosATL (_this get "truckX"), 80, 80]);
				_this set ["timer", (_this get "timer") - 1];
				sleep 1;
			};
        }],
        ["condition", { //Type: code | Required | Return type: bool | Condition to compleate the stage
            (((_this get "truckX") distance (_this get "destination") < 40) and (isNull attachedTo (_this get "truckX")) and (isNull ropeAttachedTo (_this get "truckX")) and ((_this get "timer") isEqualTo 0))
        }],
        ["required", true], //Type: bool | Optional | if the task needs the stage to succeed
        ["reward", { //Type: code | Optional | the reward given for completing the stage
            private _bonus = if (_this get "_isDifficult") then {2} else {1};
            private _positionX = (_this get "destination");
            private _markerX =(_this get "marker");
            private _side = _this get "_side";
            private _truckX = (_this get "truckX");

            // OKAY TASK IS GOOD
			if ((_this get "state") isEqualTo "SUCCEEDED") then
			{
                [petros,"hint",(localize "STR_antistasi_LTasks_LOG_Supplies_supplies_delivered"), "Logistics Mission"] remoteExec ["A3A_fnc_commsMP",[teamPlayer,civilian]];
                private _playersInRange = (allPlayers - (entities "HeadlessClient_F")) inAreaArray [_markerX, 250, 250];
			    {[10*_bonus * tierWar,_x] call A3A_fnc_playerScoreAdd} forEach _playersInRange;
			    [5*_bonus * tierWar,theBoss] call A3A_fnc_playerScoreAdd;
			    [-15 * _bonus,15 * _bonus,_positionX] remoteExec ["A3A_fnc_citySupportChange",2];
                Debug("aggroEvent | Rebels won a supply mission");
			    [Occupants, -10, 60] remoteExec ["A3A_fnc_addAggression",2];
                [0,200 * _bonus * tierWar] remoteExec ["A3A_fnc_resourcesFIA",2];
			}
		    else
			{
			    [5*_bonus,-5*_bonus,_positionX] remoteExec ["A3A_fnc_citySupportChange",2];
			    [-10*_bonus,theBoss] call A3A_fnc_playerScoreAdd;
			};
            private _ecpos = getpos _truckX;
            deleteVehicle _truckX;
            private _emptybox = "Land_Pallet_F" createVehicle _ecpos;
            [_emptybox] spawn A3A_fnc_postmortem;

        }],
        ["rewardInstant", false], //Type: bool | Optional | if the reward should be given instantly on compleation of stage
        ["timeout", _timeLimit * 60] //Type: number | Optional | Time limit for the stage before auto fail
    ]
];
_this set ["stages", _stages];
