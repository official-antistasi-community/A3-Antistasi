#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_marker", "_unitCount", "_unitQuality"];

private _garrison = A3A_activeGarrison get _marker;
private _side = sidesX getVariable _marker;         // TODO: bad, should contain within activeGarrison data

// TODO: This doesn't fully work because spawnGarrisonSquads doesn't consider already-spawned squads
[_garrison, _marker, _side, [_unitCount, _unitQuality]] call A3A_fnc_spawnGarrisonSquads;
