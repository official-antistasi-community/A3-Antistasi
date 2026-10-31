/*
    Author: [Håkon]
    Description:
        Broadcast source availability in garage to all clients

    Arguments:
    0. <Index> Source type to check and broadcast

    Return Value:
    <nil>

    Scope: Server
    Environment: Any
    Public: No
    Dependencies: HR_GRG_Sources

    Example: [0] call HR_GRG_fnc_declairSources;

    License: APL-ND
*/
#include "defines.inc"
FIX_LINE_NUMBERS()
params ["_source"];
if (!isServer) exitWith {};

#define AmmoSource 0
#define FuelSource 1
#define RepairSource 2

switch _source do {
    case AmmoSource: { HR_GRG_hasAmmoSource = (HR_GRG_Sources#0) isNotEqualTo []; publicVariable "HR_GRG_hasAmmoSource" };
    case FuelSource: { HR_GRG_hasFuelSource = (HR_GRG_Sources#1) isNotEqualTo []; publicVariable "HR_GRG_hasFuelSource" };
    case RepairSource: { HR_GRG_hasRepairSource = (HR_GRG_Sources#2) isNotEqualTo []; publicVariable "HR_GRG_hasRepairSource" };
    default { Info_1("Invalid source type: %1",_source) };
};
