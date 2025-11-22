params ["_entity"];
//[_entity, "", false] call A3A_fnc_NATOinit;

private _cfgPath = (configFile >> "CfgVehicles" >> typeOf _entity);

private _unitSide = getNumber (_cfgPath >> "side");
private _loadoutData = [];



switch (_unitSide) do
{
	case 0: { 
        //hint "east"; 
        _loadoutData = (A3A_faction_inv get "loadouts");
    };
	case 1: { 
        //hint "west"; 
        _loadoutData = ((A3A_faction_occ get "loadouts") get getText(_cfgPath >> "A3A_loadout"));
    };
	case 2: { 
        //hint "guer"; 
        _loadoutData = (A3A_faction_reb get "loadouts");
    };
	case 3: { 
        //hint "civ";
        _loadoutData = (A3A_faction_civ get "loadouts"); 
    };
};
_entity setUnitLoadout (selectRandom (_loadoutData#0));