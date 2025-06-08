// spawn only
// HC and server, client allowed for testing?

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

/*private _functionHM = createHashMapFromArray [
    ["spawn", A3A_fnc_spawnGarrison],
    ["despawn", A3A_fnc_despawnGarrison],
    ["pause", A3A_fnc_pauseGarrison],
    ["unpause", A3A_fnc_unpauseGarrison],
    ["addGroup", A3A_fnc_addGroupToGarrisonLocal],
    ["addVehicle", A3A_fnc_addVehicleToGarrisonLocal],
    ["remVehicle", A3A_fnc_remVehicleFromGarrisonLocal],
    ["remUnit", A3A_fnc_remUnitFromGarrisonLocal],
    ["spawnUnit", A3A_fnc_spawnUnitInGarrison],
    ["spawnUnitCount", A3A_fnc_spawnUnitCountInGarrison],
    ["changeSide", A3A_fnc_changeGarrisonSideLocal]
];
*/

while {true} do
{
    if (A3A_garrisonOps isEqualTo []) then { sleep 1; continue };

    private _nextOp = A3A_garrisonOps deleteAt 0;      // atomic on A3A_garrisonOps
    _nextOp params ["_opType", "_params"];

    if (_opType != "spawn" and !(_params#0 in A3A_activeGarrison)) then {
        Error_2("Called garrison op %1 while %2 was not spawned", _opType, _params#0); 
        continue;
    };

    private _opFunc = missionNamespace getVariable ("A3A_fnc_garrisonLocal_" + _opType);
    if (isNil "_opFunc") then {
        Error_1("Operation %1 not found", _opType); 
        continue;
    };
    _params call _opFunc;
};
