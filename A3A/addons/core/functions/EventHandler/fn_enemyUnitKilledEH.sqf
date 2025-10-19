params ["_victim", "_killer"];
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

//Stops the unit from spawning things
if (_victim getVariable ["spawner",false]) then
{
	_victim setVariable ["spawner",nil,true]
};

//Gather infos, trigger timed despawn
private _victimGroup = group _victim;
private _victimSide = side (group _victim);
[_victim] remoteExec ["A3A_fnc_postmortem", 2];

// Deplete resource pools if we haven't paid for this unit in advance
private _pool = _victim getVariable ["A3A_resPool", "legacy"];
if (_pool == "legacy") then {
	[-10, _victimSide, "legacy"] remoteExecCall ["A3A_fnc_addEnemyResources", 2];
};


if (A3A_hasACE) then {
	if ((isNull _killer) || (_killer == _victim)) then {
		_killer = _victim getVariable ["ace_medical_lastDamageSource", _killer];
	};
} else {
    if (_victim getVariable ["incapacitated", false]) then {
        _killer = _victim getVariable ["A3A_downedBy", _killer];
    };
};


if (_victimSide == Occupants or _victimSide == Invaders) then {
    [_victim, _victimGroup, _killer] spawn A3A_fnc_AIreactOnKill;
};

if (side (group _killer) == teamPlayer) then
{
    if (isPlayer _killer) then
    {
        [1,_killer] call A3A_fnc_playerScoreAdd;
        if (captive _killer) then
        {
            if (_killer distance _victim < distanceSPWN) then
            {
                [_killer,false] remoteExec ["setCaptive",_killer];
            };
        };
    };
    if (vehicle _killer isKindOf "StaticMortar") then
    {
        {
            if ((_x distance _victim < 300) and (captive _x)) then
            {
                [_x,false] remoteExec ["setCaptive",_x];
            };
        } forEach (call A3A_fnc_playableUnits);
    };
	if (count weapons _victim < 1 && !(_victim getVariable ["isAnimal", false])) then
    {
        //This doesn't trigger for dogs, only for surrendered units
        private _uid = (["AI",getPlayerUID _killer] select (isPlayer _killer));
        private _name = name _killer;
        Debug_3("aggroEvent | Rebel %1 [UID: %2 Name: %3] killed a surrendered unit", _killer, _uid, _name);
		[-2, getPosATL _victim] remoteExecCall ["A3A_fnc_citySupportChange", 2];     // always punish rebels for murder
        [_victimSide, 20, 30] remoteExec ["A3A_fnc_addAggression", 2];
	}
	else
	{
        private _marker = _victim getVariable ["markerX", ""];
        [1, [_marker, getPosATL _victim] select (_marker == "")] remoteExecCall ["A3A_fnc_citySupportChange", 2];
        [_victimSide, 0.5, 45] remoteExec ["A3A_fnc_addAggression", 2];
	};
};

/*
// Handled in AIReactOnKill
private _marker = _victim getVariable ["markerX", ""];
if (_marker != "") then {
    A3A_garrisonOps pushBack ["zoneCheck", [_marker]];          // should always be local for marker units
};
*/