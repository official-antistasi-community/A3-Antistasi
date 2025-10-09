/*
Maintainer: Caleb Serafin, DoomMetal
    Handles the initialization and updating of the HQ Dialog
    This function should only be called from HqDialog onLoad and control activation EHs.

Arguments:
    <STRING> Mode, possible values for this dialog are "onLoad", "switchTab"
    <ARRAY<ANY>> Array of params for the mode when applicable. Params for specific modes are documented in the modes.

Return Value:
    Nothing

Scope: Clients, Local Arguments, Local Effect
Environment: Scheduled for onLoad mode / Unscheduled for everything else unless specified
Public: No
Dependencies:
    None

Example:
    ["onLoad"] spawn FUNC(hqDialog); // initialization
    ["switchTab", ["garrison"]] call FUNC(hqDialog); // switching to the garrison tab

License: APL-ND

*/

#include "..\..\dialogues\ids.inc"
#include "..\..\dialogues\defines.hpp"
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params[["_mode","onLoad"], ["_params",[]]];

// Get display and map control
private _display = findDisplay A3A_IDD_HQDIALOG;
if (isNull _display) exitWith {};               // server might use sendGarrisonData after the dialog is closed
private _garrisonMap = _display displayCtrl A3A_IDC_GARRISONMAP;

