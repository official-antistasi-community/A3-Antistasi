
params ["_marker"];

// hmm. changeSide instead?
// what does it do:
// only removes troops?
// civilians stay
// statics and vehicles stay
// 

// just use despawn for intentional removal?

// currently different because we're only using this garrison stuff for rebels
// actually getting kinda close to working with enemies too though?

// requirements for rebels:
// 1. Disbanding a garrison intentionally
// 2. Disband on loss

// Same thing, just delete the troops for the moment?

// ah fuck, do we need to do both at the same time to make switches work?
// maybe

// ok, to get something running, just do the delete/surrender

private _garrison = A3A_activeGarrison get _marker;

{ if (alive _x) then { deleteVehicle _x }; } forEach (_garrison get "troops");
{ deleteGroup _x } forEach (_garrison get "groups");

_garrison set ["troops", []];
_garrison set ["groups", []];
