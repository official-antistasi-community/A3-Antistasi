/*
Maintainer: Tiny
    Handles everything related to the UI for the vehicle service page, between the start and checkout.
    This function should only be called from vehServiceDialog onLoad and control activation EHs.

Arguments:
    <STRING> Mode, e.g. "onLoad", "switchTab"
    <ARRAY<ANY>> Array of params for the mode when applicable. Params for specific modes are documented in the modes.

Return Value:
    Nothing

Scope: Clients, Local Arguments, Local Effect
Environment: Scheduled for onLoad mode / Unscheduled for everything else unless specified
Public: No
Dependencies:
    None

Example:
    ["onLoad"] spawn FUNC(mainDialog); // initialization
    ["switchTab", ["player"]] call FUNC(mainDialog); // switching to the player tab

License: APL-ND

*/

#include "..\..\dialogues\ids.inc"
#include "..\..\dialogues\defines.hpp"
#include "..\..\dialogues\textures.inc"
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params[
    ["_mode","onLoad"],
    ["_params", []]
];
// setup easy reference config paths
private _veh = cursorObject; // todo; replace across all actions with more forgiving raycast
private _vehClass = typeOf _veh;
private _vehConfig = configFile >> "CfgVehicles" >> _vehClass;
private _pylonConfig =  _vehConfig >> "Components" >> "TransportPylonsComponent";
private _vehName = getText (_vehConfig >> "displayName");

// Get display
private _display = findDisplay A3A_IDD_VEHSERVICEDIALOG;

private _titlebarText = _display displayCtrl A3A_IDC_VEHSERVICE_TITLEBARTEXT;
private _ammoButton = _display displayCtrl A3A_IDC_VEHSERVICE_AMMOTABBUTTON;
private _pylonButton = _display displayCtrl A3A_IDC_VEHSERVICE_PYLONTABBUTTON;
private _repairButton = _display displayCtrl A3A_IDC_VEHSERVICE_REPAIRTABBUTTON;
private _refuelButton = _display displayCtrl A3A_IDC_VEHSERVICE_REFUELTABBUTTON;
private _resVehicle = _display displayCtrl A3A_IDC_VEHSERVICE_RESOURCEVEHICLEDATA;
private _applyButton = _display displayCtrl A3A_IDC_VEHSERVICE_APPLYBUTTON;
private _dynamicTable = _display displayCtrl A3A_IDC_VEHSERVICE_DYNAMICTABLE;
private _pylonPicture = _display displayCtrl A3A_IDC_VEHSERVICE_PYLONPICTURE;
private _pylonPresets = _display displayCtrl A3A_IDC_VEHSERVICE_PYLONPRESETS;
private _dynamicTableBackground = _display displayCtrl A3A_IDC_VEHSERVICE_DYNAMICTABLEBACKGROUND;
private _pylonPictureGroup = _display displayCtrl A3A_IDC_VEHSERVICE_PYLONPICTUREGROUP;

private _fnc_calculateAmmo = {
    params ["_magName", "_roundCount", "_magCount"];
    private _roundsPerMag = getNumber (configFile >> "CfgMagazines" >> _magName >> "count");
    private _maxTotalRounds = _magCount * _roundsPerMag;
    private _percentRemaining = _roundCount / _maxTotalRounds;
    [_percentRemaining, _maxTotalRounds];
};