switch (_mode) do
{
    case ("onLoad"):
    {
        Debug("HQ Dialog onLoad starting...");

        // Hide HC group icons to stop them from interfering with map controls
        _display setVariable ["HCgroupIcons", groupIconsVisible];
        setGroupIconsVisible [false, false];
        setGroupIconsSelectable false;

        // Show main tab content
        private _shownTab = ["garrison", "main"] select (player isNil "showGarrisonMenu");
        ["switchTab", [_shownTab]] call FUNC(hqDialog);

        // Move HQ button
        /*private _moveHqIcon = _display displayCtrl A3A_IDC_MOVEHQICON;
        private _moveHqButton = _display displayCtrl A3A_IDC_MOVEHQBUTTON;

        private _canMoveHQ = [player] call FUNCMAIN(canMoveHQ);
        if (_canMoveHQ # 0) then {
            _moveHqButton ctrlEnable true;
            _moveHqButton ctrlSetTooltip "";
            _moveHqIcon ctrlSetTextColor ([A3A_COLOR_WHITE] call FUNC(configColorToArray));
            _moveHqIcon ctrlSetTooltip "";
        } else {
            _moveHqButton ctrlEnable false;
            _moveHqButton ctrlSetTooltip _canMoveHQ # 1;
            _moveHqIcon ctrlSetTextColor ([A3A_COLOR_BUTTON_BACKGROUND_DISABLED] call FUNC(configColorToArray));
            _moveHqIcon ctrlSetTooltip _canMoveHQ # 1;
        };
        */
        // Faction money section setup
        private _factionMoneySlider = _display displayCtrl A3A_IDC_FACTIONMONEYSLIDER;
        private _factionMoney = server getVariable ["resourcesFIA", 0];
        _factionMoneySlider sliderSetRange [0,_factionMoney];
        _factionMoneySlider sliderSetSpeed [100, 100];
        _factionMoneySlider sliderSetPosition 0;

        // Rest section setup
        private _restSlider = _display displayCtrl A3A_IDC_RESTSLIDER;
        _restSlider sliderSetRange [0,24];
        _restSlider sliderSetSpeed [1,1];
        _restSlider sliderSetPosition 8;
        ["restSliderChanged"] spawn FUNC(hqDialog);

        // Garrison tab map drawing EHs
        // Select marker
        _garrisonMap ctrlAddEventHandler ["Draw", "_this call A3A_GUI_fnc_mapDrawSelectEH"];
        // Outposts
        _garrisonMap ctrlAddEventHandler ["Draw","_this call A3A_GUI_fnc_mapDrawOutpostsEH"];
        // User markers
        _garrisonMap ctrlAddEventHandler ["Draw","_this call A3A_GUI_fnc_mapDrawUserMarkersEH"];
        // HC group render
        _garrisonMap ctrlAddEventHandler ["Draw","_this call A3A_GUI_fnc_mapDrawHcGroupsEH"];

        Debug("HqDialog onLoad complete.");
    };

    case ("onUnload"):
    {
        Debug("HqDialog onUnload starting...");

        // Remove map drawing EH
        _garrisonMap ctrlRemoveAllEventHandlers "Draw";

        // Restore HC group icons state
        private _groupIcons = _display getVariable ["HCgroupIcons", [false,false]];
        setGroupIconsVisible _groupIcons;
        setGroupIconsSelectable true;

        Debug("HqDialog onUnload complete.");
    };

    case ("switchTab"):
    {
        // Get selected tab
        private _selectedTab = _params select 0;

        Debug_1("HqDialog switching tab to %1.", _selectedTab);

        // Get IDC for selected tab
        private _selectedTabIDC = -1;
        switch (_selectedTab) do
        {
            case ("main"):
            {
                // No permission check needed
                _selectedTabIDC = A3A_IDC_HQDIALOGMAINTAB;
            };

            case ("garrison"):
            {
                _selectedTabIDC = A3A_IDC_HQDIALOGGARRISONTAB;
            };

            case ("minefields"):
            {
                _selectedTabIDC = A3A_IDC_HQDIALOGMINEFIELDSTAB;
            };
        };

        // Log attempt at accessing tab without permission
        if (_selectedTabIDC == -1) exitWith {
            Error("Attempted to access non-existant tab: %1", _selectedTab);
        };

        // Array of IDCs for all the tabs, including subtabs (like AI & player management)
        // Garrison map is also hidden here, and shown again in updateCommanderTab
        private _allTabs = [
            A3A_IDC_HQDIALOGMAINTAB,
            A3A_IDC_GARRISONMAP,
            A3A_IDC_HQDIALOGGARRISONTAB,
            A3A_IDC_HQDIALOGMINEFIELDSTAB
        ];

        // Hide all tabs
        {
        private _ctrl = _display displayCtrl _x;
            _ctrl ctrlShow false;
        } forEach _allTabs;

        // Hide back button, enable in update tab mode when/if needed
        private _backButton = _display displayCtrl A3A_IDC_HQDIALOGBACKBUTTON;
        _backButton ctrlShow false;

        // Show selected tab
        private _selectedTabCtrl = _display displayCtrl _selectedTabIDC;
        _selectedTabCtrl ctrlShow true;

        switch (_selectedTab) do
        {
            case ("main"):
            {
                ["updateMainTab"] call FUNC(hqDialog);
            };

            case ("garrison"):
            {
                ["updateGarrisonTab"] call FUNC(hqDialog);
            };

            case ("minefields"):
            {
                ["updateMinefieldsTab"] call FUNC(hqDialog);
            };
        };
    };

    case ("updateMainTab"):
    {
        _display = findDisplay A3A_IDD_HQDIALOG;

        // Update titlebar
        _titleBar = _display displayCtrl A3A_IDC_HQDIALOGTITLEBAR;
        _titleBar ctrlSetText localize "STR_antistasi_dialogs_hq_titlebar";

        // Update campaign status section
        // Uupdate war level & aggro
        private _warLevelText = _display displayCtrl A3A_IDC_WARLEVELTEXT;
        private _occupantsFlag = _display displayCtrl A3A_IDC_OCCFLAGPICTURE;
        private _occupantsAggroText = _display displayCtrl A3A_IDC_OCCAGGROTEXT;
        private _invadersFlag = _display displayCtrl A3A_IDC_INVFLAGPICTURE;
        private _invadersAggroText = _display displayCtrl A3A_IDC_INVAGGROTEXT;
        _warLevelText ctrlSetText str tierWar;
        _occupantsFlag ctrlSetText (A3A_faction_occ get "flagTexture");
        _occupantsAggroText ctrlSetText ([aggressionLevelOccupants] call FUNCMAIN(getAggroLevelString));
        _aggressionStr = localize "STR_antistasi_dialogs_generic_aggression";
        private _nameOccupants = A3A_faction_occ get "name";
        _occupantsFlag ctrlSetToolTip (_nameOccupants + " " + _aggressionStr);
        _occupantsAggroText ctrlSetTooltip (_nameOccupants + " " + _aggressionStr);
        _invadersFlag ctrlSetText (A3A_faction_inv get "flagTexture");
        _invadersAggroText ctrlSetText ([aggressionLevelInvaders] call FUNCMAIN(getAggroLevelString));
        private _nameInvaders = A3A_faction_inv get "name";
        _invadersFlag ctrlSetToolTip (_nameInvaders + " " + _aggressionStr);
        _invadersAggroText ctrlSetTooltip (_nameInvaders + " " + _aggressionStr);

        // Skip time condition
        private _restButton = _display displayCtrl A3A_IDC_RESTBUTTON;
        private _error = [] call FUNCMAIN(canSkipTime);
        if (_error isEqualTo "") then {
            _restButton ctrlEnable true;
            _restButton ctrlSetTooltip "";
            _restButton ctrlSetTextColor ([A3A_COLOR_WHITE] call FUNC(configColorToArray));
        } else {
            _restButton ctrlEnable false;
            _restButton ctrlSetTooltip _error;
            _restButton ctrlSetTextColor ([A3A_COLOR_BUTTON_TEXT_DISABLED] call FUNC(configColorToArray));
        };

        // Move HQ condition
        private _moveHqIcon = _display displayCtrl A3A_IDC_MOVEHQICON;
        private _moveHqButton = _display displayCtrl A3A_IDC_MOVEHQBUTTON;

        private _canMoveHQ = [player] call FUNCMAIN(canMoveHQ);
        if (_canMoveHQ # 0) then {
            _moveHqButton ctrlEnable true;
            _moveHqButton ctrlSetTooltip "";
            _moveHqIcon ctrlSetTextColor ([A3A_COLOR_WHITE] call FUNC(configColorToArray));
            _moveHqIcon ctrlSetTooltip "";
        } else {
            _moveHqButton ctrlEnable false;
            _moveHqButton ctrlSetTooltip _canMoveHQ # 1;
            _moveHqIcon ctrlSetTextColor ([A3A_COLOR_BUTTON_BACKGROUND_DISABLED] call FUNC(configColorToArray));
            _moveHqIcon ctrlSetTooltip _canMoveHQ # 1;
        };
        
        // Get location data
        private _controlledCities = {sidesX getVariable [_x, sideUnknown] == teamPlayer} count citiesX;
        private _totalCities = count citiesX;
        private _controlledOutposts = {sidesX getVariable [_x, sideUnknown] == teamPlayer} count outposts;
        private _totalOutposts = count outposts;
        private _controlledAirbases = {sidesX getVariable [_x, sideUnknown] == teamPlayer} count airportsX;
        private _totalAirbases = count airportsX;
        private _controlledResources = {sidesX getVariable [_x, sideUnknown] == teamPlayer} count resourcesX;
        private _totalResources = count resourcesX;
        private _controlledFactories = {sidesX getVariable [_x, sideUnknown] == teamPlayer} count factories;
        private _totalFactories = count factories;
        private _controlledSeaports = {sidesX getVariable [_x, sideUnknown] == teamPlayer} count seaports;
        private _totalSeaports = count seaports;

        // Population calculations
        private _totalPopulation = 0;
        private _rebelPopulation = 0;
        private _deadPopulation = 0;
        {
            private _city = _x;
            private _cityData = A3A_cityData getVariable _city;
            _cityData params ["_numCiv", "_supportReb"];

            _totalPopulation = _totalPopulation + _numCiv;
            if (_city in destroyedSites) then { _deadPopulation = _deadPopulation + _numCiv} else 
            {
                _rebelPopulation = _rebelPopulation + (_numCiv * (_supportReb / 100));
            };
        } forEach citiesX;

        // If we aren't changing tooltips runtime we don't need to get the icons here
        /* _controlledCitiesIcon = _display displayCtrl A3A_IDC_CONTROLLEDCITIESICON;
        _controlledOutpostsIcon = _display displayCtrl A3A_IDC_CONTROLLEDOUTPOSTSICON;
        _controlledAirbasesIcon = _display displayCtrl A3A_IDC_CONTROLLEDAIRBASESICON;
        _controlledResourcesIcon = _display displayCtrl A3A_IDC_CONTROLLEDRESOURCESICON;
        _controlledFactoriesIcon = _display displayCtrl A3A_IDC_CONTROLLEDFACTORIESICON;
        _controlledSeaPortsIcon = _display displayCtrl A3A_IDC_CONTROLLEDSEAPORTSICON; */

        _controlledCitiesText = _display displayCtrl A3A_IDC_CONTROLLEDCITIESTEXT;
        _controlledOutpostsText = _display displayCtrl A3A_IDC_CONTROLLEDOUTPOSTSTEXT;
        _controlledAirbasesText = _display displayCtrl A3A_IDC_CONTROLLEDAIRBASESTEXT;
        _controlledResourcesText = _display displayCtrl A3A_IDC_CONTROLLEDRESOURCESTEXT;
        _controlledFactoriesText = _display displayCtrl A3A_IDC_CONTROLLEDFACTORIESTEXT;
        _controlledSeaportsText = _display displayCtrl A3A_IDC_CONTROLLEDSEAPORTSTEXT;

        _controlledCitiesText ctrlSetText format ["%1/%2", _controlledCities, _totalCities];
        _controlledOutpostsText ctrlSetText format ["%1/%2", _controlledOutposts, _totalOutposts];
        _controlledAirbasesText ctrlSetText format ["%1/%2", _controlledAirbases, _totalAirbases];
        _controlledResourcesText ctrlSetText format ["%1/%2", _controlledResources, _totalResources];
        _controlledFactoriesText ctrlSetText format ["%1/%2", _controlledFactories, _totalFactories];
        _controlledSeaportsText ctrlSetText format ["%1/%2", _controlledSeaports, _totalSeaports];


        // Update population status bar
        private _statusBarRebels = _display displayCtrl A3A_IDC_POPSTATUSBARREB;
        private _statusBarDead = _display displayCtrl A3A_IDC_POPSTATUSBARDEAD;

        // Calculate new positions for status bar
        private _rebelsBarWidth = (_rebelPopulation / _totalPopulation) * 50 * GRID_W;
        private _deadBarWidth = (_deadPopulation / _totalPopulation) * 50 * GRID_W;
        private _deadBarXpos = (50 * GRID_W) - _deadBarWidth;

        // Calculate and format percentages, 1 decimal space
        private _rebPercentage = (round ((_rebelPopulation / _totalPopulation) * 1000)) / 10;
        private _deadPercentage = (round ((_deadPopulation / _totalPopulation) * 1000)) / 10;

        private _rebText = _display displayCtrl A3A_IDC_POPSTATUSREBTEXT;
        private _deadText = _display displayCtrl A3A_IDC_POPSTATUSDEADTEXT;
        _rebText ctrlSetText (str _rebPercentage) + "%";
        _deadText ctrlSetText (str _deadPercentage) + "%";

        _statusBarRebels ctrlSetPosition [0, 0, _rebelsBarWidth, 6 * GRID_H];
        _statusBarRebels ctrlCommit 0;

        _statusBarDead ctrlSetPosition [_deadBarXpos, 0, _deadBarWidth, 6 * GRID_H];
        _statusBarDead ctrlCommit 0;


        // Update faction resources section
        private _hr = server getVariable ["hr", 0];
        private _trainingLevel = skillFIA;
        private _hrText = _display displayCtrl A3A_IDC_FACTIONHRTEXT;
        private _trainingText = _display displayCtrl A3A_IDC_FACTIONTRAININGTEXT;
        _hrText ctrlSetText str floor _hr;
        _trainingText ctrlSetText format ["%1 / 20", _trainingLevel];
        private _trainingButton = _display displayCtrl A3A_IDC_FACTIONTRAININGBUTTON;
        if (_trainingLevel < 20) then {
            _trainingButton ctrlSetTooltip (format [localize "STR_antistasi_dialogs_hq_train_tooltip",1000 + (1.5*((skillFIA) *750))]);
        } else {
            _trainingButton ctrlSetTooltip "Rebel training maxed!";
            _trainingButton ctrlEnable false;
        };

        private _factionMoney = server getVariable ["resourcesFIA", 0];
        private _factionMoneyText = _display displayCtrl A3A_IDC_FACTIONMONEYTEXT;
        _factionMoneyText ctrlSetText format ["%1 €", floor _factionMoney];

        // Faction money slider update
        private _factionMoneySlider = _display displayCtrl A3A_IDC_FACTIONMONEYSLIDER;
        _factionMoneySlider sliderSetRange [0,_factionMoney];
        _factionMoneySlider sliderSetSpeed [100, 100];
        _factionMoneySlider sliderSetPosition 0;

    };

    case ("updateGarrisonTab"):
    {
        // Update titlebar
        _titleBar = _display displayCtrl A3A_IDC_HQDIALOGTITLEBAR;
        _titleBar ctrlSetText (localize "STR_antistasi_dialogs_hq_titlebar") + " > " + (localize "STR_antistasi_dialogs_hq_garrisons_titlebar");

        // Show back button, only if from main
        if ((_display isNil "showGarrisonMenu") && {player isNil "showGarrisonMenu"}) then {
            private _backButton = _display displayCtrl A3A_IDC_HQDIALOGBACKBUTTON;
            _backButton ctrlRemoveAllEventHandlers "MouseButtonClick";
            _backButton ctrlAddEventHandler ["MouseButtonClick", {
                ["switchTab", ["main"]] call FUNC(hqDialog);
            }];
            _backButton ctrlShow true;
        } else {
            _display setVariable ["showGarrisonMenu", true];
        };

        // Show map if not already visible
        if (!ctrlShown _garrisonMap) then {_garrisonMap ctrlShow true;};

        // Get selected marker
        private _selectedMarker = _garrisonMap getVariable ["selectedMarker", ""];

        // If no marker is selected (as in you just opened the garrison tab),
        // simulate a map click event to select HQ
        if (_selectedMarker isEqualTo "") exitWith
        {
            Trace("No marker selected, selecting HQ");
            _hqMapPos = _garrisonMap ctrlMapWorldToScreen (getMarkerPos "Synd_HQ");
            ["garrisonMapClicked", [_hqMapPos]] call FUNC(hqDialog);
        };

        private _garrison = _garrisonMap getVariable "currentGarrisonData";
        if (isNil "_garrison") exitWith {};             // could happen if you clicked twice before server send data?
        private _troops = _garrison getOrDefault ["troops", []];

        // Get the data from the marker
        private _position = getMarkerPos _selectedMarker;
        private _garrisonName = [_selectedMarker] call A3A_GUI_fnc_getLocationMarkerName;

        // Get garrison counts
        private _rifleman = {_x in FactionGet(reb,"unitRifle")} count _troops;
        private _squadLeader = {_x in FactionGet(reb,"unitSL")} count _troops;
        private _autorifleman = {_x in FactionGet(reb,"unitMG")} count _troops;
        private _grenadier = {_x in FactionGet(reb,"unitGL")} count _troops;
        private _medic = {_x in FactionGet(reb,"unitMedic")} count _troops;
        private _marksman = {_x in FactionGet(reb,"unitSniper")} count _troops;
        private _at = {_x in FactionGet(reb,"unitLAT")} count _troops;
        private _atMissile = {_x in FactionGet(reb,"unitAT")} count _troops;
        private _aaMissile = {_x in FactionGet(reb,"unitAA")} count _troops;

        // Get controls
        private _garrisonTitle = _display displayCtrl A3A_IDC_GARRISONTITLE;
        private _riflemanNumber = _display displayCtrl A3A_IDC_RIFLEMANNUMBER;
        private _squadleaderNumber = _display displayCtrl A3A_IDC_SQUADLEADERNUMBER;
        private _autoriflemanNumber = _display displayCtrl A3A_IDC_AUTORIFLEMANNUMBER;
        private _grenadierNumber = _display displayCtrl A3A_IDC_GRENADIERNUMBER;
        private _medicNumber = _display displayCtrl A3A_IDC_MEDICNUMBER;
        private _marksmanNumber = _display displayCtrl A3A_IDC_MARKSMANNUMBER;
        private _atNumber = _display displayCtrl A3A_IDC_ATNUMBER;
        private _atMissileNumber = _display displayCtrl A3A_IDC_ATMISSILENUMBER;
        private _aaMissileNumber = _display displayCtrl A3A_IDC_AAMISSILENUMBER;

        // Add currently selected marker to map, we need it later for... stuff...
        _garrisonMap setVariable ["selectedMarker", _selectedMarker];

        // Update controls
        _garrisonTitle ctrlSetText _garrisonName;
        _riflemanNumber ctrlSetText str _rifleman;
        _squadleaderNumber ctrlSetText str _squadleader;
        _autoriflemanNumber ctrlSetText str _autorifleman;
        _grenadierNumber ctrlSetText str _grenadier;
        _medicNumber ctrlSetText str _medic;
        _marksmanNumber ctrlSetText str _marksman;
        _atNumber ctrlSetText str _at;
        _atMissileNumber ctrlSetText str _atMissile;
        _aaMissileNumber ctrlSetText str _aaMissile;

        // Buttons
        _riflemanAddButton = _display displayCtrl A3A_IDC_RIFLEMANADDBUTTON;
        _riflemanSubButton = _display displayCtrl A3A_IDC_RIFLEMANSUBBUTTON;
        _squadleaderAddButton = _display displayCtrl A3A_IDC_SQUADLEADERADDBUTTON;
        _squadleaderSubButton = _display displayCtrl A3A_IDC_SQUADLEADERSUBBUTTON;
        _autoriflemanAddButton = _display displayCtrl A3A_IDC_AUTORIFLEMANADDBUTTON;
        _autoriflemanSubButton = _display displayCtrl A3A_IDC_AUTORIFLEMANSUBBUTTON;
        _grenadierAddButton = _display displayCtrl A3A_IDC_GRENADIERADDBUTTON;
        _grenadierSubButton = _display displayCtrl A3A_IDC_GRENADIERSUBBUTTON;
        _medicAddButton = _display displayCtrl A3A_IDC_MEDICADDBUTTON;
        _medicSubButton = _display displayCtrl A3A_IDC_MEDICSUBBUTTON;
        _marksmanAddButton = _display displayCtrl A3A_IDC_MARKSMANADDBUTTON;
        _marksmanSubButton = _display displayCtrl A3A_IDC_MARKSMANSUBBUTTON;
        _atAddButton = _display displayCtrl A3A_IDC_ATADDBUTTON;
        _atSubButton = _display displayCtrl A3A_IDC_ATSUBBUTTON;
        _atMissileAddButton = _display displayCtrl A3A_IDC_ATMISSILEADDBUTTON;
        _atMissileSubButton = _display displayCtrl A3A_IDC_ATMISSILESUBBUTTON;
        _aaMissileAddButton = _display displayCtrl A3A_IDC_AAMISSILEADDBUTTON;
        _aaMissileSubButton = _display displayCtrl A3A_IDC_AAMISSILESUBBUTTON;

        _rebuildGarrisonButton = _display displayCtrl A3A_IDC_REBUILDGARRISONBUTTON;
        _dismissGarrisonButton = _display displayCtrl A3A_IDC_DISMISSGARRISONBUTTON;

        private _addSubButtons = [
            _riflemanAddButton,
            _riflemanSubButton,
            _squadleaderAddButton,
            _squadleaderSubButton,
            _autoriflemanAddButton,
            _autoriflemanSubButton,
            _grenadierAddButton,
            _grenadierSubButton,
            _medicAddButton,
            _medicSubButton,
            _marksmanAddButton,
            _marksmanSubButton,
            _atAddButton,
            _atSubButton,
            _atMissileAddButton,
            _atMissileSubButton,
            _aaMissileAddButton,
            _aaMissileSubButton
        ];

        // Reset ctrlEnable for all management buttons
        {_x ctrlEnable true; _x ctrlSetTooltip ""} forEach _addSubButtons;
        _rebuildGarrisonButton ctrlEnable true; // TODO UI-update: Check if rebuild is available under attacks, probably shouldn't be?
        _rebuildGarrisonButton ctrlSetTooltip "";
        _dismissGarrisonButton ctrlEnable true;
        _dismissGarrisonButton ctrlSetTooltip "";


        // Disable subtract buttons if number is < 1
        if (_rifleman < 1) then {_riflemanSubButton ctrlEnable false};
        if (_squadLeader < 1) then {_squadleaderSubButton ctrlEnable false};
        if (_autorifleman < 1) then {_autoriflemanSubButton ctrlEnable false};
        if (_grenadier < 1) then {_grenadierSubButton ctrlEnable false};
        if (_medic < 1) then {_medicSubButton ctrlEnable false};
        if (_marksman < 1) then {_marksmanSubButton ctrlEnable false};
        if (_at < 1) then {_atSubButton ctrlEnable false};
        if (_atMissile < 1) then {_atMissileSubButton ctrlEnable false};
        if (_aaMissile < 1) then {_aaMissileSubButton ctrlEnable false};

        // Get prices
        _riflemanPrice = server getVariable (FactionGet(reb,"unitRifle"));
        _squadLeaderPrice = server getVariable (FactionGet(reb,"unitSL"));
        _autoriflemanPrice = server getVariable (FactionGet(reb,"unitMG"));
        _grenadierPrice = server getVariable (FactionGet(reb,"unitGL"));
        _medicPrice = server getVariable (FactionGet(reb,"unitMedic"));
        _marksmanPrice = server getVariable (FactionGet(reb,"unitSniper"));
        _atPrice = server getVariable (FactionGet(reb,"unitLAT"));
        _atMissilePrice = server getVariable (FactionGet(reb,"unitAT"));
        _aaMissilePrice = server getVariable (FactionGet(reb,"unitAA"));

        // Update price labels
        _riflemanPriceText = _display displayCtrl A3A_IDC_RIFLEMANPRICE;
        _squadLeaderPriceText = _display displayCtrl A3A_IDC_SQUADLEADERPRICE;
        _autoriflemanPriceText = _display displayCtrl A3A_IDC_AUTORIFLEMANPRICE;
        _grenadierPriceText = _display displayCtrl A3A_IDC_GRENADIERPRICE;
        _medicPriceText = _display displayCtrl A3A_IDC_MEDICPRICE;
        _marksmanPriceText = _display displayCtrl A3A_IDC_MARKSMANPRICE;
        _atPriceText = _display displayCtrl A3A_IDC_ATPRICE;
        _atMissilePriceText = _display displayCtrl A3A_IDC_ATMISSILEPRICE;
        _aaMissilePriceText = _display displayCtrl A3A_IDC_AAMISSILEPRICE;

        _riflemanPriceText ctrlSetText str _riflemanPrice + "€";
        _squadLeaderPriceText ctrlSetText str _squadLeaderPrice + "€";
        _autoriflemanPriceText ctrlSetText str _autoriflemanPrice + "€";
        _grenadierPriceText ctrlSetText str _grenadierPrice + "€";
        _medicPriceText ctrlSetText str _medicPrice + "€";
        _marksmanPriceText ctrlSetText str _marksmanPrice + "€";
        _atPriceText ctrlSetText str _atPrice + "€";
        _atMissilePriceText ctrlSetText str _atMissilePrice + "€";
        _aaMissilePriceText ctrlSetText str _aaMissilePrice + "€";

        // Disable add buttons if faction is lacking the resources to recruit them (1HR + money)
        _hr = server getVariable ["hr", 0];
        _factionMoney = server getVariable ["resourcesFIA", 0];
        _noResourcesText = localize "STR_antistasi_dialogs_hq_garrisons_insufficient_resources";
        if (_factionMoney < _riflemanPrice || _hr < 1) then {_riflemanAddButton ctrlEnable false; _riflemanAddButton ctrlSetTooltip _noResourcesText};
        if (_factionMoney < _squadLeaderPrice || _hr < 1) then {_squadleaderAddButton ctrlEnable false; _squadleaderAddButton ctrlSetTooltip _noResourcesText};
        if (_factionMoney < _autoriflemanPrice || _hr < 1) then {_autoriflemanAddButton ctrlEnable false; _autoriflemanAddButton ctrlSetTooltip _noResourcesText};
        if (_factionMoney < _grenadierPrice || _hr < 1) then {_grenadierAddButton ctrlEnable false; _grenadierAddButton ctrlSetTooltip _noResourcesText};
        if (_factionMoney < _medicPrice || _hr < 1) then {_medicAddButton ctrlEnable false; _medicAddButton ctrlSetTooltip _noResourcesText};
        if (_factionMoney < _marksmanPrice || _hr < 1) then {_marksmanAddButton ctrlEnable false; _marksmanAddButton ctrlSetTooltip _noResourcesText};
        if (_factionMoney < _atPrice || _hr < 1) then {_atAddButton ctrlEnable false; _atAddButton ctrlSetTooltip _noResourcesText};
        if (_factionMoney < _atMissilePrice || _hr < 1) then {_atMissileAddButton ctrlEnable false; _atMissileAddButton ctrlSetTooltip _noResourcesText};
        if (_factionMoney < _aaMissilePrice || _hr < 1) then {_aaMissileAddButton ctrlEnable false; _aaMissileAddButton ctrlSetTooltip _noResourcesText};

        ["updateGarrisonWepNum"] spawn A3A_GUI_fnc_hqDialog;

        // Disable any management buttons if garrison is under attack
        private _garrisonUnderAttack = [markerPos _selectedMarker] call FUNCMAIN(enemyNearCheck);
        if (_garrisonUnderAttack) then {
            _garrisonAttackText = localize "STR_antistasi_dialogs_hq_garrisons_under_attack";
            {
                _x ctrlEnable false;
                _x ctrlSetTooltip _garrisonAttackText;
            } forEach _addSubButtons;

            _rebuildGarrisonButton ctrlEnable false;
            _rebuildGarrisonButton ctrlSetTooltip _garrisonAttackText;
            _dismissGarrisonButton ctrlEnable false;
            _dismissGarrisonButton ctrlSetTooltip _garrisonAttackText;
        };

        // Pan to location
        _garrisonMap ctrlMapAnimAdd [0.2, ctrlMapScale _garrisonMap, _position];
        ctrlMapAnimCommit _garrisonMap;
    };
    
    case ("updateGarrisonWepNum"):
    { // Scheduled
        
        _autoriflemanAddButton = _display displayCtrl A3A_IDC_AUTORIFLEMANADDBUTTON;
        _grenadierAddButton = _display displayCtrl A3A_IDC_GRENADIERADDBUTTON;
        _marksmanAddButton = _display displayCtrl A3A_IDC_MARKSMANADDBUTTON;
        _atAddButton = _display displayCtrl A3A_IDC_ATADDBUTTON;
        _atMissileAddButton = _display displayCtrl A3A_IDC_ATMISSILEADDBUTTON;
        _aaMissileAddButton = _display displayCtrl A3A_IDC_AAMISSILEADDBUTTON;

        call A3A_fnc_fetchRebelGear;
        private _noGearText = localize "STR_A3A_garrison_error_no_weapons";
        
        if !([A3A_faction_reb get "unitMG",false] call A3A_fnc_hasWeapons) then {_autoriflemanAddButton ctrlEnable false; _autoriflemanAddButton ctrlSetTooltip _noGearText};
        if !([A3A_faction_reb get "unitGL",false] call A3A_fnc_hasWeapons) then {_grenadierAddButton ctrlEnable false; _grenadierAddButton ctrlSetTooltip _noGearText};
        if !([A3A_faction_reb get "unitSniper",false] call A3A_fnc_hasWeapons) then {_marksmanAddButton ctrlEnable false; _marksmanAddButton ctrlSetTooltip _noGearText};
        if !([A3A_faction_reb get "unitLAT",false] call A3A_fnc_hasWeapons) then {_atAddButton ctrlEnable false; _atAddButton ctrlSetTooltip _noGearText};
        if !([A3A_faction_reb get "unitAT",false] call A3A_fnc_hasWeapons) then {_atMissileAddButton ctrlEnable false; _atMissileAddButton ctrlSetTooltip _noGearText};
        if !([A3A_faction_reb get "unitAA",false] call A3A_fnc_hasWeapons) then {_aaMissileAddButton ctrlEnable false; _aaMissileAddButton ctrlSetTooltip _noGearText};
    };

    case ("updateMinefieldsTab"):
    {
        _display = findDisplay A3A_IDD_HQDIALOG;

        // Update titlebar
        _titleBar = _display displayCtrl A3A_IDC_HQDIALOGTITLEBAR;
        _titleBar ctrlSetText (localize "STR_antistasi_dialogs_hq_titlebar") + " > " + (localize "STR_antistasi_dialogs_hq_minefields_titlebar");

        // Show back button
        private _backButton = _display displayCtrl A3A_IDC_HQDIALOGBACKBUTTON;
        _backButton ctrlRemoveAllEventHandlers "MouseButtonClick";
        _backButton ctrlAddEventHandler ["MouseButtonClick", {
            ["switchTab", ["main"]] call FUNC(hqDialog);
        }];
        _backButton ctrlShow true;
    };

    case ("restSliderChanged"):
    {
        private _restButton = _display displayCtrl A3A_IDC_RESTBUTTON;
        private _restSlider = _display displayCtrl A3A_IDC_RESTSLIDER;
        private _restText = _display displayCtrl A3A_IDC_RESTTEXT;
        private _timeHours = sliderPosition _restSlider;
        private _restTimeString = [_timeHours * 60 * 60,1,1,false,2,false,true] call FUNCMAIN(timeSpan_format);
        private _message = if (_timeHours > 0) then {
            _restButton ctrlEnable true;
            private _postRestTime = (daytime + _timeHours) * 60 * 60;
            private _postRestTimeString = [_postRestTime,2,2,false,[1,3],true,false] call FUNCMAIN(timeSpan_format);
            format [localize "STR_antistasi_dialogs_hq_rest_text" + "<br />" + localize "STR_antistasi_dialogs_hq_wakeup_text", _restTimeString, _postRestTimeString];
        } else {
            _restButton ctrlEnable false;
            _restButton ctrlSetTooltip "You must select a period of time to sleep for"; // tooltip later cleared by ability to rest check
            "No rest for the wicked...";
        };
        _restText ctrlSetStructuredText parseText _message;
    };

    case ("factionMoneySliderChanged"):
    {
        private _factionMoneySlider = _display displayCtrl A3A_IDC_FACTIONMONEYSLIDER;
        private _factionMoneyEditBox = _display displayCtrl A3A_IDC_FACTIONMONEYEDITBOX;
        private _sliderValue = sliderPosition _factionMoneySlider;
        _factionMoneyEditBox ctrlSetText str floor _sliderValue;
    };

    case ("factionMoneyEditBoxChanged"):
    {
        private _factionMoneyEditBox = _display displayCtrl A3A_IDC_FACTIONMONEYEDITBOX;
        private _factionMoneySlider = _display displayCtrl A3A_IDC_FACTIONMONEYSLIDER;
        private _factionMoneyEditBoxValue = floor parseNumber ctrlText _factionMoneyEditBox;
        private _factionMoney = server getVariable ["resourcesFIA", 0];
        _factionMoneyEditBox ctrlSetText str _factionMoneyEditBoxValue; // Strips non-numeric characters
        _factionMoneySlider sliderSetPosition _factionMoneyEditBoxValue;
        if (_factionMoneyEditBoxValue < 0) then {_factionMoneyEditBox ctrlSetText str 0};
        if (_factionMoneyEditBoxValue > _factionMoney) then {_factionMoneyEditBox ctrlSetText str _factionMoney};
    };

    case("factionMoneyButtonClicked"):
    {
        private _factionMoneyEditBox = _display displayCtrl A3A_IDC_FACTIONMONEYEDITBOX;
        private _factionMoneyEditBoxValue = floor parseNumber ctrlText _factionMoneyEditBox;
        [_factionMoneyEditBoxValue] call FUNCMAIN(theBossSteal);
        ["updateMainTab"] call FUNC(hqDialog);
    };

    case ("garrisonDataSent"):
    {
        _params params ["_marker", "_garrisonData"];

        // If the data's from a previous click then ignore it
        if (_marker != _garrisonMap getVariable ["selectedMarker", ""]) exitWith {};

        _garrisonMap setVariable ["currentGarrisonData", _garrisonData];
        ["updateGarrisonTab"] call FUNC(hqDialog);
    };

    case ("garrisonMapClicked"):
    {
        // TODO UI-update: Clicking away from outposts should deselect current outpost
        Debug_1("Garrison map clicked: %1", _params);
        // Find closest marker to the clicked position
        _params params ["_clickedPosition"];
        private _clickedWorldPosition = _garrisonMap ctrlMapScreenToWorld _clickedPosition;
        private _garrisonableLocations = airportsX + resourcesX + factories + outposts + seaports + citiesX + outpostsFIA + ["Synd_HQ"];
        private _selectedMarker = [_garrisonableLocations, _clickedWorldPosition] call BIS_fnc_nearestPosition;
        Debug_1("Selected marker: %1", _selectedMarker);

        _markerMapPosition = _garrisonMap ctrlMapWorldToScreen (getMarkerPos _selectedMarker);
        private _maxDistance = 8 * GRID_W; // TODO UI-update: Move somewhere else?
        private _distance = _clickedPosition distance _markerMapPosition;
        if (_distance > _maxDistance) exitWith
        {
            Debug("Distance too large, no selection change.");
        };

        _garrisonMap setVariable ["selectedMarker", _selectedMarker];
        private _position = getMarkerPos _selectedMarker;
        _garrisonMap setVariable ["selectMarkerData", [_position]];         // unused?

        // Will bounce data back through garrisonDataSent
        [_selectedMarker] remoteExecCall [QFUNCMAIN(garrisonServer_sendData), 2];

        //["updateGarrisonTab"] call FUNC(hqDialog);
    };

    // Updating the garrison numbers
    case ("garrisonAdd"):
    {
        private _type = _params select 0;
        private _selectedMarker = _garrisonMap getVariable ["selectedMarker", ""];

        private _unitType = switch (_type) do
        {
            case ("rifleman"): {
                "unitRifle";
            };
            case ("squadleader"): {
                "unitSL";
            };
            case ("autorifleman"): {
                "unitMG";
            };
            case ("grenadier"): {
                "unitGL";
            };
            case ("medic"): {
                "unitMedic";
            };
            case ("marksman"): {
                "unitSniper";
            };
            case ("at"): {
                "unitLAT";
            };
            case ("atMissile"): {
                "unitAT";
            };
            case ("aaMissile"): {
                "unitAA";
            };
        };

        _unitType = A3A_faction_reb get _unitType;
        [_selectedMarker, _unitType, clientOwner] remoteExecCall [QFUNCMAIN(garrisonServer_addUnitType), 2];
        [_selectedMarker] remoteExecCall [QFUNCMAIN(garrisonServer_sendData), 2];
    };

    case ("garrisonRemove"):
    {
        private _type = _params select 0;
        private _selectedMarker = _garrisonMap getVariable ["selectedMarker", ""];

        private _unitType = switch (_type) do
        {
            case ("rifleman"): {
                "unitRifle";
            };
            case ("squadleader"): {
                "unitSL";
            };
            case ("autorifleman"): {
                "unitMG";
            };
            case ("grenadier"): {
                "unitGL";
            };
            case ("medic"): {
                "unitMedic";
            };
            case ("marksman"): {
                "unitSniper";
            };
            case ("at"): {
                "unitLAT";
            };
            case ("atMissile"): {
                "unitAT";
            };
            case ("aaMissile"): {
                "unitAA";
            };
        };

        _unitType = A3A_faction_reb get _unitType;
        [_selectedMarker, _unitType, clientOwner] remoteExecCall [QFUNCMAIN(garrisonServer_remUnitType), 2];
        [_selectedMarker] remoteExecCall [QFUNCMAIN(garrisonServer_sendData), 2];
    };

    case ("dismissGarrison"):
    {
        private _selectedMarker = _garrisonMap getVariable ["selectedMarker", ""];
        [_selectedMarker, true, true] remoteExecCall [QFUNCMAIN(garrisonServer_clear), 2];
        [_selectedMarker] remoteExecCall [QFUNCMAIN(garrisonServer_sendData), 2];
    };

    case ("skipTime"):
    {
        private _restSlider = _display displayCtrl A3A_IDC_RESTSLIDER;
        private _time = sliderPosition _restSlider;
        [_time] call FUNCMAIN(skipTime);

        closeDialog 1;
    };

    
    case ("buildWatchpost"):
    {
        closeDialog 1;
        ["create"] spawn FUNCMAIN(outpostDialog);
    };


    case ("rebuildAssets"):
    {
        Trace("Rebuilding assets");

        private _selectedMarker = _garrisonMap getVariable ["selectedMarker", ""];
        [_selectedMarker] spawn FUNCMAIN(rebuildAssets);
    };

    default
    {
        // Log error if attempting to call a mode that doesn't exist
        Error_1("HQ Dialog mode does not exist: %1", _mode);
    };
};
