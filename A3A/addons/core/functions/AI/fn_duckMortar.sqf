// Function to force AIs to duck temporarily
// Should be run locally to the unit

params ["_unit"];

// Most of this code is to handle the case when mortar rounds land in rapid succession:
// - Extend lock time with each shell
// - Prevent AIs being locked down forever because previous stance is overwritten

terminate (_unit getVariable ["A3A_duckHandle", scriptNull]);
private _handle = _unit spawn {
    sleep random 1.5;
    private _prevStance = _this getVariable ["A3A_duckPrevStance", unitPos _this];
    _this setVariable ["A3A_duckPrevStance", _prevStance];
    _this setUnitPos "DOWN";
    sleep (4 + random 6);               // doesn't actually matter much. The FSM holds them down anyway
    _this setUnitPos _prevStance;
    _this setVariable ["A3A_duckPrevStance", nil];
};
_unit setVariable ["A3A_duckHandle", _handle];
