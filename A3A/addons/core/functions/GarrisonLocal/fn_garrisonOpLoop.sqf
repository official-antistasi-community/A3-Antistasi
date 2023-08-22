// spawn only
// HC and server, client allowed for testing?

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

private _functionHM = createHashMapFromArray [
    ["spawn", A3A_fnc_spawnGarrison],
    ["despawn", A3A_fnc_despawnGarrison],
    ["pause", A3A_fnc_pauseGarrison],
    ["unpause", A3A_fnc_unpauseGarrison],
    ["addGroup", A3A_fnc_addGroupToGarrisonLocal],
    ["addVehicle", A3A_fnc_addVehicleToGarrisonLocal],
    ["remVehicle", A3A_fnc_remVehicleFromGarrisonLocal],
    ["remUnit", A3A_fnc_remUnitFromGarrisonLocal],
    ["spawnUnit", A3A_fnc_spawnUnitInGarrison],
    ["disband", A3A_fnc_disbandGarrison]
];

while {true} do
{
    if (A3A_garrisonOps isEqualTo []) then { sleep 1; continue };

    private _nextOp = A3A_garrisonOps deleteAt 0;      // atomic on A3A_garrisonOps
    _nextOp params ["_opType", "_params"];

    private _opFunc = _functionHM get _opType;
    if (isNil "_opFunc") then {
        Error_1("Operation %1 not found", _opType); 
        continue;
    };
    _params call _opFunc;
};
