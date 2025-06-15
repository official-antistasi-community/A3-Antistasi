// Used by local garrison despawn to mark that loot has been stolen on server side
// Kinda iffy because garrison could remain spawned for a while? Whatever

params ["_marker", "_type"];

if (_type == "crate") then {
    private _lootCD = 120*16 / (A3A_garrisonSize get _marker);
    A3A_garrison get _marker set ["lootCD", _lootCD];
};
if (_type == "intel") then {
    private _intelCD = 120*16 / (A3A_garrisonSize get _marker);
    A3A_garrison get _marker set ["intelCD", _intelCD];
};
