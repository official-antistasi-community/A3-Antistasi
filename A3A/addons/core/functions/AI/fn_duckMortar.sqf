// Function to force AIs to duck temporarily
// Should be run locally to the unit
// A3A_forcedStance should be set if a unit has a long-term requirement to be in a specific stance

params ["_unit"];

// Most of this code is to handle the case when mortar rounds land in rapid succession:
// - Extend lock time with each shell
// - (obsolete) Prevent AIs being locked down forever because previous stance is overwritten

terminate (_unit getVariable ["A3A_duckHandle", scriptNull]);
private _handle = _unit spawn {
    sleep random 1.5;
    _this setUnitPos "DOWN";
    sleep (4 + random 6);               // doesn't actually matter much. The FSM holds them down anyway
    _this setUnitPos (_this getVariable ["A3A_forcedStance", "AUTO"]);
};
_unit setVariable ["A3A_duckHandle", _handle];
