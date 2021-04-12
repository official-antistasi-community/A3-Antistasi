params ["_side", "_posDestination"];

if(tierWar < 9) exitWith {-1};

private _lastSupport = server getVariable ["lastSupport", ["", 0]];
if((_lastSupport select 0) == "ORBSTRIKE" && {(_lastSupport select 1) > time}) exitWith {-1};

if !(allowFuturisticSupports) exitWith {-1};

//Check if support is available at all
private _timer = -1;
if(_side == Occupants) then
{
    if((occupantsOrbitalStrikeTimer select 0) < time) then
    {
        _timer = 0;
    };
}
else
{
    if((invadersOrbitalStrikeTimer select 0) < time) then
    {
        _timer = 0;
    };
};
if(_timer == -1) exitWith {_timer};

//Do a logical check if the support is useful
private _proCounter = 0;
private _contraCounter = 0;

//It looks way better at night
if(sunOrMoon < 0.5) then
{
    _proCounter = _proCounter + 20
}
else
{
    _contraCounter = _contraCounter + 20;
};

private _citiesInRange = (citiesX - destroyedSites) select {((getMarkerPos _x) distance2D _posDestination) < 200};
if(_side == Occupants) then
{
    //Occupants try to avoid hitting cities
    _contraCounter = _contraCounter + (30 * (count _citiesInRange));
}
else
{
    //Invaders prefer to hit cities too
    _proCounter = _proCounter + (50 * (count _citiesInRange));
};

//Check the units on the point
private _unitsInRange = allUnits select {((getPos _x) distance2D _posDestination) < 300};
{
    if(_side == Occupants) then
    {
        //Trying to not hit own units
        if(side group _x == Occupants) then
        {
            _contraCounter = _contraCounter + 10;
            if !(isNull (objectParent _x)) then
            {
                _contraCounter = _contraCounter + 15;
            };
        }
        else
        {
            _proCounter = _proCounter + 15;
            if !(isNull (objectParent _x)) then
            {
                _proCounter = _proCounter + 50;
            };
        };

    }
    else
    {
        //As long as they hit enemies they are fine
        if(side group _x == Invaders) then
        {
            _contraCounter = _contraCounter + 5;
        }
        else
        {
            _proCounter = _proCounter + 20;
            if !(isNull (objectParent _x)) then
            {
                _proCounter = _proCounter + 75;
            };
        };
    };
} forEach _unitsInRange;

private _willUse = selectRandomWeighted [true, _proCounter, false, _contraCounter];
[2, format ["With %1 pro and %2 contra, decided for %3", _proCounter, _contraCounter, _willUse], "SUP_orbitalStrikeAvailable"] call A3A_fnc_log;

if(_willUse) exitWith {0};
-1;
