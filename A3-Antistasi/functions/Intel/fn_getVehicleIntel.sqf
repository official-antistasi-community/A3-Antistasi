#include "..\..\Includes\common.inc"
FIX_LINE_NUMBERS()

#define ACCESS_CAR      102
#define ACCESS_ARMOR    200
#define ACCESS_AIR      201
#define ACCESS_HELI     202

params ["_side", "_type"];
private _faction = Faction(_side);

/*  Creates the intel text of enemy vehicles for all sides and classes
*   Params:
*       _side : SIDE : The side of the enemy
*       _type : NUMBER : One of 102, 200, 201, 202
*
*   Returns:
*       _text : TEXT : The text for the intel
*/


private _allVehicles = switch _type do {
    case ACCESS_CAR: { (_faction get "vehiclesLightArmed") + (_faction get "vehiclesLightArmed") };
    case ACCESS_HELI: { (_faction get "vehiclesHelisLight") + (_faction get "vehiclesHelisTransport") + (_faction get "vehiclesHelisAttack") };
    case ACCESS_ARMOR: { (_faction get "vehiclesAPCs") + (_faction get "vehiclesTanks") };
    case ACCESS_AIR: {
        (_faction get "vehiclesPlanesCAS") + (_faction get "vehiclesPlanesAA") + (_faction get "vehiclesPlanesTransport")
        + (
            (_faction get "uavsAttack")
            + (_faction get "uavsPortable")
            select {_x isNotEqualTo "not_supported"}
        ) //maybe all should have "not_supported" filtered out (out of scope for this pr)
    };
};
private _text = "";
private _revealCount = 1 + round (random ((count _allVehicles) - 1));

for "_i" from 1 to _revealCount do
{
    private _vehicle = selectRandom _allVehicles;
    _allVehicles = _allVehicles - [_vehicle];

    private _vehicleName = getText (configFile >> "CfgVehicles" >> _vehicle >> "displayName");
    if([_vehicle] call A3A_fnc_vehAvailable) then
    {
        private _amount = round (timer getVariable [_vehicle, -1]);
        if(_amount == -1) then
        {
            _amount = "∞";
        };
        _text = format ["%1 %2 %3<br/>", _text, _amount, _vehicleName];
    }
    else
    {
        _text = format ["%1 0 %2<br/>", _text, _vehicleName];
    };
};

_text;
