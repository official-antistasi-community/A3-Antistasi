/*
Copyright 2025 Ian Feickert. All rights reserved.
Used and distributed with permission by the Antistasi Community project.
*/

/*
    Handles all interaction to the Map selector menu.
	Should only be called from the menu.
	This function is pre-loaded and uses different function calls because it runs in the main menu without a mission.

Environment: Scheduled for onLoad mode / Unscheduled for everything else unless specified

Arguments:
    <STRING> Mode, e.g. "onLoad", "openRole"
    <ARRAY<ANY>> Array of params for the mode when applicable. Params for specific modes are documented in the modes.

Return Value:
    Nothing

*/
#include "..\..\dialogues\ids.inc"
#include "..\..\dialogues\defines.hpp"
#include "..\..\dialogues\textures.inc"
#include "..\..\script_component.hpp"
#include "\a3\ui_f\hpp\definedikcodes.inc"

FIX_LINE_NUMBERS()

#if __A3_DEBUG__
    private _a3Debug = true;
#else
    private _a3Debug = false;
#endif

private _thisFunc = (uiNamespace getVariable "A3A_GUI_fnc_mapSelectorDialog");

params ["_mode", "_params"];

_display = findDisplay A3A_IDD_MAPSELECTORDIALOG;
private _mapLB = _display displayCtrl A3A_IDC_MAPSELECT_MAPLB;
private _selBannerButton = _display displayCtrl A3A_IDC_MAPSELECT_SELECTBANNERPICTURE;
private _selMapButton = _display displayCtrl A3A_IDC_MAPSELECT_SELECTMAPPICTURE;
private _pictureCtrl = _display displayCtrl A3A_IDC_MAPSELECT_PICTURE;
private _noPictureText = _display displayCtrl A3A_IDC_MAPSELECT_PICTURETEXT;
private _infoText = _display displayCtrl A3A_IDC_MAPSELECT_INFOTEXT;
private _playSPButton = _display displayCtrl A3A_IDC_MAPSELECT_PLAYSP;
private _playMPButton = _display displayCtrl A3A_IDC_MAPSELECT_PLAYMP;
private _pictureMapCtrl = _display displayCtrl A3A_IDC_MAPSELECT_PICTUREMAPBOARD;
private _mapBoardText = _display displayCtrl A3A_IDC_MAPSELECT_MAPBOARDTEXT;
private _reqModsText = _display displayCtrl A3A_IDC_MAPSELECT_REQUIREDMODSTEXT;
//private _debugIDTitle = _display displayCtrl A3A_IDC_MAPSELECT_DEBUGIDTITLE;
//private _debugMapTitle = _display displayCtrl A3A_IDC_MAPSELECT_DEBUGMAPTITLE;
//private _debugIDEdit = _display displayCtrl A3A_IDC_MAPSELECT_DEBUGIDEDIT;
//private _debugMapText = _display displayCtrl A3A_IDC_MAPSELECT_DEBUGMAPTEXT;
//private _debugGroup = [_debugIDTitle, _debugMapTitle, _debugIDEdit, _debugMapText];
private _mapInfoPath = configFile >> "A3A" >> "mapInfo";

