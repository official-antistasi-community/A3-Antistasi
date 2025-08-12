/*
    By: Jeroen Notenbomer

	overwrites default arsenal script, original arsenal needs to be running first in order to initilize the display.

    fuctions:
    ["Preload"] call jn_fnc_arsenal;
    	preloads the arsenal like the default arsenal but it doesnt have "BIS_fnc_endLoadingScreen" so you dont have errors
    ["customInit", "arsanalDisplay"] call jn_fnc_arsenal;
    	overwrites all functions in the arsenal with JNA ones.
*/


#include "\A3\ui_f\hpp\defineDIKCodes.inc"
#include "\A3\Ui_f\hpp\defineResinclDesign.inc"

#define FADE_DELAY	0.15

#define MODLIST ["","curator","kart","heli","mark","expansion","expansionpremium"]

#define GETDLC\
	{\
		private _dlc = "";\
		private _addons = configsourceaddonlist _this;\
		if (count _addons > 0) then {\
			private _mods = configsourcemodlist (configfile >> "CfgPatches" >> _addons select 0);\
			if (count _mods > 0) then {\
				_dlc = _mods select 0;\
			};\
		};\
		_dlc\
	};

#define ADDMODICON\
	{\
		private _dlcName = _this call GETDLC;\
		if (_dlcName != "") then {\
			_ctrlList lbsetpictureright [_lbAdd,(modParams [_dlcName,["logo"]]) param [0,""]];\
			_modID = _modList find _dlcName;\
			if (_modID < 0) then {_modID = _modList pushback _dlcName;};\
			_ctrlList lbsetvalue [_lbAdd,_modID];\
		};\
	};

#define IDCS_LEFT\
	IDC_RSCDISPLAYARSENAL_TAB_PRIMARYWEAPON,\
	IDC_RSCDISPLAYARSENAL_TAB_SECONDARYWEAPON,\
	IDC_RSCDISPLAYARSENAL_TAB_HANDGUN,\
	IDC_RSCDISPLAYARSENAL_TAB_UNIFORM,\
	IDC_RSCDISPLAYARSENAL_TAB_VEST,\
	IDC_RSCDISPLAYARSENAL_TAB_BACKPACK,\
	IDC_RSCDISPLAYARSENAL_TAB_HEADGEAR,\
	IDC_RSCDISPLAYARSENAL_TAB_GOGGLES,\
	IDC_RSCDISPLAYARSENAL_TAB_NVGS,\
	IDC_RSCDISPLAYARSENAL_TAB_BINOCULARS,\
	IDC_RSCDISPLAYARSENAL_TAB_MAP,\
	IDC_RSCDISPLAYARSENAL_TAB_GPS,\
	IDC_RSCDISPLAYARSENAL_TAB_RADIO,\
	IDC_RSCDISPLAYARSENAL_TAB_COMPASS,\
	IDC_RSCDISPLAYARSENAL_TAB_WATCH

#define IDCS_RIGHT\
	IDC_RSCDISPLAYARSENAL_TAB_ITEMOPTIC,\
	IDC_RSCDISPLAYARSENAL_TAB_ITEMACC,\
	IDC_RSCDISPLAYARSENAL_TAB_ITEMMUZZLE,\
	IDC_RSCDISPLAYARSENAL_TAB_ITEMBIPOD,\
	IDC_RSCDISPLAYARSENAL_TAB_CARGOMAG,\
	IDC_RSCDISPLAYARSENAL_TAB_CARGOMAGALL,\
	IDC_RSCDISPLAYARSENAL_TAB_CARGOTHROW,\
	IDC_RSCDISPLAYARSENAL_TAB_CARGOPUT,\
	IDC_RSCDISPLAYARSENAL_TAB_CARGOMISC\

#define IDCS	[IDCS_LEFT,IDCS_RIGHT]

#define INITTYPES\
		_types = [];\
		_types set [IDC_RSCDISPLAYARSENAL_TAB_UNIFORM,["Uniform"]];\
		_types set [IDC_RSCDISPLAYARSENAL_TAB_VEST,["Vest"]];\
		_types set [IDC_RSCDISPLAYARSENAL_TAB_BACKPACK,["Backpack"]];\
		_types set [IDC_RSCDISPLAYARSENAL_TAB_HEADGEAR,["Headgear"]];\
		_types set [IDC_RSCDISPLAYARSENAL_TAB_GOGGLES,["Glasses"]];\
		_types set [IDC_RSCDISPLAYARSENAL_TAB_NVGS,["NVGoggles"]];\
		_types set [IDC_RSCDISPLAYARSENAL_TAB_BINOCULARS,["Binocular","LaserDesignator"]];\
		_types set [IDC_RSCDISPLAYARSENAL_TAB_PRIMARYWEAPON,["AssaultRifle","MachineGun","SniperRifle","Shotgun","Rifle","SubmachineGun"]];\
		_types set [IDC_RSCDISPLAYARSENAL_TAB_SECONDARYWEAPON,["Launcher","MissileLauncher","RocketLauncher"]];\
		_types set [IDC_RSCDISPLAYARSENAL_TAB_HANDGUN,["Handgun"]];\
		_types set [IDC_RSCDISPLAYARSENAL_TAB_MAP,["Map"]];\
		_types set [IDC_RSCDISPLAYARSENAL_TAB_GPS,["GPS","UAVTerminal"]];\
		_types set [IDC_RSCDISPLAYARSENAL_TAB_RADIO,["Radio"]];\
		_types set [IDC_RSCDISPLAYARSENAL_TAB_COMPASS,["Compass"]];\
		_types set [IDC_RSCDISPLAYARSENAL_TAB_WATCH,["Watch"]];\
		_types set [IDC_RSCDISPLAYARSENAL_TAB_FACE,[]];\
		_types set [IDC_RSCDISPLAYARSENAL_TAB_VOICE,[]];\
		_types set [IDC_RSCDISPLAYARSENAL_TAB_INSIGNIA,[]];\
		_types set [IDC_RSCDISPLAYARSENAL_TAB_ITEMOPTIC,["AccessorySights"]];\
		_types set [IDC_RSCDISPLAYARSENAL_TAB_ITEMACC,["AccessoryPointer"]];\
		_types set [IDC_RSCDISPLAYARSENAL_TAB_ITEMMUZZLE,["AccessoryMuzzle"]];\
		_types set [IDC_RSCDISPLAYARSENAL_TAB_ITEMBIPOD,["AccessoryBipod"]];\
		_types set [IDC_RSCDISPLAYARSENAL_TAB_CARGOMAG,[]];\
		_types set [IDC_RSCDISPLAYARSENAL_TAB_CARGOMAGALL,[]];\
		_types set [IDC_RSCDISPLAYARSENAL_TAB_CARGOTHROW,[/*"Grenade","SmokeShell"*/]];\
		_types set [IDC_RSCDISPLAYARSENAL_TAB_CARGOPUT,[/*"Mine","MineBounding","MineDirectional"*/]];\
		_types set [IDC_RSCDISPLAYARSENAL_TAB_CARGOMISC,["FirstAidKit","Medikit","MineDetector","ToolKit"]];

