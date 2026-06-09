// Hide corpses further than XXm away for performance

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

diag_log _this;
params [["_radius", 0]];
if (!isNil "A3A_hideCorpses_handler") then {terminate A3A_hideCorpses_handler};
if (_radius == 0) exitWith {};
A3A_hideCorpses_handler = _thisScript;

while {true} do {
    isNil {
        private _corpses = entities "CAManBase" select {!alive _x};
        { _x hideObject true} forEach _corpses;
        { _x hideObject false } forEach (_corpses inAreaArray [player, _radius, _radius]);
    };
    sleep 1;
};