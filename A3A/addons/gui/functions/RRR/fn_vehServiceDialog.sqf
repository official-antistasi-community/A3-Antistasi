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
    ["onLoad"] spawn FUNC(vehServiceDialog); // initialization

License: APL-ND

*/

#include "..\..\dialogues\ids.inc"
#include "..\..\dialogues\defines.hpp"
#include "..\..\dialogues\textures.inc"
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

#define BLACKLISTED_MAGS ["FakeWeapon", "FakeMagazine"]
#define BLACKLISTED_SIMS ["laserDesignate"]

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
private _globalControlGroup = _display displayCtrl A3A_IDC_VEHSERVICE_CONTROLGROUP;

private _fnc_calculateAmmo = {
    params ["_magName", "_roundCount", "_magCount"];
    private _roundsPerMag = getNumber (configFile >> "CfgMagazines" >> _magName >> "count");
    _magCount * _roundsPerMag;
};
private _fnc_getName = {
    params ["_name", ["_cfg", "CfgMagazines"]];
    getText (configFile >> _cfg >> _name >> "displayName");
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
        private _pylonControls = _display getVariable ["pylonControls", []];
        if (count _pylonControls > 0) then {{ctrlDelete (_x#0)} foreach _pylonControls};
        _pylonControls = [];
        private _ammoControls = flatten ((_display getVariable ["rearmData", []]) apply {[_x#1, _x#2, _x#3]});
        if (count _ammoControls > 0) then {{ctrlDelete _x} foreach _ammoControls};
        _display setVariable ["pylonControls", []];
        _display setVariable ["rearmData", []];

        switch (_selectedTab) do {
            case ("rearm"): {
                (["rearm", getPosATL player, 25] call A3A_fnc_lookForSupplyVehicle) params ["_selSupplyVehicle", "_remCargo"];
                if (isNull _selSupplyVehicle) then {
                    _resVehicle ctrlSetText "None found";
                } else {
                    private _vehicleName = [typeOf _selSupplyVehicle, "CfgVehicles"] call _fnc_getName;
                    _resVehicle ctrlSetText format ["%1 (%2 points)", _vehicleName, round _remCargo];
                };
                

                // controls list with magazine names and sliders
                private _mags = magazinesAllTurrets cursorObject select {!("pylon" in toLower (_x#0))}; // apply { [_x#0, _x#2]] }; //[magName, ammo]
                // not sorting these seems to return an intuitive order. edit: lies, its based on the last mag added.
                //the good way to do this is to match it up with config which is not happening. most I can do is make it deterministic and dumb
                _mags sort true;

                // new format? [magclass, turret, bulletCount, magCount], was [magclass, bullets, mags]
                private _magsCombined = []; 
                {
                    _x params ["_mag", "_turret", "_bullets"];
                    // blacklist
                    if (_mag in BLACKLISTED_MAGS) then {continue};
                    // check for laser
                    private _ammo = getText(configFile >> "CfgMagazines" >> _mag >> "ammo");
                    private _sim = getText(configFile >> "CfgAmmo" >> _ammo >> "simulation");
                    if (_sim in BLACKLISTED_SIMS) then {continue};

                    // blacklist over
                    private _currentMagIndex = _magsCombined findIf {_x#0 == _mag and _x#3 isEqualTo _turret};
                    if (_currentMagIndex == -1) then { _magsCombined pushBack [_mag, 0, 0, _turret] };
                    private _currentMagInfo = _magsCombined select _currentMagIndex;        // select -1 picks last element                    
                    _currentMagInfo set [1, _currentMagInfo#1 + _bullets];
                    _currentMagInfo set [2, _currentMagInfo#2 + 1];
                } forEach _mags;


                // need to filter out weapons that dont need rearm
                // left out for debugging
                // edit 3 weeks later: actually dont need this? all mags can be visible regardless
                //_magsCombined = _magsCombined select {((_x call _fnc_calculateAmmo)#0) < 1};
                private _weapons = flatten ((allTurrets cursorObject + [[-1]]) apply { cursorObject weaponsTurret _x });
                private _dataList = [];
                private _rowCount = -1;                
                {
                    _rowCount = _rowCount + 1;

                    _x params ["_magName", "_roundCount", "_magCount", "_turret"];
                    private _maxRounds = _x call _fnc_calculateAmmo;

                    private _data = [_x];
                    private _textCtrl = _display ctrlCreate ["A3A_Text_Small", -1, _dynamicTable];
                    _textCtrl ctrlSetPosition [0, GRID_H*_rowCount*6, GRID_W*45, GRID_H*4];
                    _textCtrl ctrlCommit 0;
                    private _prettyName = [_magName] call _fnc_getName;
                    if (_prettyName isEqualTo "") then {
                        private _index = _weapons findIf {
                            private _magazines = getArray (configFile >> "CfgWeapons" >> _x >> "magazines");
                            (_magazines findIf {_x isEqualTo _magName}) > -1;
                        };
                        private _selWeapon = _weapons select _index;
                        _prettyName = [_selWeapon, "CfgWeapons"] call _fnc_getName;
                    };
                    if (_turret isNotEqualTo [-1]) then { _textCtrl ctrlSetTooltip format ["Turret path %1", _turret] };
                    _textCtrl ctrlSetText _prettyName;

                    // this doesnt actually kick out useful info
                    /*
                    private _tooltip = getText (configFile >> "CfgMagazines" >> _magName >> "descriptionShort");
                    if (_tooltip isNotEqualTo "") then {
                        _textCtrl ctrlSetTooltip _tooltip;
                    };
                    */

                    private _percentCtrl = _display ctrlCreate ["A3A_Text_Small", _rowCount + A3A_IDC_SETUP_PARAMSROWS, _dynamicTable];
                    _percentCtrl ctrlSetPosition [GRID_W*54, GRID_H*_rowCount*6, GRID_W*12, GRID_H*4];
                    _percentCtrl ctrlCommit 0;
                    _data pushBack _percentCtrl;

                    private _sliderCtrl = _display ctrlCreate ["A3A_Slider", _rowCount + A3A_IDC_SETUP_PARAMSROWS, _dynamicTable];
                    _sliderCtrl ctrlAddEventHandler ["sliderPosChanged", {["onAmmoSliderChanged", _this] spawn A3A_GUI_fnc_vehServiceDialog}];
                    _sliderCtrl ctrlSetPosition [GRID_W*67, GRID_H*_rowCount*6, GRID_W*30, GRID_H*4];
                    _sliderCtrl sliderSetRange [0, _maxRounds];
                    _sliderCtrl sliderSetSpeed [1 max 0.01*_maxRounds, 1, 1];
                    _sliderCtrl ctrlCommit 0;

                    _data pushBack _sliderCtrl;
                    _data pushBack _textCtrl;
                    _dataList pushBack _data;
                
                } forEach _magsCombined;

                _display setVariable ["rearmData", _dataList];

                // initialize slider positions
                {
                    ["onAmmoSliderChanged", [_x#2, -1]] call A3A_GUI_fnc_vehServiceDialog;
                } forEach _dataList;

                ["calculateCosts"] call A3A_GUI_fnc_vehServiceDialog; // init
            };

            case ("pylon"): {
                // heavy inspiration / parts of code taken from the ZEN setup for pylon editing which is extremely similar to the 3den setup that seems to be protected
                // credit to the listed authors of the master setup file as of 2026.01.05: mharris001, neilzar, kexanone
                _display setVariable ["A3A_building", true];

                (["pylon", getPosATL player, 25] call A3A_fnc_lookForSupplyVehicle) params ["_selSupplyVehicle", "_remCargo"];
                if (isNull _selSupplyVehicle) then {
                    _resVehicle ctrlSetText "None found";
                } else {
                    private _vehicleName = [typeOf _selSupplyVehicle, "CfgVehicles"] call _fnc_getName;
                    _resVehicle ctrlSetText format ["%1 (%2 points)", _vehicleName, _remCargo];
                };

                _pylonPicture ctrlSetText getText (_pylonConfig >> "uiPicture");
                _pylonPicture ctrlEnable false;
                _pylonPicture ctrlEnable false;
                (ctrlPosition _pylonPicture) params ["_pictureX", "_pictureY", "_pictureW", "_pictureH"]; // direct UI positions are needed
                _pylonList = "true" configClasses (_pylonConfig >> "Pylons");
                (ctrlPosition _globalControlGroup) params ["_groupX", "_groupY"];

                private _cfgMagazines = configFile >> "CfgMagazines";
                private _currentMagazines = getPylonMagazines _veh;
                private _hasGunner = [0] in allTurrets [_veh, false];
                {
                    private _uiPos = getArray (_x >> "UIposition") apply {
                        if (_x isEqualType "") then {call compile _x} else {_x}
                    };

                    _uiPos params ["_uiPosX", "_uiPosY"];

                    private _posX = (-7 * GRID_W) + _pictureX - _groupX + _uiPosX * _pictureW * 1.5; // magic numbers. think I had to derive this for smth else. applicable outside of this menu?
                    private _posY = (0.5 * GRID_H) + _pictureY - _groupY + _uiPosY * _pictureH * 1.6667; // 1.6

                    private _mirroredIndex = getNumber (_x >> "mirroredMissilePos") - 1;
                    private _defaultTurretPath = getArray (_x >> "turret");

                    // Pylon config can use [] as the driver turret path
                    if (_defaultTurretPath isEqualTo []) then {
                        _defaultTurretPath = [-1];
                    };

                    private _ctrlCombo = _display ctrlCreate ["ctrlCombo", -1, _globalControlGroup];
                    _ctrlCombo ctrlSetPosition [_posX, _posY, (55 * GRID_W)/3, 3 * GRID_H];
                    _ctrlCombo ctrlCommit 0;

                    _ctrlCombo ctrlAddEventHandler ["LBSelChanged", {["pylonLBChanged", _this] call A3A_GUI_fnc_vehServiceDialog}];
                    _ctrlCombo setVariable ["index", _forEachIndex];

                    // Get compatible magazines and sort them alphabetically by name
                    private _magazines = _veh getCompatiblePylonMagazines configName _x apply {
                        private _config = _cfgMagazines >> _x;
                        [getText (_config >> "displayName"), getText (_config >> "descriptionShort"), _x]
                    };

                    _magazines sort true;
                    _magazines insert [0, [["<do not change>", "This option will not rearm or change the pylon", "doNotChange"], ["<rearm>", "This option will rearm this specific pylon", "rearm"], [localize "STR_3DEN_Attributes_PylonEmpty_text", "This option will leave the pylon empty", ""]]];

                    // Add compatible magazines to the combo box and select the current one
                    private _currentMagazine = _currentMagazines select _forEachIndex;

                    {
                        _x params ["_name", "_tooltip", "_magazine"];

                        private _index = _ctrlCombo lbAdd _name;
                        _ctrlCombo lbSetTooltip [_index, _tooltip];
                        _ctrlCombo lbSetData [_index, _magazine];

                        if (_magazine == _currentMagazine) then {
                            //_ctrlCombo lbSetCurSel _index;
                            if (_magazine isEqualTo "") then {_name = "None"};
                            _ctrlCombo setVariable ["A3A_curWeaponName", _name];
                            _ctrlCombo ctrlSetTooltip format ["Current pylon: %1", _name];
                        };
                    } forEach _magazines;
                    _ctrlCombo lbSetCurSel ([0,2] select (_currentMagazine isEqualTo ""));

                    // Create turret button if aircraft has a gunner position
                    private _ctrlTurret = controlNull;

                    if (_hasGunner) then {
                        _ctrlTurret = _display ctrlCreate ["ctrlButtonPictureKeepAspect", -1, _globalControlGroup];
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
                _display setVariable ["A3A_building", false];
                ["calculateCosts"] call A3A_GUI_fnc_vehServiceDialog;
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
        private _rearmData = _display getVariable ["rearmData", []];
        if (_rearmData isEqualTo []) exitWith {}; // possible to quit mid update cycle
        private _index = _rearmData findIf {(_x#2) isEqualTo _control};
        (_rearmData#_index) params ["_ammoData", "_percentCtrl", "_sliderCtrl"];
        private _maxRounds = _ammoData call _fnc_calculateAmmo;
        _ammoData params ["_magName", "_roundCount", "_magCount"];
        if (_newValue < _roundCount) then {
            _control sliderSetPosition _roundCount;         // apparently this doesn't call the EH?
            _newValue = _roundCount;
        };
        private _sliderPercent = floor (100 * _newValue / _maxRounds);
        if (_newValue > _roundCount) then {
            private _startingPercent = floor (100 * _roundCount / _maxRounds);
            _percentCtrl ctrlSetText format ["%1%2 + %3%4", _startingPercent, "%", _sliderPercent - _startingPercent, "%"];
            _percentCtrl ctrlSetTooltip format ["%1 + %2 / %3", _roundCount, _newValue - _roundCount, _maxRounds];
        } else {
            _percentCtrl ctrlSetText format ["%1%2", _sliderPercent, "%"];
            _percentCtrl ctrlSetTooltip format ["%1 / %2", _roundCount, _maxRounds];
        };
        // recalculate
        if (_isInit) exitWith {};
        ["calculateCosts"] call A3A_GUI_fnc_vehServiceDialog;
    };

    case ("pylonLBChanged"):
    {
        _params params ["_control", "_lbCurSel"];
        if (_display getVariable ["A3A_building", false]) exitWith {};
        private _tooltip = _control getVariable ["A3A_curWeaponName", "None"];
        _control ctrlSetTooltip format ["Current weapon: %1", _tooltip];
        ["calculateCosts"] call A3A_GUI_fnc_vehServiceDialog;
    };

    case ("calculateCosts"):
    {
        private _mode = _display getVariable "currentMode";
        private _totalCost = 0;
        private _purchaseList = [];
        private _prettyPurchaseList = [];
        private _stringSuffix = [_mode, "rearm"] select (_mode isEqualTo "pylon");

        ([_mode, getPosATL player, 25] call A3A_fnc_lookForSupplyVehicle) params ["_selSupplyVehicle", "_remCargo"];
        _display setVariable ["A3A_supplyVehicle", _selSupplyVehicle];

        switch (_mode) do {
            case "rearm": {
                private _rearmData = _display getVariable "rearmData";
                {
                    _x params ["_ammoData", "_percentCtrl", "_sliderCtrl", "_textCtrl"];
                    _ammoData params ["_magName", "_roundCount", "_magCount", "_turret"];

                    private _curSel = sliderPosition _sliderCtrl;
                    private _roundsToBuy = _curSel - _roundCount;
                    if (_roundsToBuy == 0) then {continue};

                    private _count = getNumber (configFile >> "CfgMagazines" >> _magName >> "count") max 1;
                    private _roundPrice = ([_magName, "mag"] call A3A_GUI_fnc_calculateItemPrice) / _count;
                    private _orderPrice = _roundPrice * _roundsToBuy;
                    _totalCost = _totalCost + _orderPrice;

                    _purchaseList pushBack [_magName, _roundsToBuy, _orderPrice, ctrlText _textCtrl, nil, nil, _turret];

                } forEach _rearmData;

                {
                    _x params ["_name", "_roundsToBuy", "_orderPrice", "_prettyName"];
                    _prettyPurchaseList pushBack format [localize format ["STR_antistasi_vehService_cost%1", _stringSuffix], _roundsToBuy, _prettyName, round _orderPrice];
                } forEach _purchaseList;
            };
            case ("pylon"): {
                private _controlsList = _display getVariable "pylonControls";
                private _uiMagList = _controlsList apply {(_x#0) lbData (lbCurSel (_x#0))};
                private _vehDataList = getAllPylonsInfo _veh;
                {  
                    _x params ["_pylonIndex", "_pylonName", "_turretPath", "_magName", "_countRounds"];
                    if (_countRounds < 0) then {_countRounds = 0};
                    private _uiMag = _uiMagList#_forEachIndex;
                    if (_uiMag isEqualTo "doNotChange") then { continue };

                    // old: currently on the plane
                    // new: currently selected in UI

                    private _oldMaxRounds = getNumber (configFile >> "CfgMagazines" >> _magName >> "count");

                    private _count = getNumber (configFile >> "CfgMagazines" >> _magName >> "count") max 1;
                    private _oldRoundPrice = ([_magName, "mag"] call A3A_GUI_fnc_calculateItemPrice) / _count;
                    private _oldRoundsToBuy = _oldMaxRounds - _countRounds;
                    private _oldOrderPrice = _oldRoundPrice * _oldRoundsToBuy;

                    // can kind of early exit here for rearm

                    if (_uiMag isEqualTo _magName || (_uiMag isEqualTo "rearm")) then {
                        if !(_oldMaxRounds isEqualTo _countRounds) then { // rearm
                            _totalCost = _totalCost + _oldOrderPrice;
                            _purchaseList pushBack [_magName, _oldRoundsToBuy, _oldOrderPrice, [_magName] call _fnc_getName, false, _pylonIndex, _turretPath]; 
                        };
                        continue;
                    };

                    // if last mag != "" then refund last mag
                    // if new mag != "" then add cost for new mag

                    if (_magName isNotEqualTo "") then {
                        
                        private _currentValue = (_oldRoundPrice * _countRounds) * 0.8;
                        _totalCost = _totalCost - _currentValue;
                        _purchaseList pushBack [_magName, _countRounds, _currentValue, [_magName] call _fnc_getName, true, _pylonIndex, _turretPath];  
                    };

                    if (_uiMag isNotEqualTo "") then {
                        private _newAmmoName = getText (configFile >> "CfgMagazines" >> _uiMag >> "ammo");
                        private _newRoundPrice = [_newAmmoName, "ammo"] call A3A_GUI_fnc_calculateItemPrice;
                        private _newMaxRounds = getNumber (configFile >> "CfgMagazines" >> _uiMag >> "count");
                        private _newOrderPrice = _newRoundPrice * _newMaxRounds;
                        _totalCost = _totalCost + _newOrderPrice;
                        _purchaseList pushBack [_uiMag, _newMaxRounds, _newOrderPrice, [_uiMag] call _fnc_getName, false, _pylonIndex, _turretPath];
                    };
                } forEach _vehDataList;

                // this section used to be nothing but depravity. relatively clean now. only took 3 rewrites

                private _refunds = _purchaseList select {_x#4};
                private _purchases = _purchaseList - _refunds;
                private _swappableRefunds = _refunds select {
                    (_x#1) isEqualTo (getNumber (configFile >> "CfgMagazines" >> (_x#0) >> "count"))
                };
                private _purchaseNames = _purchases apply {_x#3};

                private _pairs = [];
                {
                    _x params ["_mag", "_roundsToBuy", "_orderPrice", "_prettyName"];
                    _index = _purchaseNames findIf {_x == _prettyName}; // case sensitivity probably not an issue here
                    if (_index isEqualTo -1) then {continue};
                    private _purchase = (_purchases deleteAt _index);
                    _pairs pushBack [(_refunds deleteAt (_refunds find _x)), _purchase];
                    _totalCost = _totalCost + _orderPrice - (_purchase#2);
                } forEach _swappableRefunds;

                // alright, we have a list of pairs, refunds, and purchases, all mutually exclusive. beautiful
                // this next part gets a lot more complicated
                // mneh its not too bad
                
                {
                    (_x#0) params ["_name", "_roundsToBuy", "_orderPrice", "_prettyName"];
                    _prettyPurchaseList pushBack format [localize "STR_antistasi_vehService_swapping", _prettyName];
                } forEach _pairs;
                {
                    _x params ["_name", "_roundsToBuy", "_orderPrice", "_prettyName"];
                    _prettyPurchaseList pushBack format [localize format ["STR_antistasi_vehService_cost%1", _stringSuffix], _roundsToBuy, _prettyName, floor _orderPrice];
                } forEach _purchases;
                {
                    _x params ["_name", "_roundsToBuy", "_orderPrice", "_prettyName"];
                    _prettyPurchaseList pushBack format [localize "STR_antistasi_vehService_refund", _roundsToBuy, _prettyName, floor _orderPrice, "80%"];
                } forEach _refunds;

                _purchaseList = createHashMapFromArray [
                    ["swap", _pairs],
                    ["refund", _refunds],
                    ["purchase", _purchases]
                ];
            };

            case ("repair"): {

            };

            case ("refuel"): {

            };

            default {

            };
        };

        _applyButton ctrlSetText format [localize format ["STR_antistasi_vehService_apply%1", ["points", "refuel"] select (_mode isEqualTo "refuel")], (round _totalCost) max 0];
        private _response = switch (true) do {
            case (_purchaseList isEqualTo []);
            case (_purchaseList isEqualType createHashMap && {flatten (values _purchaseList) isEqualTo []}): {
                localize format ["STR_antistasi_vehService_nothing%1", _stringSuffix];
            };
            case (isNull _selSupplyVehicle): {
                localize format ["STR_antistasi_vehService_noNear%1", _stringSuffix];
            };
            case (_remCargo < _totalCost): {
                private _ammoTruckName = [typeOf _selSupplyVehicle, "CfgVehicles"] call _fnc_getName;
                format [localize format ["STR_antistasi_vehService_noCargo%1", _stringSuffix], _ammoTruckName, round (player distance _selSupplyVehicle), _remCargo];
            };
            default {""};
        };

        if (_response isNotEqualTo "") exitWith {
            _applyButton ctrlEnable false;
            _applyButton ctrlSetTooltip _response;
        };

        _applyButton ctrlEnable true;
        _prettyPurchaseList = _prettyPurchaseList joinString "\n";
        if (_totalCost < 0) then {_prettyPurchaseList = format ["Your refunded weapons are more valuable than the weapons you are purchasing, so this transaction is free.\nAny surplus will vanish.\n\n%1", _prettyPurchaseList]};
        _applyButton ctrlSetTooltip _prettyPurchaseList;

        _display setVariable ["purchaseList", _purchaseList];
        _display setVariable ["totalCost", _totalCost];
    };
    
    case ("checkout"):
    {
        private _purchaseList = _display getVariable ["purchaseList", []];
        private _totalCost = _display getVariable ["totalCost", 0];
        private _mode = _display getVariable "currentMode";
        private _stringSuffix = [_mode, "rearm"] select (_mode isEqualTo "pylon");
        if (count _purchaseList == 0) exitWith {};
        closeDialog 0;
        if (player distance _veh > 25) exitWith {[localize "STR_antistasi_vehService_hintTitle", localize [format "STR_antistasi_vehService_tooFar%1", _stringSuffix]] spawn A3A_fnc_customHint};
        private _supplyVic = _display getVariable ["A3A_supplyVehicle", objNull];
        [_veh, _mode, _supplyVic, _purchaseList, _totalCost max 0] spawn A3A_fnc_serviceVehicle;
    };

    case ("reset"):
    {
        ["switchTab", [_display getVariable "currentMode"]] spawn A3A_GUI_fnc_vehServiceDialog;
    };

    case ("fullRestore"):
    {
        private _tab = _display getVariable "currentMode";
        switch (_tab) do {
            case ("rearm"): {
                private _controls = _display getVariable ["rearmData", []];
                if (_controls isEqualTo []) exitWith {};
                private _sliders = _controls apply {_x#2};
                {
                    private _maxValue = sliderRange _x # 1;
                    ["onAmmoSliderChanged", [_x, _maxValue]] call A3A_GUI_fnc_vehServiceDialog;
                    _x sliderSetPosition _maxValue;
                } forEach _sliders;
            };
            case ("pylon"): {
                private _controlsList = _display getVariable "pylonControls";
                private _comboList = _controlsList apply {_x#0};
                {
                    _x lbSetCurSel 1
                } forEach _comboList;
            };
        };
        
    };

    case ("onUnload"):
    {
        Debug("vehServiceDialog onUnload starting...");

    };

    default {
        // Log error if attempting to call a mode that doesn't exist
        Error_1("vehServiceDialog mode does not exist: %1", _mode);
    };
};
