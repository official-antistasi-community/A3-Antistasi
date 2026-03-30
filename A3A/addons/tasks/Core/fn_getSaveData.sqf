#include "..\script_component.sqf"
FIX_LINE_NUMBERS()
private _saveData = [];
{
    private _cfg = _x get "cfg";
    _saveData pushBack [configName _cfg, _x get "params" ,_x getOrDefault ["__CurrentStage",1], getNumber (_cfg/"version")];
} forEach GVAR(activeTasks);
_saveData;
