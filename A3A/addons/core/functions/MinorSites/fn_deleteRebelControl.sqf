#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_name"];

Info_1("Deleting rebel post %1", _name);

if !(_name in outpostsFIA) then { Error("No marker entry for site!") };

outpostsFIA deleteAt (outpostsFIA find _name);
publicVariable "outpostsFIA";

// Delete the visible marker but not the real one
deleteMarker format ["Dum%1", _name];

// Site might still be spawned. Wait until it's despawned to delete the marker
A3A_markersToDelete pushBack _name;
