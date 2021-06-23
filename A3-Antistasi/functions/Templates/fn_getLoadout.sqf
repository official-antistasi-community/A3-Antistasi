params ["_loadoutName"];

private _basicMedicalSupplies =
	if (A3A_hasACE) then {
		[
			["ACE_Tourniquet",4],
			["ACE_Morphine",3],
			["ACE_Epinephrine",3],
			["ACE_PackingBandage",20],
			["ACE_Quikclot",10],
			["ACE_splint", 2]
		]
	} else {
		[
			["FirstAidKit",3]
		];
	};

private _basicMiscItems =
	if (A3A_hasACE) then {
		[
			["ACE_Earplugs",1],
			["ACE_Cabletie",3],
			["ACE_MapTools",1]

		];
	} else {
		[

		];
	};

private _medicSupplies =
	if (A3A_hasACE) then {
		[
			["ACE_surgicalKit",1],

			["ACE_ElasticBandage",25],

			["ACE_Morphine",5],
			["ACE_Epinephrine",10],

			["ACE_BloodIV_500",6],
			["ACE_Splint",5]
		]
	} else {
		[
			["Medikit", 1]
		];
	};

private _fnc_modItem = {
	params ["_hasMod", "_modItem", "_replacementItem"];

	if (_hasMod) then {
		[_modItem];
	} else {
		if (isNil "_replacementItem") then {
			[];
		} else {
			[_replacementItem];
		};
	};
};

private _fnc_modItemNoArray = {
	(_this call _fnc_modItem) select 0;
};

private _fnc_tfarRadio = {
	params ["_radio"];
	[A3A_hasTFAR, _radio, "ItemRadio"] call _fnc_modItemNoArray;
};

private _tfarMicroDAGRNoArray = [A3A_hasTFAR, "TF_MicroDagr", "ItemWatch"] call _fnc_modItemNoArray;

private _aceFlashlight = [A3A_hasACE, ["ACE_Flashlight_XL50", 1]] call _fnc_modItem;
private _aceM84 = [A3A_hasACE, ["ACE_M84",2,1]] call _fnc_modItem;
private _aceDefusalKit = [A3A_hasACE, ["ACE_DefusalKit", 1]] call _fnc_modItem;
private _aceClacker = [A3A_hasACE, ["ACE_Clacker", 1]] call _fnc_modItem;
private _aceRangecard = [A3A_hasACE, ["ACE_Rangecard", 1]] call _fnc_modItem;
private _aceKestrel = [A3A_hasACE, ["ACE_Kestrel14500", 1]] call _fnc_modItem;

private _loadoutArray = missionNamespace getVariable [_loadoutName, []];

if (_loadoutArray isEqualTo []) then {
	_loadoutArray = call compile preprocessFileLineNumbers format ["%1.sqf", _loadoutName];
	missionNamespace setVariable [_loadoutName, _loadoutArray];
};

_loadoutArray;
