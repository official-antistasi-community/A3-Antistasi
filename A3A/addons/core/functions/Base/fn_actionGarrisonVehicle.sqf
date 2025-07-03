params ["_vehicle", "_player"];           // actually action params: ["_target", "_caller", "_actionId", "_arguments"];

private _titleStr = localize "STR_A3A_garrison_header";

private _marker = [getPosATL _vehicle] call A3A_fnc_getMarkerForPos;
if (_marker == "" or { sidesX getVariable _marker != teamPlayer }) then {
    [_titleStr, "This vehicle is not within a rebel garrison"] remoteExecCall ["A3A_fnc_customHint", _player];
};

[_marker, _vehicle] remoteExecCall ["A3A_fnc_garrisonServer_addVehicle", 2];

[_titleStr, "Vehicle added to garrison. Unload any important cargo or inventory because this may not be preserved when you leave the area. Entering the vehicle will remove it from the garrison."] remoteExecCall ["A3A_fnc_customHint", _player];
