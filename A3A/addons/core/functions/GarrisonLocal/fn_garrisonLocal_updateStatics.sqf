
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

Trace_1("Called with %1", _this);

params ["_marker"];

private _garrison = A3A_activeGarrison get _marker;
private _side = _garrison get "side";
private _faction = Faction(_side);
private _crewVar = ["A3A_crewed", "A3A_rebCrewed"] select (_side == teamPlayer);
private _statics = _garrison get "vehicles";

private _nearEnemies = call {
    private _enemySides = [teamPlayer, Occupants, Invaders] - [_side];
    private _enemies = units (_enemySides#0) + units (_enemySides#1);
    _enemies = _enemies inAreaArray [markerPos _marker, markerSize _marker # 0 + 50, markerSize _marker # 1 + 50, markerDir _marker, markerShape _marker == "RECTANGLE"];
    _enemies select { _x call A3A_fnc_canFight };
};

private _freeStatics = [];
{
    if (!isNull gunner _x) then { continue };
    if (!alive _x) then { _statics deleteAt _forEachIndex; continue };
    if (isNil {_x getVariable _crewVar}) then { continue };             // var set when vehicle is added to garrison
    if (_side == teamPlayer and {_x getVariable ["lockedForAI", false]}) then { continue };

    if (_nearEnemies inAreaArray [getPosATL _x, 50, 50] isEqualTo []) then { _freeStatics pushBack _x };

} forEachReversed _statics;

if (_freeStatics isEqualTo []) then { continue };

private _crewTypes = if (_side == teamPlayer) then { [_faction get "unitRifle"] }
    else { [_faction get "unitGrunt", _faction get "unitMilitiaGrunt"] };

private _freeTroops = _garrison get "troops" select { vehicle _x == _x } select { _x call A3A_fnc_canFight };
_freeTroops = _freeTroops select { _x getVariable "unitType" in _crewTypes };
if (_freeTroops isEqualTo []) then { continue };

// Routine does not work on non-local units
private _nonLocal = _freeTroops select { !local _x };
_freeTroops = _freeTroops - _nonLocal;

private _fnc_mountStatic = {
    params ["_unit", "_static", "_isMortar"];

    _unit enableAI "ALL";
    _unit setUnitPos "UP";
    _unit assignAsGunner _static;
    //_unit doMove (getPosATL _static);
    [_unit] orderGetIn true;

    sleep (_unit distance2d _static);

    if !(_unit call A3A_fnc_canFight) exitWith {};
    if (_unit == gunner _static) exitWith {
        // Static might have been blocked or removed from garrison by now
        if (_static getVariable ["lockedForAI", false] or _static getVariable ["markerX", ""] == "") exitWith {
            group _unit leaveVehicle _static;
            moveOut _unit;
        };
        if (_isMortar) then { _unit disableAI "CHECKVISIBLE" };
    };

    // Failed to mount. Redo sanity checks, force unit in if they got close
    if (!alive _static or !isNull gunner _static) exitWith {};
    if (_static getVariable ["lockedForAI", false] or _static getVariable ["markerX", ""] != "") exitWith {};
    if (_unit distance2d _static < 10) then {
        _unit moveInGunner _static;
        if (_isMortar) then { _unit disableAI "CHECKVISIBLE" };
    };
};

{
    // If not under fire, could just pop them in? hmm
    private _nearTroops = _freeTroops inAreaArray [getPosATL _x, 50, 50];
    if (_nearTroops isEqualTo []) then { continue };
    private _unit = _nearTroops # 0;
    _freeTroops deleteAt (_freeTroops find _unit);

    private _isMortar = _x isKindOf "StaticMortar";
    private _groupType = ["staticGroup", "mortarGroup"] select _isMortar;
    private _group = _garrison get _groupType;
    if (isNull _group) then { _group = createGroup _side; _garrison set [_groupType, _group] };

    [_unit] joinSilent _group;
    [_unit, _x, _isMortar] spawn _fnc_mountStatic;
} forEach _freeStatics;

// If there are non-local units, fire this function again after 10 seconds
if (_nonLocal isEqualTo []) exitWith {};
_marker spawn {
    sleep 10;
    if !(_this in A3A_activeGarrison) exitWith {};
    A3A_garrisonOps pushBack ["updateStatics", [_this]];
};
