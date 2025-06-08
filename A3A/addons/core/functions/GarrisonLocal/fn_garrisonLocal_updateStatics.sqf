
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_marker"];

private _garrison = A3A_activeGarrison get _marker;
private _side = _garrison get "side";
private _faction = Faction(_side);
private _statics = _garrison get "statics";

private _nearEnemies = call {
    private _enemySides = [teamPlayer, Occupants, Invaders] - [_side];
    private _enemies = units (_enemySides#0) + units (_enemySides#1);
    _enemies = _enemies inAreaArray [markerPos _marker, markerSize _marker # 0 + 50, markerSize _marker # 1 + 50, markerDir _marker, markerShape _marker == "RECTANGLE"];
    _enemies select { _x call A3A_fnc_canFight };
};

private _freeStatics = [];
{
    if (!alive _x) then { _statics deleteAt _forEachIndex; continue };
    if (!isNull gunner _x) then { continue };
    if (_x getVariable ["lockedForAI", false]) then { continue };
    if (_x isKindOf "staticMortar") then { continue };              // yeah not dealing with that

    if (_nearEnemies inAreaArray [getPosATL _x, 50, 50] isEqualTo []) then { _freeStatics pushBack _x };

} forEachReversed _statics;

if (_freeStatics isEqualTo []) then { continue };

private _crewType = _faction get "unitRifle";
private _freeTroops = _garrison get "troops" select { vehicle _x == _x } select { _x call A3A_fnc_canFight };
_freeTroops = _freeTroops select { _x getVariable "unitType" == _crewType };
if (_freeTroops isEqualTo []) then { continue };

private _fnc_mountStatic = {
    params [_unit, _static];

    _unit enableAI "ALL";
    _unit setUnitPos "UP";
    _unit assignAsGunner _static;
    _unit doMove (getPosATL _static);
    [_unit] orderGetIn true;

    sleep (_unit distance2d _static);

    if !(_unit call A3A_fnc_canFight) exitWith {};
    if (_unit == gunner _static) exitWith {};

    // redo sanity checks...
    if (!alive _static or !isNull gunner _static or _static getVariable ["lockedForAI", false]) exitWith {};
    if (_unit distance2d _static < 10) then { _unit moveInGunner _static };
};

private _group = _garrison get "staticGroup";
if (isNull _group) then { _group = createGroup _side; _garrison set ["staticGroup", _group] };

{
    // If not under fire, could just pop them in? hmm
    private _nearTroops = _freeTroops inAreaArray [getPosATL _x, 50, 50];
    if (_nearTroops isEqualTo []) then { continue };
    private _unit = _nearTroops deleteAt 0;
    [_unit] joinSilent _group;
    [_unit, _x] spawn _fnc_mountStatic;
} forEach _freeStatics;
