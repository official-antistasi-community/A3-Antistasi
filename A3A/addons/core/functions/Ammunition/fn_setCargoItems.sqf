/*  Clear & fill crate or vehicle object with specified items
    Sets max load so that it fits everything without overload

Scope: Server or HC
Environment: Spawned

Arguments:
    <OBJECT> Vehicle or crate
    <ARRAY> Contains [classname, amount] pairs
*/

params ["_vehicle", "_items"];

clearMagazineCargoGlobal _vehicle;
clearWeaponCargoGlobal _vehicle;
clearItemCargoGlobal _vehicle;
clearBackpackCargoGlobal _vehicle;

{
    _x params ["_key", "_amount"];
    _vehicle addItemCargoGlobal [_key, _amount];

    sleep 0.01;    // sleep here in case someone buys 1000 of something
} forEach _items;

if (load _vehicle > 1) then {
    private _reqMaxLoad = load _vehicle * maxLoad _vehicle;
    [_vehicle, _reqMaxLoad] remoteExec ["setMaxLoad", 2];
};
