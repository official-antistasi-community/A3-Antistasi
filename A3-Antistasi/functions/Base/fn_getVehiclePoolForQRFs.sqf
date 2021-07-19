/*  Returns a weighted and balanced vehicle pool for the given side and filter

    Execution on: All

    Scope: External

    Params:
        _side: SIDE : The side for which the vehicle pool should be used
        _filter: ARRAY of STRINGS : The bases classes of units that should be filtered out (for example ["LandVehicle"] or ["Air"])

    Returns:
        _vehiclePool: ARRAY : [vehicleName, weight, vehicleName2, weight2]
*/

params ["_side", ["_filter", []]];
#include "..\..\Includes\common.inc"
FIX_LINE_NUMBERS()
private _faction = Faction(_side);
private _isOcc = _side isEqualTo Occupants;

#define EntryCommon(VEH, Q_OCC, Q_INV) [VEH, if (_isOcc) then {Q_OCC} else {Q_INV}]
#define VEH(VAR) (_faction get VAR)

Debug_2("Now searching for QRF vehicle pool for %1 with filter %2", _side, _filter);
//In general is Invaders always a bit less chill than the occupants, they will use heavier vehicles more often and earlier
private _vehicleSelection = switch (tierWar) do
{
    //General idea: Send only ground units as players should be able to loot and grab the crate before the enemy arrives with a QRF
    // JJ: As of 2.3-prerelease, this function is always called with either an air or ground filter, so air/ground balancing is not valid
    case (1):
    {
        [
            EntryCommon(VEH("vehiclesHelisLight"), 100, 100)
        ] + (if (_isOcc) then {[
            [VEH("vehiclesPolice"), 40],
            [VEH("vehiclesMilitiaCars"), 30],
            [VEH("vehiclesMilitiaTrucks"), 20],
            [VEH("vehiclesMilitiaLightArmed"), 10]
        ]} else {[
            [VEH("vehiclesLightUnarmed"), 40],
            [VEH("vehiclesTrucks"), 40],
            [VEH("vehiclesLightArmed"), 20]
        ]});
    };
    //General idea: Enemies get airborne, police units are reduced and replaced by military units
    case (2):
    {
        [
            EntryCommon(VEH("vehiclesHelisLight"), 100, 80),
            EntryCommon(VEH("vehiclesLightUnarmed"), 15, 20),
            EntryCommon(VEH("vehiclesLightArmed"), 10, 30),
            EntryCommon(VEH("vehiclesTrucks"), 25, 40)
        ] + (if (_isOcc) then {[
            [VEH("vehiclesPolice"), 15],
            [VEH("vehiclesMilitiaCars"), 15],
            [VEH("vehiclesMilitiaTrucks"), 10],
            [VEH("vehiclesMilitiaLightArmed"), 10]
        ]} else {[
            [VEH("vehiclesAPCs"), 10]
        ]});
    };
    //General idea: No police units any more, armed vehicles and first sightings of APCs
    case (3):
    {
        [
            EntryCommon(VEH("vehiclesHelisLight"), 80, 60),
            EntryCommon(VEH("vehiclesHelisLight") + VEH("vehiclesHelisTransport"), 20, 40),
            EntryCommon(VEH("vehiclesLightUnarmed"), 10, 5),
            EntryCommon(VEH("vehiclesLightArmed"), 20, 45),
            EntryCommon(VEH("vehiclesTrucks"), 40, 30),
            EntryCommon(VEH("vehiclesAPCs"), 10, 20)
        ] + (if (_isOcc) then {[
            [VEH("vehiclesMilitiaTrucks"), 10],
            [VEH("vehiclesMilitiaLightArmed"), 10]
        ]} else {[]});
    };
    //General idea: Unarmed vehicles vanish, trucks start to get replaced by APCs, first sighting of transport helicopters
    case (4):
    {
        [
            EntryCommon(VEH("vehiclesHelisLight"), 50, 40),
            EntryCommon(VEH("vehiclesHelisLight") + VEH("vehiclesHelisTransport"), 50, 50),
            EntryCommon(VEH("vehiclesLightArmed"), 35, 40),
            EntryCommon(VEH("vehiclesTrucks"), 40, 10),
            EntryCommon(VEH("vehiclesAPCs"), 25, 40)
        ] + (if (_isOcc) then {[]} else {[
            [VEH("vehiclesHelisAttack"), 10],
            [VEH("vehiclesTanks"), 10]
        ]});
    };
    //General idea: Get rid of any unarmed vehicle, Invaders start to bring the big guns
    case (5):
    {
        [
            EntryCommon(VEH("vehiclesHelisLight"), 30, 25),
            EntryCommon(VEH("vehiclesHelisLight") + VEH("vehiclesHelisTransport"), 60, 50),
            EntryCommon(VEH("vehiclesLightArmed"), 30, 30),
            EntryCommon(VEH("vehiclesTrucks"), 25, 10),
            EntryCommon(VEH("vehiclesAPCs"), 35, 40),
            EntryCommon(VEH("vehiclesTanks"), 10, 20),
            EntryCommon(VEH("vehiclesHelisAttack"), 10, 15)
        ] + (if (_isOcc) then {[]} else {[
            [VEH("vehiclesPlanesTransport"), 10]
        ]});
    };
    //General idea: No light vehicles any more, Invaders start to bring attack helicopter
    case (6):
    {
        [
            EntryCommon(VEH("vehiclesLightArmed"), 25, 25),
            EntryCommon(VEH("vehiclesTrucks"), 15, 5),
            EntryCommon(VEH("vehiclesAPCs"), 45, 45),
            EntryCommon(VEH("vehiclesTanks"), 15, 20),
            EntryCommon(VEH("vehiclesHelisLight"), 20, 15),
            EntryCommon(VEH("vehiclesHelisLight") + VEH("vehiclesHelisTransport"), 60, 50),
            EntryCommon(VEH("vehiclesPlanesTransport"), 10, 15),
            EntryCommon(VEH("vehiclesHelisAttack"), 10, 20)
        ] + (if (_isOcc) then {[]} else {[
            [VEH("vehiclesAA"), 5]
        ]});
    };
    //General idea: Getting rid of light helis, Invaders start the endgame
    case (7):
    {
        [
            EntryCommon(VEH("vehiclesLightArmed"), 20, 25),
            EntryCommon(VEH("vehiclesTrucks"), 10, 5),
            EntryCommon(VEH("vehiclesAPCs"), 50, 40),
            EntryCommon(VEH("vehiclesAA"), 5, 5),
            EntryCommon(VEH("vehiclesTanks"), 15, 25),
            EntryCommon(VEH("vehiclesHelisLight"), 10, 10),
            EntryCommon(VEH("vehiclesHelisLight") + VEH("vehiclesHelisTransport"), 55, 40),
            EntryCommon(VEH("vehiclesPlanesTransport"), 20, 25),
            EntryCommon(VEH("vehiclesHelisAttack"), 15, 25)
        ];
    };
    //General idea, Occupants start to throw in everything, Invaders upgrade to maximum
    case (8):
    {
        [
            EntryCommon(VEH("vehiclesLightArmed"), 15, 20),
            EntryCommon(VEH("vehiclesTrucks"), 10, 5),
            EntryCommon(VEH("vehiclesAPCs"), 50, 40),
            EntryCommon(VEH("vehiclesAA"), 5, 10),
            EntryCommon(VEH("vehiclesTanks"), 20, 25),
            EntryCommon(VEH("vehiclesHelisLight"), 10, 5),
            EntryCommon(VEH("vehiclesHelisLight") + VEH("vehiclesHelisTransport"), 40, 40),
            EntryCommon(VEH("vehiclesPlanesTransport"), 25, 25),
            EntryCommon(VEH("vehiclesHelisAttack"), 20, 25)
        ];
    };
    //General idea: Occupants get access to all, invaders start to heavily rely on tanks and attack helis
    case (9):
    {
        [
            EntryCommon(VEH("vehiclesLightArmed"), 10, 10),
            EntryCommon(VEH("vehiclesTrucks"), 5, 5),
            EntryCommon(VEH("vehiclesAPCs"), 50, 40),
            EntryCommon(VEH("vehiclesAA"), 10, 10),
            EntryCommon(VEH("vehiclesTanks"), 25, 30),
            EntryCommon(VEH("vehiclesHelisLight"), 5, 5),
            EntryCommon(VEH("vehiclesHelisLight") + VEH("vehiclesHelisTransport"), 35, 35),
            EntryCommon(VEH("vehiclesPlanesTransport"), 25, 25),
            EntryCommon(VEH("vehiclesHelisAttack"), 25, 30)
        ];
    };
    //General idea: Occupants finish with a focus on infantry units supported by combat vehicles, while Invaders tend to use heavy armor
    case (10):
    {
        [
            EntryCommon(VEH("vehiclesLightArmed"), 5, 5),
            EntryCommon(VEH("vehiclesTrucks"), 5, 5),
            EntryCommon(VEH("vehiclesAPCs"), 50, 45),
            EntryCommon(VEH("vehiclesAA"), 10, 10),
            EntryCommon(VEH("vehiclesTanks"), 30, 35),
            EntryCommon(VEH("vehiclesHelisLight"), 5, 5),
            EntryCommon(VEH("vehiclesHelisLight") + VEH("vehiclesHelisTransport"), 30, 30),
            EntryCommon(VEH("vehiclesPlanesTransport"), 25, 25),
            EntryCommon(VEH("vehiclesHelisAttack"), 25, 30)
        ];
    };
};

