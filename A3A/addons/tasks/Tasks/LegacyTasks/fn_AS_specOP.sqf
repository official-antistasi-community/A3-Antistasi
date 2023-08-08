#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

(_this get "params") params [["_marker", "", [""]]];
if ((getMarkerPos _marker) isEqualTo [0,0,0]) exitWith {
    Error_1("SpecOP mission started with bad marker name | %1", _this);
};

private _side = sidesX getVariable _marker;
private _faction = Faction(_side);

_this set ["_side", _side];
_this set ["_faction", _faction];
_this set ["_isDifficult",(random 10 < tierWar)];

//get info for description
private _nameDest = [_marker] call A3A_fnc_localizar;
private _timeLimit = if (_this get "_isDifficult") then {60} else {120};
private _endTime = [_timeLimit] call FUNC(minutesFromNow);

_this set ["title", "STR_antistasi_LTasks_AS_specOP_title"]; //test if it will localize from key
_this set ["description", format [
    localize "STR_antistasi_LTasks_AS_specOP_description",
    _faction get "name",
    _nameDest,
    _endTime
]];
_this set ["marker", _marker];
_this set ["destination", getMarkerPos _marker];

_this set ["constructor", { // Type: code | Required | Constructor to run at start of task
}];

_this set ["destructor", { // Type: code | Optional | Destructor to run at end of task
}];

_stages = [
    createHashMapFromArray [
        ["action", { //Type: code | Required | Action to be done in that stage
        //relies on createAIControl, this should change for the future
        }],
        ["condition", { //Type: code | Required | Return type: bool | Condition to compleate the stage
            (sidesX getVariable [_this get "marker", sideUnknown]) isEqualTo teamPlayer;
        }],
        ["reward", { //Type: code | Optional | the reward given for completing the stage
            private _multiplier = if (_this get "_isDifficult") then {2} else {1};
            private _pos = getMarkerPos (_this get "marker");
            private _side = _this get "_side";

            if ((_this get "state") isEqualTo "SUCCEEDED") then { //to do check environment of the remoteExec funcs as we are already on server
                [0,200 * _multiplier] remoteExec ["A3A_fnc_resourcesFIA",2];
                {
                    if (isPlayer _x) then {[10 * _multiplier,_x] call A3A_fnc_playerScoreAdd}
                } forEach ([500,0,_pos,teamPlayer] call A3A_fnc_distanceUnits);
                [10 * _multiplier, theBoss] call A3A_fnc_playerScoreAdd;

                [600 * _multiplier, _side] remoteExec ["A3A_fnc_timingCA",2];
                [0, 5 * _multiplier, _pos] remoteExec ["A3A_fnc_citySupportChange",2];

                [_side, 10, 60] remoteExec ["A3A_fnc_addAggression", 2];
            } else {
                [-10 * _multiplier, theBoss] call A3A_fnc_playerScoreAdd;
                [5 * _multiplier, 0, _pos] remoteExec ["A3A_fnc_citySupportChange",2];
                [-600 * _multiplier, _side] remoteExec ["A3A_fnc_timingCA",2];
            };
        }],
        ["timeout", _timeLimit * 60] //Type: number | Optional | Time limit for the stage before auto fail
    ]
];
_this set ["stages", _stages];
