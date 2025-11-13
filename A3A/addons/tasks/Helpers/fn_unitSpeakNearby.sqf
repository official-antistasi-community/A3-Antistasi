/*
    Puts a line in text chat as if a unit was speaking.
*/

params ["_unit", "_message", ["_radius", 20]];
private _playersClose = allPlayers select {_x distance _unit < _radius};
private _playersFar = allPlayers select {_x distance _unit < (_radius*2)};
if (_playersFar isEqualTo []) exitWith {};

private _inaudiblePlayers = _playersFar - _playersClose;
diag_log format ["close %1 far %2 inaudible %3", _playersClose, _playersFar, _inaudiblePlayers];
[_unit, _message] remoteExec ["globalChat", _playersClose];
[_unit, "(inaudible)"] remoteExec ["globalChat", _inaudiblePlayers]