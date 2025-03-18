/*
Maintainer: Caleb Serafin
    Not registered in CfgFunctions.
    Manually copy and paste.
    Tests assertions for A3A_fnc_timeSpan_format.

Return Array:
    <BOOL> True if success, false if failed.
    <STRING> empty is success, list of failed assertions if failure joined by newlines.

Scope: Any
Environment: Any
Public: No
*/

// Format [Code, ExpectedValue]
private _tests = [

//// These are probably the ones you want: ////
// Dynamic range. (Full names; Show zeros between non-zeros; Hide positive sign; Limit to 2 significant fields; No padding; Localised)
[{[(1*24*60*60 + 2*60*60),0,1,false,2,false,true] call A3A_fnc_timeSpan_format;},  "1 Days 2 Hours"],
[{[(13*60*60 + 0),0,1,false,2,false,true] call A3A_fnc_timeSpan_format;},  "13 Hours"],
// Fixed Range like a digital clock (Colon separated; Show all zeros; Hide positive sign; Select only hours and minutes; With padding; Not localised)
[{[(23*60*60 + 54*60),2,2,false,[1,3],true,false] call A3A_fnc_timeSpan_format;},  "23:54"],
[{[(0*60*60 + 43*60),2,2,false,[1,3],true,false] call A3A_fnc_timeSpan_format;},  "00:43"],
[{[(24*60*60 + 43*60),2,2,false,[1,3],true,false] call A3A_fnc_timeSpan_format;},  "00:43"],
[{[(14*60*60 + 0*60),2,2,false,[1,3],true,false] call A3A_fnc_timeSpan_format;},  "14:00"],
////                                    ////

// Negatives.
[{DEV_timeSpan = [true,0,0,21,0,0,69,420];"";},  ""],
[{[DEV_timeSpan]                      call A3A_fnc_timeSpan_format;},  "(-) 21 Minutes 69 Microseconds 420 Nanoseconds"],
[{[DEV_timeSpan,1]                    call A3A_fnc_timeSpan_format;},  "(-) 21m 69µs 420ns"],
[{[DEV_timeSpan,2,2]                  call A3A_fnc_timeSpan_format;},  "-0:0:21:0–0:69:420"],

// Zeros. Note the negative marker in DEV_timeSpan.
[{DEV_timeSpan = [true]; "";},  ""],
[{[DEV_timeSpan]                      call A3A_fnc_timeSpan_format;},  "(Now)"],
[{[DEV_timeSpan,0,0,true]             call A3A_fnc_timeSpan_format;},  "(+) (Now)"],
[{[DEV_timeSpan,1]                    call A3A_fnc_timeSpan_format;},  "0"],
[{[DEV_timeSpan,1,0,true]             call A3A_fnc_timeSpan_format;},  "(+) 0"],
[{[DEV_timeSpan,0,2,false]            call A3A_fnc_timeSpan_format;},  "0 Days 0 Hours 0 Minutes 0 Seconds 0 Milliseconds 0 Microseconds 0 Nanoseconds"],
[{[DEV_timeSpan,0,2,false,nil,true]   call A3A_fnc_timeSpan_format;},  "00 Days 00 Hours 00 Minutes 00 Seconds 000 Milliseconds 000 Microseconds 000 Nanoseconds"],
[{[DEV_timeSpan,1,2,false]            call A3A_fnc_timeSpan_format;},  "0d 0h 0m 0s 0ms 0µs 0ns"],
[{[DEV_timeSpan,2,2,false]            call A3A_fnc_timeSpan_format;},  "0:0:0:0–0:0:0"],
[{[DEV_timeSpan,2,2,true,nil,true]    call A3A_fnc_timeSpan_format;},  "+00:00:00:00–000:000:000"],

// Fields Amount. (First examples show effects of "show zeros" options, last one exhibits show field amount.)
[{DEV_timeSpan = [false,0,3,54,0,152,0]; "";},  ""],
[{[DEV_timeSpan,0]                    call A3A_fnc_timeSpan_format;},  "3 Hours 54 Minutes 152 Milliseconds"],
[{[DEV_timeSpan,0,1]                  call A3A_fnc_timeSpan_format;},  "3 Hours 54 Minutes 0 Seconds 152 Milliseconds"],
[{[DEV_timeSpan,0,2]                  call A3A_fnc_timeSpan_format;},  "0 Days 3 Hours 54 Minutes 0 Seconds 152 Milliseconds 0 Microseconds 0 Nanoseconds"],
[{[DEV_timeSpan,0,2,true]             call A3A_fnc_timeSpan_format;},  "(+) 0 Days 3 Hours 54 Minutes 0 Seconds 152 Milliseconds 0 Microseconds 0 Nanoseconds"],
[{[DEV_timeSpan,0,0,false,2]          call A3A_fnc_timeSpan_format;},  "3 Hours 54 Minutes"],

// Slicing. (inclusive start index and exclusive end index)
[{DEV_timeSpan = [false,0,3,54,0,152,0]; "";},  ""],
[{[DEV_timeSpan,0,1,false,2]          call A3A_fnc_timeSpan_format;},  "3 Hours 54 Minutes"],
[{[DEV_timeSpan,0,2,false,[1,1e7]]    call A3A_fnc_timeSpan_format;},  "3 Hours 54 Minutes 0 Seconds 152 Milliseconds 0 Microseconds 0 Nanoseconds"],
[{[DEV_timeSpan,0,2,false,[0,4]]      call A3A_fnc_timeSpan_format;},  "0 Days 3 Hours 54 Minutes 0 Seconds"],
[{[DEV_timeSpan,0,2,false,[1,4]]      call A3A_fnc_timeSpan_format;},  "3 Hours 54 Minutes 0 Seconds"],

// Slicing to get digital time.
[{DEV_timeSpan = [false,0,3,54,0,152,0]; "";},  ""],
[{[DEV_timeSpan,2,2,false,[1,4]]      call A3A_fnc_timeSpan_format;},  "3:54:0"],
[{[DEV_timeSpan,2,2,false,[1,4],true] call A3A_fnc_timeSpan_format;},  "03:54:00"],

[{"";},  ""]

];

private _errors = [];
{
    _x params ["_code", "_expectedValue"];
    private _result = [] call _code;
    if (_result isNotEqualTo _expectedValue) then {
        _errors pushBack (format ["Code %1 produced %2 but was expected to be %3", _code, str _result, str _expectedValue]);
    };
} forEach _tests;

[count _errors == 0, _errors joinString endl];
