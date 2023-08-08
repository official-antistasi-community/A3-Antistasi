#include "..\script_component.hpp"
FIX_LINE_NUMBERS()

/*
    Note: the task sets all feedback to players automaticly based on the info in the task hm passed to the task
    the modifyable values are:
        description, title, marker, destination, state, priority, showNotification, type, visibleIn3D

    note that TaskID is also available but should only be used when creating sub tasks, and NEVER modified within the task.
    of the afformentioned only title is required, but it is recomended to set:
        description, marker, and destination
    in addition to the title
*/
_this set ["title", "Test task"];
_this set ["description", "Test task description"];
_this set ["destination", [allPlayers#0, true]];

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
        }],
        ["condition", { //Type: code | Required | Return type: bool | Condition to compleate the stage
            false;
        }],
        ["required", true], //Type: bool | Optional | if the task needs the stage to succeed
        ["reward", { //Type: code | Optional | the reward given for completing the stage
            Info("Stage 1 reward called");
        }],
        ["rewardInstant", false], //Type: bool | Optional | if the reward should be given instantly on compleation of stage
        ["timeout", 10] //Type: number | Optional | Time limit for the stage before auto fail
    ]
];
_this set ["stages", _stages];

/*
    to add sub tasks -> add them to the Children entry in the task hm
    each one of these children should be a hashmap containing the same task information as the parent task,
    but importantly the task needs the TaskID to be set to an array in the following format: [unique sub ID, ParentID]

    example:
    private _subTaskA = createHashMap;
    _subTaskA set ["taskID", ["A", _this get "taskID"]];
    _subTaskA set ["title", "Test sub task A"];
    _subTaskA set ["description", "Test sub task A description"];
    _this set ["Children", [_subTaskA]];
*/
private _subTaskA = createHashMap;
_subTaskA set ["taskID", [call FUNC(genTaskUID), _this get "taskID"]];
_subTaskA set ["title", "Test sub task A"];
_subTaskA set ["description", "Test sub task A description"];
_this set ["Children", [_subTaskA]]; // Type: Array of hashMaps | Optional | sub tasks of the main task
