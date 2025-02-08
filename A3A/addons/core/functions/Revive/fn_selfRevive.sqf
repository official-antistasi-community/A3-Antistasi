/*
    A3A_fnc_selfRevive
    Attempt to self-revive the local player (needs FAK, 5min timeout) 

    No arguments, no return

    Environment: Player-local
*/

if !(player getVariable ["incapacitated", false]) exitWith {};

private _firstAidKits = ["FirstAidKit"] + (A3A_faction_reb get "firstAidKits");
private _hasFAKs = _firstAidKits arrayIntersect items player;

private _hintTitle = localize "STR_A3A_selfRevive_title";
if (_hasFAKs isEqualTo []) exitWith {
    [_hintTitle, localize "STR_A3A_selfRevive_noFAK"] call A3A_fnc_customHint;
};

if (time < player getVariable ["A3A_selfReviveTimeout", -1]) exitWith {
    [_hintTitle, localize "STR_A3A_selfRevive_recent"] call A3A_fnc_customHint;
};

// ok so now we actually do it...
removeAllUserActionEventHandlers ["A3A_core_respawn", "Activate"];
removeAllUserActionEventHandlers ["A3A_core_selfRevive", "Activate"];

player setVariable ["incapacitated", false, true];
player setDamage 0.5;
player removeItem selectRandom _hasFAKs;

private _timeout = missionNamespace getVariable ["A3A_selfReviveTimeout", 300];
player setVariable ["A3A_selfReviveTimeout", _timeout + time];

[_hintTitle, localize "STR_A3A_selfRevive_success"] call A3A_fnc_customHint;

private _aimCoef = missionNamespace getVariable ["A3A_selfReviveAimCoef", 3];
player setCustomAimCoef _aimCoef;

// Some bog standard desaturation
private _handle = ppEffectCreate ["ColorCorrections", 1537];
_handle ppEffectEnable true;
_handle ppEffectAdjust [1, 1, 0,
	[0, 0, 0, 0],
	[1, 1, 1, 0.5],
	[0.299, 0.587, 0.114, 0]
];
_handle ppEffectCommit 5;
A3A_selfRevivePPHandle = _handle;

_timeout spawn {
    sleep _this;
    [false] call A3A_fnc_selfReviveReset;
};
