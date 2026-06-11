/*
 * File: fn_loadout_addMedicalSupplies.sqf
 * Author: Spoffy
 * Description:
 *    Description goes here
 * Params:
 *    _level - Level of supplies to give - 'Minimal', 'Standard' or 'Medic'
 *    _side - side of unit. Must not be provide in faction template. Must be provided after faction templates.
 * Returns:
 *    Modified loadout
 * Dependencies
 *    <NAMESPACE> _dataStore is defined in compatibilityLoadFaction. Medical equipment is set in XXXDefaults or the template if overridden. "mediKits" and "firstAidKits" are required.
 * Example Usage:
 *    Example usage goes here
 */

params ["_level",["_side",sideUnknown]];
private _factionData = if (_side in [west, east, independent, civilian]) then {	// This is used in template loadout setting as well as rebel medic spawning. both are different environments.
	[A3A_faction_occ, A3A_faction_inv, A3A_faction_reb, A3A_faction_civ] #([west, east, independent, civilian] find _side);
} else {
	_dataStore;
};

if (_level == "MEDIC") exitWith {
	switch (true) do {
		case (A3A_hasACEMedical && A3A_hasACM): {
			[
				["ACE_surgicalKit",1],

				["ACM_PressureBandage",25],
				["ACM_ElasticWrap",10],

				["ACE_morphine",5],
				["ACE_epinephrine",5],
				["ACE_adenosine",5],

				["ACE_plasmaIV_250",5],
				["ACE_salineIV_500",3],
				["ACM_BloodBag_ON_1000",1],
				["ACM_IV_16g",1],

				["ACE_tourniquet",3],
				["ACM_SAMSplint",4]
			]
		};
		case (A3A_hasACEMedical && !A3A_hasACM): {
			[
				["ACE_surgicalKit",1],

				["ACE_packingBandage",15],
				["ACE_elasticBandage",10],
				["ACE_quikclot",10],

				["ACE_morphine",5],
				["ACE_epinephrine",5],
				["ACE_adenosine",5],

				["ACE_plasmaIV_250",5],
				["ACE_salineIV_500",3],
				["ACE_bloodIV",1],

				["ACE_tourniquet",3],
				["ACE_splint",4]
			]
		};
		default {
			private _mediKits = _factionData get "mediKits";
			private _firstAidKits = _factionData get "firstAidKits";
			[
				[_mediKits#0, 1],
				[_firstAidKits#0,10]
			]
			};
		};
	};

	if (_level == "STANDARD") exitWith {
	switch (true) do {
		case (A3A_hasACEMedical && A3A_hasACM): {
			[
				["ACE_tourniquet",1],
				["ACE_salineIV_500",1],
				["ACM_IV_16g",1],
				["ACE_morphine",2],
				["ACE_epinephrine",2],
				["ACE_adenosine",2],
				["ACM_PressureBandage",8],
				["ACM_ElasticWrap",3],
				["ACM_SAMSplint", 2]
			]
		};
		case (A3A_hasACEMedical && !A3A_hasACM): {
			[
				["ACE_tourniquet",1],
				["ACE_salineIV_500",1],
				["ACE_morphine",2],
				["ACE_epinephrine",2],
				["ACE_adenosine",2],
				["ACE_packingBandage",5],
				["ACE_elasticBandage",3],
				["ACE_quikclot",3],
				["ACE_splint", 2]
			]
		};
		default {
			private _firstAidKits = _factionData get "firstAidKits";
			[
				[_firstAidKits#0,3]
			]
		};
	};
};
//If neither of them, return minimal medical supplies
switch (true) do {
	case (A3A_hasACEMedical && A3A_hasACM): {
		[
			["ACE_morphine",1],
			["ACE_epinephrine",1],
			["ACM_PressureBandage",3]
		]
	};
	case (A3A_hasACEMedical && !A3A_hasACM): {
		[
			["ACE_morphine",1],
			["ACE_epinephrine",1],
			["ACE_fieldDressing",3]
		]
	};
	default {
		private _firstAidKits = _factionData get "firstAidKits";
		[
			[_firstAidKits#0,3]
		]
	};
};
