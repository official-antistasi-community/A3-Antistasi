params ["_side", "_setupTime", "_position", "_supportName"];

sleep _setupTime;

private _targetList = server getVariable [format ["%1_targets", _supportName], []];
private _reveal = _targetList select 0 select 1;

private _textMarker = createMarker [format ["%1_text", _supportName], _position];
_textMarker setMarkerShape "ICON";
_textMarker setMarkerType "mil_dot";
_textMarker setMarkerText "Carpet bombing";
if(_side == Occupants) then
{
    _textMarker setMarkerColor colorOccupants;
}
else
{
    _textMarker setMarkerColor colorInvaders;
};
_textMarker setMarkerAlpha 0;

[_reveal, _position, _side, "CARPETBOMB", format ["%1_coverage", _supportName], _textMarker] spawn A3A_fnc_showInterceptedSupportCall;
[_side, format ["%1_coverage", _supportName]] spawn A3A_fnc_clearTargetArea;

private _carrierMarker = if (_side == Occupants) then {"NATOCarrier"} else {"CSATCarrier"};
private _dir = getMarkerPos _carrierMarker getDir _position;

private _vectorDir = [[1,0], _dir] call BIS_fnc_rotateVector2D;
private _vectorRight = [[1,0], _dir + 90] call BIS_fnc_rotateVector2D;
_vectorDir pushBack 0;
_vectorRight pushBack 0;

private _lengthDistanceBetweenBombs = 75;//65;
private _widthDistanceBetweenBombs = 40;//25;

//The logic for bomb positioning, first bomb is always of tho, no idea why
for "_counter" from 0 to 20 do
{
    private _dropPos = _position vectorAdd (_vectorDir vectorMultiply ((_counter * (_lengthDistanceBetweenBombs/5)) - (2.2 * _lengthDistanceBetweenBombs)));

    private _sideOffset = 0;
    if(_counter < 3) then
    {
        _sideOffset = _counter - 1;
    }
    else
    {
        if(_counter < 18) then
        {
            _sideOffset = ((_counter - 3) % 5) - 2;
        }
        else
        {
            _sideOffset = _counter - 19;
        };
    };
    _dropPos = _dropPos vectorAdd (_vectorRight vectorMultiply (_sideOffset * _widthDistanceBetweenBombs));
    _dropPos set [2, 1000];

    private _bomb = createVehicle ["Bo_Mk82", _dropPos, [], 0 , "CAN_COLLIDE"];
    _bomb setVectorDirAndUp [[0,0,-1], [1,0,0]];
    _bomb setVelocity [0, 0, -75];

    sleep 0.35;
};

sleep 15;

[_supportName, _side] spawn A3A_fnc_endSupport;
