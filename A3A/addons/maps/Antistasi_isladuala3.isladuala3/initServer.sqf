{_x allowDamage false; _x  enableSimulation false;} forEach nearestObjects [[worldSize / 2, worldSize / 2], ["Land_ibr_mostd_bez_lamp", "Land_ibr_mostd_stred30"], worldSize * sqrt 2 / 2, true];

private _allTerrainObjects = 
(nearestTerrainObjects [[worldSize / 2, worldSize / 2], ["HIDE", "HOUSE", "FENCE"], worldSize * sqrt 2 / 2, false, true]);
private _badModelHM = [
"fort_bagfence_long.p3d",
"fort_bagfence_round.p3d",
"barel6.p3d",
"bagfencelong.p3d",
"bagfenceround.p3d",
"misc_palletsfoiled_heap.p3d",
"toilet.p3d",
"misc_cargo_cont_small2.p3d",
"seacrate.p3d",
"fort_rampart.p3d"
] createHashMapFromArray [];
_allTerrainObjects = _allTerrainObjects select {(getModelInfo _x #0) in _badModelHM;};
{ _x hideObjectGlobal true } forEach _allTerrainObjects;

call A3A_fnc_initServer;
