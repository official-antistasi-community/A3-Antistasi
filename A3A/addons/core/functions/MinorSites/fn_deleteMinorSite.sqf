// Remove (nearly) all data for destroyed minor site

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_name", ["_globalUpdate", false]];

Info_1("Deleting minor site %1", _name);

if !(_name in A3A_minorSitesHM) then { Error("Minor site doesn't exist!") };
if !(_name in controlsX) then { Error("No marker entry for site!") };

A3A_minorSitesHM deleteAt _name;
deleteMarker _name;

// Leave sidesX and spawner entries to make old code safer
//sidesX setVariable [_name, _side, true];
//spawner setVariable [_name, 2, true];
controlsX deleteAt (controlsX find _name);

if (_globalUpdate) then {
    publicVariable "controlsX";
};
