#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

(_this get "params") params [["_marker", "", [""]]];
if ((getMarkerPos _marker) isEqualTo [0,0,0]) exitWith {
    Error_1("Conquest mission started with bad marker name | %1", _this);
};

private _side = sidesX getVariable _marker;
private _faction = Faction(_side);

_this set ["_side", _side];
_this set ["_faction", _faction];
_this set ["_isDifficult", (random 10 < tierWar)];
_this set ["destination", getMarkerPos _marker];
_this set ["marker", _marker];

private _nameDest = [_marker] call A3A_fnc_localizar;

private _timeLimit = if (_this get "_isDifficult") then {30} else {90};
if (A3A_hasIFA) then {_timeLimit = _timeLimit * 2};

private _displayTime = [_timeLimit] call FUNC(minutesFromNow);
private _markerSide = sidesX getVariable [_marker, sideUnknown];

switch (true) do {
    case (_marker in resourcesX): { [
        localize "STR_antistasi_LTasks_CON_Outpost_resource_title",
        format [(localize "STR_antistasi_LTasks_CON_Outpost_resource_description"), _nameDest, _displayTime]
    ]};
    case (_marker in outposts): { [
        localize "STR_antistasi_LTasks_CON_Outpost_outpost_title",
        format [(localize "STR_antistasi_LTasks_CON_Outpost_outpost_description"), _nameDest, _displayTime]
    ]};
    case (_marker in seaports): { [
        localize "STR_antistasi_LTasks_CON_Outpost_seaport_title",
        format [(localize "STR_antistasi_LTasks_CON_Outpost_seaport_description"), _nameDest, _displayTime]
    ]};
    case (_marker in factories): { [
        localize "STR_antistasi_LTasks_CON_Outpost_factory_title",
        format [(localize "STR_antistasi_LTasks_CON_Outpost_factory_description"), _nameDest, _displayTime]
    ]};
} params ["_taskName", "_taskDescription"];

_this set ["title", _taskName];
_this set ["description", _taskDescription];

_this set ["constructor", { // Type: code | Required | Constructor to run at start of task
}];

_this set ["destructor", { // Type: code | Optional | Destructor to run at end of task
}];

_stages = [
    createHashMapFromArray [
        ["action", { //Type: code | Required | Action to be done in that stage
        }],
        ["condition", { //Type: code | Required | Return type: bool | Condition to compleate the stage
            (sidesX getVariable [_this get "marker", sideUnknown]) isEqualTo teamPlayer;
        }],
        ["required", true], //Type: bool | Optional | if the task needs the stage to succeed
        ["reward", { //Type: code | Optional | the reward given for completing the stage
            private _multiplier = if (_this get "_isDifficult") then {2} else {1};
            private _pos = getMarkerPos (_this get "marker");
            private _side = _this get "_side";

            if ((_this get "state") isEqualTo "SUCCEEDED") then
            {
                [0,200 * _multiplier] remoteExec ["A3A_fnc_resourcesFIA",2];
                [-5 * _multiplier,0,_pos] remoteExec ["A3A_fnc_citySupportChange",2];
                [600 * _multiplier, _side] remoteExec ["A3A_fnc_timingCA",2];
                {if (isPlayer _x) then {[10 * _multiplier,_x] call A3A_fnc_playerScoreAdd}} forEach ([500,0,_pos,teamPlayer] call A3A_fnc_distanceUnits);
                [10 * _multiplier,theBoss] call A3A_fnc_playerScoreAdd;
            }
            else
            {
                [5,0,_pos] remoteExec ["A3A_fnc_citySupportChange",2];
                [-600, _side] remoteExec ["A3A_fnc_timingCA",2];
                [-10,theBoss] call A3A_fnc_playerScoreAdd;
            };
        }],
        ["timeout", _timeLimit * 60] //Type: number | Optional | Time limit for the stage before auto fail
    ]
];
_this set ["stages", _stages];
