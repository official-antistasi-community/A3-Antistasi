/*
    Author: [Targetingsnake]
    [Description]
        Checks for Statics which aren't categorized or can't be categroized automaticly

    Arguments: None

    Return Value: None

    Scope: Clients
    Environment: unscheduled
    Public: [Yes]
    Dependencies:

    Example: [] call A3A_Logistics_fnc_checkDefinedCargoNodes;
*/
#include "..\script_component.hpp"

Info("Check Statics");

private _allVehicles = "true" configClasses (configFile >> "CfgVehicles");
private _wantedClasses = ["StaticMortar", "StaticMGWeapon", "StaticGrenadeLauncher", "StaticATWeapon", "StaticAAWeapon"];


{
	private _className = configName _x;
	private _cargoConfig = [_className] call A3A_Logistics_fnc_getCargoConfig;
	if (isClass (_cargoConfig)) then {
		private _parent  = _className;
		if (1 == getNumber (_cargoConfig/"isWeapon")) then {
			private _success = false;
			while {_parent != "ALL"} do {
				_parent = configName (inheritsFrom (configFile >> "CfgVehicles" >> _parent));
				if (_parent in _wantedClasses) then {
					_success = true;
				};
			};
			if (!(_success) && ! (getNumber (_cargoConfig/"weaponType") in [1,2,3,4])) then {
				Info_2("Static Weapon %1 with classname %2 ca not be classified automaticaly", getText(configFile >> "CfgVehicles" >> "displayName"), _className);
			};
		};
	};

} forEach _allVehicles;

Info("Check Statics completed");