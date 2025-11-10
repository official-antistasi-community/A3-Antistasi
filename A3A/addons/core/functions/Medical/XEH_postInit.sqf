#include "script_component.hpp"

0 spawn {
  sleep 0.001;

  if (
    isClass (configFile >> "CfgPatches" >> "rhs_main") ||
    {isClass (configFile >> "CfgPatches" >> "rhsusf_main")}
  ) then {
    ace_medical_playerDamageThreshold = ace_medical_playerDamageThreshold * 0.34;
    ace_medical_AIDamageThreshold = ace_medical_AIDamageThreshold * 0.34;
    ace_medical_const_penetrationThreshold = 0.1;
  };
};

if !(hasInterface) exitWith {};

// exit if curator/spectator
if ((side (group player)) isEqualTo sideLogic) exitWith {};

// Add extra vehicle explosion damage and wreck ejecting
addMissionEventHandler ["EntityKilled", {
  _this call FUNC(handleEntityKilled);
}];

[QGVAR(showTreatmentMessage), {
  _this call FUNC(showTreatmentMessage);
}] call CBA_fnc_addEventHandler;

["ace_treatmentStarted", {
  _this call FUNC(handleTreatmentStarted);
}] call CBA_fnc_addEventHandler;

["ace_medical_woundReceived", {
  // Add friendly-fire logging
  _this call FUNC(handleFriendlyFire);
  // Handle headshots
  _this call FUNC(handleHeadshot);
  // Handle fatal state
  _this call FUNC(handleFatalState);
}] call CBA_fnc_addEventHandler;

// Head damage healing
[{
  params ["_player", "_handle"];

  if !(alive _player) exitWith {
    [_handle] call CBA_fnc_removePerFrameHandler;
  };
  private _headDamage = _player getVariable [QGVAR(currentHeadDamage), 0];
  if (_headDamage <= 0) exitWith {};

  private _newDamage = (_headDamage - (_player getVariable [QGVAR(headDamageHealTick), 0])) max 0;

  // Reset diagnosed injuries if fully healed
  if (_newDamage == 0) then {
    _player setVariable [QGVAR(diagnosedBrainInjuries), [], true];
  };

  // Update current head dmg
  _player setVariable [
    QGVAR(currentHeadDamage),
    _newDamage,
    true
  ];
}, 60, player] call CBA_fnc_addPerFrameHandler;