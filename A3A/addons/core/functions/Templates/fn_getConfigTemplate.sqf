params ["_faction", "_var", ["_default", 0]];
diag_log ["faction", _faction];
private _varName = switch (_faction) do {
    case Occupants : {"A3A_occ_template"};
    case Invaders : {"A3A_inv_template"};
    case teamPlayer : {"A3A_reb_template"};
    case civilian : {"A3A_civ_template"};
};
diag_log _varName;
private _cfgName = missionNamespace getVariable _varName;
private _data = (configFile >> "A3A" >> "Templates" >> _cfgName >> _var) call BIS_fnc_getCfgData;
if (isNil "_data") then { _default } else { _data };