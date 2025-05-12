//Define results for small intel
#define TROOPS          100
#define TIME_LEFT       101
#define DECRYPTION_KEY  102
#define CONVOY          103
#define DEF_RESOURCES   104

//Define results for medium intel
#define ACCESS_ARMOR    200
#define ACCESS_AIR      201
#define ACCESS_HELI     202
#define CONVOYS         203
#define COUNTER_ATTACK  204
#define KEY_PACK        205

//Define results for large intel
#define WEAPON          300
#define TRAITOR         301
#define MONEY           302

params ["_intelType", "_side"];

/*  Selects, creates and executes the intel of the given type and side
*   Params:
*       _intelType : STRING : One of "Small", "Medium" or "Large"
*       _side : SIDE : The enemy side, which the intel belongs to
*
*   Returns:
*       _text : STRING : The text of the selected intel
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
if(isNil "_intelType") exitWith
{
    Error("No intel type given!");
};
if(isNil "_side") exitWith
{
    Error("No side given!");
};

private _faction = Faction(_side);
private _text = "";
private _sideName = _faction get "name";
private _intelContent = "";

if (_intelType == "Small") then
{
    _intelContent = selectRandomWeighted [TROOPS, 0, TIME_LEFT, 0.2, DEF_RESOURCES, 0.2, DECRYPTION_KEY, 0.6, CONVOY, 0];
    switch (_intelContent) do
    {
        case (TROOPS):
        {
            //Case not yet implemented as system is not usable right now
            //This can be added when the new garrison system is active
        };
        case (TIME_LEFT):
        {
            private _atkRes = [A3A_resourcesAttackOcc, A3A_resourcesAttackInv] select (_side == Invaders);
            private _atkResRate = A3A_balanceResourceRate * (A3A_enemyAttackMul / 10) / 10;           // per minute
            if (_side == Invaders) then { _atkResRate = _atkResRate * (A3A_invaderBalanceMul / 10) };

            private _nextAttack = (0.7 + random 0.6) * (-_atkRes / _atkResRate);
            if(_nextAttack < 5) then
            {
                _text = format [localize "STR_A3A_fn_intel_select_time_1", _sideName];
            }
            else
            {
                _text = format [localize "STR_A3A_fn_intel_select_time_2", _sideName, round (_nextAttack)];
            };
        };
        case (DEF_RESOURCES):
        {
            private _defRes = [A3A_resourcesDefenceOcc, A3A_resourcesDefenceInv] select (_side == Invaders);
            private _defResCap = A3A_balanceResourceRate * 10 * ([1, A3A_invaderBalanceMul / 10] select (_side == Invaders));

            private _fraction = _defRes / _defResCap;
            private _fmt = call {
                if (_fraction > 0.75) exitWith { localize "STR_A3A_fn_intel_select_reso_1" };
                if (_fraction > 0.50) exitWith { localize "STR_A3A_fn_intel_select_reso_2" };
                if (_fraction > 0.25) exitWith { localize "STR_A3A_fn_intel_select_reso_3" };
                if (_fraction > 0.00) exitWith { localize "STR_A3A_fn_intel_select_reso_4" };
                localize "STR_A3A_fn_intel_select_reso_5";
            };
            _text = format [_fmt, _sideName];
        };
        case (DECRYPTION_KEY):
        {
            if(_side == Occupants) then
            {
                occupantsRadioKeys = occupantsRadioKeys + 1;
            }
            else
            {
                invaderRadioKeys = invaderRadioKeys + 1;
            };
            _text = format [localize "STR_A3A_fn_intel_select_decry_1", _sideName];
        };
        case (CONVOY):
        {
            // These aren't active at the moment
            private _convoyMarker = "";
            [] call A3A_fnc_cleanConvoyMarker;
            if(_side == Occupants) then
            {
                _convoyMarker = (server getVariable ["convoyMarker_Occupants", []]);
            }
            else
            {
                _convoyMarker = (server getVariable ["convoyMarker_Invaders", []]);
            };
            if(count _convoyMarker != 0) then
            {
                (selectRandom _convoyMarker) setMarkerAlpha 1;
                _text = format [localize "STR_A3A_fn_intel_select_conv_1", _sideName];
            }
            else
            {
                _text = format [localize "STR_A3A_fn_intel_select_conv_2", _sideName];
            };
        };
    };
};

if (_intelType == "Medium") then
{
    _intelContent = selectRandomWeighted [KEY_PACK, 1, ACCESS_AIR, 0, ACCESS_HELI, 0, ACCESS_ARMOR, 0, CONVOYS, 0, COUNTER_ATTACK, 0];
    switch (_intelContent) do
    {
        case (KEY_PACK):
        {
            private _keyCount = round (3 + random 3);
            if(_side == Occupants) then
            {
                occupantsRadioKeys = occupantsRadioKeys + _keyCount;
            }
            else
            {
                invaderRadioKeys = invaderRadioKeys + _keyCount;
            };
            _text = format [localize "STR_A3A_fn_intel_select_decry_2", _sideName];
        };
/*
        // These are meaningless at the moment
        case (ACCESS_AIR):
        {
            _text = format ["%1 currently has access to<br/>%2", _sideName, ([_side, ACCESS_AIR] call A3A_fnc_getVehicleIntel)];
        };
        case (ACCESS_HELI):
        {
            _text = format ["%1 currently has access to<br/>%2", _sideName, ([_side, ACCESS_HELI] call A3A_fnc_getVehicleIntel)];
        };
        case (ACCESS_ARMOR):
        {
            _text = format ["%1 currently has access to<br/>%2", _sideName, ([_side, ACCESS_ARMOR] call A3A_fnc_getVehicleIntel)];
        };
*/
        case (CONVOYS):
        {
            [] call A3A_fnc_cleanConvoyMarker;
            private _convoyMarkers = [];
            if(_side == Occupants) then
            {
                _convoyMarkers = server getVariable ["convoyMarker_Occupants", []];
            }
            else
            {
                _convoyMarkers = server getVariable ["convoyMarker_Invaders", []];
            };
            {
                _x setMarkerAlpha 1;
            } forEach _convoyMarkers;
            _text = format [localize "STR_A3A_fn_intel_select_conv_3", _sideName, count _convoyMarkers];
        };
        case (COUNTER_ATTACK):
        {
            //Not yet implemented, needs a rework of the attack script
        };
    };

};

