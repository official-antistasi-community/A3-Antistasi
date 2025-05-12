#include "..\..\script_component.hpp"
/*
Author: Killerswin2, Giddi
    Automatic/backup garbage cleaner with fix time slices
Arguments:
    NONE

Return Value:
    <nil>

Scope: Server
Environment: scheduled
Public: yes
Dependencies:
    None
Example:
*/

#define GC_THRESHOLD_DISABLE 0

#define GC_NOTIFY_CHECK_INTERVAL 10

#define GC_FINAL_WARNING_SECONDS 120

#define GC_QUEUE_SENTINEL_TIME -1



if(!isServer) exitWith {};
if(A3A_GCThreshold isEqualTo GC_THRESHOLD_DISABLE) exitWith {};



// store the value of the last garbage clean so it can be checked if it changed.
private _storedLastGCTime = A3A_lastGarbageCleanTime;


// initialize some later needed variables.
private _contextQueue = [];

private _currentContext = [];




private _fnc_conditionalSleep = {
    // returns true if the condition turned true at any time and false if it rant until _targetTime
    // done this way to be able to immediatley register when a manual GC was done.

    private _returnValue = false;

    // end-time can be changed to be a parameter if necessary
    private _targetEndTime = serverTime + GC_NOTIFY_CHECK_INTERVAL;

    while {serverTime < _targetEndTime} do {

        if (_storedLastGCTime isNotEqualTo A3A_lastGarbageCleanTime) then {
            _returnValue = true;
            break;
        };

        uiSleep 2;
    };


    _returnValue;
};



private _fnc_onRemind = {

    private _timeSinceLastGC = [[serverTime-A3A_lastGarbageCleanTime] call A3A_fnc_secondsToTimeSpan,0,0,false,2] call A3A_fnc_timeSpan_format;
    private _timeUntilForcedGC = [[(A3A_lastGarbageCleanTime + A3A_GCThreshold)-serverTime] call A3A_fnc_secondsToTimeSpan,0,0,false,2] call A3A_fnc_timeSpan_format;
    [localize "STR_A3A_GCTracker_tracker_title", format [localize "STR_A3A_GCTracker_tracker_notification", _timeSinceLastGC, _timeUntilForcedGC]] remoteExec ["A3A_fnc_customHint", 0];
    Debug_2("Garbage Cleaner Tracker has notified players of last gc time %1 and time until forced gc %2", _timeSinceLastGC, _timeUntilForcedGC);
};


private _fnc_onFinalWarning = {

    private _timeUntilForcedGC = [[(A3A_lastGarbageCleanTime + A3A_GCThreshold)-serverTime] call A3A_fnc_secondsToTimeSpan,0,0,false,2] call A3A_fnc_timeSpan_format;
    [localize "STR_A3A_GCTracker_warning_title", format [localize "STR_A3A_GCTracker_warning_text", _timeUntilForcedGC]] remoteExec ["A3A_fnc_customHint", 0];
    Debug("Garbage Cleaner Tracker has notified players of finalWarning for auto GC");

};



private _fnc_onAutoGC = {

    [] call A3A_fnc_garbageCleaner;
    [localize "STR_A3A_GCTracker_tracker_title", localize "STR_A3A_GCTracker_tracker_ran_gc"] remoteExec ["A3A_fnc_customHint", 0];

    private _timeSinceLastGC = [[serverTime-A3A_lastGarbageCleanTime] call A3A_fnc_secondsToTimeSpan,0,0,false,2] call A3A_fnc_timeSpan_format;

    Debug_2("Garbage Cleaner Tracker has ran a gc as players reached threshold, time since last gc: %1", _timeSinceLastGC);
};

// Noop function just to be safe and to not break the Context Queue format.
private _fnc_noOp = {

};



private _fnc_getNewContextQueue = {
    // creates the context queue, to modify the beaviour of the tracker, only this function has to be edited
    // basically a context queue factory function
    private _singleStepTime = (A3A_GCThreshold/4);


    // ensure that the final warning actually happens after the last reminder, currently not that important but could be if the preset thresholds change
    private _actualWarningSeconds = GC_FINAL_WARNING_SECONDS min (_singleStepTime/2);


    // context queue is an array that consists of sub arrays of [trigger time, function to call]
    // last context always has to be the Sentinel context aka [GC_QUEUE_SENTINEL_TIME, _noOp]
    private _returnValue = [
        [A3A_lastGarbageCleanTime + (_singleStepTime*1), _fnc_onRemind],
        [A3A_lastGarbageCleanTime + (_singleStepTime*2), _fnc_onRemind],
        [A3A_lastGarbageCleanTime + (_singleStepTime*3), _fnc_onRemind],
        [(A3A_lastGarbageCleanTime + A3A_GCThreshold)-_actualWarningSeconds, _fnc_onFinalWarning],
        [A3A_lastGarbageCleanTime+A3A_GCThreshold, _fnc_onAutoGC],
        [GC_QUEUE_SENTINEL_TIME, _fnc_noOp]
    ];



    _returnValue;
};

private _fnc_resetTracker = {
    // resets everything after a GC happened or initially sets everything up


    // reset the stored GC Time as it most likely has changed.
    _storedLastGCTime = A3A_lastGarbageCleanTime;

    // generate a completely new context queue from the context queue factory function
    _contextQueue = call _fnc_getNewContextQueue;

    // pre-select the current context as to not have to do it each time the loop checks if it has to trigger
    _currentContext = _contextQueue select 0;

    Debug("Reseted GC Tracker");
};

// initially fill the context Queue
call _fnc_resetTracker;


// event-loop
while {true} do {

    // sleeps for the CHECK_INTERVAL, but also return sooner if it detects that a GC happened. If GC happened, we reset the context queue.
    if (call _fnc_conditionalSleep) then {
        call _fnc_resetTracker;
    };

    // if we ever enter a state where the last context (auto-gc) was used but the queue was not reset, then we do nothing.
    if ((_currentContext select 0) isEqualTo GC_QUEUE_SENTINEL_TIME) then {
        Error("Context Queue ran out without triggering a GC, something went wrong");
        continue;
        };

    // actuall main logic, checks if the set time of the top item in the queue is in the past, if yes it executes the associated function
    // then removes the top most item from the queue and sets the new top most as current.
    if (serverTime >= (_currentContext select 0)) then {
        call (_currentContext select 1);
        _contextQueue deleteAt 0;
        _currentContext = _contextQueue select 0;

    };


};
