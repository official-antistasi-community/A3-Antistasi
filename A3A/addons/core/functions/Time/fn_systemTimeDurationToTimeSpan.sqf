/*
 * File: fn_systemTimeDurationToTimeSpan.sqf
 * Function: 
 * Author: <killerswin2>
 * Function description
 * converts the arma 3 timespans to antistai timespans
 * Arguments:
 * 0: timespan <ARRAY>
 * 1: timespan <BOOL>
 *
 * Return Value:
 * 0: timespan in antistasi format
 *
 * Example:
 * [systemTimeUTC, _locktime] call A3A_fnc_systemTimeDurationToTimeSpan
 *
 * Public: No
 */

 /*
    I MUST PREFACE THIS HERE. I FUCKING HATE DOING THIS SHIT IN SQF.
    THIS CODE WENT THROUGH ABOUT 6 DIFFERENT REVISIONS, WHETHER BY 
    FIXING RANDOM ERRORS THAT ONLY SQF COULD HAVE, OR THE FUCKING
    STUPID FACT THAT WE ONLY HAVE FUCKING FLOATS IN THIS LANGUAGE.
    THAT WOULDN'T BE A PROBLEM IF WE HAD LOWER LEVEL OPERATORS
    AND FUNCTIONS, BUT AFTER 20+ YEARS THOSE NEVER MATERAILIZED.
    FLOATS CAN ONLY SUPPORT INT VALUES UP TO 16,777,216. NOW THINK
    WHY IS THIS A PROBLEM. ONE YEAR, NON LEAP, IS 31,536,000 SECONDS.
    IT IS IMPOSSIBLE TO ENCODE UNIX TIMESTAMPS OR ANY NORMAL STAMP
    WITH THIS ABYSMAL LANGUAGE. SO WHAT DO WE DO? WE FUCKING HAVE
    TO MANUALLY FUCKING SUBTRACT PER TIME UNIT. WHY? WHY? WHY? THIS 
    IS FUCKING STUPID, I'M NOT A FUCKING EXPERT ON CALENDAR 
    CALCULATIONS BUT THIS LANGUAGE HAS FORCED MY HAND. I WANT THIS
    LANGUAGE TO DIE A HORRIBLE DEATH. IF WE WENT TO INTERCEPT OR
    JUST A PLAIN EXTENSION, I WOULDN'T HAVE HAD TO SPEND HOURS
    ON THIS. I'M NOT A BETTER PROGRAMMER AFTER EXPERIENCING THIS.
    MY TIME IS VALUABLE, IT IS A FINITE RESOURCE. I HAVE LOST IT
    HERE, I'LL NEVER GET IT BACK. THIS LANGUAGE TREATS US LIKE 
    SHIT, ONLY BY SPENDING TIME AWAY FROM IT DO WE REASON HOW 
    TERRIBLE WE HAVE IT. IF THIS WAS ANY OTHER LANGUAGE THIS CODE
    WOULD HAVE BEEN THREE LINES MAX.

    MAY GOD HAVE MERCY ON THE SOULS THAT MAINTAIN THIS PIECE OF
    SHIT.
 
 */

params ["_systemTimeFinal", "_systemTimeinit"];

#define YEARS	 0
#define MONTHS	1
#define DAYS	  2
#define HOURS	 3
#define MINUTES   4
#define SECONDS   5
#define MILLISECS 6

// test case here [false,580,0,48,22,210,0,0]
//_systemTimeinit = [2022, 11, 30, 16, 31, 2, 685];
//_systemTimeFinal = [2024, 7, 2, 17, 19, 24, 895];

private _daysToMonths365 = [0, 31, 59, 90, 120, 151, 181, 212, 243, 273, 304, 334, 365];
private _daysToMonths366 = [0, 31, 60, 91, 121, 152, 182, 213, 244, 274, 305, 335, 366];

private _daysInMonths365 = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
private _daysInMonths366 = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];


private _fnc_isLeapYear = 
{
    (_this % 4) == 0 && {( _this % 100) != 0 || {_this % 400 == 0}}
};

