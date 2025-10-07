// Remove (nearly) all data for destroyed minor site
// should be called unscheduled

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_name"];

Info_1("Deleting minor site %1", _name);

if !(_name in A3A_minorSitesHM) then { Error("Minor site doesn't exist!") };
if !(_name in controlsX) then { Error("No marker entry for site!") };

A3A_minorSitesHM deleteAt _name;
controlsX deleteAt (controlsX find _name);
publicVariable "controlsX";                         // We don't mass-delete, probably
sidesX setVariable [_name, teamPlayer, true];       // trigger missions. Hopefully shouldn't do anything else

//deleteMarker _name;
// Site might still be spawned. Wait until it's despawned to delete the marker
A3A_markersToDelete pushBack _name;
