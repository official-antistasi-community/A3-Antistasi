params ["_entity"];
//[_entity, "", false] call A3A_fnc_NATOinit;

private _unitSide = str (side _entity);
private _loadoutData;

switch (_unitSide) do
{
	case "WEST": { 
        hint "west"; 
    };
	case "EAST": { 
        hint "east"; 
    };
	case "CIV": { 
        hint "civ"; 
    };
	case "GUER": { 
        hint "guer"; 
    };
};