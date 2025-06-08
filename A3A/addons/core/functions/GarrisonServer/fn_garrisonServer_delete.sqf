// Final cleanup for destroyed minor sites
// called after despawn
// In theory, nothing should be touching the garrison after this?

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_marker"];

Trace_1("Called with params %1", _this);

A3A_markersToDelete deleteAt (A3A_markersToDelete find _marker);
deleteMarker _marker;
A3A_garrison deleteAt _marker;

Trace("Completed");
