#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Implemented by: Bob Murphy
 * Shows treatment message to patient
 */

params ["_patient", "_type", "_medicName"];

if (!hasInterface || {_patient isNotEqualTo ace_player}) exitWith {};

if (_patient getVariable ["ACE_isUnconscious", false]) then {
  // Player can't see who is performing treatment while unconscious
  _medicName = LLSTRING(TreatmentMessage_author_somebody);
};

[
  format [
    "<t shadow='2' size='0.45' font='EtelkaMonospaceProBold'>%1</t>",
    format [localize (format [LSTRING(TreatmentMessage_%1), _type]), _medicName]
  ],
  -1,
  (safeZoneH + safeZoneY) -  25 * (pixelH * pixelGrid),
  3,
  0,
  0
] spawn BIS_fnc_dynamicText;