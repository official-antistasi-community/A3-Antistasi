params ["_base", "_target", ["_isAir", false], ["_bypass", false]];

/*  Selects the units to send, given on the targets reinf needs (and what the base has (not yet))
*   Params:
*     _base : STRING : The name of the origin base
*     _target : STRING : The name of the destination
*     _isAir : BOOLEAN : UNUSED
*
*   Returns:
*     _unitsSend : ARRAY : The units in the correct format
*/
#include "..\..\Includes\common.inc"
FIX_LINE_NUMBERS()

private _maxUnitSend = garrison getVariable [format ["%1_recruit", _base], 0];
if(_maxUnitSend < 3 && {!_bypass}) exitWith
{
    Debug("Can't select units with less than 3 slots, would be an vehicle only with crew!");
    [];
};

private _unitsSend = [];

//Hard copy, need to work on this
private _reinf = +([_target] call A3A_fnc_getRequested);
private _side = sidesX getVariable [_base, sideUnknown];
private _faction = Faction(_side);
private _groupData = _faction get "groups";

private _maxRequested = [_reinf, false] call A3A_fnc_countGarrison;
private _maxVehiclesNeeded = _maxRequested select 0;
private _maxCargoSpaceNeeded = _maxRequested select 2;
private _currentUnitCount = 0;

Verbose_2("Gathered data for unit selection, available are %1, %2 cargo units needed", _maxUnitSend, _maxCargoSpaceNeeded);
Verbose_2("Reinforcments requested from %1 for: %2", _target, _reinf);

private _finishedSelection = false;

while {_currentUnitCount < (_maxUnitSend - 2) && {_maxCargoSpaceNeeded+_maxVehiclesNeeded > 0}} do
{
    private _currentSelected = "";
    private _seatCount = 0;
    private _crewSeats = 0;

    //Attempt to find suitable vehicle in requested list
    {
        private _vehicle = (_x select 0);
        if(_vehicle != "") then
        {
            private _curSeatCount = [_vehicle, true] call BIS_fnc_crewCount;
            private _curCrewSeats = [_vehicle, false] call BIS_fnc_crewCount;

            //TODO available check on the base, currently it is bypassing the economy
            //Check we don't overflow the max units we can send, if we get this vehicle and crew it.
            if
            (
                (((_currentUnitCount + _curCrewSeats) + 1) <= _maxUnitSend) &&     //Already send units + crew + 1 for vehicle <= available units
                {_curSeatCount > _seatCount &&                                      //Can send more then the last select vehicle
                {!_isAir ||	{_vehicle isKindOf "Air"}}}                         //Ensure air vehicle for air convoys
            ) then
            {
                _currentSelected = _vehicle;
                _seatCount = _curSeatCount;
                _crewSeats = _curCrewSeats;
            };
        };
    } forEach _reinf;

    //Delete vehicle if we selected one
    if(_currentSelected != "") then
    {
        private _index = _reinf findIf {(_x select 0) == _currentSelected};
        if(_index != -1) then
        {
            (_reinf select _index) set [0, ""];
            _maxVehiclesNeeded = _maxVehiclesNeeded - 1;
        }
        else
        {
            Error_1("Tried to delete reinf vehicle, but couldn't find it after selection, vehicle was %1!", _currentSelected);
        };
    };

    //No suitable vehicle found, usign different vehicle to reinforce
    if(_currentSelected == "") then
    {
        //Calculate the amount of units that we still need to send against the amount of units we still have available after substracting driver and vehicle
        //Save whatever number is smaller
        private _neededCargoSpace = _maxCargoSpaceNeeded min (_maxUnitSend - _currentUnitCount - 2);

        if(_neededCargoSpace == 0) then
        {
            Error("_neededCargoSpace is 0, something went really wrong!");
        }
        else
        {
            Verbose_1("No reinf vehicle found, selecting not needed transport vehicle, needs space for %1 passengers", _neededCargoSpace);
            if (_isAir) then
            {
                if (_neededCargoSpace <= 4) then
                {
                    _currentSelected = selectRandom (_faction get "vehiclesHelisLight");
                }
                else
                {
                    _currentSelected = selectRandom ((_faction get "vehiclesHelisLight") + (_faction get "vehiclesHelisTransport"));
                };
                Verbose_1("Selected %1 as an air transport vehicle", _currentSelected);
            }
            else
            {
                if(_neededCargoSpace == 1) then
                {
                    //Vehicle, crew and one person, selecting quad
                    _currentSelected = selectRandom (_faction get "vehiclesBasic");
                }
                else
                {
                    if(_neededCargoSpace <= 5) then
                    {
                        //Select light unarmed vehicle (as the armed uses three crew)
                        _currentSelected = selectRandom (_faction get "vehiclesLightUnarmed");
                    }
                    else
                    {
                        //Select random truck or helicopter
                        _currentSelected = selectRandom ((_faction get "vehiclesLightUnarmed") + (_faction get "vehiclesHelisLight") + (_faction get "vehiclesHelisTransport"));
                    };
                };
                Verbose_1("Selected %1 as an ground or air transport vehicle", _currentSelected);
            };
            _seatCount = [_currentSelected, true] call BIS_fnc_crewCount;
            _crewSeats = [_currentSelected, false] call BIS_fnc_crewCount;
        };
    };

    if(_currentSelected != "") then
    {
        //Assigning crew
        private _crewMember = _groupData get "crew";
        private _crew = [_currentSelected, _crewMember] call A3A_fnc_getVehicleCrew;
        _currentUnitCount = _currentUnitCount + 1 + _crewSeats;

        //Assigning cargo
        private _cargo = [];
        private _openSpace = _seatCount - _crewSeats;
        private _abort = false;

        for "_i" from 0 to ((count _reinf) - 1) do
        {
            private _data = _reinf select _i;
            private _dataCargo = _data select 2;

            while {count _dataCargo > 0} do
            {
                //If space is available and units are available, add them
                if((_currentUnitCount < _maxUnitSend) && {_openSpace > 0}) then
                {
                    _cargo pushBack (_dataCargo deleteAt 0);
                    _currentUnitCount = _currentUnitCount + 1;
                    _maxCargoSpaceNeeded = _maxCargoSpaceNeeded - 1;
                    _openSpace = _openSpace - 1;
                }
                else
                {
                    //No space or units available, abort
                    _abort = true;
                };
                if(_abort) exitWith {};
            };

            //No more space, exit
            if(_abort) exitWith {};
        };
        _unitsSend pushBack [_currentSelected, _crew, _cargo];
        Debug_3("Units selected, Vehicle is %1, crew is %2, cargo is %3", _currentSelected, _crew, _cargo);
    }
    else
    {
        //No units need to be send, and vehicle is not available, abort loop
        _finishedSelection = true;
    };

    if(_finishedSelection) exitWith {};
};

garrison setVariable [format ["%1_recruit", _base], (_maxUnitSend - _currentUnitCount), true];

_unitsSend;
