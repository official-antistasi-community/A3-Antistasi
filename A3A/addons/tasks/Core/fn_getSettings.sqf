#include "..\script_component.hpp"
FIX_LINE_NUMBERS()
if (isNil QGVAR(taskUID)) then { GVAR(taskUID) = 0 };
if (isNil QGVAR(chainStates)) then { GVAR(chainStates) = createHashMap };
if (isNil QGVAR(settings)) then { GVAR(settings) = createHashMap };

//no cba fallback
if !("taskLingerTime" in GVAR(settings)) then { GVAR(settings) set ["taskLingerTime", 180] };
if !("maxTestMissions" in GVAR(settings)) then { GVAR(settings) set ["maxTestMissions", 3] };

//CBA settings
if (isClass (configfile >> "CBA_Extended_EventHandlers")) then {

    [QGVAR(taskLingerTime), "SLIDER", ["Task linger time", "Time in minutes a task remains in the task list after completion"], ["Antistasi","Tasks"], [1, 15, 3, 0], true, {
        GVAR(settings) set ["taskLingerTime",round _this * 60];
    }] call CBA_fnc_addSetting;

    [QGVAR(maxTestMissions), "SLIDER", ["Max test missions", "Maximum amount of test missions that can be active at the same time"], ["Antistasi","Tasks"], [0, 10, 3, 0], true, {
        GVAR(settings) set ["maxTasksOfCat_Test",round _this];
    }] call CBA_fnc_addSetting;

};
