params ["_plane", "_type"];

/*  Equips a plane with the needed loadout
    Params:
        _plane: OBJECT : The actual plane object
        _type: STRING : The type of attack plane, either "CAS" or "AA" or "HELICOPTER"
    Returns:
        Nothing
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

private _loadout = [];
private _configType = switch (_type) do
{
    case "CAS": {"CASPlane"};
    case "AA": {"CAPPlane"};
    case "HELICOPTER": {"Helicopter"};
    default {"None"}
};

if (_configType == "None") exitWith {
    Error_1("Invalid type - Entry in ['CAS','AA','HELICOPTER'] expected - %1 recieved", typeOf _plane);
};

private _configPath = configFile >> "A3A" >> "Loadouts" >> _configType >> typeOf _plane;

if (isNull _configPath) exitWith {
    Debug_1("%1 has no loadout set, exiting", typeOf _plane);
};

_loadout = getArray(_configPath >> "loadout");

if (_type == "CAS") then {
    _plane setVariable ["mainGun", getArray(_configPath >> "mainGun") select 0];
    _plane setVariable ["rocketLauncher", getArray(_configPath >> "rocketLauncher")];
    _plane setVariable ["missileLauncher", getArray(_configPath >> "missileLauncher")];

    _plane setVariable ["bombRacks", getArray(_configPath >> "bombRacks")];
    _plane setVariable ["diveParams", getArray(_configPath >> "diveParams")];
};

[_plane, _type] call (compile (getText(_configPath >> "code")));

if !(_loadout isEqualTo []) then
{
    Debug_2("Selected new loadout for %1, now equipping %2 with it",typeOf _plane, _plane);
    {
        _plane setPylonLoadout [_forEachIndex + 1, _x, true];
        _plane setVariable ["loadout", _loadout];
    } forEach _loadout;
};
