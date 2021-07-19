params ["_vehicleType", "_typeOfAttack", "_landPosBlacklist", "_side", "_markerOrigin", "_posDestination"];
#include "..\..\Includes\common.inc"
FIX_LINE_NUMBERS()
/*  Creates a vehicle for a QRF or small attack, including crew and cargo

    Execution on: HC or Server

    Scope: Internal

    Parameters:
        _vehicleType: STRING : The name of the vehicle to spawn
        _typeOfAttack: STRING : The type of the attack
        _landPosBlacklist: ARRAY : List of blacklisted position
        _side: SIDE : The side of the attacker
        _markerOrigin: STRING : The name of the marker marking the origin
        _posDestination: ARRAY : Target position (ASL or ATL? probably used as 2d anyway)

    Returns:
        ARRAY : [_vehicle, _crewGroup, _cargoGroup, _landPosBlacklist]
        or
        OBJECT : objNull if the spawning did not worked
*/

private _groupData = FactionGetGroups(_side);
private _vehicle = [_markerOrigin, _vehicleType] call A3A_fnc_spawnVehicleAtMarker;

if(isNull _vehicle) exitWith {objNull};

private _crewGroup = [_side, _vehicle] call A3A_fnc_createVehicleCrew;
{
    [_x] call A3A_fnc_NATOinit
} forEach (units _crewGroup);
[_vehicle, _side] call A3A_fnc_AIVEHinit;

private _cargoGroup = grpNull;
private _expectedCargo = ([_vehicleType, true] call BIS_fnc_crewCount) - ([_vehicleType, false] call BIS_fnc_crewCount);
if (_expectedCargo > 0) then
{
    //Vehicle is able to transport units
    private _groupType = if (_typeOfAttack == "Normal") then
    {
        [_vehicleType, _side] call A3A_fnc_cargoSeats;
    }
    else
    {
        if (_typeOfAttack == "Air") then
        {
            _groupData get "AA";
        }
        else
        {
            _groupData get "AT";
        };
    };

    _cargoGroup = [getMarkerPos _markerOrigin, _side, _groupType, true, false] call A3A_fnc_spawnGroup;         // force spawn, should be pre-checked
    {
        _x assignAsCargo _vehicle;
        _x moveInCargo _vehicle;
        if !(isNull objectParent _x) then
        {
            [_x] call A3A_fnc_NATOinit;
            _x setVariable ["originX", _markerOrigin];
        }
        else
        {
            deleteVehicle _x;
        };
    } forEach units _cargoGroup;
};

_landPosBlacklist = [_vehicle, _crewGroup, _cargoGroup, _posDestination, _markerOrigin, _landPosBlacklist] call A3A_fnc_createVehicleQRFBehaviour;
Debug_2("Spawn Performed: Created vehicle %1 with %2 soldiers", typeof _vehicle, count crew _vehicle);

private _vehicleData = [_vehicle, _crewGroup, _cargoGroup, _landPosBlacklist];
_vehicleData;
