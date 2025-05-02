/*
Author: Caleb Serafin
    Decimates most objects.
    Vehicles should survive but be extremely damaged.
    Plays relevant audio if applicable. (Hurt sounds)
    Deletes items and cargo inventory.

Arguments:
    <OBJECT> The targeted object. Is filtered within this function.
    <BOOL> If allowed to create particles and lights. Only set to true if this used on few objects at a time.
    <STRING> CancellationToken; pass with element 0 = true; if element 0 is false effects stop as-soon as possible.

Return Value:
    <BOOL> true if normal operation. false if something is invalid.

Scope: _victim, Local Arguments, Global Effect
Environment: Any
Public: Yes. Can be called on objects independently, might make for an "interesting" punishment.
Dependencies:
    <BOOL> A3A_hasACEMedical

Example:
    [cursorObject, true] call A3A_fnc_napalmDamage;  // Burn whatever you are looking at.
*/
params [
    ["_victim",objNull,[objNull]],
    ["_particles",false,[false]],
    ["_cancellationTokenUUID","",[ "" ]]
];
private _filename = "functions\AI\fn_napalmDamage.sqf";

if (isNull _victim) exitWith {false};  // Silent, likely for script to find some null objects somehow.

if (isNil {
    if (!alive _victim || {!isDamageAllowed _victim} || {isObjectHidden _victim}) exitWith {nil};   // Hidden objects could be Zeus or other important mission things.
    1;
}) exitWith {true};
private _overKill = 3;  // In case the the unit starts getting healed.
private _timeToLive = 6;  // Higher number causes damage to be dealt more slowly.
private _totalTicks = 3;  // Higher number gives more detail.

private _timeBetweenTicks = _timeToLive/_totalTicks;
private _damagePerTick = 1/_totalTicks;
_totalTicks = _totalTicks * _overKill;

private _fnc_init = 'params ["_victim"];';                  // params ["_victim"] No return required
private _fnc_onTick = 'params ["_victim","_tickCount"];';   // params ["_victim","_tickCount"] No return required
private _fnc_final = 'params ["_victim"];';                 // params ["_victim"] No return required

