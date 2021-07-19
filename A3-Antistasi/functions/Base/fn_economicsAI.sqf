#include "..\..\Includes\common.inc"
FIX_LINE_NUMBERS()
//Original Author: Barbolani
//Edited and updated by the Antstasi Community Development Team

_fnc_economics = {
    params ["_coefficient", "_random", "_typeX", "_maxItems", "_accelerator"];
    private ["_currentItems"];

    if (_typeX isEqualType "") then {
        _typeX  = [_typeX];
    };

	if (_typeX isEqualTo []) exitWith {};

    if (_random == "random") then {
        private _selectedType = selectRandom _typeX;
        _currentItems = timer getVariable [_selectedType, 0];
        if (_currentItems < _maxItems) then {
            timer setVariable [_selectedType, _currentItems + _coefficient * _accelerator, true];
        };
    } else {
        _currentItems = 0;
        {
            _currentItems = _currentItems + (timer getVariable [_x, 0]);
        } forEach _typeX;
        if (_currentItems < _maxItems) then {
            timer setVariable [selectRandom _typeX, _currentItems + _coefficient * _accelerator, true];
        };
    };
};

//--------------------------------------Occupants--------------------------------------------------
private _airbases = { sidesX getVariable [_x, sideUnknown] == Occupants } count airportsX;
private _outposts = { sidesX getVariable [_x, sideUnknown] == Occupants } count outposts;
private _seaports = { sidesX getVariable [_x, sideUnknown] == Occupants } count seaports;
private _accelerator = [1 + (tierWar + difficultyCoef) / 20, 0] select (tierWar == 1);

[0.2, "", FactionGet(occ,"staticAT") , _outposts * 0.2 + _airbases * 0.5, _accelerator] spawn _fnc_economics;
[0.1, "", FactionGet(occ,"staticAA"), _airbases * 2, _accelerator] spawn _fnc_economics;
[0.2, "random", FactionGet(occ,"vehiclesAPCs"), _outposts * 0.3 + _airbases * 2, _accelerator] spawn _fnc_economics;
[0.1, "", FactionGet(occ,"vehiclesTanks"), _outposts * 0.5 + _airbases * 2, _accelerator] spawn _fnc_economics;
[0.1, "", FactionGet(occ,"vehiclesAA"), _airbases, _accelerator] spawn _fnc_economics;
[0.3, "", FactionGet(occ,"vehiclesGunBoats"), _seaports, _accelerator] spawn _fnc_economics;
[0.2, "", FactionGet(occ,"vehiclesPlanesCAS"), _airbases * 4, _accelerator] spawn _fnc_economics;
[0.2, "", FactionGet(occ,"vehiclesPlanesAA"), _airbases * 4, _accelerator] spawn _fnc_economics;
[0.2, "random", FactionGet(occ,"vehiclesPlanesTransport"), _airbases * 4, _accelerator] spawn _fnc_economics;
[0.2, "random", FactionGet(occ,"vehiclesHelisTransport"), _airbases * 4, _accelerator] spawn _fnc_economics;
[0.2, "random", FactionGet(occ,"vehiclesHelisAttack"), _airbases * 4, _accelerator] spawn _fnc_economics;
[0.2, "", FactionGet(occ,"vehiclesArtillery"), _airbases + _outposts * 0.2, _accelerator] spawn _fnc_economics;

//--------------------------------------Invaders---------------------------------------------------
_airbases = { sidesX getVariable [_x, sideUnknown] == Invaders } count airportsX;
_outposts = { sidesX getVariable [_x, sideUnknown] == Invaders } count outposts;
_seaports = { sidesX getVariable [_x, sideUnknown] == Invaders } count seaports;
_accelerator = 1.2 + (tierWar + difficultyCoef) / 20;

[0.2, "", FactionGet(inv,"staticAT"), _outposts * 0.2 + _airbases * 0.5, _accelerator] spawn _fnc_economics;
[0.1, "", FactionGet(inv,"staticAA"), _airbases * 2, _accelerator] spawn _fnc_economics;
[0.2, "random", FactionGet(inv,"vehiclesAPCs"), _outposts * 0.3 + _airbases * 2, _accelerator] spawn _fnc_economics;
[0.1, "", FactionGet(inv,"vehiclesTanks"), _outposts * 0.5 + _airbases * 2, _accelerator] spawn _fnc_economics;
[0.1, "", FactionGet(inv,"vehiclesAA"), _airbases, _accelerator] spawn _fnc_economics;
[0.3, "", FactionGet(inv,"vehiclesGunBoats"), _seaports, _accelerator] spawn _fnc_economics;
[0.2, "", FactionGet(inv,"vehiclesPlanesCAS"), _airbases * 4, _accelerator] spawn _fnc_economics;
[0.2, "", FactionGet(inv,"vehiclesPlanesAA"), _airbases * 4, _accelerator] spawn _fnc_economics;
[0.2, "random", FactionGet(inv,"vehiclesPlanesTransport"), _airbases * 4, _accelerator] spawn _fnc_economics;
[0.2, "random", FactionGet(inv,"vehiclesHelisTransport"), _airbases * 4, _accelerator] spawn _fnc_economics;
[0.2, "random", FactionGet(inv,"vehiclesHelisAttack"), _airbases * 4, _accelerator] spawn _fnc_economics;
[0.2, "", FactionGet(inv,"vehiclesArtillery"), _airbases + _outposts * 0.2, _accelerator] spawn _fnc_economics;
