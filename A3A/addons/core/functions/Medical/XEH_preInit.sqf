#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

GVAR(friendlyFireLock) = false;
GVAR(friendlyFireSource) = objNull;
GVAR(friendlyFireID) = 0;
GVAR(disabledCollisionUnits) = [];

GVAR(fatalStateCheckScheduled) = false;

GVAR(treatmentMessageTypes) = createHashMapFromArray [
  ["Adenosine", "injection"],
  ["ApplyTourniquet", "applyTourniquet"],
  ["BasicBandage", "bandage"],
  ["BloodIV", "transfusion"],
  ["BloodIV_250", "transfusion"],
  ["BloodIV_500", "transfusion"],
  ["CheckBloodPressure", "examine"],
  ["CheckPulse", "examine"],
  ["CheckResponse", "examine"],
  ["CPR", "cpr"],
  ["ElasticBandage", "bandage"],
  ["Epinephrine", "injection"],
  ["FieldDressing", "bandage"],
  ["Morphine", "injection"],
  ["PackingBandage", "bandage"],
  ["PatDown", "patting"],
  ["PersonalAidKit", "healing"],
  ["PlasmaIV", "transfusion"],
  ["PlasmaIV_250", "transfusion"],
  ["PlasmaIV_500", "transfusion"],
  ["QuikClot", "bandage"],
  ["RemoveTourniquet", "removeTourniquet"],
  ["SalineIV", "transfusion"],
  ["SalineIV_250", "transfusion"],
  ["SalineIV_500", "transfusion"],
  ["Splint", "splint"],
  ["SurgicalKit", "suturing"]
];

// Save last damage source
["ace_medical_woundReceived", {
  params ["_unit", "", "", "_damageType"];
  _unit setVariable [QGVAR(lastDamageType), _damageType];
}] call CBA_fnc_addEventHandler;

["ace_unconscious", {
  params ["_unit", "_active"];
  TRACE_2("ace_unconscious",_unit,_active);

  if (player isEqualTo _unit) exitWith {
    if (_active) then {
      GVAR(disabledCollisionUnits) = playableUnits + switchableUnits;
      {player disableCollisionWith _x} forEach GVAR(disabledCollisionUnits);
    } else {
      {player enableCollisionWith _x} forEach GVAR(disabledCollisionUnits);
      GVAR(disabledCollisionUnits) = [];
    };
  };

  if (_active) then {
    player disableCollisionWith _unit;
  } else {
    player enableCollisionWith _unit; 
  };
}] call CBA_fnc_addEventHandler;

// Publish last damage type of dead units
["ace_medical_death", {
  params ["_unit"];

  private _lastDamageType = _unit getVariable [QGVAR(lastDamageType), ""];
  TRACE_2("ace_medical_death: publishing lastDamageType"_unit, _lastDamageType);
  _unit setVariable [QGVAR(lastDamageType), _lastDamageType, true];
}] call CBA_fnc_addEventHandler;

ADDON = true;