private _invalidVictim = false;
switch (true) do {
    case (_victim isKindOf "CAManBase"): {  // Man includes everything biological, even animals such as goats ect...
        if (_victim == petros) then {
            // Should probably pass in the napalm source side but this will do for now
            _victim setVariable ["A3A_napalmHit", true, 2];
            _fnc_final = _fnc_final + 'if (alive _victim) then { _victim setVariable ["A3A_napalmHit", nil, 2] };';
        };
        if (A3A_hasACEMedical) then {
            _fnc_onTick = _fnc_onTick +
            'if (alive _victim) then {
                [ _victim, 1*' + str _damagePerTick + ' , "Body", "grenade"] call ace_medical_fnc_addDamageToUnit;'+  // Multiplier might need to be raised for ACE.
            '};

            if (alive _victim && {!(_victim getVariable ["ACE_isUnconscious",false])} && {(('+ str _timeBetweenTicks + '*_tickCount) mod 2) isEqualTo 0}) then {'+  // Once every 2 seconds
            '    playSound3D [selectRandom A3A_sounds_soundInjured_max,vehicle _victim, false, getPosASL vehicle _victim, 1.75, 1, 200];'+  // For `vehicle _victim` see https://community.bistudio.com/wiki/playSound3D Comment Posted on November 8, 2014 - 21:48 (UTC) By Killzone kid
            '};';
        } else {
            _fnc_onTick = _fnc_onTick +
            'if (alive _victim) then {
                _victim setDamage [(damage _victim + ' + str _damagePerTick + ') min 1, true];'+
            '};

            if (alive _victim && {(('+ str _timeBetweenTicks + '* _tickCount) mod 2) isEqualTo 0}) then {'+  // Once every 2 seconds
            '    playSound3D [selectRandom A3A_sounds_soundInjured_max,vehicle _victim, false, getPosASL vehicle _victim, 1.75, 1, 200];'+  // For `vehicle _victim` see https://community.bistudio.com/wiki/playSound3D Comment Posted on November 8, 2014 - 21:48 (UTC) By Killzone kid
            '};';
        };
        if (_particles) then {
            // WIP
        };
    };
    case (_victim isKindOf "Man"): {_invalidVictim = true;};  // Goats, Sneks, butterflies, Rabbits can be blessed by Petros himself.
    case (_victim isKindOf "AllVehicles"): {
        // Vehicles should be damaged as much as possible but salvageable. This would give napalm a unique tactic of clearing AI from vehicles allowing them to be repaired, refuelled and requestioned.
        _fnc_init = _fnc_init +
            'clearMagazineCargoGlobal _victim;
            clearWeaponCargoGlobal _victim;
            clearItemCargoGlobal _victim;
            clearBackpackCargoGlobal _victim;';

        if !(getAllHitPointsDamage _victim isEqualTo []) then { // The static has a class entry, but its empty and getAllHitPointsDamage will return empty array
            _fnc_onTick = _fnc_onTick +
                '_victim setHitPointDamage ["HitHull",(((_victim getHitPointDamage "HitHull") + ' + str _damagePerTick + ') min 0.8) max (_victim getHitPointDamage "HitHull")];'+ // Limited to avoid vehicle being destroyed. Will not decrease vehicle damage if it was initially above 80%
                '{
                    _victim setHitPointDamage [_x,((_victim getHitPointDamage _x) + ' + str _damagePerTick + ') min 1];
                } forEach ' + str ((getAllHitPointsDamage _victim)#0 - ["hithull"]) + ';';
        } else {
            _fnc_onTick = _fnc_onTick + '_victim setDamage (((damage _victim + ' + str _damagePerTick + ') min 0.8) max damage _victim);'; // Limited to avoid vehicle being destroyed. Will not decrease vehicle damage if it was initially above 80%
        };

        _fnc_onTick = _fnc_onTick +
            'private _thermalHeat = 0.75*(_tickCount/'+ str _totalTicks +') + 0.25;'+  // The vehicles shouldn't snap to cold when the napalm effect starts begin.
            '_victim setVehicleTIPars [_thermalHeat, _thermalHeat, _thermalHeat];';

        private _horn = getArray (configFile >> "cfgVehicles" >> typeOf _victim >> "weapons");
        if !(_horn isEqualTo []) then {
            private _soundArray = getArray (configFile >> "cfgWeapons" >> _horn#0 >> "drySound");
            _soundArray params [["_sound",""],["_volume",1],["_pitch",1],["_range",250]];
            if (_sound == "") exitWith {};  // When fileExists becomes available on stable, use `fileExists (_soundArray#0 + ".wss")`
            _sound = _sound + ".wss";
            _pitch = _pitch -0.05;

            _fnc_init = _fnc_init + 'playSound3D ['+ str _sound +', _victim, false, getPosASL _victim, '+ str _volume +' + random 1, '+ str _pitch +' + random 0.1, '+ str _range +'];';
        };
    };
    case (_victim isKindOf "GroundWeaponHolder"): {  // Is a building, therefore needs to be above buildings
        _totalTicks = 1;
        _fnc_final = _fnc_final + 'deleteVehicle _victim;';  // Items would be burnt to ashes.
    };
    case (_victim isKindOf "Building"): {
        _totalTicks = _totalTicks/_overKill;  // Undo overkill
        _fnc_onTick = _fnc_onTick + '_victim setDamage [((damage _victim + ' + str _damagePerTick + ') min 0.5) max (damage _victim), true];';
    };
    case (_victim isKindOf "ReammoBox_F"): {
        _totalTicks = _totalTicks/_overKill;  // Undo overkill
        _fnc_onTick = _fnc_onTick + '_victim setDamage [(damage _victim + ' + str _damagePerTick + ') min 1, true];';
        _fnc_final = _fnc_final + 'deleteVehicle _victim;';
    };
    default {_invalidVictim = true;};  // Exclude everything else. Safest & least laggy option, gameplay comes before realism.
};

if (_invalidVictim) exitWith {true};

[_victim,_cancellationTokenUUID,_timeBetweenTicks,_totalTicks,compile _fnc_init,compile _fnc_onTick, compile _fnc_final] spawn {
    params ["_victim", "_canTokUUID", "_timeBetweenTicks" ,"_totalTicks","_fnc_init", "_fnc_onTick", "_fnc_final"];

    private _fnc_cancelRequested = { false; };// Future provisioning for implementation of cancellationTokens.
    private _fnc_exit = {isNull _victim || [_canTokUUID] call _fnc_cancelRequested};

    uiSleep (random 3); // To ensure that damage and sound is not in-sync. Makes it more chaotic.

    if (call _fnc_exit) exitWith {};
    [_victim] call _fnc_init;

    for "_tickCount" from 1 to _totalTicks do {
        if (call _fnc_exit) exitWith {};
        [_victim, _tickCount] call _fnc_onTick;
        uiSleep _timeBetweenTicks;
    };

    if (call _fnc_exit) exitWith {};
    [_victim] call _fnc_final;
};

true;
