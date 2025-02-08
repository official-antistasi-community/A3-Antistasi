params ["_unit"];
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

if !(local _unit) exitWith {
    Error("Function miscalled with non-local unit");
	[_unit] remoteExec ["A3A_fnc_surrenderAction", _unit];
};

if (_unit getVariable ["surrendered", false]) exitWith {};
_unit setVariable ["surrendered", true, true];

if (typeOf _unit == "Fin_random_F") exitWith {};		// dogs do not surrender?

if (!alive _unit) exitWith {};							// Used to happen with ACE, seems to be fixed
if (lifeState _unit == "INCAPACITATED") exitWith {
    Info("Unit attempted to surrender while incapacitated"); // If not rare, probably a sync bug
	_unit setVariable ["surrendered", false, true];
};

private _unitSide = side group _unit;
_unit allowDamage false;		// give players a couple of seconds to stop shooting
_unit setCaptive true;
_unit stop true;
_unit disableAI "MOVE";
_unit disableAI "AUTOTARGET";
_unit disableAI "TARGET";
_unit disableAI "ANIM";
_unit setSkill 0;
unassignVehicle _unit;			// stop them getting back into vehicles
[_unit] orderGetin false;
_unit setUnitPos "UP";
_unit playMoveNow "AmovPercMstpSnonWnonDnon_AmovPercMstpSsurWnonDnon";		// hands up?
_unit setSpeaker "NoVoice";

// prevent surrendered units from spawning garrisons
if (_unit getVariable ["spawner", false]) then { _unit setVariable ["spawner", nil, true] };

// find or create suitable group for surrendered unit
private _grpIdx = allGroups findIf { local _x && (side _x == _unitSide) && {_x getVariable ["surrenderGroup", false]} };
if (_grpIdx == -1) then {
	private _grp = createGroup _unitSide;
	_grp setVariable ["surrenderGroup", true, true];
	[_unit] joinSilent _grp;
} else {
	[_unit] joinSilent (allGroups select _grpIdx);
};

// create surrender box
private _surrenderCrateType = FactionGet(reb,"surrenderCrate");
private _boxX = _surrenderCrateType createVehicle position _unit;
_boxX allowDamage false;
[_boxX] call A3A_fnc_initObject;


// move all unit's equipment except uniform into the surrender crate
private _loadout = getUnitLoadout _unit;
for "_i" from 0 to 2 do {
	if !(_loadout select _i isEqualTo []) then {
		_boxX addWeaponWithAttachmentsCargoGlobal [_loadout select _i, 1];
	};
};
{_boxX addMagazineCargoGlobal [_x,1]} forEach (magazines _unit);
{_boxX addItemCargoGlobal [_x,1]} forEach (assignedItems _unit);
{_boxX addItemCargoGlobal [_x,1]} forEach (items _unit);
{_boxX addItemCargoGlobal [_x,1]} forEach [vest _unit, headgear _unit, goggles _unit];
private _backpack = backpack _unit;
if (_backpack != "") then {
	// because backpacks are often subclasses containing items
	_backpack = _backpack call A3A_fnc_basicBackpack;
	_boxX addBackpackCargoGlobal [_backpack, 1];
};
_unit setUnitLoadout [ [], [], [], [uniform _unit, []], [], [], "", "", [], ["","","","","",""] ];


if (_unitSide == Occupants) then {
	[-2, 0, getPos _unit] remoteExec ["A3A_fnc_citySupportChange", 2];
} else {
	[0, 1, getPos _unit] remoteExec ["A3A_fnc_citySupportChange", 2];
};

private _markerX = _unit getVariable "markerX";
if (!isNil "_markerX") then { [_markerX, _unitSide] remoteExec ["A3A_fnc_zoneCheck", 2] };


// timed cleanup functions
[_unit] remoteExec ["A3A_fnc_postmortem", 2];
[_boxX] remoteExec ["A3A_fnc_postmortem", 2];

sleep 3;				// Also protects against box kills
_unit allowDamage true;
_unit addEventHandler ["HandleDamage", {
	// If unit gets injured after the delay, run away
	params ["_unit","_part","_damage"];
	if (_damage < 0.2) exitWith {};
	[_unit, "remove"] remoteExec ["A3A_fnc_flagaction", [teamPlayer, civilian], _unit];
	[_unit, side group _unit] spawn A3A_fnc_fleeToSide;
	_unit removeEventHandler ["HandleDamage", _thisEventHandler];
	nil;
}];

// Add release/recruit/interrogate options
[_unit,"captureX"] remoteExec ["A3A_fnc_flagaction",[teamPlayer,civilian],_unit];
