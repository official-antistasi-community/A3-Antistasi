#include "..\..\Includes\common.inc"
FIX_LINE_NUMBERS()
if(!isServer && hasInterface) exitWith {};

params ["_marker"];

//Not sure if that ever happens, but it reduces redundance
//if(spawner getVariable _marker == 2) exitWith {};

_markerPos = getMarkerPos _marker;

//Calculating marker size and max length;
_markerSize = markerSize _marker;
_markerLength = (_markerSize select 0) max (_markerSize select 1);

_isFrontline = [_marker] call A3A_fnc_isFrontline;

_side = sidesX getVariable [_marker, sideUnknown];
private _faction = Faction(_side);
_isMilitia = false;

if(_side == sideUnknown) exitWith
{
    Error_1("Could not get side of %1", _marker);
};

//Check if the outpost is hold by militia
if(_side == Occupants) then
{
  //Frontline is never hold by militia
  if(!_isFrontline && {!(_marker in airportsX)}) then
  {
    _chance = 10 min (tierWar + difficultyCoef);
    _isMilitia = selectRandomWeighted [false, _chance, true, (10 - _chance)]; //Well it doesn't change the units (facepalm)
  };
};

_patrolMarkerSize = [0,0];
if(_isFrontline || _isMilitia) then
{
  //Cannot risk to spread to thin, stay close
  Debug_1("Decided smaller radius for patrol, due to %1!", if(_isFrontline) then {if(_isMilitia) then {"frontline and militia"} else {"frontline"};} else {"militia"});
  _patrolMarkerSize = [(distanceSPWN/8), (distanceSPWN/8)];
}
else
{
  //Full patrol way, not so extrem like in the original
  Debug("Decided larger radius for patrol!");
  _patrolMarkerSize = [(distanceSPWN/4), (distanceSPWN/4)];
};

//Adding marker size and additional size
_patrolMarkerSize set [0, (_patrolMarkerSize select 0) + (_markerSize select 0)];
_patrolMarkerSize set [1, (_patrolMarkerSize select 1) + (_markerSize select 1)];


_patrolMarker = createMarkerLocal [format ["%1_patrol_%2", _marker, random 100], _markerPos];
_patrolMarker setMarkerShapeLocal "ELLIPSE";
_patrolMarker setMarkerSizeLocal _patrolMarkerSize;
_patrolMarker setMarkerTypeLocal "hd_warning";
_patrolMarker setMarkerColorLocal "ColorRed";
_patrolMarker setMarkerBrushLocal "DiagGrid";
_patrolMarker setMarkerDirLocaL (markerDir _marker);

if(!debug) then
{
  _patrolMarker setMarkerAlphaLocal 0;
};

_typeFlag = _faction get "flag";
_flag = createVehicle [_typeFlag, _markerPos, [], 0, "NONE"];
_flag allowDamage false;
[_flag,"take"] remoteExec ["A3A_fnc_flagaction",[teamPlayer,civilian],_flag];

_box = objNull;
if(_marker in airportsX || {_marker in seaports || {_marker in outposts}}) then
{
    _box = [_faction get "ammobox", _markerPos, 15, 5, true] call A3A_fnc_safeVehicleSpawn;
    [_box] spawn A3A_fnc_fillLootCrate;
    [_box] call A3A_fnc_logistics_addLoadAction;
};

[_marker, _patrolMarker, _flag, _box] call A3A_fnc_cycleSpawn;

Debug("Marker spawn prepared!");
