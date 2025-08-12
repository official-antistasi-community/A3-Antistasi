#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
params ["_units", "_roadblockMarker"];

_nightTimeBonus = if (daytime < 6 || {daytime > 22}) then {0.25} else {0};

_defenderBonus = 1 + _nightTimeBonus + (random 0.5);
_attackerBonus = 1;

_garrison = garrison getVariable [_roadblockMarker, []];

_roadblockCount = 0;
{
    if(_x == FactionGet(reb,"unitCrew")) then
    {
      _roadblockCount = _roadblockCount + 3;
    };
    _roadblockCount = _roadblockCount + 1;
} forEach _garrison;
_roadblockCount = _roadblockCount * _defenderBonus;
// Defender calculated

_attackerCount = 0;
{
  _attackerCount = _attackerCount + (count (_x select 1)) + (count (_x select 2));
  _vehicle = _x select 0;
  //Debug_2("Units: %1, Veh: %2", str _units, str _vehicle);
  switch (true) do
  {
    case (_vehicle isKindOf "APC"): {_attackerCount = _attackerCount + 5};
    case (_vehicle isKindOf "Tank"): {_attackerCount = _attackerCount + 10};
    case (_vehicle isKindOf "Helicopter"):
    {
      //Transport helicopter without a gun dont count
      if(count (getArray (configFile >> "CfgVehicles" >> _vehicle >> "weapons")) > 0) then
      {
        _attackerCount = _attackerCount + 7;
      };
    };
    case (_vehicle isKindOf "Plane"): {_attackerCount = _attackerCount + 10};
    default {_attackerCount = _attackerCount + 1;};
  };
} forEach _units;

_result = false;
if(_attackerCount == 0) then
{
  //Attacker lost
  Debug_1("Attacker lost against roadblock %1", _roadblockMarker);
  _result = false;
}
else
{
  _ratio = _roadblockCount/_attackerCount;
  if(_roadblockCount == 0 || {_ratio < 0.9}) then
  {
      Debug_2("Defender at %1 lost against attacker with ratio %2", _roadblockMarker, _ratio);
    _result = true;
  }
  else
  {
    if(_ratio > 1.1) then
    {
        Debug_1("Attacker lost against roadblock %1", _roadblockMarker);
      _result = false;
    }
    else
    {
      _result = [true, false] selectRandomWeighted [0.5, 0.5];
      if(_result) then
      {
          Debug_2("Defender at %1 lost against attacker with ratio %2", _roadblockMarker, _ratio);
      }
      else
      {
          Debug_1("Attacker lost against roadblock %1", _roadblockMarker);
      };
    };
  };
};


if(_result) then
{
  outpostsFIA = outpostsFIA - [_roadblockMarker]; publicVariable "outpostsFIA";
  markersX = markersX - [_roadblockMarker]; publicVariable "markersX";
  sidesX setVariable [_roadblockMarker, nil, true];
  [5, -5, (getMarkerPos _roadblockMarker)] remoteExec ["A3A_fnc_citySupportChange",2];
  ["TaskFailed", ["", localize "STR_A3A_fn_base_roadblockFight_lost"]] remoteExec ["BIS_fnc_showNotification", 2];
};

_result;
