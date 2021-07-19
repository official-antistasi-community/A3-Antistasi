params ["_side", "_posDestination", "_supportName"];

/*  Sends a QRF force towards the given position

    Execution on: Server

    Scope: External

    Params:
        _posDestination: POSITION : The target position where the QRF will be send to
        _side: SIDE : The side of the QRF

    Returns:
        _coverageMarker : STRING : The name of the marker covering the support area, "" if not possible
*/
#include "..\..\Includes\common.inc"
FIX_LINE_NUMBERS()
private _faction = Faction(_side);

private _typeOfAttack = [_posDestination, _side, _supportName] call A3A_fnc_chooseAttackType;
//If no type specified, exit here
if(_typeOfAttack == "") exitWith
{
    ""
};

private _markerOrigin = [_posDestination, _side] call A3A_fnc_findBaseForQRF;
if (_markerOrigin == "") exitWith
{
    Info_1("QRF to %1 cancelled because no usable bases in vicinity",_posDestination);
    ""
};
private _posOrigin = getMarkerPos _markerOrigin;

Debug_2("%1 will be send from %2", _supportName, _markerOrigin);

private _targetMarker = createMarker [format ["%1_coverage", _supportName], _posDestination];

_targetMarker setMarkerShape "ELLIPSE";
_targetMarker setMarkerBrush "Grid";
_targetMarker setMarkerSize [300, 300];
if(_side == Occupants) then
{
    _targetMarker setMarkerColor colorOccupants;
};
if(_side == Invaders) then
{
    _targetMarker setMarkerColor colorInvaders;
};
_targetMarker setMarkerAlpha 0;

//Base selected, select units now
private _vehicles = [];
private _groups = [];
private _landPosBlacklist = [];
private _vehicleCount = if(_side == Occupants) then
{
    (aggressionOccupants/25)
    + ([-0.5, 0, 0.5] select (skillMult - 1))
}
else
{
    (aggressionInvaders/25)
    + ([0, 0.5, 1.5] select (skillMult - 1))
};
_vehicleCount = (round (_vehicleCount)) max 1;

Debug_2("Due to %1 aggression, sending %2 vehicles", (if(_side == Occupants) then {aggressionOccupants} else {aggressionInvaders}), _vehicleCount);

//Set idle times for marker
if (_markerOrigin in airportsX) then
{
    [_markerOrigin, 10] call A3A_fnc_addTimeForIdle;
}
else
{
    [_markerOrigin, 20] call A3A_fnc_addTimeForIdle;
};

private _vehPool = [];
private _replacement = [];

if ((_posOrigin distance2D _posDestination < distanceForLandAttack) && {[_posOrigin, _posDestination] call A3A_fnc_arePositionsConnected}) then
{
    //The attack will be carried out by land and air vehicles
	_vehPool = [_side] call A3A_fnc_getVehiclePoolForQRFs;
    _replacement = (_faction get "vehiclesHelisLight") + (_faction get "vehiclesHelisTransport") + (_faction get "vehiclesTrucks") + (_faction get "vehiclesHelisTransport");
}
else
{
    //The attack will be carried out by air vehicles only
	_vehPool = [_side, ["LandVehicle"]] call A3A_fnc_getVehiclePoolForQRFs;
    _replacement = (_faction get "vehiclesHelisLight") + (_faction get "vehiclesHelisTransport") + (_faction get "vehiclesHelisLight");
};

//If vehicle pool is empty, fill it up
if(_vehPool isEqualTo []) then
{
    {_vehPool append [_x, 1]} forEach _replacement;
};

for "_i" from 1 to _vehicleCount do
{
    if ([_side] call A3A_fnc_remUnitCount < 4) exitWith {
        Info("Cancelling because maxUnits exceeded");
    };

    private _vehicleType = selectRandomWeighted _vehPool;
    private _vehicleData = [_vehicleType, _typeOfAttack, _landPosBlacklist, _side, _markerOrigin, _posDestination] call A3A_fnc_createAttackVehicle;
    if (_vehicleData isEqualType []) then
    {
        _vehicles pushBack (_vehicleData select 0);
        _groups pushBack (_vehicleData select 1);
        if !(isNull (_vehicleData select 2)) then
        {
            _groups pushBack (_vehicleData select 2);
        };
        _landPosBlacklist = (_vehicleData select 3);
        sleep 5;
    };

};
Info_3("Spawn Performed: %1 QRF sent with %2 vehicles, callsign %3", _typeOfAttack, count _vehicles, _supportName);

[_side, _vehicles, _groups, _posDestination, _supportName] spawn A3A_fnc_SUP_QRFRoutine;

_markerOrigin spawn
{
    sleep 60;
    if(spawner getVariable _this == 2) then
    {
        [_this] call A3A_fnc_freeSpawnPositions;
    };
};

private _distance = _posOrigin distance2D _posDestination;
private _minTime = _distance / (300 / 3.6);
private _maxTime = _distance / (25 / 3.6);

private _result = [_targetMarker, _minTime, _maxTime];
_result;
