/*
    Puts a line in text chat as if a unit was speaking.
*/

params ["_unit", "message", ["_radius", 20]];
private _playersClose = allPlayers select {_x distance _unit < _radius};
private _playersFar = allPlayers select {_x distance _unit < (_radius*2)};
private _inaudiblePlayers = _playersFar - _playersClose;
[_unit, _message] remoteExec ["globalChat", _playersClose];
[_unit, "(inaudible"] remoteExec ["globalChat", _inaudiblePlayers]