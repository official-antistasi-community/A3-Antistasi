/*
    Author: [Håkon]
    [Description]
        Reloads mounted statics

    Arguments:
    0. <nil>

    Return Value:
    <nil>

    Scope: Clients
    Environment: Any
    Public: [No]
    Dependencies:

    Example: [] call HR_GRG_fnc_reloadMounts

    License: APL-ND
*/
#include "defines.inc"
FIX_LINE_NUMBERS()
Trace("Reloading mounts");
private _disp = findDisplay HR_GRG_IDD_Garage;
private _ctrl = _disp displayCtrl HR_GRG_IDC_ExtraMounts;
private _cat = HR_GRG_vehicles#8;
//remove old statics
{
    [HR_GRG_previewVeh, true] call A3A_Logistics_fnc_unload;
    deleteVehicle _x;
} forEach attachedObjects HR_GRG_previewVeh;

//read ticked statics from UI
private _newMounts = [];
for "_i" from 0 to (lbSize _ctrl) -1 do {
    private _UID = _ctrl lbValue _i;
    if ( (checkboxTextures find (_ctrl lbPicture _i)) isEqualTo 1 ) then { //and checked
        _newMounts pushBack [_ctrl lbData _i, _UID];
    };
};

// Preserve previous array order if elements exist in both
HR_GRG_Mounts = HR_GRG_Mounts select { _x in _newMounts };
HR_GRG_Mounts append (_newMounts - HR_GRG_Mounts);

Trace_1("reloadMounts - Remaining mounts | %1", HR_GRG_Mounts);


//add new statics
private _lockedSeats = 0;
private _usedCapacity = 0;
{
    //load preview static onto preview vehicle
    _x params ["_class", "_vehUID"];
    private _staticData = (HR_GRG_Vehicles#8) get _vehUID;
    private _static = _class createVehicleLocal [random 100,random 100,10000 + random 10000];
    [_static, _staticData#4] call HR_GRG_fnc_setState;
    _static enableSimulation false;
    _static allowDamage false;
    _loadInfo = [HR_GRG_previewVeh, _static] call A3A_Logistics_fnc_canLoad;
    if (_loadInfo isEqualType 0) exitWith {};
    (_loadInfo + [true]) call A3A_Logistics_fnc_load;

    //get new load info
    private _nodes = _loadInfo#2;
    _usedCapacity = _usedCapacity + count _nodes;
    {_lockedSeats = _lockedSeats + count (_x#2)} forEach _nodes;

    //correct rotation bug
    private _offsetAndDir = [_static] call A3A_Logistics_fnc_getCargoOffsetAndDir;
    _static setVectorDir (_offsetAndDir#1);
} forEach HR_GRG_Mounts;
HR_GRG_usedCapacity = _usedCapacity;
HR_GRG_LockedSeats = _lockedSeats;
