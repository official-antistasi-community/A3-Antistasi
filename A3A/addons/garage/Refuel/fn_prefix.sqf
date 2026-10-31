/*
Author: Håkon
Description:


Arguments:
0. <Number> Number to convert to closets prefix
1. <String> base unit of the number

Return Value:
<String> number with prefixed baseunit

Scope: Any
Environment: Scheduled
Public: Yes
Dependencies:

Example:

License: MIT License
*/
params ["_number", "_baseUnit"];

switch (true) do {
    case (_number >= 1e12): {str (floor (_number/1e12)) + "T" + _baseUnit};
    case (_number >= 1e9): {str (floor (_number/1e9)) + "G" + _baseUnit};
    case (_number >= 1e6): {str (floor (_number/1e6)) + "M" + _baseUnit};
    case (_number >= 1e3): {str (floor (_number/1e3)) + "k" + _baseUnit};
    /* Disabled as we dont need that high accuracy
    case (_number >= 1e2): {str (floor (_number/1e2)) + "h" + _baseUnit};
    case (_number >= 1e1): {str (floor (_number/1e1)) + "da" + _baseUnit};

    case (_number <= 1e-12): {str (floor (_number*1e12)) + "p" + _baseUnit};
    case (_number <= 1e-9): {str (floor (_number*1e9)) + "n" + _baseUnit};
    case (_number <= 1e-6): {str (floor (_number*1e6)) + "µ" + _baseUnit};
    case (_number <= 1e-3): {str (floor (_number*1e3)) + "m" + _baseUnit};
    case (_number <= 1e-2): {str (floor (_number*1e2)) + "c" + _baseUnit};
    case (_number <= 1e-1): {str (floor (_number*1e1)) + "d" + _baseUnit};
    */
    default {str (floor _number) + _baseUnit};

};
