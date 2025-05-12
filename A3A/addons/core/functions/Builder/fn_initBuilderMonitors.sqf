/*
Description:
    Client-side spawned function to run continuous monitor/render functions for builder

Environment: Client, spawned
Arguments: None
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

Info("initBuilderMonitors started");
if !(player call A3A_fnc_isEngineer) exitWith {};
Info("initBuilderMonitors started2");

// EH to draw icons for nearby under-construction objects
A3A_buildDrawIconsEH = addMissionEventHandler ["Draw3D", {
    {
        // when we get farther away we increase the transparency
        private _normalizedDistance = 1 - ((_x distance player) / 100);
        _normalizedDistance = 0 max _normalizedDistance;
        _normalizedDistance = 1 min _normalizedDistance;
        drawIcon3D [
            "\A3\ui_f\data\map\markers\handdrawn\objective_CA.paa",
            [1,0,0,_normalizedDistance],
            getPosATLVisual _x vectorAdd [0,0,2],
            1,1,0,
            _x getVariable "A3A_build_name",
            2,0.06,"RobotoCondensedLight"
        ];
    } forEach (A3A_unbuiltObjects inAreaArray [getPosATL player, 150, 150]);
}];

// cursorObject monitor loop to add deconstruction actions to built structures
// (better than spamming 1000 extra remoteExecs on init, probably)
while { true } do {
    if (isNil { cursorObject getVariable "A3A_building" }) then { sleep 1; continue };
    if (!isNil { cursorObject getVariable "A3A_build_removeAction" }) then { sleep 1; continue };

    diag_log format ["Adding remove action for item %1", cursorObject];
    cursorObject setVariable ["A3A_build_removeAction", true];
    [
        cursorObject,
        "Destroy",
        "a3\ui_f\data\igui\cfg\actions\repair_ca.paa",
        "a3\ui_f\data\igui\cfg\actions\repair_ca.paa",
        "true",                                         // was player getUnitTrait 'engineer'
        "[player] call A3A_fnc_canFight",
        {},
        {},
        {
            // refund? Nah
            // Just delete the thing, let server clear out the array on saving
            deleteVehicle (_this#0);
        },
        {},
        [],
        10
    ] call BIS_fnc_holdActionAdd;
};
