#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_incomingUnits"];

if (!visibleMap) then {openMap true};
positionTel = [];

showCommandingMenu "";
onMapSingleClick "positionTel = _pos; true";

[localize "STR_A3A_garrison_header", localize "STR_A3A_garrison_select_zone"] call A3A_fnc_customHint;

waitUntil {sleep 0.5; positionTel isNotEqualTo [] or {!visiblemap}};
onMapSingleClick "";

if (!visibleMap) exitWith {};

private _positionTel = positionTel;
private _nearX = [markersX,_positionTel] call BIS_fnc_nearestPosition;

if (_positionTel distance2D (getMarkerPos _nearX) > 50) exitWith {
    [localize "STR_A3A_garrison_header", format [localize "STR_A3A_garrison_fail_not_markerzone",FactionGet(reb,"name")]] call A3A_fnc_customHint;
};

if (!(sidesX getVariable [_nearX,sideUnknown] == teamPlayer)) exitWith {
    [localize "STR_A3A_garrison_header", format [localize "STR_A3A_garrison_fail_not_teamplayer",FactionGet(reb,"name")]] call A3A_fnc_customHint;
};

private _groupX = grpNull;
private _unitsX = objNull;

if ((_incomingUnits select 0) isEqualType grpNull) then {
    _groupX = _incomingUnits select 0;
    _unitsX = units _groupX;
} else {
    _unitsX = _incomingUnits;
};

private _earlyEscape = false;
private _alreadyInGarrison = false;
{
    private _garrisondIn = _x getVariable "markerX";
    if !(isNil "_garrisondIn") then {_alreadyInGarrison = true};
} forEach _unitsX;
if _alreadyInGarrison exitWith {
    [localize "STR_A3A_garrison_header", localize "STR_A3A_garrison_fail_already_in_garrison"] call A3A_fnc_customHint
};

if (groupID _groupX == "MineF" or groupID _groupX == "Post" or (isPlayer(leader _groupX))) exitWith {
    [localize "STR_A3A_garrison_header", localize "STR_A3A_garrison_fail_no_specific_squads"] call A3A_fnc_customHint;
};

{
    if (isPlayer _x or !alive _x) exitWith {_earlyEscape = true};
} forEach _unitsX;

if (_earlyEscape) exitWith {
    [localize "STR_A3A_garrison_header", localize "STR_A3A_garrison_fail_dead_units"] call A3A_fnc_customHint;
};

private _bannedTypes = FactionGet(civ, "unitMan") + 
    FactionGet(civ, "unitPress") + 
    FactionGet(civ, "unitWorker") + 
    FactionGet(reb,"unitCrew") + 
    FactionGet(reb,"unitUnarmed") + 
    FactionGet(reb,"unitPetros");

{
    private _unitType = _x getVariable "unitType";
    if (_unitType in _bannedTypes) exitWith {_earlyEscape = true};
} forEach _unitsX;
if (_earlyEscape) exitWith {
    [localize "STR_A3A_garrison_header", localize "STR_A3A_garrison_fail_no_specific_units"] call A3A_fnc_customHint;
};

[_nearX, _unitsX, clientOwner] remoteExecCall ["A3A_fnc_addUnitsToGarrison", 2];
