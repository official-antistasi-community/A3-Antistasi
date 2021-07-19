params ["_markerDestination", "_side", "_super"];

/*  Sends an attack force towards the given marker

    Execution on: Server

    Scope: External

    Params:
        _markerDestination: MARKER : The target position where the attack will be send to
        _side: SIDE or MARKER : The start parameter of the attack
        _super: BOOLEAN : Determine if the attack should be super strong

    Returns:
        Nothing
*/
#include "..\..\Includes\common.inc"
FIX_LINE_NUMBERS()

Info_1("Starting single attack with parameters %1", _this);

private _markerOrigin = "";
private _posOrigin = [];

private _posDestination = getMarkerPos _markerDestination;

//Parameter is the starting base
if(_side isEqualType "") then
{
    _markerOrigin = _side;
    _posOrigin = getMarkerPos _markerOrigin;
    _side = sidesX getVariable [_markerOrigin, sideUnknown];
    Info_2("Adapting attack params, side is %1, start base is %2", _side, _markerOrigin);
};

if(_side == sideUnknown) exitWith
{
    Error_1("Could not retrieve side for %1", _markerOrigin);
};
private _faction = Faction(_side);

private _typeOfAttack = [_posDestination, _side] call A3A_fnc_chooseAttackType;
if(_typeOfAttack == "") exitWith {};

//No start based selected by now
if(_markerOrigin == "") then
{
    _markerOrigin = [_posDestination, _side] call A3A_fnc_findBaseForQRF;
    _posOrigin = getMarkerPos _markerOrigin;
};

if (_markerOrigin == "") exitWith
{
    Info_1("Small attack to %1 cancelled because no usable bases in vicinity",_markerDestination);
};

//Base selected, select units now
private _vehicles = [];
private _groups = [];
private _landPosBlacklist = [];
private _aggression = if (_side == Occupants) then {aggressionOccupants} else {aggressionInvaders};
if (sidesX getVariable [_markerDestination, sideUnknown] != teamPlayer) then {_aggression = 100 - _aggression};
private _vehicleCount = if(_side == Occupants) then
{
    1
    + (_aggression/16)
    + ([0, 2] select _super)
    + ([-0.5, 0, 0.5] select (skillMult - 1))
}
else
{
    1
    + (_aggression/16)
    + ([0, 3] select _super)
    + ([0, 0.5, 1.5] select (skillMult - 1))
};
_vehicleCount = (round (_vehicleCount)) max 1;

Debug_2("Due to %1 aggression, sending %2 vehicles", (if(_side == Occupants) then {aggressionOccupants} else {aggressionInvaders}), _vehicleCount);

//Set idle times for marker
if (_markerOrigin in airportsX) then
{
    [_markerOrigin, 20] call A3A_fnc_addTimeForIdle;
}
else
{
    [_markerOrigin, 40] call A3A_fnc_addTimeForIdle;
};

private _vehPool = [];
private _replacement = [];

if ((_posOrigin distance2D _posDestination < distanceForLandAttack) && {[_posOrigin, _posDestination] call A3A_fnc_arePositionsConnected}) then
{
    //The attack will be carried out by land and air vehicles
	_vehPool = [_side] call A3A_fnc_getVehiclePoolForAttacks;
    _replacement = (_faction get "vehiclesHelisLight") + (_faction get "vehiclesHelisTransport") + (_faction get "vehiclesTrucks") + (_faction get "vehiclesHelisLight");
}
else
{
    //The attack will be carried out by air vehicles only
	_vehPool = [_side, ["LandVehicle"]] call A3A_fnc_getVehiclePoolForAttacks;
    _replacement = (_faction get "vehiclesHelisLight") + (_faction get "vehiclesHelisTransport") + (_faction get "vehiclesHelisLight");
};

//If vehicle pool is empty, fill it up
if(_vehPool isEqualTo []) then
{
    {_vehPool append [_x, 1]} forEach _replacement;
};

//Spawn in the vehicles
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
Info_2("Spawn Performed: Small %1 attack sent with %2 vehicles", _typeOfAttack, count _vehicles);

//Prepare despawn conditions
private _endTime = time + 2700;
private _qrfHasArrived = false;
private _qrfHasWon = false;

while {true} do
{
    private _markerSide = sidesX getVariable [_markerDestination, sideUnknown];

    if(_markerSide == _side) exitWith
    {
        Info_1("Small attack to %1 captured the marker, starting despawn routines", _markerDestination);
    };

    //Trying to flip marker
    Debug("Checking whether small attack took marker");
    [_markerDestination, _markerSide] remoteExec ["A3A_fnc_zoneCheck", 2];

    private _groupAlive = false;
    {
        private _index = (units _x) findIf {[_x] call A3A_fnc_canFight};
        if(_index != -1) exitWith
        {
            _groupAlive = true;
        };
    } forEach _groups;

    if !(_groupAlive) exitWith
    {
        Info_1("Small attack to %1 has been eliminated, starting despawn routines", _markerDestination);
    };

    sleep 60;
    if(_endTime < time) exitWith
    {
        Info_1("Small attack to %1 timed out without winning or loosing, starting despawn routines", _markerDestination);
    };
};

{
    [_x] spawn A3A_fnc_VEHDespawner;
} forEach _vehicles;

{
    [_x] spawn A3A_fnc_groupDespawner;
} forEach _groups;
