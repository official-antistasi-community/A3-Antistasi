//if (worldName != "Tanoa") exitWith {};
private ["_unit"];

_unit = _this select 0;

_unit addUniform (selectRandom (A3A_faction_reb get "uniforms"));

_unit addItemToUniform "FirstAidKit";