if (_intelType == "Large") then
{
    if("AS" in A3A_activeTasks) then
    {
        _intelContent = selectRandomWeighted [TRAITOR, 0.3, WEAPON, 0.3, MONEY, 0.4];
    }
    else
    {
        _intelContent = selectRandomWeighted [WEAPON, 0.4, MONEY, 0.6];
    };
    switch (_intelContent) do
    {
        case (TRAITOR):
        {
            _text = localize "STR_A3A_fn_intel_select_trait_1";
            traitorIntel = true; publicVariable "traitorIntel";
        };
        case (WEAPON):
        {
            private _notYetUnlocked = allWeapons - unlockedWeapons - allMissileLaunchers; // to prevent guided launchers from being unlocked by large intel
            _newWeapon = selectRandom _notYetUnlocked;
            [_newWeapon] remoteExec ["A3A_fnc_unlockEquipment", 2];

            private _weaponName = getText (configFile >> "CfgWeapons" >> _newWeapon >> "displayName");
            _text = format [localize "STR_A3A_fn_intel_select_weap_1", _weaponName];
        };
        case (MONEY):
        {
            private _money = ((round (random 50)) + (10 * tierWar)) * 100;
            _text = format [localize "STR_A3A_fn_intel_select_mon_1", _money];
            [0, _money] remoteExec ["A3A_fnc_resourcesFIA",2];
        };
    };
};

[_text] remoteExec ["A3A_fnc_showIntel", 0];
