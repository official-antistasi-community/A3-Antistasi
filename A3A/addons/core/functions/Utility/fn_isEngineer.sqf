params ["_unit"];

if (!isNil {_unit getVariable "ace_isEngineer"}) exitWith {
    // Yes, the spec for this var is garbage
    !(_unit getVariable "ace_isEngineer" in [0, false])
};

_unit getUnitTrait "engineer";
