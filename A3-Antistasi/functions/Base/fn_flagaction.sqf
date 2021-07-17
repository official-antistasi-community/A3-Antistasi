private ["_flag","_typeX"];

if (!hasInterface) exitWith {};

_flag = _this select 0;
_typeX = _this select 1;

switch _typeX do
{
    case "take":
    {
        removeAllActions _flag;
        _actionX = _flag addAction [localize "STR_antistasi_addAction_takeFlag" + "<img image='\A3\ui_f\data\igui\cfg\actions\takeflag_ca.paa' size='1.8' shadow=2 />", A3A_fnc_mrkWIN,nil,6,true,true,"","(isPlayer _this) and (_this == _this getVariable ['owner',objNull])",4];
        _flag setUserActionText [_actionX,localize "STR_antistasi_addAction_takeFlag","<t size='2'><img image='\A3\ui_f\data\igui\cfg\actions\takeflag_ca.paa'/></t>"];
    };
    case "unit":
    {
        _flag addAction [localize "STR_antistasi_customHint_unit_recruit", {if ([player,300] call A3A_fnc_enemyNearCheck) then {[localize "STR_antistasi_customHint_unit_recruit", localize "STR_antistasi_customHint_unit_recruit_enemies"] call A3A_fnc_customHint;} else { [] spawn A3A_fnc_unit_recruit; };},nil,0,false,true,"","(isPlayer _this) and (_this == _this getVariable ['owner',objNull])",4]
    };
    case "vehicle":
    {
        _flag addAction [localize "STR_antistasi_dialogs_vehicle_purchase_buy_text", {if ([player,300] call A3A_fnc_enemyNearCheck) then {[localize "STR_antistasi_dialogs_vehicle_purchase_buy_text", localize "STR_antistasi_customHint_buy_vehicle_enemies"] call A3A_fnc_customHint;} else {createDialog "vehicle_option"}},nil,0,false,true,"","(isPlayer _this) and (_this == _this getVariable ['owner',objNull])",4]
    };
    case "mission":
    {
        petros addAction [localize "STR_antistasi_mission_request", {CreateDialog "mission_menu";},nil,0,false,true,"","(isPlayer _this) and (_this == _this getVariable ['owner',objNull]) and ([_this] call A3A_fnc_isMember) and (petros == leader group petros)",4];
        petros addAction [localize "STR_antistasi_addAction_HQ_management", A3A_fnc_dialogHQ,nil,0,false,true,"","(_this == theBoss) and (petros == leader group petros)", 4];
        petros addAction [localize "STR_antistasi_logistics_move", A3A_fnc_moveHQObject,nil,0,false,true,"","(_this == theBoss)"];
    };
    case "truckX":
    {
        actionX = _flag addAction [localize "STR_antistasi_logistics_box_to_truck" + "<img image='\A3\ui_f\data\igui\cfg\actions\unloadVehicle_ca.paa' size='1.8' shadow=2 />", A3A_fnc_transfer,nil,6,true,true,"","(isPlayer _this) and (_this == _this getVariable ['owner',objNull])"]
    };
    //case "heal": {if (player != _flag) then {_flag addAction [format ["Revive %1",name _flag], { _this spawn A3A_fnc_actionRevive; },nil,0,false,true,"","(isPlayer _this) and (_this == _this getVariable ['owner',objNull])"]}};
    case "heal":
    {
        if (player != _flag) then
        {
            if ([_flag] call A3A_fnc_fatalWound) then
            {
                _actionX = _flag addAction [format [localize "STR_A3_ReviveName" + "<img size='1.8' <img image='\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_reviveMedic_ca.paa' />",name _flag], A3A_fnc_actionRevive,nil,6,true,true,"","!(_this getVariable [""helping"",false]) and (isNull attachedTo _target)",4];
                _flag setUserActionText [_actionX,format [localize "STR_A3_ReviveName",name _flag],"<t size='2'><img image='\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_reviveMedic_ca.paa'/></t>"];
            }
            else
            {
                _actionX = _flag addAction [format [localize "STR_A3_ReviveName" + "<img size='1.8' <img image='\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_revive_ca.paa' />",name _flag], A3A_fnc_actionRevive,nil,6,true,true,"","!(_this getVariable [""helping"",false]) and (isNull attachedTo _target)",4];
                _flag setUserActionText [_actionX,format [localize "STR_A3_ReviveName",name _flag],"<t size='2'><img image='\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_revive_ca.paa'/></t>"];
            };
        };
    };
    case "heal1":
    {
        if (player != _flag) then
        {
            if ([_flag] call A3A_fnc_fatalWound) then
            {
                _actionX = _flag addAction [format [localize "STR_A3_ReviveName" + "<img size='1.8' <img image='\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_reviveMedic_ca.paa' />",name _flag], A3A_fnc_actionRevive,nil,6,true,false,"","!(_this getVariable [""helping"",false]) and (isNull attachedTo _target)",4];
                _flag setUserActionText [_actionX,format [localize "STR_A3_ReviveName",name _flag],"<t size='2'><img image='\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_reviveMedic_ca.paa'/></t>"];
            }
            else
            {
                _actionX = _flag addAction [format [localize "STR_A3_ReviveName" + "<img size='1.8' <img image='\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_revive_ca.paa' />",name _flag], A3A_fnc_actionRevive,nil,6,true,false,"","!(_this getVariable [""helping"",false]) and (isNull attachedTo _target)",4];
                _flag setUserActionText [_actionX,format [localize "STR_A3_ReviveName",name _flag],"<t size='2'><img image='\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_revive_ca.paa'/></t>"];
            };
            //_flag addAction [format ["Revive %1",name _flag], { _this spawn A3A_fnc_actionRevive; },nil,0,false,true,"","!(_this getVariable [""helping"",false]) and (isNull attachedTo _target)"];

            _actionX = _flag addAction [format [localize "STR_antistasi_addAction_carry" + "<img image='\A3\ui_f\data\igui\cfg\actions\take_ca.paa' size='1.6' shadow=2 />",name _flag], A3A_fnc_carry,nil,5,true,false,"","(isPlayer _this) and (_this == _this getVariable ['owner',objNull]) and (isNull attachedTo _target) and !(_this getVariable [""helping"",false]);",4];
            _flag setUserActionText [_actionX,format [localize "STR_antistasi_addAction_carry",name _flag],"<t size='2'><img image='\A3\ui_f\data\igui\cfg\actions\take_ca.paa'/></t>"];
            [_flag] call A3A_fnc_logistics_addLoadAction;
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
                call A3A_fnc_initLootToCrate;
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
        _flag addAction [localize "STR_antistasi_addAction_liberate" + "<img image='\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_unbind_ca.paa' size='1.6' shadow=2 />", A3A_fnc_liberaterefugee,nil,6,true,true,"","(isPlayer _this) and (_this == _this getVariable ['owner',objNull])",4]
    };//"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_unbind_ca.paa"
    case "prisonerX":
    {
        _flag addAction [localize "STR_antistasi_addAction_liberate_POW" + "<img image='\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_unbind_ca.paa' size='1.6' shadow=2 />", A3A_fnc_liberatePOW,nil,6,true,true,"","(isPlayer _this) and (_this == _this getVariable ['owner',objNull])",4]
    };
    case "captureX":
    {
        // Uses the optional param to determine whether the call of captureX is a release or a recruit
        _flag addAction [localize "STR_antistasi_addAction_liberate_POW" + "<img image='\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_unbind_ca.paa' size='1.6' shadow=2 />", { _this spawn A3A_fnc_captureX; },false,6,true,true,"","(isPlayer _this) and (_this == _this getVariable ['owner',objNull])",4];
        _flag addAction [localize "STR_antistasi_journal_entry_header_AI_1", { _this spawn A3A_fnc_captureX; },true,0,false,true,"","(isPlayer _this) and (_this == _this getVariable ['owner',objNull])",4];
        _flag addAction [localize "STR_antistasi_addAction_interrogate", A3A_fnc_interrogate,nil,0,false,true,"","(isPlayer _this) and (_this == _this getVariable ['owner',objNull])",4];
    };
    case "buildHQ":
    {
        _flag addAction [localize "STR_antistasi_addAction_buildHQ", A3A_fnc_buildHQ,nil,0,false,true,"","(isPlayer _this) and (_this == _this getVariable ['owner',objNull])",4]
    };
    case "seaport":
    {
        _flag addAction [localize "STR_antistasi_addAction_buyBoat", {[vehSDKBoat] spawn A3A_fnc_addFIAVeh},nil,0,false,true,"","(isPlayer _this) and (_this == _this getVariable ['owner',objNull])",4]
    };
    case "garage":
    {
        [_flag] call HR_GRG_fnc_initGarage;
    };
    case "fireX":
    {
        fireX addAction [localize "STR_antistasi_addAction_sleep", A3A_fnc_skiptime,nil,0,false,true,"","(_this == theBoss)",4];
        fireX addAction [localize "STR_antistasi_addAction_cleanForest", A3A_fnc_clearForest,nil,0,false,true,"","(_this == theBoss)",4];
        fireX addAction [localize "STR_antistasi_addAction_fog", { [10,0] remoteExec ["setFog",2]; },nil,0,false,true,"","(_this == theBoss)",4];
        fireX addAction [localize "STR_antistasi_addAction_rain", { [10,0] remoteExec ["setRain",2]; },nil,0,false,true,"","(_this == theBoss)",4];
        fireX addAction [localize "STR_antistasi_logistics_move", A3A_fnc_moveHQObject,nil,0,false,true,"","(_this == theBoss)",4];
    };
    case "SDKFlag":
    {
        removeAllActions _flag;
        _flag addAction [localize "STR_antistasi_customHint_unit_recruit", {if ([player,300] call A3A_fnc_enemyNearCheck) then {[localize "STR_antistasi_customHint_unit_recruit", localize "STR_antistasi_customHint_unit_recruit_enemies"] call A3A_fnc_customHint;} else { [] spawn A3A_fnc_unit_recruit; };},nil,0,false,true,"","(isPlayer _this) and (_this == _this getVariable ['owner',objNull])",4];
        _flag addAction [localize "STR_antistasi_dialogs_vehicle_purchase_buy_text", {if ([player,300] call A3A_fnc_enemyNearCheck) then {["Buy Vehicle", localize "STR_antistasi_customHint_buy_vehicle_enemies"] call A3A_fnc_customHint;} else {nul = createDialog "vehicle_option"}},nil,0,false,true,"","(isPlayer _this) and (_this == _this getVariable ['owner',objNull])",4];
        [_flag] call HR_GRG_fnc_initGarage;
    };
    case "Intel_Small":
    {
        _flag addAction [localize "STR_A3_Showcase_Marksman_BIS_tskIntel_title", A3A_fnc_searchIntelOnLeader, nil, 4, true, false, "", "isPlayer _this", 4];
    };
    case "Intel_Medium":
    {
        _flag addAction [localize "STR_a3_bis_fnc_initintelobject_take", A3A_fnc_searchIntelOnDocument, nil, 4, true, false, "", "isPlayer _this", 4];
    };
    case "Intel_Large":
    {
        _flag addAction [localize "STR_a3_endgame_misc_downloadintel", A3A_fnc_searchIntelOnLaptop, nil, 4, true, false, "", "isPlayer _this", 4];
    };
    case "Intel_Encrypted":
    {
        _flag addAction [localize "STR_antistasi_intel_decifer", A3A_fnc_searchEncryptedIntel, nil, 4, true, false, "", "isPlayer _this", 4];
    };
    case "static":
    {
        private _cond = "(_target getVariable ['ownerSide', teamPlayer] == teamPlayer) and (isNull attachedTo _target) and ([_this] call A3A_fnc_isMember) and ";
        _flag addAction [localize "STR_antistasi_addAction_allowAIUseWeapon", A3A_fnc_unlockStatic, nil, 1, false, false, "", _cond+"!isNil {_target getVariable 'lockedForAI'}", 4];
        _flag addAction [localize "STR_antistasi_addAction_preventAIUseWeapon", A3A_fnc_lockStatic, nil, 1, false, false, "", _cond+"isNil {_target getVariable 'lockedForAI'}", 4];
    //    _flag addAction ["Kick AI off this weapon", A3A_fnc_lockStatic, nil, 1, true, false, "", _cond+"isNil {_target getVariable 'lockedForAI'} and !(isNull gunner _target) and !(isPlayer gunner _target)}", 4];
        _flag addAction [localize "STR_antistasi_logistics_move", A3A_fnc_moveHQObject, nil, 1.5, false, false, "",  _cond+"(count crew _target == 0)", 4];
    };
};
