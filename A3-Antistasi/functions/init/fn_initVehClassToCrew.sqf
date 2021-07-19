/*
Maintainer: Caleb Serafin
    Creates & returns a lookup table for converting a vehicle classname to 4 possible crew load-outs.
    The returned load-outs are then selected by side according to the order [Government, Invader, Rebel, Civilian]

Return Value:
    HASHMAP<
        STRING                  Vehicle class name <- key of element
        ARRAY<  <loadout?>Government loadout,  <loadout?>Invader loadout,  <loadout?>Rebel loadout,  <loadout?>Civilian loadout  >
    >

Scope: Any
Environment: Any
Public: No
Dependencies:

Example:
    How to init (inside fn_initVarServer.sqf):
        private _vehClassToCrew = call A3A_fnc_initVehClassToCrew;
        DECLARE_SERVER_VAR(A3A_vehClassToCrew,_vehClassToCrew);

    How to use:
        private _sideIndex = [west,east,resistance,civilian] find (side player);
        private _typeX = typeOf _vehicle;
        private _groupsOcc = FactionGet(occ,"groups");
        private _groupsInv = FactionGet(inv,"groups");
        private _groupsReb = FactionGet(reb,"groups");
        private _crewLoadout = A3A_vehClassToCrew getOrDefault [_typeX,[_groupsOcc get "grunt", _groupsInv get "grunt", _groupsReb get "staticCrew", "C_Man_1"]] select _sideIndex;
        //        ^-returned loadout to be used                        ^-----Default load-outs if veh not in templates-----^
*/
#include "..\..\Includes\common.inc"
FIX_LINE_NUMBERS()

private _occGroups = FactionGet(occ,"groups");
private _invGroups = FactionGet(inv,"groups");
private _rebGroups = FactionGet(reb,"groups");

// ⬇ EDIT HERE 👇 TO ADD TEMPLATE LOAD-OUTS ⬇
private _allVehClassToCrew = [

//  [ FactionGet(all,"vehiclesFixedWing"), [_occGroups get "pilot", _invGroups get "pilot", _rebGroups get "staticCrew", "C_Man_1" ]    ],
//     ^---A template category or an---^    ^--Gov--^               ^--Invade--^             ^---Rebel---^               ^--Civ--^
//     ^--array of vehicle classnames--^ ^--------------------Array of load-outs, one loadout for each faction-------------------^

// Vehicles categories at the top have higher priority than bellow.
// So if "Tank_F" is in both NATOLand and NATOTanks, NATOTanks should be ABOVE NATOLand, as NATOTanks is a specialised child.

    [FactionGet(all,"vehiclesFixedWing"),[_occGroups get "pilot", _invGroups get "pilot", _rebGroups get "staticCrew", "C_Man_1"]],
    [flatten FactionGet(all,"vehiclesArmor"), [_occGroups get "crew", _invGroups get "crew", _rebGroups get "staticCrew", "C_Man_1"]],          // <- vehiclesArmor has nested arrays; therefore, it needs to be flattened. (will change with arty template change)
    [FactionGet(all,"vehiclesHelis"), [_occGroups get "pilot", _invGroups get "pilot", _rebGroups get "staticCrew", "C_Man_1"]],
    [FactionGet(all,"vehiclesUAVs"), ["B_UAV_AI", "O_UAV_AI", "I_UAV_AI", "C_UAV_AI"]],
    [FactionGet(all,"vehiclesReb"), [_occGroups get "militia_Rifleman", _invGroups get "militia_Rifleman", _rebGroups get "staticCrew", "C_Man_1"]],
    [FactionGet(all, "vehiclesPolice"), [_occGroups get "police_Grunt", _invGroups get "police_Grunt", _rebGroups get "staticCrew", "C_Man_1"]]       // < vehiclesPolice is a single classname; therefore, it needs to be put into an array.
];
// ⬆ STOP EDITING HERE 👋 THANK YOU, COME AGAIN ⬆

private _const_emptyArray = [];
private _const_emptyString = "";
private _vehClassToCrew = createHashMap;
reverse _allVehClassToCrew;     // Does it in reverse so that items on the top of _allVehClassToCrew have higher priority over lower elements.
{
    private _currentVehClassToCrew = _x;
    if !((_currentVehClassToCrew#0) isEqualType _const_emptyArray) then {
        Error("VehicleClassesNotArray | A vehicle category was not an array, but was instead '"+str (_currentVehClassToCrew#0)+"'. Please fix this.");
        assert false;
    } else {
        {
            if !(_x isEqualType _const_emptyString) then {
                Error("VehicleClassNotString | A vehicle was not a classname, but was instead '"+str _x+"'. Please fix this.");
                assert false;
            } else {
                _vehClassToCrew set [_x,_currentVehClassToCrew#1];      // _currentVehClassToCrew#1 is all crew load-outs that should be worn in this category's vehicles.
            };
        } forEach (_currentVehClassToCrew#0);                       // _currentVehClassToCrew#0 is all vehicle classnames in this category. ie "Hunter_GMG_F" and "Hunter_HMG_F" are in vehiclesLightArmed + vehiclesLightUnarmed.
    }
} forEach _allVehClassToCrew;

_vehClassToCrew;
