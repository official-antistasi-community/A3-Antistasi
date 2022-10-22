/*
Author: [Killerswin2, Hakon (Stole his bb code)]
	creates the controls for the dialog. Picture and Button are created. Data Saved to buttons. 
Arguments:
1. <string> string for initilizer
Return Value:
NONE
Scope: Client
Environment: scheduled
Public: 
no
Example:
["onLoad"] spawn A3A_fnc_teamLeaderRTSPlacerDialog
*/




#include "..\..\dialogues\ids.inc"
#include "..\..\dialogues\defines.hpp"
#include "..\..\dialogues\textures.inc"
#include "..\..\script_component.hpp"
#include "\x\A3A\addons\core\functions\UtilityItems\placerDefines.hpp"
#define BOTTOM safeZoneH + safeZoneY
FIX_LINE_NUMBERS()

params[["_mode","onLoad"], ["_params",[]]];

switch (_mode) do
{
	case ("onLoad"):
    {
		private _display = findDisplay A3A_IDD_TEAMLEADERDIALOG;
		private _parent = (_display displayCtrl A3A_IDC_TEAMLEADERBUILDERMAIN);
		private _buildControlsGroup = _parent controlsGroupCtrl A3A_IDC_TEAMLEADERBUILDINGGROUP;


		private _buildableObjects = A3A_buildableObjects;
		

		{
			_x params [
				["_className", "Land_Tyres_F"],
				["_price", 0],
				["_holdTime", 15]
			];

			private _configClass = configFile >> "CfgVehicles" >> _className;
			private _displayName = getText (_configClass >> "displayName");
			private _editorPreview = getText (_configClass >> "editorPreview");
			private _model = getText (_configClass >> "model");
	
			private _hasVehiclePreview = fileExists _editorPreview;

            if (!_hasVehiclePreview) then {
                _editorPreview = A3A_PlaceHolder_NoVehiclePreview;
            };
	
			private _itemXpos = 7 * GRID_W + ((7 * GRID_W + 44 * GRID_W) * (_forEachIndex % 3));
			private _itemYpos = (floor (_forEachIndex / 3)) * (44 * GRID_H);

			private _itemControlsGroup = _display ctrlCreate ["A3A_ControlsGroupNoScrollbars", A3A_IDC_TEAMLEADERBUILDITEMGROUP, _buildControlsGroup];
			_itemControlsGroup ctrlSetPosition[_itemXpos, _itemYpos, 44 * GRID_W, 36 * GRID_H];
			_itemControlsGroup ctrlSetFade 1;
			_itemControlsGroup ctrlCommit 0;

			private _previewPicture = _display ctrlCreate ["A3A_Picture", A3A_IDC_TEAMLEADERBUILDIMAGEPREVIEW, _itemControlsGroup];
			_previewPicture ctrlSetPosition [0, 0, 44 * GRID_W, 25 * GRID_H];
			_previewPicture ctrlSetText _editorPreview;
			_previewPicture ctrlCommit 0;
	
			private _button = _display ctrlCreate ["A3A_ShortcutButton", A3A_IDC_TEAMLEADERBUILDBUTTON, _itemControlsGroup];
			_button ctrlSetPosition [0, 25 * GRID_H, 44 * GRID_W, 8 * GRID_H];
			_button ctrlSetText _displayName;
			_button setVariable ["className", _className];
			_button setVariable ["model", _model];
			_button setVariable ["price", _price];
			_button setVariable ["holdTime", _holdTime];
			_button ctrlCommit 0;

			_button ctrlAddEventHandler ["ButtonDown", {
				params ["_control"];

				if(isNil "A3A_building_EHDB") then {
					// how the fuck did you do this? No databases?
					call A3A_initBuildingDB;
				};

				private _className = _control getVariable ["className", "Land_Tyres_F"];
				private _price = _control getVariable ["price", 0];
				private _holdTime = _control getVariable ["holdTime", 15];

				private _object = (A3A_building_EHDB # BUILD_OBJECT_TEMP_OBJECT);
				private _direction = (A3A_building_EHDB # BUILD_OBJECT_TEMP_DIR);

				A3A_building_EHDB set [BUILD_OBJECT_SELECTED_STRING, _className];
				A3A_building_EHDB set [HOLD_TIME, _holdTime];
				A3A_building_EHDB set [OBJECT_PRICE, _price];

				private _vehPos =  getPos _object;
				deleteVehicle _object;

				A3A_building_EHDB set [BUILD_OBJECT_TEMP_OBJECT, _className createVehicleLocal [0,0,0]];
				_object enableSimulationGlobal false;
				_object setPos _vehPos; 
				_object setDir _direction;
				call (A3A_building_EHDB # UPDATE_BB);
			}];

			_button ctrlAddEventHandler ["MouseEnter", {
                params ["_control"];
                if (true || isNil "Dev_GUI_prevInjectEnter") then {
                    params ["_control"];
                    private _UIScaleAdjustment = (0.55/getResolution#5);  // I tweaked this on UI Small, so that's why the 0.55 is the base size.

                    private _model = _control getVariable "model";
                    private _className = _control getVariable "className";
                    private _display = findDisplay A3A_IDD_TEAMLEADERDIALOG;  // 9300;
                    private _objPreview = _display displayCtrl A3A_IDC_TEAMLEADERBUILDINGRENDER;  // 9303;
                    _objPreview ctrlSetModel _model;
                    private _boundingDiameter = [_className] call FUNC(sizeOf);
                    _objPreview ctrlSetModelScale (2.25/(_boundingDiameter) * _UIScaleAdjustment);
                    _objPreview ctrlSetModelDirAndUp [[-0.6283,0.3601,0.6896],[-0.0125,-0.5015,0.8651]];  // x y z

                    private _editorPreviewPicture = ctrlParentControlsGroup _control controlsGroupCtrl A3A_IDC_TEAMLEADERBUILDIMAGEPREVIEW;  // 9304;
                    private _mouseAbsolutePos = getMousePosition;
                    private _mouseRelativePos = ctrlMousePosition _editorPreviewPicture;
                    _mouseAbsolutePos vectorDiff _mouseRelativePos params ["_objPreview_x", "_objPreview_y"];


                    private _yAdjustment = 0.25 * _UIScaleAdjustment;
                    _objPreview ctrlSetPosition [_objPreview_x + 0.5 * (22 * pixelW * pixelGridNoUIScale), 4, _objPreview_y - 0.5 * (12.5 * pixelW * pixelGridNoUIScale) + _yAdjustment];
                    _editorPreviewPicture ctrlShow false;
                    _editorPreviewPicture ctrlCommit 1;

                    _objPreview ctrlShow true;
                    _objPreview ctrlEnable false;  // Prevent the user dragging it.
                } else {
                    _control call Dev_GUI_prevInjectEnter;
                };
            }];
            _button ctrlAddEventHandler ["MouseExit", {
                params ["_control"];
                if (true || isNil "Dev_GUI_prevInjectExit") then {
                    params ["_control"];
                    private _display = findDisplay A3A_IDD_TEAMLEADERDIALOG;  // 9300;
                    private _objPreview = _display displayCtrl A3A_IDC_TEAMLEADERBUILDINGRENDER;  // 9303;

                    private _editorPreviewPicture = ctrlParentControlsGroup _control controlsGroupCtrl A3A_IDC_TEAMLEADERBUILDIMAGEPREVIEW;  // 9304;

                    _editorPreviewPicture ctrlShow true;
                    _editorPreviewPicture ctrlCommit 1;

                    _objPreview ctrlShow false;
                } else {
                    _control call Dev_GUI_prevInjectExit;
                };
            }];
			if (_price isNotEqualTo 0) then {
				private _priceText = _display ctrlCreate ["A3A_InfoTextRight", -1, _itemControlsGroup];
				_priceText ctrlSetPosition[23 * GRID_W, 21 * GRID_H, 20 * GRID_W, 3 * GRID_H];
				_priceText ctrlSetText format ["%1 €",_price];
				_priceText ctrlCommit 0;
			};

			private _buildTime = _display ctrlCreate ["A3A_PictureStroke", -1, _itemControlsGroup];
			_buildTime ctrlSetPosition[1 * GRID_W, 21 * GRID_H, 4 * GRID_W, 4 * GRID_H];
			_buildTime ctrlSetText A3A_Icon_Construct;
			_buildTime ctrlSetTooltip format [localize "STR_antistasi_teamleader_placer_holdtime", _displayName, _holdTime];
			_buildTime ctrlCommit 0;
	
			// show stuff
			_itemControlsGroup ctrlSetFade 0;
            _itemControlsGroup ctrlCommit 0.1;

		} forEach _buildableObjects;

		_display setVariable ["displayCordinates", [CENTER_X(160), BOTTOM - PX_H(36), (PX_W(160)) / 2, (PX_H(36)) / 2]];

		_display displayAddEventHandler ["MouseMoving", {

			params[ "_display" ];

			private _paramsArray = _display getVariable ["displayCordinates", [1,1,1,1]];
			_paramsArray params ["_xPos", "_yPos", "_wPos", "_hPos"];
			

			private _isMouseInArea = getMousePosition inArea[[ _xPos + _wPos, _yPos + _hPos ], _wPos, _hPos, 0, true];

			if (_isMouseInArea) then {
				A3A_cam camCommand "manual off";
			} else {
				A3A_cam camCommand "manual on";
			};
			
		}];

		_txt = _display ctrlCreate[ "A3A_StructuredText", -1];
		_txt ctrlSetPosition[ (1.4 * safeZoneX) + safeZoneW, -0.65 * safeZoneY, 0.5, 0.3];			// funkiness because I don't want to deal with dialogs anymore tonight
		_txt ctrlCommit 0;
		_txt ctrlSetStructuredText parseText localize "STR_antistasi_teamleader_placer_placer_info";
	};

	default
    {
        // Log error if attempting to call a mode that doesn't exist
        Error_1("BuyVehicleDialog mode does not exist: %1", _mode);
    };
};