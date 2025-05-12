/*
Author: [Killerswin2, Hakon (Stole his bb code)]
    team leader structured placer. Allows teamleaders to gain access to a
    rts like camera to place objects.
Arguments:
1. <object> object that will center placement
2. <number> number that is used for the radius of placement
Return Value:
NONE
Scope: Client
Environment: Unscheduled
Public:
no
Example:
[player, 100] call A3A_fnc_buildingPlacer.sqf
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

#include "\a3\ui_f\hpp\definedikcodes.inc"
#include "placerDefines.hpp"
#include "\x\A3A\addons\GUI\dialogues\ids.inc"

params [
    ["_centerObject", player, [objNull]],
    ["_buildingRadius", 20, [0]],
    ["_teamLeaderBox", objNull, [objNull]]
];

// Already in the placer
if(!isNil "A3A_building_EHDB") exitwith {};

[_centerObject, _buildingRadius, _teamLeaderBox] call A3A_fnc_initPlacerDB;
("A3A_PlacerHint" call BIS_fnc_rscLayer) cutRsc ["A3A_PlacerHints", "PLAIN", -1, false];
A3A_cam = "camcurator" camCreate (position _centerObject vectorAdd [0,0,5]);
A3A_cam cameraEffect ["Internal", "top"];
player enableSimulation false;

A3A_boundingCircle = [];
for "_i" from 1 to 36 do {
    private _posStart = [_buildingRadius * (cos(10*_i)), _buildingRadius * (sin(10*_i)),0] vectorAdd getPos _centerObject;
    private _piece = "Sign_Sphere100cm_F" createVehicleLocal _posStart;
    _piece enableSimulation false;
    A3A_boundingCircle pushBack _piece;
};


private _emptyDisplay = findDisplay 46 createDisplay "A3A_teamLeaderBuilder";
A3A_building_EHDB set [BUILD_DISPLAY, _emptyDisplay];
call (A3A_building_EHDB # UPDATE_BB);

private _downKeyEH = _emptyDisplay displayAddEventHandler ["KeyDown", {
    params["_displayOrControl","_key"];

    if (_key in [DIK_ESCAPE, DIK_Y]) then {
        call (A3A_building_EHDB # END_BUILD_FUNC);
    };

    if (_key isEqualTo DIK_E) then {
        A3A_building_EHDB set [ROTATION_MODE_CCW, true];
    };

    if (_key isEqualTo DIK_R) then {
        A3A_building_EHDB set [ROTATION_MODE_CW, true];
    };
}];

A3A_building_EHDB set [KEY_DOWN_EH, _downKeyEH];

private _upKeyEH = _emptyDisplay displayAddEventHandler ["KeyUp", {
    params ["_displayOrControl", "_key"];

    // Place object
    if (_key isEqualTo DIK_SPACE) then {
        private _tempObject = (A3A_building_EHDB # BUILD_OBJECT_TEMP_OBJECT);
        if (isObjectHidden _tempObject) exitWith {};
        if ((A3A_building_EHDB # BUILD_OBJECT_SELECTED_STRING) isEqualTo "Land_Can_V2_F") exitwith {};	// temp objects not built.

        if (_tempObject distance (A3A_building_EHDB # BUILD_RADIUS_OBJECT_CENTER) > (A3A_building_EHDB # BUILD_RADIUS)) exitwith {};
        if (isOnRoad getPosATL _tempObject) exitwith {};	// can't build on roads

        private _price = (A3A_building_EHDB # OBJECT_PRICE);
        private _supply = (A3A_building_EHDB # AVAILABLE_MONEY);

        // TODO: Hints don't work here, just hope players are watching the numbers for now
        if (_price > _supply) exitWith {};

        A3A_building_EHDB set [AVAILABLE_MONEY, _supply - _price];
        ["updateMoney"] call A3A_GUI_fnc_teamLeaderRTSPlacerDialog;

        private _position = getPosWorld _tempObject;
        private _dirAndUp = [vectorDir _tempObject, vectorUp _tempObject];

        private _vehicle = typeof _tempObject createVehicleLocal [0,0,0];
        _vehicle setPosWorld _position;
        _vehicle setVectorDirAndUp _dirAndUp;
        //playSound3D[getMissionPath "Sounds\hammer.ogg", player];

        (A3A_building_EHDB # BUILD_OBJECT_TEMP_OBJECT_ARRAY) pushBack _vehicle;
        (A3A_building_EHDB # BUILD_OBJECTS_ARRAY) pushBack [typeof _vehicle, objNull, _position, _dirAndUp, _price];

        _tempObject hideObject true;		// prevent unintentional double-builds
    };

    // Cancel construction
    if (_key isEqualTo DIK_C) then {
        private _tempArray = (A3A_building_EHDB # BUILD_OBJECT_TEMP_OBJECT_ARRAY);
        private _buildArray = (A3A_building_EHDB # BUILD_OBJECTS_ARRAY);
        private _objIndex = _tempArray find (A3A_building_EHDB # CURSOR_OBJECT);
        if (_objIndex == -1) exitWith {};

        deleteVehicle (_tempArray deleteAt _objIndex);
        private _buildData = _buildArray deleteAt _objIndex;
        private _supply = (A3A_building_EHDB # AVAILABLE_MONEY);
        A3A_building_EHDB set [AVAILABLE_MONEY, _supply + (_buildData#4)];
        ["updateMoney"] call A3A_GUI_fnc_teamLeaderRTSPlacerDialog;
    };

    // Repair
    if (_key isEqualTo DIK_T) then {
        private _ruin = (A3A_building_EHDB # CURSOR_OBJECT);
        if !(_ruin isKindOf "Ruins") exitWith {};
        private _building = _ruin getVariable "building";
        if (isNil "_building") then { _building = _ruin getVariable "BIS_fnc_createRuin_object" };
        if (isNil "_building") exitWith {};																	// non-rebuildable ruin
        if (-1 != (A3A_building_EHDB # BUILD_OBJECTS_ARRAY) findIf { _x#1 == _building }) exitWith {};		// already rebuilt

        // Calculate repair cost from bounding box
        private _bbsize = (boundingBoxReal _building # 1) vectorDiff (boundingBoxReal _building # 0);
        private _price = 6 * sqrt((_bbsize#0) * (_bbsize#1) * (_bbsize#2));
        _price = 10 * round (_price / 10);

        // TODO: Sort out hints or something?
        private _supply = (A3A_building_EHDB # AVAILABLE_MONEY);
        if(_price > _supply) exitWith {};
        A3A_building_EHDB set [AVAILABLE_MONEY, _supply - _price];
        ["updateMoney"] call A3A_GUI_fnc_teamLeaderRTSPlacerDialog;

        // Place imitation of repaired building
        private _oldPos = getPosATL _building;
        private _vehicle = typeof _building createVehicleLocal [0,0,0];
        _vehicle setDir getDir _building;
        _vehicle setPosATL [_oldPos#0, _oldPos#1, 0];

        (A3A_building_EHDB # BUILD_OBJECTS_ARRAY) pushBack [typeof _vehicle, _building, nil, nil, _price];
        (A3A_building_EHDB # BUILD_OBJECT_TEMP_OBJECT_ARRAY) pushBack _vehicle;
    };

    // unsafe mode
    if (_key isEqualTo DIK_LSHIFT) then {
        A3A_building_EHDB set [UNSAFE_MODE, !(A3A_building_EHDB # UNSAFE_MODE)];
        // change the text color to tell that you have entered the mode
        private _display = uiNamespace getVariable "A3A_placerHint_display";
        private _shiftText = (_display displayCtrl IDC_PLACERHINT_SHIFT_TEXT);
        if (A3A_building_EHDB # UNSAFE_MODE) then {_shiftText ctrlSetTextColor [1, 0, 0, 1];} else {_shiftText ctrlSetTextColor [1, 1, 1, 1];}
    };

    // snap to surface
    if (_key isEqualTo DIK_LALT) then {
        A3A_building_EHDB set [SNAP_SURFACE_MODE, !(A3A_building_EHDB # SNAP_SURFACE_MODE)];
        // change the text color to tell that you have entered the mode
        private _display = uiNamespace getVariable "A3A_placerHint_display";
        private _altText = (_display displayCtrl IDC_PLACERHINT_ALT_TEXT);
        if (A3A_building_EHDB # SNAP_SURFACE_MODE) then {_altText ctrlSetTextColor [1, 0, 0, 1];} else {_altText ctrlSetTextColor [1, 1, 1, 1];}
    };

    if (_key isEqualTo DIK_E) then {
        A3A_building_EHDB set [ROTATION_MODE_CCW, false];
    };

    if (_key isEqualTo DIK_R) then {
        A3A_building_EHDB set [ROTATION_MODE_CW, false];
    };

}];

A3A_building_EHDB set [KEY_UP_EH, _upKeyEH];



private _eventHanderEachFrame = addMissionEventHandler ["EachFrame", {
    private _stateChange = false;
    private _object = (A3A_building_EHDB # BUILD_OBJECT_TEMP_OBJECT);
    private _vehiclePos = screenToWorld getMousePosition;

    //change in position
    if (_object distance2d _vehiclePos > 0.1) then {
        _stateChange = true;
    };

    // Set up context-sensitive hints (cancel, repair)
    private _intersects = lineIntersectsSurfaces [getPosASL A3A_cam, AGLtoASL _vehiclePos, _object, A3A_cam];
    private _intersectObj = if (count _intersects > 0) then { _intersects#0#3 } else { objNull };
    A3A_building_EHDB set [CURSOR_OBJECT, _intersectObj];
    ["setContextKey", [""]] call A3A_GUI_fnc_setUpPlacerHints;

    //((uiNamespace getVariable "A3A_placerHint_display") displayCtrl IDC_PLACERHINT_TEST_TEXT) ctrlSetText str _intersectObj;

    if (_intersectObj isKindOf "Ruins") then {
        // Show T key and rebuild cost
        private _ruin = _intersectObj;
        private _building = _ruin getVariable "building";
        if (isNil "_building") exitWith {};																	// non-rebuildable ruin
        if (_building in antennasDead) exitWith {};                                                         // don't use this for radio towers
        if (-1 != (A3A_building_EHDB # BUILD_OBJECTS_ARRAY) findIf { _x#1 == _building }) exitWith {};		// already rebuilt

        // Calculate repair cost from bounding box
        private _bbsize = (boundingBoxReal _building # 1) vectorDiff (boundingBoxReal _building # 0);
        private _price = 6 * sqrt((_bbsize#0) * (_bbsize#1) * (_bbsize#2));
        _price = 10 * round (_price / 10);
        ["setContextKey", ["rebuild", _price]] call A3A_GUI_fnc_setUpPlacerHints;
    };

    if (_intersectObj in (A3A_building_EHDB # BUILD_OBJECT_TEMP_OBJECT_ARRAY)) then {
        // show C key
        ["setContextKey", ["cancel", getText (configof _intersectObj >> "displayName")]] call A3A_GUI_fnc_setUpPlacerHints;
    };

    if (A3A_building_EHDB # ROTATION_MODE_CCW) then {
        private _direction = ((A3A_building_EHDB # BUILD_OBJECT_TEMP_DIR) - diag_deltaTime * 120);
        A3A_building_EHDB set [BUILD_OBJECT_TEMP_DIR, _direction];
        _object setDir _direction;
        _stateChange = true;
    };

    if (A3A_building_EHDB # ROTATION_MODE_CW) then {
        private _direction = ((A3A_building_EHDB # BUILD_OBJECT_TEMP_DIR) + diag_deltaTime * 120);
        A3A_building_EHDB set [BUILD_OBJECT_TEMP_DIR, _direction];
        _object setDir _direction;
        _stateChange = true;
    };


    if (A3A_building_EHDB # GUI_BUTTON_PRESSED) then {
        A3A_building_EHDB set [GUI_BUTTON_PRESSED, false];
        _stateChange = true;
    };

    if (A3A_building_EHDB # SNAP_SURFACE_MODE) then {
        private _posASL = AGLtoASL _vehiclePos;
        private _intersects = lineIntersectsSurfaces [_posASL vectorAdd [0,0,100], _posASL vectorAdd [0,0,-100], _object];
        if (count _intersects > 0) then {
            _vehiclePos = ASLtoAGL (_intersects select 0 select 0);
        };
        _stateChange = true;
    };


    // Camera clamping
    private _centerPos = getPosATL (A3A_building_EHDB # BUILD_RADIUS_OBJECT_CENTER);
    private _cameraPos = getPosATL A3A_cam;
    private _buildRad = A3A_building_EHDB # BUILD_RADIUS;

    private _camClampPos = [0,0,0];
    _camClampPos set [0, _cameraPos#0 max (_centerPos#0 - _buildRad) min (_centerPos#0 + _buildRad)];
    _camClampPos set [1, _cameraPos#1 max (_centerPos#1 - _buildRad) min (_centerPos#1 + _buildRad)];

    // make the clamp a sphere instead of a weird rectangle
    _camClampPos set [2, _cameraPos#2 max (_centerPos#2 + 5) min (_centerPos#2 + _buildRad)];
    A3A_cam setPosATL _camClampPos;


    // Object render state update
    if (!_stateChange) exitWith {};

    _object setPosATL _vehiclePos;
    _object setDir (A3A_building_EHDB # BUILD_OBJECT_TEMP_DIR);

    // Conform for terrain surface normal in vicinity. Kinda works
    private _normTotal = surfaceNormal _vehiclePos;
    {
        _normTotal = _normTotal vectorAdd (surfaceNormal (_vehiclePos vectorAdd _x));
    } forEach [[-2,0], [2,0], [0,-2], [0,2]];
    _object setVectorUp vectorNormalized _normTotal;

    private _hide = call {
        if (_object distance (A3A_building_EHDB # BUILD_RADIUS_OBJECT_CENTER) > (A3A_building_EHDB # BUILD_RADIUS)) exitWith {true};
        if (surfaceIsWater _vehiclePos) exitWith {true};
        if (A3A_building_EHDB # UNSAFE_MODE) exitWith {false};
        if (A3A_building_EHDB # SNAP_SURFACE_MODE) exitWith {false};				// implies unsafe anyway

        // collison check, god arma what I would give for collison trigers (looking at you unity, BGE had them and it was made by 20ish guys)
        if (isNil "A3A_buildingRays") then { call (A3A_building_EHDB # UPDATE_BB) };

        -1 != A3A_buildingRays findIf {
            _x params ["_start", "_end"];
            lineIntersects [_object modelToWorldVisualWorld _start, _object modelToWorldVisualWorld _end, _object];
        };
    };
    _object hideObject _hide;

}];

A3A_building_EHDB set [EACH_FRAME_EH, _eventHanderEachFrame];