#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

(_this get "params") params [["_marker", "", [""]]];
if ((getMarkerPos _marker) isEqualTo [0,0,0]) exitWith {
    Error_1("Assassinate official mission started with bad marker name | %1", _this);
};

private _side = sidesX getVariable _marker;
private _faction = Faction(_side);

_this set ["_side", _side];
_this set ["_faction", _faction];
_this set ["_isDifficult",(random 10 < tierWar)];

//get info for description
private _nameDest = [_marker] call A3A_fnc_localizar;
private _timeLimit = if (_this get "_isDifficult") then {15} else {30};
private _endTime = [_timeLimit] call FUNC(minutesFromNow);

_this set ["title", "STR_antistasi_LTasks_AS_official_title"]; //test if it will localize from key
_this set ["description", format [
    localize "STR_antistasi_LTasks_AS_official_description",
    _faction get "name",
    _nameDest,
    _endTime
]];
_this set ["marker", _marker];
_this set ["destination", getMarkerPos _marker];

_this set ["constructor", { // Type: code | Required | Constructor to run at start of task
    private _faction = _this get "_faction";
    private _group = createGroup (_this get "_side");
    private _official = [_group, _faction get "unitOfficial", _this get "destination", [], 0, "NONE"] call A3A_fnc_createUnit;

    private _guardsTypes = [_faction get "unitBodyguard"];
    if (_this get "_isDifficult") then {_guardsTypes append [
        _faction get "unitBodyguard",_faction get "unitBodyguard",_faction get "unitBodyguard",_faction get "unitBodyguard"
    ]};
    private _guards = [];
    {
        _guards pushBack [_group, _x, _this get "destination", [], 0, "NONE"] call A3A_fnc_createUnit;
    } forEach _guardsTypes;

    _this set ["_official", _official];
    _this set ["_guards", _guards];
}];

_this set ["destructor", { // Type: code | Optional | Destructor to run at end of task
    waitUntil {
        (spawner getVariable (_this get "marker")) isEqualTo 2 // not spawned
    };
    { deleteVehicle _x } forEach ([_this get "_official"] + (_this get "_guards"));
}];

_stages = [
    createHashMapFromArray [
        ["action", { //Type: code | Required | Action to be done in that stage
            private _official = _this get "_official";
            private _group = group _official;
            _group selectLeader _official;

            //patrol behaviour to be replaced by vcom
            [leader _group, _this get "marker", "SAFE", "SPAWNED", "NOVEH", "NOFOLLOW"] spawn UPSMON_fnc_UPSMON;
            {
                [_x] call A3A_fnc_NATOinit;
                _x allowFleeing 0;
            } forEach ([_official] + (_this get "_guards"));
        }],
        ["condition", { //Type: code | Required | Return type: bool | Condition to compleate the stage
            !alive (_this get "_official");
        }],
        ["reward", { //Type: code | Optional | the reward given for completing the stage
            private _multiplier = if (_this get "_isDifficult") then {2} else {1};
            if ((_this get "state") isEqualTo "SUCCEEDED") then {
                [0,300 * _multiplier] remoteExec ["A3A_fnc_resourcesFIA",2];
                [1200 + 600 * _multiplier, _this get "_side"] remoteExec ["A3A_fnc_timingCA",2];
                {
                    if (isPlayer _x) then {[10 * _multiplier,_x] call A3A_fnc_playerScoreAdd};
                } forEach ([500,0,getMarkerPos (_this get "marker"),teamPlayer] call A3A_fnc_distanceUnits);
                [5 * _multiplier,theBoss] call A3A_fnc_playerScoreAdd;
                [_this get "marker",30 * _multiplier] call A3A_fnc_addTimeForIdle;
            } else {
                [-600 * _multiplier, _this get "_side"] remoteExec ["A3A_fnc_timingCA",2];
                [-10 * _multiplier,theBoss] call A3A_fnc_playerScoreAdd;
                [_this get "marker",-30 * _multiplier] call A3A_fnc_addTimeForIdle;
            };
        }],
        ["timeout", _timeLimit * 60] //Type: number | Optional | Time limit for the stage before auto fail
    ]
];
_this set ["stages", _stages];
