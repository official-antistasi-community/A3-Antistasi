/*
Maintainer: Caleb Serafin, DoomMetal
    Converts colors defined in mission config to arrays usable in sqf.
    From this:
      {1,0,0,1}
    To this:
      [1,0,0,1]

    No, this doesn't do the same thing as BIS_fnc_colorConfigToRGBA.

Arguments:
    <CODE> The color from the config. Usually the referencing the define itself.

Return Value:
    <ARRAY<SCALAR>> The color as an array

Scope: Any, Local Arguments, Local Effect
Environment: Any
Public: Yes
Dependencies:
    None

Example:
    [A3A_COLOR_BLACK] call FUNC(configColorToArray); // [0,0,0,1]
    [{0,0,0,1}] call FUNC(configColorToArray); // [0,0,0,1]

License: APL-ND

*/

private _configColor = _this select 0;
private _configColorAsString = str _configColor;
private _colorArrayString = "[" + (_configColorAsString select [1, (count _configColorAsString) -2]) + "]";
call compile _colorArrayString;
