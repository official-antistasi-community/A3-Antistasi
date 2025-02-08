#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
private ["_flag","_typeX"];

if (!hasInterface) exitWith {};

_flag = _this select 0;
_typeX = _this select 1;

switch _typeX do
{
    case "take":
    {
        removeAllActions _flag;
        _actionX = _flag addAction ["<t>Take the Flag<t> <img image='\A3\ui_f\data\igui\cfg\actions\takeflag_ca.paa' size='1.8' shadow=2 />", A3A_fnc_mrkWIN,nil,6,true,true,"","(isNil 'A3A_isPlayerCapturingFlag' || {!A3A_isPlayerCapturingFlag}) && (_this == _this getVariable ['owner',objNull])",4];// TODO: partial string created - unsure about implementation
        _flag setUserActionText [_actionX,localize "STR_A3A_fn_base_flagaction_take","<img size='2' image='\A3\ui_f\data\igui\cfg\actions\takeflag_ca.paa'/>"];
    };
    case "unit":
    {
        _flag addAction [localize "STR_A3A_fn_base_flagaction_recruit", {if ([getPosATL player] call A3A_fnc_enemyNearCheck) then {[localize "STR_A3A_fn_base_flagaction_recruit", localize "STR_A3A_fn_base_flagaction_recruit_no"] call A3A_fnc_customHint;} else { [] spawn A3A_fnc_unit_recruit; };},nil,0,false,true,"","(isPlayer _this) and (_this == _this getVariable ['owner',objNull])",4]
    };
    case "vehicle":
    {
        _flag addAction [localize "STR_A3A_fn_base_flagaction_vehiclebuy", {if ([getPosATL player] call A3A_fnc_enemyNearCheck) then {
            [localize "STR_A3A_fn_base_flagaction_vehiclebuy", localize "STR_A3A_fn_base_flagaction_vehiclebuy_no"] call A3A_fnc_customHint;
        } else {
            createDialog "A3A_BuyVehicleDialog";
        }},nil,0,false,true,"","(isPlayer _this) and (_this == _this getVariable ['owner',objNull])",4]
    };
    case "petros":
    {
        petros addAction [localize "STR_A3A_fn_base_flagaction_missionrequest", {
#ifdef UseDoomGUI
    ERROR("Disabled due to UseDoomGUI Switch.")
#else
            CreateDialog "mission_menu";
#endif
        },nil,0,false,true,"","([_this] call A3A_fnc_isMember or _this == theBoss) and (petros == leader group petros) and _this == _this getVariable ['owner',objNull]",4];
        petros addAction [localize "STR_A3A_fn_base_flagaction_hq_manage", A3A_fnc_dialogHQ,nil,0,false,true,"","(_this == theBoss) and (petros == leader group petros)", 4];
        petros addAction [localize "STR_A3A_fn_base_flagaction_asset_move", A3A_fnc_carryItem,nil,0,false,true,"","(_this == theBoss) and (petros == leader group petros) and (isNull objectParent _this) and !(call A3A_fnc_isCarrying)"];

        petros addAction [localize "STR_A3A_fn_base_flagaction_hq_build", A3A_fnc_buildHQ,nil,0,false,true,"","(_this == theBoss) and (petros != leader group petros)",4];
        //petros addAction ["Experimental HQ Management. Work in Progress.", { createDialog "A3A_HqDialog"; },nil,0,false,true,"","A3A_GUIDevPreview and (_this == theBoss) and (petros == leader group petros)",4];
    };
    case "truckX":
    {
        actionX = _flag addAction ["<t>Transfer Ammobox to Truck<t> <img image='\A3\ui_f\data\igui\cfg\actions\unloadVehicle_ca.paa' size='1.8' shadow=2 />", A3A_fnc_transfer,nil,6,true,true,"","(isPlayer _this) and (_this == _this getVariable ['owner',objNull])"]// TODO: partial string created - unsure about implementation
    };
    //case "heal": {if (player != _flag) then {_flag addAction [format ["Revive %1",name _flag], { _this spawn A3A_fnc_actionRevive; },nil,0,false,true,"","(isPlayer _this) and (_this == _this getVariable ['owner',objNull])"]}};
    case "heal":
    {
        if (player != _flag) then
        {
            if ([_flag] call A3A_fnc_fatalWound) then
            {
                _actionX = _flag addAction [format ["<t>Revive %1 </t> <img size='1.8' <img image='\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_reviveMedic_ca.paa' />",name _flag], A3A_fnc_actionRevive,nil,6,true,true,"","!(_this getVariable [""helping"",false]) and (isNull attachedTo _target)",4];// TODO: partial string created - unsure about implementation
                _flag setUserActionText [_actionX,format [localize "STR_A3A_fn_base_flagaction_heal_revive",name _flag],"<t size='2'><img image='\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_reviveMedic_ca.paa'/></t>"];
            }
            else
            {
                _actionX = _flag addAction [format ["<t>Revive %1 </t> <img size='1.8' <img image='\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_revive_ca.paa' />",name _flag], A3A_fnc_actionRevive,nil,6,true,true,"","!(_this getVariable [""helping"",false]) and (isNull attachedTo _target)",4];// TODO: partial string created - unsure about implementation
                _flag setUserActionText [_actionX,format [localize "STR_A3A_fn_base_flagaction_heal_revive",name _flag],"<t size='2'><img image='\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_revive_ca.paa'/></t>"];
            };
        };
    };
    case "heal1":
    {
        if (player != _flag) then
        {
            if ([_flag] call A3A_fnc_fatalWound) then
            {
                _actionX = _flag addAction [format ["<t>Revive %1</t> <img size='1.8' <img image='\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_reviveMedic_ca.paa' />",name _flag], A3A_fnc_actionRevive,nil,6,true,false,"","!(_this getVariable [""helping"",false]) and (isNull attachedTo _target)",4];// TODO: partial string created - unsure about implementation
                _flag setUserActionText [_actionX,format [localize "STR_A3A_fn_base_flagaction_heal_revive",name _flag],"<t size='2'><img image='\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_reviveMedic_ca.paa'/></t>"];
            }
            else
            {
                _actionX = _flag addAction [format ["<t>Revive %1</t> <img size='1.8' <img image='\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_revive_ca.paa' />",name _flag], A3A_fnc_actionRevive,nil,6,true,false,"","!(_this getVariable [""helping"",false]) and (isNull attachedTo _target)",4];// TODO: partial string created - unsure about implementation
                _flag setUserActionText [_actionX,format [localize "STR_A3A_fn_base_flagaction_heal_revive",name _flag],"<t size='2'><img image='\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_revive_ca.paa'/></t>"];
            };
            //_flag addAction [format ["Revive %1",name _flag], { _this spawn A3A_fnc_actionRevive; },nil,0,false,true,"","!(_this getVariable [""helping"",false]) and (isNull attachedTo _target)"];

            _actionX = _flag addAction [format ["<t>Carry %1</t> <img image='\A3\ui_f\data\igui\cfg\actions\take_ca.paa' size='1.6' shadow=2 />",name _flag], A3A_fnc_carry,nil,5,true,false,"","(isPlayer _this) and (_this == _this getVariable ['owner',objNull]) and (isNull attachedTo _target) and !(_this getVariable [""helping"",false]) and !(call A3A_fnc_isCarrying);",4];// TODO: partial string created - unsure about implementation
            _flag setUserActionText [_actionX,format [localize "STR_A3A_fn_base_flagaction_heal_carry",name _flag],"<t size='2'><img image='\A3\ui_f\data\igui\cfg\actions\take_ca.paa'/></t>"];// TODO: string created, unsure about implementation

            // Call the internal logistics function, because this one is already global-JIP
            [_flag, "load"] call A3A_Logistics_fnc_addAction;
        };
    };
    case "remove":
    {
        if (player == _flag) then
        {
            if (isNil "actionX") then
            {
                removeAllActions _flag;
                if (player == player getVariable ["owner",player]) then {[] call SA_Add_Player_Tow_Actions};
            }
            else
            {
                _flag removeAction actionX;
            };
        }
        else
        {
            removeAllActions _flag;
        };
    };
    case "refugee":
    {
        _flag addAction ["<t>Liberate</t> <img image='\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_unbind_ca.paa' size='1.6' shadow=2 />", A3A_fnc_liberaterefugee,nil,6,true,true,"","(isPlayer _this) and (_this == _this getVariable ['owner',objNull])",4]// TODO: partial string created - unsure about implementation
    };//"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_unbind_ca.paa"
    case "prisonerX":
    {
        _flag addAction ["<t>Liberate POW</t> <img image='\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_unbind_ca.paa' size='1.6' shadow=2 />", A3A_fnc_liberatePOW,nil,6,true,true,"","(isPlayer _this) and (_this == _this getVariable ['owner',objNull])",4]// TODO: partial string created - unsure about implementation
    };
    case "captureX":
    {
        // Uses the optional param to determine whether the call of captureX is a release or a recruit
        _flag addAction ["<t>Release POW</t> <img image='\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_unbind_ca.paa' size='1.6' shadow=2 />", { _this spawn A3A_fnc_captureX; },false,6,true,true,"","(isPlayer _this) and (_this == _this getVariable ['owner',objNull])",4];// TODO: partial string created - unsure about implementation
        _flag addAction [localize "STR_A3A_fn_base_flagaction_capturex_recruit", { _this spawn A3A_fnc_captureX; },true,0,false,true,"","(isPlayer _this) and (_this == _this getVariable ['owner',objNull])",4];
        _flag addAction [localize "STR_A3A_fn_base_flagaction_capturex_interrogate", A3A_fnc_interrogate,nil,0,false,true,"","(isPlayer _this) and (_this == _this getVariable ['owner',objNull])",4];
    };
    case "seaport":
    {
        // No additional actions assigned.
    };
    case "garage":
    {
        [_flag] call HR_GRG_fnc_initGarage;
    };
    case "fireX":
    {
        fireX addAction [localize "STR_A3A_fn_base_flagaction_firex_rest", A3A_fnc_skiptime,nil,0,false,true,"","(_this == theBoss)",4];
        fireX addAction [localize "STR_A3A_fn_base_flagaction_firex_forest", A3A_fnc_clearForest,nil,0,false,true,"","(_this == theBoss)",4];
        fireX addAction [localize "STR_A3A_fn_base_flagaction_firex_fog", { [10,[0,0,0]] remoteExec ["setFog",2]; },nil,0,false,true,"","(_this == theBoss)",4];
        fireX addAction [localize "STR_A3A_fn_base_flagaction_firex_rain", { [10,0] remoteExec ["setRain",2]; [60,0.25] remoteExec ["setOvercast",2] },nil,0,false,true,"","(_this == theBoss)",4];
    };
    case "SDKFlag":
    {
#ifdef UseDoomGUI
        if (true) exitWith { ERROR("Disabled due to UseDoomGUI Switch.") };
#endif
        removeAllActions _flag;
        _flag addAction [localize "STR_A3A_fn_base_flagaction_recruit", {if ([getPosATL player] call A3A_fnc_enemyNearCheck) then {[localize "STR_A3A_fn_base_flagaction_recruit", localize "STR_A3A_fn_base_flagaction_recruit_no"] call A3A_fnc_customHint;} else { [] spawn A3A_fnc_unit_recruit; };},nil,0,false,true,"","(isPlayer _this) and (_this == _this getVariable ['owner',objNull])",4];
        _flag addAction [localize "STR_A3A_fn_base_flagaction_vehiclebuy", {if ([getPosATL player] call A3A_fnc_enemyNearCheck) then {
            [localize "STR_A3A_fn_base_flagaction_vehiclebuy", localize "STR_A3A_fn_base_flagaction_vehiclebuy_no"] call A3A_fnc_customHint;
        } else {
            createDialog "A3A_BuyVehicleDialog";
        }},nil,0,false,true,"","(isPlayer _this) and (_this == _this getVariable ['owner',objNull])",4];
        [_flag] call HR_GRG_fnc_initGarage;
    };
    case "Intel_Small":
    {
        _flag addAction [
            localize "STR_A3A_fn_base_flagaction_intel_search",
            A3A_fnc_searchIntelOnLeader,
            nil,
            4,
            true,
            false,
            "",
            "!([_target] call A3A_fnc_canFight) && !(_target getVariable ['intelSearchDone', false]) && isPlayer _this",
            4
        ];
    };
    case "Intel_Medium":
    {
        _flag addAction [localize "STR_A3A_fn_base_flagaction_intel_take", A3A_fnc_searchIntelOnDocument, nil, 4, true, false, "", "isPlayer _this", 4];
    };
    case "Intel_Large":
    {
        _flag addAction [localize "STR_A3A_fn_base_flagaction_intel_download", A3A_fnc_searchIntelOnLaptop, nil, 4, true, false, "", "isPlayer _this", 4];
    };
    case "Intel_Encrypted":
    {
        _flag addAction [localize "STR_A3A_fn_base_flagaction_intel_decifer", A3A_fnc_searchEncryptedIntel, nil, 4, true, false, "", "isPlayer _this", 4];
    };
    case "static":
    {
        private _cond = "(isPlayer _this) and (_target getVariable ['ownerSide', teamPlayer] == teamPlayer) and (isNull attachedTo _target) and ";
        _flag addAction [localize "STR_A3A_fn_base_flagaction_static_allow", A3A_fnc_unlockStatic, nil, 1, false, true, "", _cond+"!isNil {_target getVariable 'lockedForAI'}", 4];
        _flag addAction [localize "STR_A3A_fn_base_flagaction_static_prevent", A3A_fnc_lockStatic, nil, 1, false, true, "", _cond+"isNil {_target getVariable 'lockedForAI'}", 4];
    //    _flag addAction ["Kick AI off this weapon", A3A_fnc_lockStatic, nil, 1, true, false, "", _cond+"isNil {_target getVariable 'lockedForAI'} and !(isNull gunner _target) and !(isPlayer gunner _target)}", 4];
        _flag addAction [localize "STR_A3A_fn_base_flagaction_asset_move", A3A_fnc_carryItem, nil, 1.5, false, true, "",  _cond+"(count crew _target == 0) and (isNull objectParent _this) and !(call A3A_fnc_isCarrying)", 4];
    };
};