#define STATS_WEAPONS\
	["reloadtime","dispersion","maxzeroing","hit","mass","initSpeed"],\
	[true,true,false,true,false,false]

#define STATS_EQUIPMENT\
	["passthrough","armor","maximumLoad","mass"],\
	[false,false,false,false]

#define ERROR if !(_item in _disabledItems) then {_disabledItems set [count _disabledItems,_item];};

disableserialization;

// Calculate the minimum number of an item needed before non-members can take it
private _minItemsMember = {
	params ["_index", "_item"];					// Arsenal tab index, item classname
	private _min = jna_minItemMember select _index;
	_min = A3A_arsenalLimits getOrDefault [_item, [_min]] select 0;
	if (_index == IDC_RSCDISPLAYARSENAL_TAB_CARGOMAG || _index == IDC_RSCDISPLAYARSENAL_TAB_CARGOMAGALL) then {
		_min = _min * getNumber (configfile >> "CfgMagazines" >> _item >> "count");
	};
	_min;
};

_mode = [_this,0,"Open",[displaynull,""]] call bis_fnc_param;
_this = [_this,1,[]] call bis_fnc_param;

switch _mode do {

	///////////////////////////////////////////////////////////////////////////////////////////
	case "CustomInit":{
		_display = _this select 0;
		_veh = vehicle player;

		diag_log ["CustomInit VehicleArsenal",_display];

		//save crap in array
		jnva_loadout = ((vehicle player) call jn_fnc_arsenal_cargoToArray);
		jnva_loadout_mass = ["getMass"] call jn_fnc_vehicleArsenal;
       	clearMagazineCargoGlobal _veh;
        clearItemCargoGlobal _veh;
        clearweaponCargoGlobal _veh;
        clearbackpackCargoGlobal _veh;

		["customGUI",[_display]] call jn_fnc_vehicleArsenal;
		["customEvents",[_display]] call jn_fnc_vehicleArsenal;
		["ColorTabs",[_display]] call jn_fnc_vehicleArsenal;

		['showMessage',[_display, localize "STR_A3A_JNA_vehicle_title"]] call jn_fnc_arsenal;
		["jn_fnc_arsenal"] call BIS_fnc_endLoadingScreen;
	};

	///////////////////////////////////////////////////////////////////////////////////////////
	case "getMass":{
		_massTotal = 0;
		_loadout = ((vehicle player) call jn_fnc_arsenal_cargoToArray);
		{
			_index = _forEachIndex;
			{
				_item = _x select 0;
				_amount = _x select 1;
				_mass = ["getMassItem",[_item,_amount,_index]] call jn_fnc_vehicleArsenal;
				_massTotal = _massTotal + _mass;
			} forEach _x;
		}foreach _loadout;
		_massTotal;
	};

	///////////////////////////////////////////////////////////////////////////////////////////
	case "getMassItem":{
		_item = _this select 0;
		_amount = _this select 1;
		_index = _this select 2;

		_magCount = 1;
		_cfg = switch _index do {
			case IDC_RSCDISPLAYARSENAL_TAB_BACKPACK:	{configfile >> "cfgvehicles" 	>> _item >> "mass"};
			case IDC_RSCDISPLAYARSENAL_TAB_GOGGLES:		{configfile >> "cfgglasses" 	>> _item >> "mass"};
			case IDC_RSCDISPLAYARSENAL_TAB_CARGOMAG;
			case IDC_RSCDISPLAYARSENAL_TAB_CARGOMAGALL;
			case IDC_RSCDISPLAYARSENAL_TAB_CARGOTHROW;
			case IDC_RSCDISPLAYARSENAL_TAB_CARGOPUT: 	{	_magCount = getNumber (configfile >> "cfgmagazines" 	>> _item >> "count");
															configfile >> "cfgmagazines" 	>> _item >> "mass"};
			case IDC_RSCDISPLAYARSENAL_TAB_PRIMARYWEAPON;
			case IDC_RSCDISPLAYARSENAL_TAB_SECONDARYWEAPON;
			case IDC_RSCDISPLAYARSENAL_TAB_HANDGUN:		{configfile >> "CfgWeapons" >> _item >> "WeaponSlotsInfo" >> "mass"};
			default										{configfile >> "cfgweapons" 	>> _item >> "ItemInfo" >> "mass"};
		};

		_amount = ceil (_amount/_magCount);

		_mass = (getNumber _cfg) * _amount;
		_mass;//return
	};

	///////////////////////////////////////////////////////////////////////////////////////////
	case "customGUI":{
		_display = _this select 0;

		//move CARGOMAGALL to left so we can use it there
		{
			_index = _x;
			_ctrlRight = _display displayctrl (IDC_RSCDISPLAYARSENAL_TAB + _index);
			_ctrlRight ctrlenable true;
			_ctrlRight ctrlsetfade 0;
			_ctrlRight ctrlcommit 0;//FADE_DELAY;
			_ctrlLeft = _display displayctrl (IDC_RSCDISPLAYARSENAL_TAB + _forEachIndex);
			_height = ctrlPosition _ctrlLeft select 1;
			_pos = ctrlPosition _ctrlRight;
			_pos set [1, _height];
			_ctrlRight ctrlSetPosition _pos;
			_ctrlRight ctrlcommit 0;

		} foreach [IDCS_RIGHT];
		_ctrlLeft = _display displayctrl (IDC_RSCDISPLAYARSENAL_LIST + IDC_RSCDISPLAYARSENAL_TAB_PRIMARYWEAPON);
		_ctrlRight = _display displayctrl (IDC_RSCDISPLAYARSENAL_LIST + IDC_RSCDISPLAYARSENAL_TAB_CARGOMAGALL);
		_pos = ctrlPosition _ctrlLeft;
		_pos set [1, ctrlPosition _ctrlRight select 1];
		_ctrlRight ctrlSetPosition _pos;
		_ctrlRight ctrlcommit 0;

		//hide icons on player
		{
			_tab = _x;
			{
				_ctrl = _display displayctrl (_tab + _x);
				_ctrl ctrlshow false;
				_ctrl ctrlenable false;
				_ctrl ctrlremovealleventhandlers "buttonclick";
				_ctrl ctrlremovealleventhandlers "mousezchanged";
				_ctrl ctrlremovealleventhandlers "lbselchanged";
				_ctrl ctrlremovealleventhandlers "lbdblclick";
				_ctrl ctrlsetposition [0,0,0,0];
				_ctrl ctrlcommit 0;
			} foreach [IDC_RSCDISPLAYARSENAL_ICON,IDC_RSCDISPLAYARSENAL_ICONBACKGROUND];
		} foreach IDCS;

		//loadbar middle
		_ctrlLoadCargo = _display displayctrl IDC_RSCDISPLAYARSENAL_LOADCARGO;

		//right background set
		_ctrlList = _display displayctrl (IDC_RSCDISPLAYARSENAL_LIST + IDC_RSCDISPLAYARSENAL_TAB_CARGOMAG);
		_ctrFrameRight = _display displayctrl IDC_RSCDISPLAYARSENAL_FRAMERIGHT;
		_ctrBackgroundRight = _display displayctrl IDC_RSCDISPLAYARSENAL_BACKGROUNDRIGHT;
		_ctrlListPos = ctrlposition _ctrlList;
		_ctrlListPos set [3,(_ctrlListPos select 3)];
		{
			_x ctrlsetposition _ctrlListPos;
			_x ctrlcommit 0;
		} foreach [_ctrFrameRight,_ctrBackgroundRight];
	};

	///////////////////////////////////////////////////////////////////////////////////////////
	case "customEvents":{
		_display = _this select 0;



		//Keys
		_display displayRemoveAllEventHandlers "keydown";
		_display displayRemoveAllEventHandlers "keyup";
		_display displayAddEventHandler ["keydown",{['KeyDown',_this] call jn_fnc_arsenal;}];
		_display displayAddEventHandler ["keyup",{['KeyUp',_this] call jn_fnc_arsenal;}];

		//--- UI event handlers
		_ctrlButtonRandom = _display displayctrl IDC_RSCDISPLAYARSENAL_CONTROLSBAR_BUTTONRANDOM;
		_ctrlButtonRandom ctrlRemoveAllEventHandlers "buttonclick";
		_ctrlButtonRandom ctrladdeventhandler ["buttonclick",{["Unload",[ctrlparent (_this select 0)]] call jn_fnc_vehicleArsenal;}];
		_ctrlButtonRandom ctrlSetText localize "STR_A3A_JNA_text_unload";
		_ctrlButtonRandom ctrlSetTooltip localize "STR_A3A_JNA_tooltop_unload";

		_ctrlButtonExport = _display displayctrl IDC_RSCDISPLAYARSENAL_CONTROLSBAR_BUTTONEXPORT;
		_ctrlButtonExport ctrlRemoveAllEventHandlers "buttonclick";
		_ctrlButtonExport ctrlSetText "";

		_ctrlButtonImport = _display displayctrl IDC_RSCDISPLAYARSENAL_CONTROLSBAR_BUTTONIMPORT;
		_ctrlButtonImport ctrlRemoveAllEventHandlers "buttonclick";
		_ctrlButtonImport ctrlSetText "";

		_ctrlArrowLeft = _display displayctrl IDC_RSCDISPLAYARSENAL_ARROWLEFT;
		_ctrlArrowLeft ctrlRemoveAllEventHandlers "buttonclick";
		_ctrlArrowLeft ctrladdeventhandler ["buttonclick",{["buttonCargo",[ctrlparent (_this select 0),-1]] call jn_fnc_vehicleArsenal;}];

		_ctrlArrowRight = _display displayctrl IDC_RSCDISPLAYARSENAL_ARROWRIGHT;
		_ctrlArrowRight ctrlRemoveAllEventHandlers "buttonclick";
		_ctrlArrowRight ctrladdeventhandler ["buttonclick",{["buttonCargo",[ctrlparent (_this select 0),+1]] call jn_fnc_vehicleArsenal;}];

		_ctrlButtonLoad = _display displayctrl IDC_RSCDISPLAYARSENAL_CONTROLSBAR_BUTTONLOAD;
		_ctrlButtonLoad ctrlRemoveAllEventHandlers "buttonclick";
		_ctrlButtonLoad ctrlSetTextColor [1,0,0,1];
		//_ctrlButtonLoad ctrladdeventhandler ["buttonclick",{["buttonLoad",[ctrlparent (_this select 0)]] call jn_fnc_vehicleArsenal;}];

		_ctrlButtonSave = _display displayctrl IDC_RSCDISPLAYARSENAL_CONTROLSBAR_BUTTONSAVE;
		_ctrlButtonSave ctrlRemoveAllEventHandlers "buttonclick";
		_ctrlButtonSave ctrlSetTextColor [1,0,0,1];
		//_ctrlButtonSave ctrladdeventhandler ["buttonclick",{["buttonSave",[ctrlparent (_this select 0)]] call jn_fnc_vehicleArsenal;}];

		//disable annoying deselecting of tabs when you misclick
		_ctrlMouseArea = _display displayctrl IDC_RSCDISPLAYARSENAL_MOUSEAREA;
		_ctrlMouseArea ctrlRemoveEventHandler ["mousebuttonclick",0];

		_ctrlButtonInterface = _display displayctrl IDC_RSCDISPLAYARSENAL_CONTROLSBAR_BUTTONINTERFACE;
		_ctrlButtonInterface ctrlRemoveAllEventHandlers "buttonclick";

		{
			_idc = _x;

			_ctrlList = _display displayctrl (IDC_RSCDISPLAYARSENAL_LIST + _idc);
			_ctrlList ctrlRemoveAllEventHandlers "LBSelChanged";
			_ctrlList ctrlAddEventHandler ["MouseButtonUp",	{uiNamespace setvariable ['jna_userInput',true];}];
			_ctrlList ctrlAddEventHandler ["LBSelChanged",	format ["
				if(uiNamespace getvariable ['jna_userInput',false])then{
					['SelectItem',[ctrlparent (_this select 0),(_this select 0),%1]] call jn_fnc_vehicleArsenal;
					uiNamespace setvariable ['jna_userInput',false];
				};
			",_idc]];


			_ctrlTab = _display displayctrl (IDC_RSCDISPLAYARSENAL_TAB + _idc);
			_ctrlTab ctrlRemoveAllEventHandlers "buttonclick";
			_ctrlTab ctrladdeventhandler ["buttonclick",format ["['TabSelect',[ctrlparent (_this select 0),%1],true] call jn_fnc_vehicleArsenal;",_idc]];


		} foreach IDCS;
	};

	///////////////////////////////////////////////////////////////////////////////////////////
	case "ColorTabs":{
		_display = _this select 0;
/* 
		// everything here is wrong
		{
			_ctrlTab = _display displayctrl (IDC_RSCDISPLAYARSENAL_TAB + _forEachIndex);

			_color = if(_x isEqualTo [])then{
				[1,1,1,1];
			}else{
				[1,0.3,0.3,1];
			};
			_ctrlTab ctrlSetTextColor _color;
			_ctrlTab ctrlSetActiveColor _color;
			_ctrlTab ctrlSetTextColorSecondary _color;
			_ctrlTab ctrlSetBackgroundColor _color;
			_ctrlTab ctrlSetForegroundColor _color;
		} forEach jnva_loadout;
*/
	};

	///////////////////////////////////////////////////////////////////////////////////////////
	case "TabSelect": {
		_display = _this select 0;
		_index = _this select 1;
		_ctrlList = ctrlnull;
		jnca_tab_selected = _index;
		_veh  = vehicle player;
		_isSelectedLeft = _index in [IDCS_LEFT];
		_listSelected = [IDC_RSCDISPLAYARSENAL_TAB_CARGOMAG,IDC_RSCDISPLAYARSENAL_TAB_CARGOMAGALL] select _isSelectedLeft;

		_inventory = if(_index == IDC_RSCDISPLAYARSENAL_TAB_CARGOMAG) then {

			// Find compatible magazines for all primary weapons in vehicle
			// Use toLower because modsets are bugged, eg. rhs_45Rnd_545x39_AK vs rhs_45Rnd_545X39_AK
			private _usableMagazines = [];
			{
				private _weapons = jnva_loadout select _x;
				
				{
					_usableMagazines append ((compatibleMagazines (_x select 0)) apply {toLower _x});
				} forEach _weapons;
			}forEach [
				IDC_RSCDISPLAYARSENAL_TAB_PRIMARYWEAPON,
				IDC_RSCDISPLAYARSENAL_TAB_SECONDARYWEAPON,
				IDC_RSCDISPLAYARSENAL_TAB_HANDGUN
			];
			_usableMagazines =_usableMagazines arrayIntersect _usableMagazines;

			// Add compatible vehicle magazines for 3CB-style ammunition systems
			private _cfgVehicle = configFile >> "cfgVehicles" >> typeof _veh;
			private _vehMagTypes = _cfgVehicle call A3A_fnc_allMagazines;
			{ _usableMagazines pushBackUnique toLower _x } forEach _vehMagTypes;

			// Get magazine counts from arsenal that are compatible
			private _magsArsenal = [];
			private _magsVehicle = [];
			{
				if !(toLower (_x select 0) in _usableMagazines) then { continue };
				_magsArsenal pushBack _x;
				_magsVehicle pushBack [_x select 0, 0];
			} forEach (jna_dataList select IDC_RSCDISPLAYARSENAL_TAB_CARGOMAGALL);
			
			// Then add compatible mags from the vehicle cargo
			{
				if !(toLower (_x select 0) in _usableMagazines) then { continue };
				// Use addToArray to avoid duplicating the type if they're already in the arsenal
				_magsArsenal = [_magsArsenal, [_x select 0, 0]] call jn_fnc_arsenal_addToArray;
				_magsVehicle = [_magsVehicle, _x] call jn_fnc_arsenal_addToArray;
			} forEach (jnva_loadout select IDC_RSCDISPLAYARSENAL_TAB_CARGOMAGALL);

			jnva_loadout set [IDC_RSCDISPLAYARSENAL_TAB_CARGOMAG, _magsVehicle];
			_magsArsenal;
		}
		else {
			private _items = jna_dataList select _index;
			// Add entries from vehicle with zero count
			{
				_items = [_items, [_x select 0, 0]] call jn_fnc_arsenal_addToArray;
			} forEach (jnva_loadout select _index);
			_items;
		};

		//update list
		["CreateList",[_display,_index,_inventory,_listSelected]] call jn_fnc_vehicleArsenal;
		["updateItemInfo",[ _display,_ctrlList,_index]] call jn_fnc_arsenal;

		{
			_idc = _x;
			_active = _idc == _listSelected;
			{
				_ctrl = _display displayctrl (_x + _idc);
				_ctrl ctrlenable _active;
				_ctrl ctrlsetfade ([1,0] select _active);
				_ctrl ctrlcommit FADE_DELAY;
			} foreach [IDC_RSCDISPLAYARSENAL_LIST,IDC_RSCDISPLAYARSENAL_LISTDISABLED,IDC_RSCDISPLAYARSENAL_SORT];
		}foreach [IDC_RSCDISPLAYARSENAL_TAB_CARGOMAG,IDC_RSCDISPLAYARSENAL_TAB_CARGOMAGALL];

		//show correct list
		{
			_idc = _x;
			_active = _idc == _index;
			_isLeft = _idc in [IDCS_LEFT];
			_list = [IDC_RSCDISPLAYARSENAL_TAB_CARGOMAG,IDC_RSCDISPLAYARSENAL_TAB_CARGOMAGALL] select _isLeft;

			_ctrlTab = _display displayctrl (IDC_RSCDISPLAYARSENAL_TAB + _idc);
			_ctrlTab ctrlenable !_active;

			_ctrlList = _display displayctrl (IDC_RSCDISPLAYARSENAL_LIST + _list);

			if (_active) then {

				_ctrlLineTab = _display displayctrl ([IDC_RSCDISPLAYARSENAL_LINETABRIGHT,IDC_RSCDISPLAYARSENAL_LINETABLEFT] select _isLeft);

				_ctrlLineTab ctrlsetfade 0;
				_ctrlTabPos = ctrlposition _ctrlTab;

				if(_isLeft)then{
					_ctrlLineTabPosX = (_ctrlTabPos select 0) + (_ctrlTabPos select 2) - 0.01;
					_ctrlLineTabPosY = (_ctrlTabPos select 1);
					_ctrlLineTab ctrlsetposition [
						safezoneX,//_ctrlLineTabPosX,
						_ctrlLineTabPosY,
						(ctrlposition _ctrlList select 0) - safezoneX,//_ctrlLineTabPosX,
						ctrlposition _ctrlTab select 3
					];
				}else{
					_ctrlLineTabPosX = (ctrlposition _ctrlList select 0) + (ctrlposition _ctrlList select 2);
					_ctrlLineTabPosY = (_ctrlTabPos select 1);
					_ctrlLineTab ctrlsetposition [
						_ctrlLineTabPosX,
						_ctrlLineTabPosY,
						safezoneX + safezoneW - _ctrlLineTabPosX,//(_ctrlTabPos select 0) - _ctrlLineTabPosX + 0.01,
						ctrlposition _ctrlTab select 3
					];
				};
				_ctrlLineTab ctrlcommit 0;
				ctrlsetfocus _ctrlList;

				//set right item counters
				_items = jnva_loadout select _idc;
				for "_l" from 0 to ((lnbsize _ctrlList select 0) - 1) do {
					_dataStr = _ctrlList lnbdata [_l,0];
					_data = call compile _dataStr;
					_item = _data select 0;
					_amount = 0;
					{
						_itemX = _x select 0;
						_amountX = _x select 1;
						if(_itemX == _item)then{
							_amount = _amount + _amountX;
						}
					} forEach _items;

					_ctrlList lnbsettext [[_l,2],str (_amount)];
				};

				//["SelectItemRight",[_display,_ctrlList,_idc]] call jn_fnc_vehicleArsenal;



			};
		}foreach IDCS;



		//Show or hide background
		{
			_ctrl = _display displayctrl _x;
			_ctrl ctrlsetfade ([1,0] select (_index in [IDCS_LEFT]));
			_ctrl ctrlcommit FADE_DELAY;
		} foreach [
			IDC_RSCDISPLAYARSENAL_LINETABLEFT,
			IDC_RSCDISPLAYARSENAL_FRAMELEFT,
			IDC_RSCDISPLAYARSENAL_BACKGROUNDLEFT
		];

		{
			_ctrl = _display displayctrl _x;
			_ctrl ctrlsetfade ([1,0] select (_index in [IDCS_RIGHT]));
			_ctrl ctrlcommit FADE_DELAY;
		} foreach [
			IDC_RSCDISPLAYARSENAL_LINETABRIGHT,
			IDC_RSCDISPLAYARSENAL_FRAMERIGHT,
			IDC_RSCDISPLAYARSENAL_BACKGROUNDRIGHT
		];
	};

	///////////////////////////////////////////////////////////////////////////////////////////
	// This function isn't used here. Colouring is done by updateItemGui in fn_arsenal
	case "SelectItemRight": {
		_display = _this select 0;
		_ctrlList = _this select 1;
		_index = _this select 2;
		_center = (missionnamespace getvariable ["BIS_fnc_arsenal_center",player]);
		_type = (ctrltype _ctrlList == 102);
		_veh = vehicle player;


		_maximumLoad = getNumber(configfile >> "CfgVehicles" >> (typeOf _veh) >> "maximumLoad");

		_ctrlLoadCargo = _display displayctrl IDC_RSCDISPLAYARSENAL_LOADCARGO;
		_load = _maximumLoad * (1 - progressposition _ctrlLoadCargo);


		//-- Disable too heavy items
		_rows = lnbsize _ctrlList select 0;
		_columns = lnbsize _ctrlList select 1;
		_colorWarning = ["IGUI","WARNING_RGB"] call bis_fnc_displayColorGet;
		_columns = count lnbGetColumnsPosition _ctrlList;

		for "_r" from 0 to (_rows - 1) do {
			_dataStr = _ctrlList lnbData [_r,0];
			_data = call compile _dataStr;
			_item = _data select 0;
			_amount = _data select 1;
			_grayout = false;

			_min = [_index, _item] call _minItemsMember;
			if ((_amount <= _min) AND (_amount != -1) AND (_amount !=0) AND !([player] call A3A_fnc_isMember)) then{_grayout = true};

			_isIncompatible = _ctrlList lnbvalue [_r,1];
			_mass = _ctrlList lbvalue (_r * _columns);
			_alpha = [1.0,0.25] select (_mass > parseNumber (str _load));
			_color = [[1,1,1,_alpha],[1,0.5,0,_alpha]] select _isIncompatible;
			if(_grayout)then{_color = [1,1,0,0.60];};
			_ctrlList lnbsetcolor [[_r,1],_color];
			_ctrlList lnbsetcolor [[_r,2],_color];
			_text = _ctrlList lnbtext [_r,1];
			_ctrlList lbsettooltip [_r * _columns,[_text,_text + localize "STR_A3A_JNA_scope_incompatible"] select _isIncompatible];
		};
	};

	///////////////////////////////////////////////////////////////////////////////////////////
	case "CreateList":{
		_display =  _this select 0;
		_index = _this select 1;
		_inventory = _this select 2;
		_indexList = _this select 3;
		_ctrlList = _display displayctrl (IDC_RSCDISPLAYARSENAL_LIST + _indexList);

		lnbclear _ctrlList;

		{
			_item = _x select 0;
			_amount = _x select 1;
			["CreateItem",[_display,_ctrlList,_index,_item,_amount]] call jn_fnc_arsenal;
		} forEach _inventory;

		["UpdateListGui",[ _display,_ctrlList, _index]] call jn_fnc_arsenal;
	};

	///////////////////////////////////////////////////////////////////////////////////////////
	case "SelectItem":{
		_display = _this select 0;
		_ctrlList = _this select 1;
		_index = jnca_tab_selected;

		["updateItemInfo",[ _display,_ctrlList,_index]] call jn_fnc_arsenal;
	};

	/////////////////////////////////////////////////////////////////////////////////////////// event
	case "buttonCargo": {
		_display = _this select 0;
		_add = _this select 1;

		_veh = vehicle player;
		_index = jnca_tab_selected;

		if(_index == IDC_RSCDISPLAYARSENAL_TAB_CARGOMAG)then{_index = IDC_RSCDISPLAYARSENAL_TAB_CARGOMAGALL};

		_indexList = [IDC_RSCDISPLAYARSENAL_TAB_CARGOMAG,IDC_RSCDISPLAYARSENAL_TAB_CARGOMAGALL] select (_index in [IDCS_LEFT]);
		_ctrlList = _display displayctrl (IDC_RSCDISPLAYARSENAL_LIST + _indexList);
		_lbcursel = lbcursel _ctrlList;


		_dataStr = _ctrlList lnbData [_lbcursel,0];
		_data = call compile _dataStr;
		_item = _data select 0;
		_amount = _data select 1;

		_load = 0;
		_items = [];

		_container = vehicle player;

		_ctrlLoadCargo = _display displayctrl IDC_RSCDISPLAYARSENAL_LOADCARGO;
		//save old weight
		_max = getNumber(configfile >> "CfgVehicles" >> (typeOf _veh) >> "maximumLoad");

		_amountOld = parseNumber (_ctrlList lnbtext [_lbcursel,2]);
		//remove or add
		_count = 1;

		private _shift = uiNamespace getVariable ["arsenalShift", false];
		private _ctrl = uiNamespace getVariable ["arsenalCtrl", false];

		if(_shift && !_ctrl) then {
			_count = _count * 5;
		};
		if(!_shift && _ctrl) then {
			_count = _count * 10;
		};
		if(_shift && _ctrl) then {
			_count = _count * 25;
		};

		if (_add > 0 && {_count > _amount && {_amount != -1}}) then {
			_count = _amount;
		};

		if(((_amount > 0 || _amount == -1) || _add < 0) && (_add != 0))then{

			if (_add > 0) then {//add

				//non-member limits
				_min = [_index, _item] call _minItemsMember;
				if((_amount <= _min) AND (_amount != -1) AND !([player] call A3A_fnc_isMember)) exitWith{
					['showMessage',[_display, localize "STR_A3A_JNA_memberonly"]] call jn_fnc_arsenal;
				};

				//magazines are handeld by bullet count
				if(_index in [IDC_RSCDISPLAYARSENAL_TAB_CARGOMAG,IDC_RSCDISPLAYARSENAL_TAB_CARGOMAGALL])then{
					//check if full mag can be optaind
					_count = _count * getNumber (configfile >> "CfgMagazines" >> _item >> "count");
				};

				if(_amount != -1) then {
					_count = _count min _amount;
				};

				if(_count > 0)then{
					_mass = jnva_loadout_mass + (["getMassItem",[_item,_count,_index]] call jn_fnc_vehicleArsenal);
					if(_mass <= _max)then{
						_ctrlList lnbsettext [[_lbcursel,2],str (_amountOld + _count)];

						jnva_loadout set [_index,[jnva_loadout select _index,[_item,_count]] call jn_fnc_arsenal_addToArray];
						jnva_loadout_mass = _mass;
						//[_index, _item, _count] remoteExecCall ["jn_fnc_arsenal_removeItem"];
						[_index, _item, _count] call jn_fnc_arsenal_removeItem; //Sparker: why execute it on all clients?
					};
				};

			}else{
				if(_index in [IDC_RSCDISPLAYARSENAL_TAB_CARGOMAG,IDC_RSCDISPLAYARSENAL_TAB_CARGOMAGALL])then{
					_count = getNumber (configfile >> "CfgMagazines" >> _item >> "count");
				};

				if(_count>_amountOld)then{
					_count = _amountOld;
				};

				if(_count > 0)then{
					_ctrlList lnbsettext [[_lbcursel,2],str (_amountOld - _count)];

					jnva_loadout set [_index,[jnva_loadout select _index,[_item,_count]] call jn_fnc_arsenal_removeFromArray];
					_mass = ["getMassItem",[_item,_count,_index]] call jn_fnc_vehicleArsenal;
					jnva_loadout_mass = jnva_loadout_mass - _mass;
					//[_index, _item, _count] remoteExecCall ["jn_fnc_arsenal_addItem"];
					[_index, _item, _count] call jn_fnc_arsenal_addItem; //Sparker: why execute it on all clients?
				};
			};
		};

		["ColorTabs",[_display]] call jn_fnc_vehicleArsenal;
		['showMessage',[_display,(localize "STR_A3A_JNA_vehicle_mass_load"+str round (jnva_loadout_mass/_max *100)+"%")]] call jn_fnc_arsenal;
	};

	/////////////////////////////////////////////////////////////////////////////////////////// event
	case "KeyDown": {
		_display = _this select 0;
		_key = _this select 1;
		_shift = _this select 2;
		_ctrl = _this select 3;
		_alt = _this select 4;
		_center = (missionnamespace getvariable ["BIS_fnc_arsenal_center",player]);
		_return = false;
		_ctrlTemplate = _display displayctrl IDC_RSCDISPLAYARSENAL_TEMPLATE_TEMPLATE;
		_inTemplate = ctrlfade _ctrlTemplate == 0;

		switch true do {
			case (_key == DIK_ESCAPE): {
				if (_inTemplate) then {
					_ctrlTemplate ctrlsetfade 1;
					_ctrlTemplate ctrlcommit 0;
					_ctrlTemplate ctrlenable false;

					_ctrlMouseBlock = _display displayctrl IDC_RSCDISPLAYARSENAL_MOUSEBLOCK;
					_ctrlMouseBlock ctrlenable false;
				} else {
					if (true) then {["buttonClose",[_display]] spawn jn_fnc_arsenal;} else {_display closedisplay 2;};
				};
				_return = true;
			};

			//--- Enter
			case (_key in [DIK_RETURN,DIK_NUMPADENTER]): {
				_ctrlTemplate = _display displayctrl IDC_RSCDISPLAYARSENAL_TEMPLATE_TEMPLATE;
				if (ctrlfade _ctrlTemplate == 0) then {
					if (BIS_fnc_arsenal_type == 0) then {
						//["buttonTemplateOK",[_display]] spawn jn_fnc_arsenal;
					} else {
						//["buttonTemplateOK",[_display]] spawn jn_fnc_arsenal;
					};
					_return = true;
				};
			};

			//--- Prevent opening the commanding menu
			case (_key == DIK_1);
			case (_key == DIK_2);
			case (_key == DIK_3);
			case (_key == DIK_4);
			case (_key == DIK_5);
			case (_key == DIK_1);
			case (_key == DIK_7);
			case (_key == DIK_8);
			case (_key == DIK_9);
			case (_key == DIK_0);

			//--- Tab to browse tabs
			case (_key == DIK_TAB): {
			};

			case (_key == DIK_LSHIFT): {
				uiNamespace setVariable ["arsenalShift", true];
				_return = true;
			};
			case (_key == DIK_LCONTROL): {
				uiNamespace setVariable ["arsenalCtrl", true];
				_return = true;
			};
			case (_key == DIK_LALT): {
				uiNamespace setVariable ["arsenalAlt", true];
				_return = true;
			};

			//--- Save
			case (_key == DIK_S): {
				//if (_ctrl) then {['buttonSave',[_display]] call jn_fnc_arsenal;};
			};
			//--- Open
			case (_key == DIK_O): {
				//if (_ctrl) then {['buttonLoad',[_display]] call jn_fnc_arsenal;};
			};

			//--- Vision mode
			case (_key in (actionkeys "nightvision") && !_inTemplate): {
				_mode = missionnamespace getvariable ["BIS_fnc_arsenal_visionMode",-1];
				_mode = (_mode + 1) % 3;
				missionnamespace setvariable ["BIS_fnc_arsenal_visionMode",_mode];
				switch _mode do {
					//--- Normal
					case 0: {
						camusenvg false;
						false setCamUseTi 0;
					};
					//--- NVG
					case 1: {
						camusenvg true;
						false setCamUseTi 0;
					};
					//--- TI
					default {
						camusenvg false;
						true setCamUseTi 0;
					};
				};
				playsound ["RscDisplayCurator_visionMode",true];
				_return = true;

			};
		};
		_return
	};

    /////////////////////////////////////////////////////////////////////////////////////////// event
 	case "KeyUp": {
		_display = _this select 0;
		_key = _this select 1;
		_shift = _this select 2;
		_ctrl = _this select 3;
		_alt = _this select 4;
		switch true do {
			case (_key == DIK_LSHIFT): {
				uiNamespace setVariable ["arsenalShift", false];
				_return = true;
			};
			case (_key == DIK_LCONTROL): {
				uiNamespace setVariable ["arsenalCtrl", false];
				_return = true;
			};
			case (_key == DIK_LALT): {
				uiNamespace setVariable ["arsenalAlt", false];
				_return = true;
			};
		};
		_return
	};

	///////////////////////////////////////////////////////////////////////////////////////////
	case "Unload":{
		_display = _this select 0;

		jnva_loadout_mass = 0;
		diag_log jnva_loadout;
        jnva_loadout remoteExecCall ["jn_fnc_arsenal_addItem",2];
       	jnva_loadout = ((vehicle player) call jn_fnc_arsenal_cargoToArray);
       	diag_log jnva_loadout;

       	_list = missionnamespace getVariable ["jnca_tab_selected",-1];
       	if(_list != -1)then{
       		["TabSelect",[_display, _list]] call jn_fnc_vehicleArsenal;
       	};
       	["ColorTabs",[_display]] call jn_fnc_vehicleArsenal;
	};

	///////////////////////////////////////////////////////////////////////////////////////////
	case "Close": {
		jnva_loadout_mass = nil;
		_veh = vehicle player;
		jnca_tab_selected = nil;
		//weapons
		{
			_list = jnva_loadout select _x;
			{
				_item = _x select 0;
				_amount = _x select 1;
				_veh addWeaponCargoGlobal [_item,_amount];
			} forEach _list;
		} forEach [
			IDC_RSCDISPLAYARSENAL_TAB_PRIMARYWEAPON,
			IDC_RSCDISPLAYARSENAL_TAB_SECONDARYWEAPON,
			IDC_RSCDISPLAYARSENAL_TAB_HANDGUN
		];

		//items
		{
			_list = jnva_loadout select _x;
			{
				_item = _x select 0;
				_amount = _x select 1;
				_veh addItemCargoGlobal [_item,_amount];
			} forEach _list;
		} forEach [
			IDC_RSCDISPLAYARSENAL_TAB_UNIFORM,
			IDC_RSCDISPLAYARSENAL_TAB_VEST,
			IDC_RSCDISPLAYARSENAL_TAB_HEADGEAR,
			IDC_RSCDISPLAYARSENAL_TAB_GOGGLES,
			IDC_RSCDISPLAYARSENAL_TAB_NVGS,
			IDC_RSCDISPLAYARSENAL_TAB_BINOCULARS,
			IDC_RSCDISPLAYARSENAL_TAB_MAP,
			IDC_RSCDISPLAYARSENAL_TAB_GPS,
			IDC_RSCDISPLAYARSENAL_TAB_RADIO,
			IDC_RSCDISPLAYARSENAL_TAB_COMPASS,
			IDC_RSCDISPLAYARSENAL_TAB_WATCH,
			IDC_RSCDISPLAYARSENAL_TAB_ITEMOPTIC,
			IDC_RSCDISPLAYARSENAL_TAB_ITEMACC,
			IDC_RSCDISPLAYARSENAL_TAB_ITEMMUZZLE,
			IDC_RSCDISPLAYARSENAL_TAB_ITEMBIPOD,
			IDC_RSCDISPLAYARSENAL_TAB_CARGOMISC
		];

		//magazines
		{
			_list = jnva_loadout select _x;
			{
				_item = _x select 0;
				_amount = _x select 1;
				_count = getNumber (configfile >> "CfgMagazines" >> _item >> "count");

				while{_amount>0}do{
					_veh addMagazineAmmoCargo [_item,1,_amount];
					_amount = _amount - _count;
				};
			} forEach _list;
		} forEach [
			IDC_RSCDISPLAYARSENAL_TAB_CARGOMAGALL,
			IDC_RSCDISPLAYARSENAL_TAB_CARGOTHROW,
			IDC_RSCDISPLAYARSENAL_TAB_CARGOPUT
		];

		//backpack
		{
			_list = jnva_loadout select _x;
			{
				_item = _x select 0;
				_amount = _x select 1;
				_veh addBackpackCargoGlobal [_item,_amount];
			} forEach _list;
		} forEach [
			IDC_RSCDISPLAYARSENAL_TAB_BACKPACK
		];


		jnva_loadout = nil;
	};

	///////////////////////////////////////////////////////////////////////////////////////////
	default {
		["Error: wrong input given '%1' for mode '%2'",_this,_mode] call BIS_fnc_error;
	};
};
