/*
Author: Targetingsnake
Description:
    Spawns a vehicles from template around player

Arguments: None

Return Value: None

Scope: Local
Environment: Any
Public: Yes
Dependencies:

Example: [] call A3A_fnc_debugSpawnVics;

License: MIT License
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
private _factions  = [A3A_faction_reb, A3A_faction_inv, A3A_faction_occ, A3A_faction_civ];

private _pos = getPos player;
private _lines = 10;
private _current_line = 0;
private _start_y = _pos select 0;

private _calcPos = {
	params ["_lpos", "_llines", "_currentLines", "_y_start"];
	if (_currentLines >= (_llines - 1)) then {
		_lpos set [1, (_lpos#1 + 30 )];
		_lpos set [0, _y_start];
		_currentLines = 0;
	} else {
		_lpos set [0, (_lpos#0) + 30];
		_currentLines = _currentLines + 1;
	};
	[_lpos, _currentLines]
};

private _debugOutput = {
	params["_type"];
	if (typeName _type != "STRING") then {
		_type = str _type;
	};
	private _string = "Spawning: " + _type;
	Info(_string);
};

Info("Start spawning vehicles");
{
	Info("Spawning next Faction");
	private _fn = _x get "name";
	_fn = "Spawning " + _fn ;
	Info(_fn);
	private _faction = _x;
	private _keys = keys _x;
	{
		private _key = _x;
		if (typeName _key == "STRING") then {
			private _value = _faction get _key;
			if (["vehicle", _x] call BIS_fnc_inString || (["static", _x] call BIS_fnc_inString 
				&& (!(["unit", _x] call BIS_fnc_inString)) && (!(["Mag", _x] call BIS_fnc_inString))) ) then {
				if (typeName _value == "ARRAY" ) then {
					{
						if (typeName _x == "STRING") then {
							_ar = [_pos, _lines, _current_line, _start_y] call _calcPos;
							_pos = _ar#0;
							_current_line = _ar#1;
							[_x] call _debugOutput;
							createVehicle [_x, _pos, [], 0, "CAN_COLLIDE"];
						};
					} forEach _value;
				};
				if (typeName _value == "STRING" ) then {
						_ar = [_pos, _lines, _current_line, _start_y] call _calcPos;
						_pos = _ar#0;
						_current_line = _ar#1;
						[_value] call _debugOutput;
						createVehicle [_value, _pos, [], 0, "CAN_COLLIDE"];
				};
			};
		};
	} forEach _keys;
	_pos set [1, ((_pos#1) + 100)];
	_pos set [0, (_start_y - 30)];
	_current_line = _lines;
} forEach _factions;
Info("End spawning vehicles");