#include "..\..\dialogues\ids.inc"
#include "..\..\script_component.hpp"
#include "..\..\dialogues\defines.hpp"
#include "\a3\ui_f\hpp\definedikcodes.inc"

params ["_displayOrControl", "_key", "_shift", "_ctrl", "_alt"];

if !(_key in [DIK_RETURN, DIK_NUMPADENTER]) exitWith {}; 

// get current tab
private _display = findDisplay A3A_IDD_GUN_SHOP;
private _selectedTab = A3A_selectedTab;

// get the search text
private _text = toLower(ctrlText A3A_IDC_GUN_SHOP_SEARCH_FIELD);

private _controls = (_display getVariable ((_selectedTab#1) + "Ctrls"));
(_display getVariable ((_selectedTab) + "Ctrls" + "Meta")) params ["_modulus", "_gridWidthConst", "_gridHeightConst"];


// show all the items again if searching was an empty string
if (_text isEqualTo "") exitWith {
    {
        {
            _x ctrlShow true;
        } forEach allControls _x;

    } forEach _controls;
    {
		private _itemXPos = (_forEachIndex % _modulus) * (_gridWidthConst * GRID_W);
        private _itemYPos =  (floor (_forEachIndex / _modulus)) * (_gridHeightConst * GRID_H);
		_x ctrlSetPositionX _itemXPos;
        _x ctrlSetPositionY _itemYPos;
        _x ctrlCommit 0.1;
    } forEach _controls;
};


// go through the controls and find ones that are close to the text
private _foundControls = []; 
{
    private _controlDisplay =  _x getVariable ["displayName", ""];
    private _controlClass = _x getVariable ["className", ""];
    if ((_controlDisplay isEqualTo "") || {(((toLower _controlDisplay) find _text) isEqualTo -1) && {(((toLower _controlClass) find _text) isEqualTo -1)}}) then 
    {
        {
            _x ctrlShow false;
        } forEach allControls _x;
    } 
    else 
    {
        // the control is saved so that we can place it at the top
        _foundControls pushBack _x;
    };

} forEach _controls;



if (_foundControls isEqualTo []) exitWith {};

// move the items we found up to the top
{
    private _itemXPos = (_forEachIndex % _modulus) * (_gridWidthConst * GRID_W);
    private _itemYPos =  (floor (_forEachIndex / _modulus)) * (_gridHeightConst * GRID_H);
	_x ctrlSetPositionX _itemXPos;
    _x ctrlSetPositionY _itemYPos;
    _x ctrlCommit .5;
} forEach _foundControls;