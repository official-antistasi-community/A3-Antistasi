// Move old globally saved rebel statics & buildings into new garrison data

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

// Too much of a pain to support, don't bother
if (A3A_saveVersion < 20401) exitWith {};

// Nothing to do for new saves
if (A3A_saveVersion >= 31000) exitWith {};

{
	_x params ["_typeVeh", "_posVeh", "_vecUp", "_vecDir", "_state"];

	_marker = [_posVeh] call A3A_fnc_getMarkerForPos;
	if (_marker == "") then {
		Info_2("Position %1 not in garrison, spawning object %2 now", _posVeh, _typeVeh);
		isNil {
			private _veh = createVehicle [_typeVeh, _posVeh, [], 0, "CAN_COLLIDE"];
			_veh setPosWorld _posVeh;
			_veh setVectorDirAndUp [_vecDir, _vecUp];
		};
		if (!isNil "_state") then { [_vehicle, _state] call HR_GRG_fnc_setState };
		[_vehicle, teamPlayer] call A3A_fnc_AIVEHinit;
 	};

	private _arrayType = call {
		if (_typeVeh isKindOf "StaticWeapon") exitWith {"vehicles"};
		if (getNumber (configFile >> "CfgVehicles" >> _typeVeh >> "hasDriver") == 1) exitWith {"vehicles"};
		if (_typeVeh in A3A_utilityItemHM) exitWith {"vehicles"};
		"buildings";
	};
	Info_3("Adding %1 to garrison %2 %3", _typeVeh, _marker, _arrayType);

	// arrayType guaranteed to exist in garrison? barring logic bugs
	private _garrisonArray = A3A_garrison get _marker get _arrayType;
	if (isNil "_garrisonArray") then {
		Error_2("Array %1 not found in %2", _arrayType, _marker);
		continue;
	};

	if (_arrayType == "buildings") then { _garrisonArray pushBack [_typeVeh, _posVeh, _vecDir, _vecUp]; continue };
	if (isNil "_state") then { _garrisonArray pushBack [_typeVeh, [_posVeh, _vecDir, _vecUp]] }
		else { _garrisonArray pushBack [_typeVeh, [_posVeh, _vecDir, _vecUp], _state] };

} forEach (["staticsX"] call A3A_fnc_returnSavedStat);