switch (_mode) do
{
    case ("onLoad"):
    {
        Debug("vehServiceDialog onLoad starting...");
        _titlebarText ctrlSetText format ["Vehicle Service (%1)", _vehName];

        _repairButton ctrlEnable false;
        _refuelButton ctrlEnable false;
        _repairButton ctrlSetTooltip "Feature coming soon";
        _refuelButton ctrlSetTooltip "Feature coming soon";
        private _usePylons = isClass _pylonConfig;
        if !(_usePylons) then {
            _pylonButton ctrlEnable false;
            _pylonButton ctrlSetTooltip "This vehicle does not have editable pylons";
        };

        // extremely minimalistic functionality to autodetect correct page. expand later
        private _defaultPage = ["rearm", "pylon"] select _usePylons;
        ["switchTab", [_defaultPage]] call A3A_GUI_fnc_vehServiceDialog;    
    };

    case ("onUnload"):
    {
        Debug("vehServiceDialog onUnload starting...");

    };

    case ("switchTab"):
    {
        // Takes 1 parameter: <STRING> name of tab

        // Get selected tab
        private _selectedTab = _params select 0;

        Debug_1("vehServiceDialog switching tab to %1.", _selectedTab);

        _display setVariable ["currentMode", _selectedTab];

        private _isPylon = (_selectedTab == "pylon");
        _dynamicTable ctrlShow (!_isPylon);
        _pylonPicture ctrlShow (_isPylon);
        _pylonPresets ctrlShow (_isPylon);
        _dynamicTableBackground ctrlshow (!_isPylon);
        if (!_isPylon) then {
            private _pylonControls = _display getVariable ["pylonControls", []];
            if (count _pylonControls > 0) then {{ctrlDelete (_x#0)} foreach _pylonControls};
        };
        
        switch (_selectedTab) do {
            case ("rearm"): {

                // controls list with magazine names and sliders
                private _mags = magazinesAllTurrets _veh select {!("pylon" in toLower (_x#0))} apply { [[_x#0, _x#2]] }; //[magName, ammo]
                private _magsCombined = [];
                {
                    private _currentMag = _x#0;
                    private _index = _magsCombined findif {_x#0 isEqualTo _currentMag};
                    private _currentEntry = if (_index isEqualTo -1) then {[_currentMag, 0, 0]} else {_magsCombined select _index};
                    private _ammo = _currentEntry#1;
                    private _magCount = _currentEntry#2;
                    _magsCombined set [_x#0, _ammo + (_x#1), _magCount + 1];
                } forEach _mags;

                // not sorting these seems to return an intuitive order

                // need to filter out weapons that dont need rearm
                // left out for debugging
                //_magsCombined = _magsCombined select {((_x call _fnc_calculateAmmo)#0) < 1};

                private _percentCtrls = [];
                private _sliderCtrls = [];
                private _rowCount = -1;
                {
                    _rowCount = _rowCount + 1;

                    _x params ["_magName", "_roundCount", "_magCount"];

                    private _textCtrl = _display ctrlCreate ["A3A_Text_Small", -1, _dynamicTable];
                    _textCtrl ctrlSetPosition [0, GRID_H*_rowCount*4, GRID_W*45, GRID_H*4];
                    _textCtrl ctrlCommit 0;                 // needed?
                    _textCtrl ctrlSetText getText (configFile >> "CfgMagazines" >> _x >> "displayName");

                    private _tooltip = getText (configFile >> "CfgMagazines" >> _x >> "descriptionShort");
                    if (_tooltip isNotEqualTo "") then {
                        _textCtrl ctrlSetTooltip _tooltip;
                    };

                    private _percentCtrl = _display ctrlCreate ["A3A_Text_Small", _rowCount + A3A_IDC_SETUP_PARAMSROWS, _dynamicTable];
                    _percentCtrl ctrlSetPosition [GRID_W*49, GRID_H*_rowCount*4, GRID_W*8, GRID_H*4];
                    _percentCtrl ctrlCommit 0;
                    _percentCtrls pushBack _percentCtrl;

                    private _sliderCtrl = _display ctrlCreate ["A3A_Slider", _rowCount + A3A_IDC_SETUP_PARAMSROWS, _dynamicTable];
                    _sliderCtrl ctrlSetPosition [GRID_W*59, GRID_H*_rowCount*4, GRID_W*24, GRID_H*4];
                    _sliderCtrl sliderSetRange [0, 1];
                    _sliderCtrl ctrlCommit 0;
                    _sliderCtrls pushBack _sliderCtrl;

                    // set the initial values
                    ["onAmmoSliderChanged", [_sliderCtrl, -1]] call A3A_GUI_fnc_vehServiceDialog;
                
                } forEach _magsCombined;

                _display setVariable ["rearmData", [_magsCombined, _percentCtrls, _sliderCtrls]];

                // [["1000Rnd_Gatling_30mm_Plane_CAS_01_F",[-1],1000,1e+07,0],["Laserbatteries",[-1],1,1e+07,0],["120Rnd_CMFlare_Chaff_Magazine",[-1],120,1e+07,0],["PylonRack_1Rnd_Missile_AA_04_F",[-1],1,1e+07,0],["PylonRack_7Rnd_Rocket_04_HE_F",[-1],7,1e+07,0],["PylonRack_3Rnd_Missile_AGM_02_F",[-1],3,1e+07,0],["PylonMissile_1Rnd_Bomb_04_F",[-1],1,1e+07,0],["PylonMissile_1Rnd_Bomb_04_F",[-1],1,1e+07,0],["PylonMissile_1Rnd_Bomb_04_F",[-1],1,1e+07,0],["PylonMissile_1Rnd_Bomb_04_F",[-1],1,1e+07,0],["PylonRack_3Rnd_Missile_AGM_02_F",[-1],3,1e+07,0],["PylonRack_7Rnd_Rocket_04_AP_F",[-1],7,1e+07,0],["PylonRack_1Rnd_Missile_AA_04_F",[-1],1,1e+07,0]]
                // [["140Rnd_30mm_MP_shells_Tracer_Green",[0],131,1.00003e+07,0],["140Rnd_30mm_MP_shells_Tracer_Green",[0],140,1.00003e+07,0],["60Rnd_30mm_APFSDS_shells_Tracer_Green",[0],56,1.00003e+07,0],["60Rnd_30mm_APFSDS_shells_Tracer_Green",[0],60,1.00003e+07,0],["200Rnd_762x51_Belt_Green",[0],144,1.00003e+07,0],["200Rnd_762x51_Belt_Green",[0],200,1.00003e+07,0],["200Rnd_762x51_Belt_Green",[0],200,1.00003e+07,0],["200Rnd_762x51_Belt_Green",[0],200,1.00003e+07,0],["200Rnd_762x51_Belt_Green",[0],200,1.00003e+07,0],["200Rnd_762x51_Belt_Green",[0],200,1.00003e+07,0],["200Rnd_762x51_Belt_Green",[0],200,1.00003e+07,0],["200Rnd_762x51_Belt_Green",[0],200,1.00003e+07,0],["2Rnd_GAT_missiles_O",[0],2,1.00003e+07,0],["2Rnd_GAT_missiles_O",[0],2,1.00003e+07,0],["SmokeLauncherMag",[0,0],2,1.00003e+07,0]]
            };

            case ("pylon"): {
                // heavy inspiration / parts of code taken from the ZEN setup for pylon editing which is extremely similar to the 3den setup that seems to be protected
                // credit to the listed authors of the master setup file as of 2026.01.05: mharris001, neilzar, kexanone
                _pylonPicture ctrlSetText getText (_pylonConfig >> "uiPicture");
                _pylonPicture ctrlEnable false;
                _pylonPicture ctrlEnable false;
                (ctrlPosition _pylonPicture) params ["_pictureX", "_pictureY", "_pictureW", "_pictureH"]; // direct UI positions are needed
                _pylonList = "true" configClasses (_pylonConfig >> "Pylons");
                private _pylonControls = _display getVariable ["pylonControls", []];
                if (count _pylonControls > 0) then {{ctrlDelete (_x#0)} foreach _pylonControls};

                private _cfgMagazines = configFile >> "CfgMagazines";
                private _currentMagazines = getPylonMagazines _veh;
                private _hasGunner = [0] in allTurrets [_veh, false];
                {
                    private _uiPos = getArray (_x >> "UIposition") apply {
                        if (_x isEqualType "") then {call compile _x} else {_x}
                    };

                    _uiPos params ["_uiPosX", "_uiPosY"];

                    private _posX = (-5.5 * GRID_W) + _pictureX + _uiPosX * _pictureW * 1.25; // magic numbers. think I had to derive this for smth else. applicable outside of this menu?
                    private _posY = (1 * GRID_H) + _pictureY + _uiPosY * _pictureH * 1.6667; // 1.6

                    private _mirroredIndex = getNumber (_x >> "mirroredMissilePos") - 1;
                    private _defaultTurretPath = getArray (_x >> "turret");

                    // Pylon config can use [] as the driver turret path
                    if (_defaultTurretPath isEqualTo []) then {
                        _defaultTurretPath = [-1];
                    };

                    private _ctrlCombo = _display ctrlCreate ["ctrlCombo", -1];
                    _ctrlCombo ctrlSetPosition [_posX, _posY, (82 * GRID_W)/3, 5 * GRID_H];
                    _ctrlCombo ctrlCommit 0;

                    _ctrlCombo ctrlAddEventHandler ["LBSelChanged", {["pylonLBChanged"] call A3A_GUI_fnc_vehServiceDialog}];
                    _ctrlCombo setVariable ["index", _forEachIndex];

                    _ctrlCombo lbAdd localize "STR_3DEN_Attributes_PylonEmpty_text";
                    _ctrlCombo lbSetCurSel 0;
                    private _ignoreOption = _ctrlCombo lbAdd "Do not change";
                    _ctrlCombo lbSetData [_ignoreOption, "doNotChange"];
                    

                    // Get compatible magazines and sort them alphabetically by name
                    private _magazines = _veh getCompatiblePylonMagazines configName _x apply {
                        private _config = _cfgMagazines >> _x;
                        [getText (_config >> "displayName"), getText (_config >> "descriptionShort"), _x]
                    };

                    _magazines sort true;

                    // Add compatible magazines to the combo box and select the current one
                    private _currentMagazine = _currentMagazines select _forEachIndex;

                    {
                        _x params ["_name", "_tooltip", "_magazine"];

                        private _index = _ctrlCombo lbAdd _name;
                        _ctrlCombo lbSetTooltip [_index, _tooltip];
                        _ctrlCombo lbSetData [_index, _magazine];

                        if (_magazine == _currentMagazine) then {
                            _ctrlCombo lbSetCurSel _index;
                        };
                    } forEach _magazines;

                    // Create turret button if aircraft has a gunner position
                    private _ctrlTurret = controlNull;

                    if (_hasGunner) then {
                        _ctrlTurret = _display ctrlCreate ["ctrlButtonPictureKeepAspect", -1];
                        _ctrlTurret ctrlSetPosition [_posX - (5 * GRID_W), _posY, 5 * GRID_W, 5 * GRID_H];
                        _ctrlTurret ctrlCommit 0;

                        private _turretPath = [_veh, _forEachIndex] call EFUNC(common,getPylonTurret);
                        _ctrlTurret setVariable ["turretPath", _turretPath];
                        _ctrlTurret setVariable ["index", _forEachIndex];
                        /*
                        _ctrlTurret call FUNC(handleTurretButton);

                        // Toggle the pylon's turret when the button is clicked
                        _ctrlTurret ctrlAddEventHandler ["ButtonClick", {
                            params ["_ctrlTurret"];

                            [_ctrlTurret, true] call FUNC(handleTurretButton);
                        }];
                        */
                    };
                    ctrlSetFocus _ctrlCombo;

                    _pylonControls pushBack [_ctrlCombo, _ctrlTurret, _mirroredIndex, _defaultTurretPath];
                } forEach _pylonList;
                _display setVariable ["pylonControls", _pylonControls];
                /*
                notes:
                save controls to display    
                grab lbData from each pylon control
                compare to current control, only pushback controls that have changed
                off that count * ammo = magazine cost and it falls into place same as the mag rearm did
                see prepPylons and setAmmoData for info on how to actually set them in-game
                also need to figure out how to detect partial/depleted weapons
                */
            };

            case ("repair"): {

            };

            case ("refuel"): {

            };
            default {

            };
        }
    };

    case ("onAmmoSliderChanged"):
    {
        _params params ["_control", "_newValue"];
        private _isInit = _newValue == -1;
        private _rearmData = _display getVariable "rearmData";
        private _index = (_rearmData#2) find _control;
        private _ammoData = _rearmData#0#_index;
        (_ammoData call _fnc_calculateAmmo) params ["_percentRemaining", "_maxTotalRounds"];
        _ammoData params ["_magName", "_roundCount", "_magCount"];
        private _currentAmmoLevel = _roundCount / _maxTotalRounds;
        if (_newValue < _currentAmmoLevel) then {_control sliderSetPosition _currentAmmoLevel; _newValue = _currentAmmoLevel};
        private _percentCtrl = _rearmData#1#_index;
        private _sliderCtrl = _rearmData#2#_index;
        _percentCtrl ctrlSetText format ["%1%", floor (_percentRemaining * 100)]; // floor is important so you dont rearm a 100% full mag
        _sliderCtrl sliderSetPosition (floor (_percentRemaining * 100) / 100); // 2 points of accuracy
        _percentCtrl ctrlSetTooltip format ["%1/%2", _roundCount, _maxTotalRounds];
        // recalulate
        if (_isInit) exitWith {};
        ["calculateCosts"] call A3A_GUI_fnc_vehServiceDialog;
    };

    case ("calculateCosts"):
    {
        private _mode = _display getVariable "currentMode";
        private _totalCost = 0;
        private _purchaseList = [];
        switch (_mode) do {
            case "rearm": 
            {
                private _rearmData = _display getVariable "rearmData";
                {
                    _x params ["_ammoData", "_percentCtrl", "_sliderCtrl"];
                    _ammoData params ["_magName", "_roundCount", "_magCount"];
                    (_ammoData call _fnc_calculateAmmo) params ["_percentRemaining", "_maxTotalRounds"];

                    private _curSel = sliderPosition _sliderCtrl;
                    private _percentDiff = _curSel - _percentRemaining;
                    if (_percentDiff < 0.01) then {continue};

                    private _roundsToBuy = if (_curSel == 1) then {
                        _maxTotalRounds - _roundCount
                    } else {
                        _maxTotalRounds * _percentDiff
                    };

                    private _roundPrice = [_magName] call A3A_fnc_calculateVehAmmoPrice;
                    private _orderPrice = _roundPrice * _roundsToBuy;
                    _totalCost = _totalCost + _orderPrice;

                    _purchaseList pushBack [_magName, _roundsToBuy, _orderPrice];

                } forEach _rearmData;
            };
            case ("pylon"): {
                private _controls = _display getVariable "pylonControls";
                private _uiMagList = _controlsList apply {_x#0 lbData (lbCurSel _x#0)};
                private _vehDataList = getAllPylonsInfo _veh;
                {  
                    _x params ["_pylonIndex", "_pylonName", "_turretPath", "_magName", "_countRounds"];
                    private _uiMag = _uiMagList#_forEachIndex;
                    if (_uiMag isEqualTo "doNotChange") then { continue };

                    private _maxRounds = getNumber (configFile >> "CfgMagazines" >> _uiMag >> "count");
                    private _roundPrice = [_magName] call A3A_fnc_calculateVehAmmoPrice;
                    private _roundsToBuy = _maxRounds - _countRounds;
                    private _orderPrice = _roundPrice * _roundsToBuy;

                    if (_uiMag isNotEqualTo _magName) then {_purchaseList pushBack [_uiMag, _maxRounds, _orderPrice, _pylonIndex]; continue };
                    if (_maxRounds isEqualTo _countRounds) then { continue }; // same pylon as marked and full, no issue here

                    _purchaseList pushBack [_uiMag, _roundsNeeded, _orderPrice, _pylonIndex, _turretPath];
                } forEach _vehDataList;
            };

            case ("repair"): {

            };

            case ("refuel"): {

            };

            default {

            };
        };

        _applyButton ctrlSetText format [localize format ["STR_antistasi_vehService_apply%1", ["points", "refuel"] select (_mode isEqualTo "refuel")], round _totalCost];
        ([_mode, getPosATL player, 25] call A3A_fnc_lookForSupplyVehicle) params ["_selSupplyVehicle", "_remCargo"];
        private _stringSuffix = [_mode, "rearm"] select (_mode isEqualTo "pylon");
        if (count _purchaseList == 0 || (isNull _selSupplyVehicle) || (_remCargo < _totalCost)) exitWith {
            _applyButton ctrlEnable false;
            private _response = switch (_mode) do {
                case (count _purchaseList == 0) : {
                    localize format ["STR_antistasi_vehService_nothing%1", _stringSuffix];
                };
                case (isNull _selSupplyVehicle): {
                    localize format ["STR_antistasi_vehService_noNear%1", _stringSuffix];
                };
                case (_remCargo < _totalCost): {
                    private _ammoTruckName = getText (configFile >> "CfgVehicles" >> typeOf _selSupplyVehicle >> "displayName");
                    format [localize format ["STR_antistasi_vehService_noNear%1", _stringSuffix], _ammoTruckName, player distance _selSupplyVehicle, _remCargo];
                };
            };
            _applyButton ctrlSetTooltip _response;
        };
        _applyButton ctrlEnable true;
        private _prettyPurchaseList = (_purchaseList apply {
            _x params ["_name", "_roundsToBuy", "_orderPrice"];
            private _prettyName = getText (configFile >> "CfgMagazines" >> _x >> "displayName"); // TODO: when expanded to repair, get different path
            format [localize format ["STR_antistasi_vehService_cost%1", _stringSuffix], _orderPrice, _roundsToBuy, _prettyName];
        }) joinString "<br/>";
        _applyButton ctrlSetTooltip _purchaseList;
        _display setVariable ["purchaseList", _purchaseList];
    };
    
    case ("checkout"):
    {
        private _purchaseList = _display getVariable ["purchaseList", []];
        private _mode = _display getVariable "currentMode";
        private _stringSuffix = [_mode, "rearm"] select (_mode isEqualTo "pylon");
        if (count _purchaseList == 0) exitWith {};
        closeDialog 0;
        if (player distance _veh > 25) exitWith {[localize "STR_antistasi_vehService_hintTitle", localize [format "STR_antistasi_vehService_tooFar%1", _stringSuffix]] spawn A3A_fnc_customHint};
        [_veh, _currentMode, _purchaseList] spawn A3A_fnc_serviceVehicle;
    };

    case ("onUnload"):
    {

    };

    default {
        // Log error if attempting to call a mode that doesn't exist
        Error_1("vehServiceDialog mode does not exist: %1", _mode);
    };
};
