// spawn only
// HC and server, client allowed for testing?

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

private _updateOps = ["updateStatics", "zoneCheck"];
private _spawnOps = ["spawn", "spawnCiv"];

while {true} do
{
    if (A3A_garrisonOps isEqualTo []) then { sleep 1; continue };

    private _nextOp = A3A_garrisonOps deleteAt 0;      // atomic on A3A_garrisonOps
    _nextOp params ["_opType", "_params"];

    if (_opType in _updateOps and {_nextOp in A3A_garrisonOps}) then {
        Debug_1("Skipping %1 (%2) due to duplicates", _opType, _params);
        continue;
    };

    if (!(_opType in _spawnOps) and !(_params#0 in A3A_activeGarrison)) then {
        Error_2("Called garrison op %1 while %2 was not spawned", _opType, _params#0); 
        continue;
    };

    private _opFunc = missionNamespace getVariable ("A3A_fnc_garrisonLocal_" + _opType);
    if (isNil "_opFunc") then {
        Error_1("Operation %1 not found", _opType); 
        continue;
    };

    // Could just call here, but we protect against flaky code for now
    // max 10 garrison ops per second should be plenty with the dupe skipping?
    private _handle = _params spawn _opFunc;
    waitUntil { sleep 0.1; isNull _handle };
};
