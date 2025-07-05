
params ["_ammoBox", "_isLarge", "_garrison", "_marker"];

private _garrisonType = _garrison get "type";
_garrison set ["ammoBox", _ammoBox];

if (_isLarge) then {
	[_ammoBox] call A3A_Logistics_fnc_addLoadAction;
	[_ammoBox] call A3A_fnc_fillLootCrate;

	if (_garrisonType == "seaport") then {
        {
            _ammoBox addItemCargoGlobal [_x, round random [2,6,8]];
        } forEach (A3A_faction_reb get "diveGear");
    };
    if (_garrisonType == "airport") then {
		{
			if (getText(configFile >> "CfgVehicles" >> _x >> "vehicleClass") isEqualTo "Backpacks") then {
				_ammoBox addBackpackCargoGlobal [_x, round random [5,15,15]];
			} else {
				_ammoBox addItemCargoGlobal [_x, round random [5,15,15]];
			};
		} forEach (A3A_faction_reb get "flyGear");
    };
} else {
    _ammoBox call A3A_fnc_initObject;           // It's really a normal loot crate

    // fill loot
    // wep, item, ammo, exp, attach, back, helm, vest, dev
    private _crateArray = [3, 2, 0, 2, 2, 2, 2, 2, 0] apply { [_x, round random 2] };
/*    private _crateArray = [crateWepTypeMax, crateWepNumMax, crateItemTypeMax, crateItemNumMax, crateAmmoTypeMax, crateAmmoNumMax,
        crateExplosiveTypeMax, crateExplosiveNumMax, crateAttachmentTypeMax, crateAttachmentNumMax, crateBackpackTypeMax, crateBackpackNumMax,
        crateHelmetTypeMax, crateHelmetNumMax, crateVestTypeMax, crateVestNumMax, crateDeviceTypeMax, crateDeviceNumMax];*/
    [_ammoBox] + flatten _crateArray call A3A_fnc_fillLootCrate;
};

// Extra event handlers so that we don't miss out on loot->save cases
_ammoBox setVariable ["markerX", _marker, true];
_ammoBox addEventHandler ["Attached", {
    private _box = _this#0;
    [_box getVariable "markerX", "crate"] remoteExecCall ["A3A_fnc_garrisonServer_looted", 2];
    _box removeEventHandler ["Attached", _thisEventHandler];
}];
_ammoBox addEventHandler ["Take", {
    private _box = _this#1;
    [_box getVariable "markerX", "crate"] remoteExecCall ["A3A_fnc_garrisonServer_looted", 2];
    _box removeEventHandler ["Take", _thisEventHandler];
}];
