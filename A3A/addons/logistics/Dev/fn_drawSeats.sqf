/*
    Author:
        Silence

    Description:
        Handles grabbing seat positions and index then drawing them to 3D space.

    Params:
	    _vehicle <OBJECT> <Default: ObjNull>

    Usage:
        [cursorObject] call A3A_logistics_fnc_drawSeats;
*/

#define SIZETEXT 0.05
#define SIZEICON 1.2
#define ICON "a3\ui_f\data\Map\Markers\Military\dot_ca.paa"
#define COLOUR [1,1,1,0.8]

params [["_vehicle", ObjNull]];

if (_vehicle isEqualTo ObjNull) exitWith {false};

if (_vehicle getVariable ["A3A_helper_seatDrawer", ""] isNotEqualTo "") exitWith {
    removeMissionEventHandler ["Draw3D", _vehicle getVariable "A3A_helper_seatDrawer"];
    
    _vehicle setVariable ["A3A_helper_seatDrawer", ""];
};

private _selections = _vehicle selectionNames "FireGeometry";
private _selectionsNames = [];
private _selectionsCoords = [];

{
    private _inModelPosition = _vehicle selectionPosition [_x, "FireGeometry", "FirstPoint"];

	private _splitSelections = _x splitString "";
	private _splitSelection = parseNumber ((_splitSelections select -3) + (_splitSelections select -2) + (_splitSelections select -1)) - 1; // get the last 3 numbers

	private _seatIndex = str _splitSelection; // Converts the int back to a string

    // The below could be a false positive if a selection isn't a seat but does have cargo/gunner in its name, though I have not encountered this yet
    if ("cargo" in _x || {"gunner" in _x}) then {
        _selectionsCoords pushBack _inModelPosition;
        _selectionsNames pushBack _seatIndex;
    };
} forEach _selections;

private _helperID = addMissionEventHandler ["Draw3D", {
    private _selectionsNames = (_thisArgs select 0);
    private _selectionsCoords = (_thisArgs select 1);
    private _vehicle = (_thisArgs select 2);

    {
        private _name = _selectionsNames select _forEachIndex;
        drawIcon3D [
            ICON,
            COLOUR,
            _vehicle modelToWorldVisual (_selectionsCoords select _forEachIndex),
            SIZEICON,SIZEICON,0,
            _name,
            0,
            SIZETEXT
        ];
    } forEach _selectionsCoords;
}, [_selectionsNames, _selectionsCoords, _vehicle]];

_vehicle setVariable ["A3A_helper_seatDrawer", _helperID];