params ["_entity"];
[_entity, "", false] call A3A_fnc_NATOinit;

private side = independent;

if ("unit_west" in (typeOf _entity)) then {
    side = west;
};
if ("unit_east" in (typeOf _entity)) then {
    side = east;
};
if ("unit_civ" in (typeOf _entity)) then {
    side = civilian;
};