switch (_mode) do
{
    case ("onLoad"):
    {
		// select info box
		_noPictureText ctrlShow false;
		_pictureMapCtrl ctrlShow false;
		_pictureCtrl ctrlShow true;
		_mapBoardText ctrlShow false;
		//{_x ctrlShow false} forEach _debugGroup;
		_reqModsText ctrlShow false;
		_selBannerButton ctrlEnable false;
		_selMapButton ctrlEnable false;
		_playSPButton ctrlEnable false;
		_playMPButton ctrlEnable false;
		_pictureCtrl ctrlSetText QPATHTOFOLDER(dialogues\textures\banner\mainBanner.jpg);
		_infoText ctrlSetStructuredText parseText localize "STR_antistasi_mapSelector_onload_text";
		// load info
		["updateMapList"] call _thisFunc;
    };
	case ("updateMapList"):
	{
		// populate listbox with maps and info
		// list of maps
		private _mapInfoPath = configFile >> "A3A" >> "mapInfo";
		private _mapConfigList = "true" configClasses _mapInfoPath;
		private _mapNameList = _mapConfigList apply {configName _x};
		private _loadedMaps = _mapNameList select {isClass (configFile >> "CfgWorlds" >> _x)};
		{
			private _mapName = _x;
			private _isDebug = (getNumber (_mapInfoPath >> _mapName >> "debug") > 0);
			if (_isDebug and !_a3Debug) then { continue };
			private _stringtable = localize format ["STR_antistasi_mission_info_%1_mapname_short_text", _mapName];
			private _finalStr = "";
			if (_stringtable == "") then {
				_finalStr = _mapName;
			} else {
				private _words = _stringtable splitString " ";
				_words deleteAt 0; // always "Antistasi" in whatever language
				_finalStr = _words joinString " ";
			};
			private _index = _mapLB lbAdd _finalStr;
			_mapLB lbSetData [_index, _mapName];
			if (_mapName in _loadedMaps) then {
				_mapLB lbSetValue [_index, 0];
			} else {
				_mapLB lbSetValue [_index, 1000];
				_mapLB lbSetColor [_index, [1,1,1,0.25]];
			};
		} forEach _mapNameList;
		_mapLB lbSortBy ["VALUE"];
	};
	case ("mapSelChanged"):
	{
		_index = lbCurSel _mapLB;
		if (_index == -1) exitWith {};
		_reqModsText ctrlShow true;
		_noPictureText ctrlShow false;
		_selBannerButton ctrlEnable true;
		_selMapButton ctrlEnable true;

		if (_display getVariable ["pictureMode", "banner"] == "map") then {
			["handleMapButton"] call _thisFunc;
		} else {
			["handleBannerButton"] call _thisFunc;
		};
		private _map = _mapLB lbData _index;
		private _requiredMods = getText(_mapInfoPath >> _map >> "requiredMods");
		private _reqModsFormat = if (_requiredMods == "") then {localize "STR_antistasi_mapSelector_noReqMods"} else {_requiredMods};
		_reqModsText ctrlSetText format [localize "STR_antistasi_mapSelector_reqMods", _reqModsFormat];
		private _mapText = _mapLB lbText _index;
		if (isClass (configFile >> "CfgWorlds" >> _map)) then {
			_playSPButton ctrlEnable true;
			_playMPButton ctrlEnable true;
			_playSPButton ctrlSetTooltip "";
			_playMPButton ctrlSetTooltip "";
		} else {
			_playSPButton ctrlEnable false;
			_playMPButton ctrlEnable false;
			_playSPButton ctrlSetTooltip format [localize "STR_antistasi_mapSelector_failReqMods", _mapText, _reqModsFormat];
			_playMPButton ctrlSetTooltip format [localize "STR_antistasi_mapSelector_failReqMods", _mapText, _reqModsFormat];
		};
		//if (ctrlShown _debugMapText) then {
		if (false) then {
			_debugMapText ctrlSetText _map;
		} else {
			_infoText ctrlSetStructuredText parseText localize format ["STR_antistasi_mapSelector_description_%1", _map];
		};
	};
	case ("handleInformationButton"):
	{
		_params params ["_infoType"];
		_noPictureText ctrlShow true;
		_pictureMapCtrl ctrlShow false;
		_pictureCtrl ctrlShow false;
		_mapBoardText ctrlShow false;
		_reqModsText ctrlShow false;
		_selBannerButton ctrlEnable false;
		_selMapButton ctrlEnable false;
		_playSPButton ctrlEnable false;
		_playMPButton ctrlEnable false;
		//{_x ctrlShow false} forEach _debugGroup;
		_display setVariable ["debugClickCount", 0];
		_mapLB lbSetCurSel -1;
		_noPictureText ctrlSetStructuredText parseText localize format ["STR_antistasi_mapSelector_%1_text", _infoType];
		if (_infoType in ["noSP"]) exitWith {_infoText ctrlSetText ""};
		_infoText ctrlSetStructuredText parseText localize format ["STR_antistasi_mapSelector_%1_text2", _infoType];

	};
	case ("handleBannerButton"):
	{
		_noPictureText ctrlShow false;
		_pictureMapCtrl ctrlShow false;
		_pictureCtrl ctrlShow true;
		_mapBoardText ctrlShow false;
		
		// open banner picture
		_display setVariable ["pictureMode", "banner"];
		private _map = _mapLB lbData (lbCurSel _mapLB);
		_picture = format ["x\A3A\addons\maps\Antistasi_%1.%1\Pictures\Mission\pic.jpg", _map];
		_pictureCtrl ctrlSetText _picture;
	};
	case ("handleMapButton"):
	{
		_pictureMapCtrl ctrlShow true;
		_pictureCtrl ctrlShow false;
		// open map picture
		_display setVariable ["pictureMode", "map"];
		private _map = _mapLB lbData (lbCurSel _mapLB);
		private _picture = format ["x\A3A\addons\maps\Antistasi_%1.%1\Pictures\Mission\whiteboard.jpg", _map];
		_pictureMapCtrl ctrlSetText _picture;
		_mapBoardText ctrlShow true;

		private _mapConfig = _mapInfoPath >> _map;
		private _climate = getText (_mapConfig >> "climate");
		private _size = getNumber (_mapConfig >> "size");
		private _cityCount = getNumber (_mapConfig >> "cityCount");
		private _bankCount = count (getArray (_mapConfig >> "banks"));
		private _airbaseCount = getNumber (_mapConfig >> "airbaseCount");
		private _finalClimate = switch (toLowerANSI _climate) do {
			case ("temprate");
			case ("temperate"): {"Temperate"};
			case ("tropical"): {"Tropical"};
			case ("arctic"): {"Arctic"};
			case ("arid"): {"Arid"};
			default {"Unknown"};
		};
		
		_final = format [localize "STR_antistasi_mapSelector_mapStats"
		, _finalClimate
		, _size
		, _cityCount
		, _bankCount
		, _airbaseCount
		];
		_mapBoardText ctrlSetStructuredText parseText _final;
		
	};
    case ("handlePlayButton"):
    {
		_params params ["_mode","_mouseData"];
		// Having a special "debug mode" on the map selector to speed up testing was considered. We cant effectively click through the menus, so this functionality was scrapped.
		/*
		_mouseData params ["_control", "_button", "_xPos", "_yPos", "_shift", "_ctrl", "_alt"];
		if (_shift && _ctrl) then {
			
		
			_currentClickCount = _display getVariable ["debugClickCount", 0];
			_currentClickCount = _currentClickCount + 1;
			_display setVariable ["debugClickCount", _currentClickCount];
			if (_currentClickCount == 1) then {
				_infoText ctrlSetText "";
				// if ctrl + shift selected, load dev info and increment counter
				{_x ctrlShow true} forEach _debugGroup;
				_debugPrefMap = profileNamespace getVariable ["A3A_debugPrefMap", "altis"];
				_debugPrefID = profileNamespace getVariable ["A3A_debugPrefID", ""];
				if (_debugPrefMap == "") then {_mapLB lbData lbCurSel _mapLB};
				_debugIDEdit ctrlSetText _debugPrefID;
				_debugMapText ctrlSetText _debugPrefMap;
			} else {
				// if ctrl + shift selected x2, set parameters and launch
				_debugPrefID = ctrlText _debugIDEdit;
				_debugPrefMap = ctrlText _debugMapText;
				profileNamespace setVariable ["A3A_debugPrefID", _debugPrefID];
				profileNamespace setVariable ["A3A_debugPrefMap", _debugPrefMap];
				profileNamespace setVariable ["A3A_autoRunDebug", true];
				saveprofilenamespace;
				["startSPGame", [_debugPrefMap]] call _thisFunc;;
			};
		*/
		if (false) then {
		} else { // if none selected, launch normally
			private _map = _mapLB lbData (lbCurSel _mapLB);
			if (_mode == "SP") then {
				["handleInformationButton", ["noSP"]] call _thisFunc;
				//["startSPGame", [_map]] call _thisFunc;
			} else {
				["startMPGame", [_map]] call _thisFunc;
			};
			
		};
    };
	/*
	case ("startSPGame"):
	{
		_params params ["_map"];
		hostMission [configFile >> "CfgMissions" >> "MPMissions" >> format ["Antistasi_%1", _map], _display];
		0 spawn {
			// Temporary until we revert Antistasi to being able to run in SP
			// host mission and server settings menu
			private _hostMenu = findDisplay 132;
			private _hostContinue = _hostMenu displayCtrl 1;
			ctrlActivate _hostContinue;
			// cant continue after this. display will come up on its own and trip mpSetupLoaded
		};
		
	};
	*/
	case ("startMPGame"):
	{
		_params params ["_map"];
		hostMission [configFile >> "CfgMissions" >> "MPMissions" >> format ["Antistasi_%1", _map], _display];
	};
	/*
	case ("mpSetupLoaded"):
	{
		private _setupMenu = findDisplay 70;
		private _setupLB = _setupMenu displayCtrl 109;
		waitUntil {lbSize _setupLB > 0};
		_setupLB lbSetCurSel 1;
		_setupLB lbSetCurSel 1;
		_setupLB lbSetCurSel 1;
		_setupLB ctrlSetMousePosition [0.5, 0.5];
		_list = ((allControls findDisplay 70) apply {[ctrlText _x, buttonAction _x, ctrlClassName _x, ctrlIDC _x]});
		_list2 = (["ui"] + allVariables uiNamespace + ["display"] + allVariables _setupMenu + ["control"] + allVariables _setupLB); 
		private _setupContinue = _setupMenu displayCtrl 1;
		_setupContinue ctrlActivate true;
	};
	*/
	case ("handleBackButton"):
	{
		// close dialog
		_display closeDisplay 0;
	};
	case ("onUnload"):
	{

	};
};