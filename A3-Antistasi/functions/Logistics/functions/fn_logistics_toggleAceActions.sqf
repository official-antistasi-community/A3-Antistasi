params ["_object"];

if (isNil "_object") exitWith {};

private _actions = _object getVariable ["LogisticsAceToggle", nil];
private _removeAction = false;
if (isNil "_actions") then {_removeAction = true};

if (_removeAction) then {
	//check if actions are on the object
	_canDrag = _object getVariable ["ace_dragging_canDrag",false];
	_canCarry = _object getVariable ["ace_dragging_canCarry",false];
	_canLoad = if (getNumber (configFile >> "CfgVehicles" >> typeOf _object >> "ace_cargo_canLoad") isEqualTo 1) then {true} else {false}; 

	//save old actions
	_object setVariable ["LogisticsAceToggle", [_canDrag, _canCarry, _canLoad], true];

	//disable ACE dragging
	_object setVariable ["ace_dragging_canDrag",false, true];
	_object setVariable ["ace_dragging_canCarry",false, true];
	_object setvariable ["ace_cargo_canLoad",false, true];
} else {
	_actions params ["_canDrag","_canCarry","_canLoad"];

	//set actions to the state it was before load
	_object setVariable ["ace_dragging_canDrag",_canDrag, true];
	_object setVariable ["ace_dragging_canCarry",_canCarry, true];
	_object setvariable ["ace_cargo_canLoad",_canLoad, true];

	_object setVariable ["LogisticsAceToggle", nil, true];
};