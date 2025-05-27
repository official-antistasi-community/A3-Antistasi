// Function for retreat/surrender of defeated garrison
// Garrison side should already be switched in sidesX - should be faster than garrison op

// what does it do:
// only removes troops?
// civilians stay
// statics and vehicles stay
// switch side of vehicles and statics?

params ["_marker", "_newSide"];

private _garrison = A3A_activeGarrison get _marker;
private _oldSide = _garrison get "side";
private _troops = _garrison get "troops";

// Ok, what to do with troops?
// If close to enemies, surrender. Otherwise attempt RTB?

// If anyone is in a vehicle (static weapon, later?), get them out
// Might have units occupying statics that aren't in this garrison, so we do this the daft way for now
// Maybe should be in xxxReturnToBase instead?
{
    if (vehicle _x != _x) then {            // isKindOf "StaticWeapon"
        group _x leaveVehicle vehicle _x;
        moveOut _x;
    };
} forEach (_garrison get "troops");

sleep 0.1;

// If close to the marker & enemy, just surrender
if (_oldSide != teamPlayer) then {
    private _nearTroops = _troops inAreaArray [markerPos _marker, 50, 50];
    _troops = _troops - _nearTroops;
    { [_x] spawn A3A_fnc_surrenderAction } forEach _nearTroops;

    // Everyone else can try to run away
    { _x spawn A3A_fnc_enemyReturnToBase } forEach (_garrison get "groups");
} else {
    { _x spawn A3A_fnc_rebelReturnToBase } forEach (_garrison get "groups");
};

// Clear the units, switch the rest?
_garrison set ["troops", []];
_garrison set ["groups", []];
_garrison set ["side", _side];

// TODO: Switch statics & vehicles?
// need to check vehicle side switch functionality