private _fnc_daysToYear = 
{
    private _year = _this - 1;
    private _century = floor (_year / 100);
    floor (_year * (365 * 4 + 1) / 4) - _century + floor (_century / 4)
};

// make a copy of init for use in adder math stuff.
private _finalTime = +_systemTimeFinal;
private _initTime = +_systemTimeinit;

// we don't support months and years, so convert them to days
private _finalDaysFrom = _finalTime # YEARS call _fnc_daysToYear;
_finalDaysFrom = _finalDaysFrom + ([_daysToMonths365, _daysToMonths366] select ((_finalTime # YEARS) call _fnc_isLeapYear) select (_finalTime # MONTHS) - 1);
_finalTime set [DAYS, (_finalTime # DAYS) + _finalDaysFrom];

private _initDaysFrom = _initTime # YEARS call _fnc_daysToYear;
_initDaysFrom = _initDaysFrom+  ([_daysToMonths365, _daysToMonths366] select ((_initTime # YEARS) call _fnc_isLeapYear) select (_initTime # MONTHS) - 1);
_initTime set [DAYS, (_initTime # DAYS) + _initDaysFrom];

// we go one by one for readability
// I definitly do not like doing this.
private _durationMS = _finalTime # MILLISECS - _initTime # MILLISECS;
if(_durationMS < 0) then
{
    // now do adder stuff
    _finalTime set [SECONDS, (_finalTime # SECONDS) - 1];
    _finalTime set [MILLISECS, (_finalTime # MILLISECS) + 1000];	
    _durationMS = _finalTime # MILLISECS - _initTime # MILLISECS; 
};

private _durationSEC = _finalTime # SECONDS - _initTime # SECONDS;
if(_durationSEC < 0) then 
{
    _finalTime set [MINUTES, (_finalTime # MINUTES) - 1];
    _finalTime set [SECONDS, (_finalTime # SECONDS) + 60];
    _durationSEC = _finalTime # SECONDS - _initTime # SECONDS; 
};

private _durationMIN = _finalTime # MINUTES - _initTime # MINUTES;
if(_durationMIN < 0) then
{
    _finalTime set [HOURS, (_finalTime # HOURS) - 1];
    _finalTime set [MINUTES, (_finalTime # MINUTES) + 60];
    _durationMIN = _finalTime # MINUTES - _initTime # MINUTES;
};

private _durationHOUR = _finalTime # HOURS - _initTime # HOURS;
if(_durationHOUR < 0) then
{
    _finalTime set [DAYS, (_finalTime # DAYS) - 1];
    _finalTime set [HOURS, (_finalTime # HOURS) + 24];
    _durationHOUR = _finalTime # HOURS - _initTime # HOURS;
};

private _durationDAYS = _finalTime # DAYS - _initTime # DAYS;
if(_durationDAYS < 0) exitwith
{
    // days are not uniform, so just do this shit. WELCOME TO HELL.
    [false, 0, 0, 0, 0, 0, 0, 0]	
};

// DON'T FUCKING UNCOMMENT THIS SHIT BELOW
// IT'S HERE TO REMIND OF WHAT SQF TOOK FROM ME
// private _durationMONTHS = _finalTime # MONTHS - _initTime # MONTHS;
// if(_durationMONTHS < 0) then
// {
//	 _finalTime set [YEARS, (_finalTime # YEARS) - 1];
//	 _finalTime set [MONTHS, (_finalTime # MONTHS) + 12];
//	 _durationMONTHS = _finalTime # MONTHS - _initTime # MONTHS;
// };

// private _durationYEARS = _finalTime # YEARS - _initTime # YEARS;
// if(_durationYEARS < 0) exitWith
// {
//	 // well shit, you're not supposed to get here... just return a zero array
//	 [0,0,0,0,0,0,0]   
// };


[false, _durationDAYS, _durationHOUR, _durationMIN, _durationSEC, _durationMS, 0, 0]