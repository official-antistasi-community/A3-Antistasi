params ["_typeUnit",["_updateGear",true]];

if (_updateGear) then {call A3A_fnc_fetchRebelGear;};		// Fetch rebel gear from the server if we're out of date

private _weaponHM = createHashMapFromArray [
	[A3A_faction_reb get "unitSniper", "SniperRifles"],
	[A3A_faction_reb get "unitLAT", "RocketLaunchers"],
	[A3A_faction_reb get "unitMG", "MachineGuns"],
	[A3A_faction_reb get "unitGL", "GrenadeLaunchers"],
	[A3A_faction_reb get "unitAA", "MissileLaunchersAA"],
	[A3A_faction_reb get "unitAT", "MissileLaunchersAT"]
];

private _hasWeapons = !(A3A_rebelGear getOrDefault [_weaponHM getOrDefault [_typeUnit, ""], false] isEqualTo []);
_hasWeapons;