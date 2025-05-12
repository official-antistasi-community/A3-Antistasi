/*
    A3A_fnc_boxCollisionCheck
    Returns true if specified box would collide with objects

    Params:
	_pos - position2d (Z ignored), center position  
	_dir - direction (either number or vector) of box length
    _length - length of test area in metres
    _width - width of test area in metres
    _height (default 0) - height of test area, 0 is faster
*/

params ["_pos", "_dir", "_length", "_width", ["_height", 0]];

_pos set [2, 0]; _pos = AGLtoASL _pos;
if (_dir isEqualType 0) then { _dir = [sin _dir, cos _dir, 0] };
private _sideDir = [_dir#1, -(_dir#0), 0];
private _sideDiff = _sideDir vectorMultiply _width;

private _botRearLeft = _pos vectorAdd (_dir vectorMultiply (-_length/2)) vectorAdd (_sideDir vectorMultiply (-_width/2)) vectorAdd [0,0,0.3];
private _botFrontLeft = _botRearLeft vectorAdd (_dir vectorMultiply _length);
private _botRearRight = _botRearLeft vectorAdd _sideDiff;
private _botFrontRight = _botFrontLeft vectorAdd _sideDiff;

private _lines = [
    [_botRearLeft, _botFrontRight],         // lower diagonal
    [_botRearLeft, _botFrontLeft],          // lower box
    [_botRearRight, _botFrontRight],
    [_botRearLeft, _botRearRight],
    [_botFrontLeft, _botFrontRight]
];

if (_height > 0) then {
    private _topRearLeft = _botRearLeft vectorAdd [0,0,_height-0.3];
    private _topFrontLeft = _topRearLeft vectorAdd (_dir vectorMultiply _length);
    private _topRearRight = _topRearLeft vectorAdd _sideDiff;
    private _topFrontRight = _topFrontLeft vectorAdd _sideDiff;

    _lines append [
        [_topRearRight, _topFrontLeft],         // upper diagonal
        [_botRearLeft, _topRearRight],
        [_botRearRight, _topFrontRight],
        [_botFrontRight, _topFrontLeft],
        [_botFrontLeft, _topRearLeft],
        [_botFrontLeft, _topRearRight]         // inner diagonal
    ];
};

private _collision = false;
{
//	private _result = lineIntersectsSurfaces [_x#0, _x#1, objNull, objNull, false, 1, "FIRE", "FIRE"];
	private _result = lineIntersectsObjs [_x#0, _x#1, objNull, objNull, false, 16];
	if (count _result > 0) exitWith {
		_collision = true;
	};
} forEach _lines;

/*addMissionEventHandler ["Draw3D", {
    {
        drawLine3D [ASLtoAGL (_x#0), ASLtoAGL (_x#1), [1,1,1,1]];
    } forEach _thisArgs;
}, _lines];
*/

_collision;