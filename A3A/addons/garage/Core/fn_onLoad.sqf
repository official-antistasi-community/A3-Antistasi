/*
    Author: [Håkon]
    [Description]
        Handels opening the garage
        setting up controls and EH for the garage to function

        Note: Should only be called from display onLoad EH

    Arguments:
        <Nil>

    Return Value:
        <Nil>

    Scope: Clients
    Environment: Any
    Public: [No]
    Dependencies:

    Example: [] call HR_GRG_fnc_onLoad;

    License: APL-ND
*/
#include "defines.inc"
FIX_LINE_NUMBERS()
['HR_GRG','Loading Garage, please wait...'] call BIS_fnc_startLoadingScreen;
Trace("Opening Garage");

//if for some reason the server init has not been done, do it now
if (isNil "HR_GRG_Init") then {remoteExecCall ["HR_GRG_fnc_initServer",2]};
waitUntil {!isNil "HR_GRG_Init"};

//dont allow opening when placing a vehicle
if (isNil "HR_GRG_Placing") then { HR_GRG_Placing = false };
if (HR_GRG_Placing) exitWith { closeDialog 2 };
[] call HR_GRG_onOpenEvent;

//define general global variables used by garage
private _disp = findDisplay HR_GRG_IDD_Garage;
HR_GRG_PlayerUID = getPlayerUID player;
HR_GRG_SelectedVehicles = [-1, -1, ""];
HR_GRG_SelectedChanged = false;
HR_GRG_previewVeh = objNull;
HR_GRG_Mounts = [];
HR_GRG_usedCapacity = 0;
HR_GRG_LockedSeats = 0;
HR_GRG_ReloadMounts = false;
HR_GRG_curTexture = [];
HR_GRG_Pylons = [];
HR_GRG_UpdatePylons = false;

//preview cam
HR_GRG_previewCam = "camera" camCreate [10,0,100000];
HR_GRG_previewCam enableSimulation false;
HR_GRG_previewCam cameraEffect ["Internal", "Back"];
showCinemaBorder false;
enableEnvironment false; //wind sound
HR_GRG_previewCam camCommit 0;
HR_GRG_camDist = 1.3;
HR_GRG_camDirX = 30;
HR_GRG_camDirY = 10;

//light source
HR_GRG_previewLight = "#lightpoint" createVehicleLocal [10,0,100000];
HR_GRG_previewLight setLightBrightness 1.1 * HR_GRG_camDist;
HR_GRG_previewLight setLightAmbient [1, 1, 1];
HR_GRG_previewLight setLightColor [1, 1, 1];
HR_GRG_previewLight setLightDayLight false;//only at night
HR_GRG_previewLight lightAttachObject [HR_GRG_previewCam, [0,0,0]];

//preview cam rotation events
HR_GRG_RMouseBtnDown = false;
_disp displayAddEventHandler ["MouseButtonDown", "if ((_this#1) isEqualTo 1) then {HR_GRG_RMouseBtnDown = true};"];
_disp displayAddEventHandler ["MouseButtonUp", "if ((_this#1) isEqualTo 1) then {HR_GRG_RMouseBtnDown = false};"];
_disp displayAddEventHandler ["MouseMoving", "if (HR_GRG_RMouseBtnDown) then {_this call HR_GRG_fnc_updateCamPos};"];
_disp displayAddEventHandler ["MouseZChanged","if !(HR_GRG_RMouseBtnDown) exitWith {}; HR_GRG_camDist = 0.9 max (HR_GRG_camDist - (_this#1)*0.1) min 2; [nil,0,0] call HR_GRG_fnc_updateCamPos; HR_GRG_previewLight setLightBrightness 1.1 * HR_GRG_camDist;"];

//add veh pool modified EH
"HR_GRG_Event" addPublicVariableEventHandler {
    if (isNil "HR_GRG_Vehicles") exitWith {};
    (_this#1) call HR_GRG_fnc_reciveBroadcast;
};
"HR_GRG_Vehicles" addPublicVariableEventHandler {
    private _disp = findDisplay HR_GRG_IDD_Garage;
    private _index = HR_GRG_Cats findIf {ctrlShown _x};
    private _ctrl = HR_GRG_Cats#_index;
    [_ctrl, _index] call HR_GRG_fnc_reloadCategory;
};
//add player to broadcast recipient list
[clientOwner] remoteExecCall ["HR_GRG_fnc_addUser", 2]; //add to recipient
waitUntil {!isNil "HR_GRG_Vehicles"};//wait for server response

//define list of controls coresponding with list index
HR_GRG_Cats = [HR_GRG_IDC_CatCar,HR_GRG_IDC_CatArmored,HR_GRG_IDC_CatAir,HR_GRG_IDC_CatBoat,HR_GRG_IDC_CatStatic] apply {_disp displayCtrl _x};
{
    _x ctrlShow false;
    _x ctrlEnable false;
} forEach HR_GRG_Cats;
[0] call HR_GRG_fnc_switchCategory;

//sell button init

if (HR_GRG_disableSellButton) then {
    _disp displayCtrl HR_GRG_IDC_SellVeh ctrlEnable false;
};

//extras list init
if (
    !HR_GRG_Pylons_Enabled //Pylon editing disabled
    || {!HR_GRG_hasAmmoSource} //or ammo source not registered
) then {
    private _pylonBttn = _disp displayCtrl HR_GRG_IDC_BttnPylons;
    _pylonBttn ctrlEnable false;
    _pylonBttn ctrlSetTextColor [0.7,0,0,1];
    _pylonBttn ctrlSetTooltip localize "STR_HR_GRG_Generic_PylonDisabled";
};
[false] call HR_GRG_fnc_reloadExtras;

//hide all extras menus and info panel
{
    _ctrl = _disp displayCtrl _x;
    _ctrl ctrlEnable false;
    _ctrl ctrlShow false;
} forEach [HR_GRG_IDC_ExtraMounts,HR_GRG_IDC_ExtraTexture,HR_GRG_IDC_ExtraAnim,HR_GRG_IDC_ExtraPylonsContainer];
[0] call HR_GRG_fnc_switchExtrasMenu;
[] call HR_GRG_fnc_reloadPylons;
call HR_GRG_fnc_updateVehicleCount;


HR_GRG_EachFrame = addMissionEventHandler ["EachFrame", {
    if (call HR_GRG_CP_closeCnd) exitWith {closeDialog 2};
    if (HR_GRG_UpdatePylons) then { [] call HR_GRG_fnc_UpdatePylons };
}];

//keyBind hints
_keyBindCtrl = _disp displayCtrl HR_GRG_IDC_KeyBindHint;
_keyBindText = composeText [
    image cameraIcon,"",localize "STR_HR_GRG_Feedback_Cam_Controls", lineBreak
    ,"    ",image moveIcon,"",localize "STR_HR_GRG_Feedback_Cam_Rotate",lineBreak
    ,"    ",image zoomIcon,"",localize "STR_HR_GRG_Feedback_Cam_Zoom"
];
_keyBindCtrl ctrlSetStructuredText _keyBindText;

'HR_GRG' call BIS_fnc_endLoadingScreen;
