/*
    Rescale weighted array to specified total target weight 
    Converts normal array to weighted
    Optionally filters elements using passed function (false = reject)
*/

params ["_array", "_targWeight", ["_fnc_validate", {true}]];
if (_array isEqualTo []) exitWith {[]};
private _output = [];

// simple array, just check and convert to weighted
if (count _array < 2 or { !(_array#1 isEqualType 0) }) exitWith {
    private _weight = _targWeight / count _array;
    {
        if !(_x call _fnc_validate) then { continue };
        _output pushBack _x;
        _output pushBack _weight;
    } forEach _array;
    _output;
};

// first pass, filter and find total weight
private _curWeight = 0;
for "_i" from 0 to (count _array - 2) step 2 do {
    if (_array select _i call _fnc_validate) then {
        _output pushBack (_array select _i);
        _output pushBack (_array select (_i+1));
        _curWeight = _curWeight + (_array select (_i+1));
    };
};
if (_curWeight == 0) exitWith {_output};

// second pass, re-weight
private _weightMod = _targWeight / _curWeight;
for "_i" from 0 to (count _output - 2) step 2 do {
    _output set [_i+1, _weightMod * (_output select (_i+1))];
};
_output;
