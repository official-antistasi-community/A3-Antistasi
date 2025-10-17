/*
Maintainer: Tiny
    Handles updating and controls on the War Status tab of the Main dialog.

Arguments:
    <STRING> Mode
    <ARRAY<ANY>> Array of params for the mode when applicable. Params for specific modes are documented in the modes.

Return Value:
    Nothing

Scope: Clients, Local Arguments, Local Effect
Environment: Scheduled for control changes / Unscheduled for update
Public: No
Dependencies:
    None

Example:
    ["update"] call FUNC(warStatusTab);

License: APL-ND

*/

#include "..\..\dialogues\ids.inc"
#include "..\..\dialogues\defines.hpp"
#include "..\..\dialogues\textures.inc"
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params[["_mode","onLoad"], ["_params",[]]];
private _display = findDisplay A3A_IDD_MAINDIALOG;
private _intelList = _display displayCtrl A3A_IDC_WARSTATUS_INTELLIST;
private _intelInfo = _display displayCtrl A3A_IDC_WARSTATUS_INTELINFO;
private _occFlag = _display displayCtrl A3A_IDC_WARSTATUS_OCCFLAG;
private _invFlag = _display displayCtrl A3A_IDC_WARSTATUS_INVFLAG;
private _occDescription = _display displayCtrl A3A_IDC_WARSTATUS_OCCDESCRIPTION;
private _invDescription = _display displayCtrl A3A_IDC_WARSTATUS_INVDESCRIPTION;
private _occAggro = _display displayCtrl A3A_IDC_WARSTATUS_OCCAGGRO;
private _invAggro = _display displayCtrl A3A_IDC_WARSTATUS_INVAGGRO;
private _occResources = _display displayCtrl A3A_IDC_WARSTATUS_OCCRESOURCES;
private _invResources = _display displayCtrl A3A_IDC_WARSTATUS_INVRESOURCES;
private _occKeys = _display displayCtrl A3A_IDC_WARSTATUS_OCCKEYS;
private _invKeys = _display displayCtrl A3A_IDC_WARSTATUS_INVKEYS;
private _rebFlag = _display displayCtrl A3A_IDC_WARSTATUS_REBFLAG;
private _rebDescription = _display displayCtrl A3A_IDC_WARSTATUS_REBDESCRIPTION;
private _rebMoney = _display displayCtrl A3A_IDC_WARSTATUS_REBMONEY;
private _rebHR = _display displayCtrl A3A_IDC_WARSTATUS_REBHR;

private _warLevel = _display displayCtrl A3A_WARSTATUS_WARLEVEL;

switch (_mode) do
{
    case ("update"):
    {
        Trace("Updating War Status Tab");
        // Show back button

        if (isNull _display) exitWith {};
        private _backButton = _display displayCtrl A3A_IDC_MAINDIALOGBACKBUTTON;
        _backButton ctrlRemoveAllEventHandlers "MouseButtonClick";
        _backButton ctrlAddEventHandler ["MouseButtonClick", {
            ["switchTab", ["player"]] call FUNC(mainDialog);
        }];
        _backButton ctrlShow true;
        if (isNil "A3A_resourcesLastOcc") then {A3A_resourcesLastOcc = ["Unknown"]};
        if (isNil "A3A_resourcesLastInv") then {A3A_resourcesLastInv = ["Unknown"]};
        lbClear _intelList;
        _warLevel ctrlSetText format ["War Level: %1", tierWar];
        _occFlag ctrlSetText (Faction(Occupants) get "flagTexture");
        _invFlag ctrlSetText (Faction(Invaders) get "flagTexture");
        _occDesc = getText (configFile >> "A3A" >> "Templates" >> missionNamespace getVariable "A3A_Occ_template" >> "lore");
        _invDesc = getText (configFile >> "A3A" >> "Templates" >> missionNamespace getVariable "A3A_Inv_template" >> "lore");
        _occDescription ctrlSetStructuredText parseText _occDesc;
        _invDescription ctrlSetStructuredText parseText _invDesc;
        
        _occAggro ctrlSetText format ["Aggression: %1", [aggressionLevelOccupants] call FUNCMAIN(getAggroLevelString)];
        _invAggro ctrlSetText format ["Aggression: %1", [aggressionLevelInvaders] call FUNCMAIN(getAggroLevelString)];
        
        _occResources ctrlSetText format ["Resources: %1", A3A_resourcesLastOcc#0];
        if (count A3A_resourcesLastOcc > 1) then {
            _occResources ctrlSetTooltip format ["Time since last update: %1",
                [[serverTime-(A3A_resourcesLastOcc#1)] call A3A_fnc_secondsToTimeSpan,0,0,false,2] call A3A_fnc_timeSpan_format
            ]
        } else {
            _occResources ctrlSetTooltip "No known resource information";
        };
        _invResources ctrlSetText format ["Resources: %1", A3A_resourcesLastInv#0];
        if (count A3A_resourcesLastInv > 1) then {
            _invResources ctrlSetTooltip format ["Time since last update: %1",
                [[serverTime-(A3A_resourcesLastInv#1)] call A3A_fnc_secondsToTimeSpan,0,0,false,2] call A3A_fnc_timeSpan_format
            ]
        } else {
            _invResources ctrlSetTooltip "No known resource information";
        };
        
        _occKeys ctrlSetText format ["Radio Keys: %1", occRadioKeys];
        _invKeys ctrlSetText format ["Radio Keys: %1", invRadioKeys];
        _rebFlag ctrlSetText (Faction(teamPlayer) get "flagTexture");
        _rebDesc = getText (configFile >> "A3A" >> "Templates" >> missionNamespace getVariable "A3A_Reb_template" >> "lore");
        _rebDescription ctrlSetStructuredText parseText _rebDesc;
        _rebMoney ctrlSetText format ["Money: %1€", str (server getVariable "resourcesFIA")];
        _rebHR ctrlSetText format ["HR: %1", str (server getVariable "HR")];

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

        

        if (isNil "A3A_clientIntelLog") then {A3A_clientIntelLog = []};
        {
            _x params ["_short", "_desc", "_time"];
            diag_log _x;
            private _fancyTime = [_time * 3600,2,2,false,[1,3],true,false] call A3A_fnc_timeSpan_format;
            private _index = _intelList lbAdd format ["%1: %2", _fancyTime, _short];
            diag_log [_index, format ["At %1, %2", _fancyTime, _desc]];
            _intelList lbSetData [_index, format ["At %1, %2", _fancyTime, _desc]];
        } forEach A3A_clientIntelLog;
    };

    case ("intelSelected"):
    {
        private _entry = lbCurSel _intelList;
        diag_log (_intelList lbData _entry);
        _intelInfo ctrlSetStructuredText parseText (_intelList lbData _entry);
    };

    default
    {
        // Log error if attempting to call a mode that doesn't exist
        Error_1("AI Management tab mode does not exist: %1", _mode);
    };
};
