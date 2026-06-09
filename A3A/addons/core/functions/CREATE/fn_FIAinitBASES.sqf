#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_unit", "_marker"];

_unit setVariable ["markerX", _marker, true];
_unit addEventHandler ["Killed", A3A_fnc_rebelUnitKilledEH];
_unit setVariable ["A3A_killedEH", true];

[_unit] call A3A_fnc_initRevive;

_unit allowFleeing 0;
private _skill = (0.1 + 0.1*A3A_rebelSkillMul + 0.015 * skillFIA);
_unit setSkill _skill;

private _typeX = _unit getVariable "unitType";
if (_typeX isEqualTo FactionGet(reb,"unitSL")) then {
	_unit setskill ["courage",_skill + 0.2];
	_unit setskill ["commanding",_skill + 0.2];
};
if (_typeX isEqualTo FactionGet(reb,"unitSniper")) then {
	_unit setskill ["aimingAccuracy",_skill + 0.2];
	_unit setskill ["aimingShake",_skill + 0.2];
};

[_unit, 2] call A3A_fnc_equipRebel;			// 2 = garrison unit
_unit selectWeapon (primaryWeapon _unit);


//Reveals all air vehicles to the unit, if it is either gunner of a vehicle or equipped with a launcher
if (_unit == gunner objectParent _unit or {(secondaryWeapon _unit) in allAA}) then
{
    {
        if (!isNull driver _x) then { _unit reveal [_x, 1.5] };
    } forEach (_unit nearEntities ["Air", distanceSPWN*2]);
};
