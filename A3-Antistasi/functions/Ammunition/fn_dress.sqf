#include "..\..\Includes\common.inc"
FIX_LINE_NUMBERS()
private _unit = _this select 0;
private _loadoutOverride = param [1];
private _team = side group _unit;
private _unitLoadoutNumber = if (!isNil "_loadoutOverride") then {_loadoutOverride} else {_unit getVariable ["pvpPlayerUnitNumber", 0]};

_loadout = switch _team do {

	case teamPlayer: {
		if (toLower worldName isEqualTo "enoch") then {
			[[],[],[],[selectRandom (FactionGet(civ,"uniforms") + FactionGet(reb,"uniforms")), []],[],[],"H_Hat_Tinfoil_F","",[],
			[(selectRandom unlockedmaps),"","",(selectRandom unlockedCompasses),(selectRandom unlockedwatches),""]];
		} else {
			[[],[],[],[selectRandom (FactionGet(civ,"uniforms") + FactionGet(reb,"uniforms")), []],[],[],selectRandom FactionGet(civ,"headgear"),"",[],
			[(selectRandom unlockedmaps),"","",(selectRandom unlockedCompasses),(selectRandom unlockedwatches),""]];
		};
	};

	default {
		[];
	};
};

_unit setUnitLoadout _loadout;

_unit selectWeapon (primaryWeapon _unit);