//Use this function to filter out any unwanted elements
_fn_checkElementAgainstFilter =
{
    params ["_element", "_filter"];

    private _passed = true;
    {
        if(_element isKindOf _x) exitWith
        {
            _passed = false;
            Debug_2("%1 didnt passed filter %2", _element, _x);
        };
    } forEach _filter;

    _passed;
};

//Break unit arrays down to single vehicles
private _vehiclePool = [];
{
    if((_x select 0) isEqualType []) then
    {
        private _points = 0;
        private _vehicleCount = count (_x select 0);
        if(_vehicleCount != 0) then
        {
            _points = (_x select 1)/_vehicleCount;
        }
        else
        {
            Error("Found vehicle array with no defined vehicles!");
        };
        {
            if(([_x, _filter] call _fn_checkElementAgainstFilter) && {[_x] call A3A_fnc_vehAvailable}) then
            {
                _vehiclePool pushBack _x;
                _vehiclePool pushBack _points;
            };
        } forEach (_x select 0);
    }
    else
    {
        if(([_x select 0, _filter] call _fn_checkElementAgainstFilter) && {[_x select 0] call A3A_fnc_vehAvailable}) then
        {
            _vehiclePool pushBack (_x select 0);
            _vehiclePool pushBack (_x select 1);
        };
    };
} forEach _vehicleSelection;

Debug_4("For %1 and war level %2 selected units are %3, filter was %4", _side, tierWar, _vehiclePool, _filter);

_vehiclePool;
