#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
Info("initPetros started");
scriptName "fn_initPetros";

petros setSkill 1;
petros setVariable ["respawning",false];
petros allowDamage false;

removeHeadgear petros;
removeGoggles petros;
private _vest = selectRandomWeighted (A3A_rebelGear get "ArmoredVests");
if (_vest == "") then { _vest = selectRandomWeighted (A3A_rebelGear get "CivilianVests") };
petros addVest _vest;
private _weapon = ["Rifles"] call A3A_fnc_randomRifle;
[petros, _weapon, "OpticsMid", 50] call A3A_fnc_addPrimaryAndMags;
petros selectWeapon (primaryWeapon petros);

if (!A3A_petrosMoving) then {
	group petros setGroupIdGlobal ["Petros","GroupColor4"];
	petros disableAI "MOVE";
	petros disableAI "AUTOTARGET";
	petros setBehaviour "SAFE";
};

// Install both moving and static actions
[petros,"petros"] remoteExec ["A3A_fnc_flagaction", 0, petros];

[petros,true] call A3A_fnc_punishment_FF_addEH;

// Install the handleDamage EH on server & commander machines
//call A3A_fnc_addPetrosEventHandlers;
//if (!isNull theBoss) then { remoteExecCall ["A3A_fnc_addPetrosEventHandlers", theBoss] };

petros addMPEventHandler ["mpkilled",
{
    removeAllActions petros;
    if (!isServer) exitWith {};

    // Because setDamage 1 sets the killer to self, replace it if possible
    _killer = _this select 1;
    _killer = petros getVariable ["ace_medical_lastDamageSource", _killer];
    //_killer = petros getVariable ["A3A_downedBy", _killer];			// this one can't exist atm

    if ((side _killer == Invaders) or (side _killer == Occupants) or petros getVariable ["A3A_napalmHit", false]) then
    {
        garrison setVariable ["Synd_HQ", [], true];
        _hr = server getVariable "hr";
        _res = server getVariable "resourcesFIA";
        [-1*(round(_hr*0.9)), -1*(round(_res*0.9))] spawn A3A_fnc_resourcesFIA;
        A3A_petrosMoving = false; publicVariable "A3A_petrosMoving";
        [] spawn A3A_fnc_petrosDeathMonitor;
    }
    else
    {
        [] call A3A_fnc_createPetros;
    };
}];
[] spawn {sleep 120; petros allowDamage true;};

Info("initPetros completed");
