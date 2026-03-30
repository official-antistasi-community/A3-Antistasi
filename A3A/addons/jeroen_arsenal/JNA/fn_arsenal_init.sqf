#include "\A3\ui_f\hpp\defineDIKCodes.inc"
#include "\A3\Ui_f\hpp\defineResinclDesign.inc"
#include "..\script_component.hpp"
FIX_LINE_NUMBERS()
///////////////////////////////////////////////////////////////////////////////////////////
scriptName "fn_arsenal_init.sqf";
private _fileName = "fn_arsenal_init.sqf";
Info("JNA init started");
params [["_object",objNull,[objNull]]];

//check if it was already initialised
if(!isnull (missionnamespace getVariable ["jna_object",objNull]))exitWith{};
if(isNull _object)exitWith{["Error: wrong input given '%1'",_object] call BIS_fnc_error;};
missionnamespace setVariable ["jna_object",_object];

//change this for items that members can only take
/* Indexes in the array correspond to these tabs:
DO NOT UNCOMMENT THIS BIT. THESE ARE ALREADY DEFINED
IDC_RSCDISPLAYARSENAL_TAB_PRIMARYWEAPON		0
IDC_RSCDISPLAYARSENAL_TAB_SECONDARYWEAPON	1
IDC_RSCDISPLAYARSENAL_TAB_HANDGUN		2
IDC_RSCDISPLAYARSENAL_TAB_UNIFORM		3
IDC_RSCDISPLAYARSENAL_TAB_VEST			4
IDC_RSCDISPLAYARSENAL_TAB_BACKPACK		5
IDC_RSCDISPLAYARSENAL_TAB_HEADGEAR		6
IDC_RSCDISPLAYARSENAL_TAB_GOGGLES		7
IDC_RSCDISPLAYARSENAL_TAB_NVGS			8
IDC_RSCDISPLAYARSENAL_TAB_BINOCULARS		9
IDC_RSCDISPLAYARSENAL_TAB_MAP			10
IDC_RSCDISPLAYARSENAL_TAB_GPS			11
IDC_RSCDISPLAYARSENAL_TAB_RADIO			12
IDC_RSCDISPLAYARSENAL_TAB_COMPASS		13
IDC_RSCDISPLAYARSENAL_TAB_WATCH			14
IDC_RSCDISPLAYARSENAL_TAB_FACE			15
IDC_RSCDISPLAYARSENAL_TAB_VOICE			16
IDC_RSCDISPLAYARSENAL_TAB_INSIGNIA		17
IDC_RSCDISPLAYARSENAL_TAB_ITEMOPTIC		18
IDC_RSCDISPLAYARSENAL_TAB_ITEMACC		19
IDC_RSCDISPLAYARSENAL_TAB_ITEMMUZZLE		20
IDC_RSCDISPLAYARSENAL_TAB_ITEMBIPOD		25
IDC_RSCDISPLAYARSENAL_TAB_CARGOMAG		21
IDC_RSCDISPLAYARSENAL_TAB_CARGOTHROW		22
IDC_RSCDISPLAYARSENAL_TAB_CARGOPUT		23
IDC_RSCDISPLAYARSENAL_TAB_CARGOMISC		24
IDC_RSCDISPLAYARSENAL_TAB_CARGOMAGALL		26
*/
jna_minItemMember = [-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1];
//jna_minItemMember = [24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,24,memberOnlyMagLimit,24,24,24,24,memberOnlyMagLimit];
jna_minItemMember = jna_minItemMember apply { A3A_guestItemLimit };
jna_minItemMember set [IDC_RSCDISPLAYARSENAL_TAB_CARGOMAG, minWeaps];
jna_minItemMember set [IDC_RSCDISPLAYARSENAL_TAB_CARGOMAGALL, minWeaps];

if (minWeaps == -1) then {
    jna_minItemMember set [IDC_RSCDISPLAYARSENAL_TAB_CARGOMAG, A3A_guestItemLimit*3];
    jna_minItemMember set [IDC_RSCDISPLAYARSENAL_TAB_CARGOMAGALL, A3A_guestItemLimit*3];
};

//server
if(isServer)then{
    Info("JNA server detected");

    //load default if it was not loaded from savegame
    if(isnil "jna_dataList" )then{jna_dataList = [[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[],[]];};
};

//player
if(hasInterface)then{
    Info("JNA loading player data");

    //add arsenal button
    _object addaction [
        localize "STR_A3_Arsenal",
        JN_fnc_arsenal_handleAction,
        [],
        6,
        true,
        false,
        "",
        "alive _target && {_target distance _this < 5} && _this == _this getVariable ['owner',objNull]"
    ];




    //add open event
    [missionNamespace, "arsenalOpened", {
        disableSerialization;
        UINamespace setVariable ["arsanalDisplay",(_this select 0)];

        //spawn this to make sure it doesnt freeze the game
        [] spawn {
            disableSerialization;

            _type = UINamespace getVariable ["jn_type",""];
            if(_type isEqualTo "arsenal")then{
                _veh = vehicle player;
                if((_veh != player) && driver _veh == player)then{
                    ["CustomInit", [uiNamespace getVariable "arsanalDisplay"]] call jn_fnc_vehicleArsenal;
                    UINamespace setVariable ["jn_type","vehicleArsenal"];
                }else{
                    ["CustomInit", [uiNamespace getVariable "arsanalDisplay"]] call jn_fnc_arsenal;
                };
            };

        };
    }] call BIS_fnc_addScriptedEventHandler;

	//add close event
    [missionNamespace, "arsenalClosed", {

        _type = UINamespace getVariable ["jn_type",""];

        if(_type isEqualTo "arsenal")then{
            [clientOwner] remoteExecCall ["jn_fnc_arsenal_requestClose",2];
        };

        if(_type isEqualTo "vehicleArsenal")then{
            ["Close"] call jn_fnc_vehicleArsenal;
            [clientOwner] remoteExecCall ["jn_fnc_arsenal_requestClose",2];
        };
    }] call BIS_fnc_addScriptedEventHandler;
};
Info("JNA init completed");
arsenalInit = true;
