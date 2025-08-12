// HandleDamage event handler for enemy (gov/inv) AIs

params ["_unit","_part","_damage","_injurer","_projectile","_hitIndex","_instigator","_hitPoint"];

// Functionality unrelated to Antistasi revive
if (side group _injurer == teamPlayer) then
{
    // Helmet popping: use _hitpoint rather than _part to work around ACE calling its fake hitpoint "head"
    if (_damage >= 1 && {_hitPoint == "hithead"}) then
    {
        if (random 100 < helmetLossChance) then
        {
            removeHeadgear _unit;
        };
    };

    private _groupX = group _unit;
    if (time > _groupX getVariable ["movedToCover",0]) then
    {
        if ((behaviour leader _groupX != "COMBAT") and (behaviour leader _groupX != "STEALTH")) then
        {
            _groupX setVariable ["movedToCover",time + 120];
            {[_x,_injurer] spawn A3A_fnc_unitGetToCover} forEach units _groupX;
        };
    };

    if (_part == "" && _damage < 1) then
    {
        if (_damage > 0.6) then {[_unit,_injurer] spawn A3A_fnc_unitGetToCover};
    };
};

// Let ACE medical handle the rest (inc return value) if it's running
if (A3A_hasACEMedical) exitWith {};

if (side _injurer != teamPlayer) exitWith {_damage};

private _makeUnconscious =
{
    params ["_unit", "_injurer", "_fatalWound"];

    _unit setVariable ["incapacitated",true,true];
    _unit setVariable ["helpFailed", 0];
    _unit setUnconscious true;
    _unit setVariable ["incapImmuneTime", time + 0.2];
    _unit setVariable ["overallDamage", 0];

    // Assume killed handler will be local as well
    // TODO: Check killed/instigator stuff?
    if (!isNull _injurer) then { _unit setVariable ["A3A_downedBy", _injurer] };

    if (vehicle _unit != _unit) then { moveOut _unit };

    //Make sure to pass group lead if unit is the leader
    if (_unit == leader (group _unit)) then	{
        private _index = (units (group _unit)) findIf {[_x] call A3A_fnc_canFight};
        if(_index != -1) then {
            (group _unit) selectLeader ((units (group _unit)) select _index);
        };
    };

    [_unit, group _unit, _injurer] spawn A3A_fnc_AIreactOnKill;

    [_unit, _injurer, _fatalWound] spawn A3A_fnc_unconsciousAAF;
};

if (_part == "") then
{
    if (_damage >= 1) then
    {
        if !(_unit getVariable ["incapacitated",false]) exitWith
        {
            if (_damage > 2 and random 1 < 0.5) exitWith {
                _unit removeEventHandler ["HandleDamage", _thisEventHandler];
            };

            [_unit, _injurer, _damage > 2] call _makeUnconscious;
            _damage = 0.9;
        };

        // Don't double-tap with one projectile
        if (time < _unit getVariable "incapImmuneTime") exitWith {_damage = 0.9};

        // already unconscious, check whether we're pushed into death
        _overall = (_unit getVariable ["overallDamage",0]) + (_damage - 0.9);
        if (_overall > 1) exitWith
        {
            _unit setDamage 1;
            _unit removeAllEventHandlers "HandleDamage";
        };

        _unit setVariable ["overallDamage",_overall];
        _damage = 0.9;
    }
    else
    {

        //Abort helping if hit too hard
        if (_damage > 0.25) then
        {
            if (_unit getVariable ["helping",false]) then
            {
                _unit setVariable ["cancelRevive",true];
            };
        };
    };
}
else
{
    if ("spine" in _part and { !(uniform _unit in A3A_strongUniformsHM) } ) then {
        private _adj = A3A_vestDamageAdj getOrDefaultCall [_part + vest _unit, A3A_fnc_calcVestDamageAdj, true];
        private _oldDmg = _unit getHit _part;
        _damage = _oldDmg + _adj * (_damage - _oldDmg);
    };

    if (_damage >= 1 && { !(_hitpoint in ["hitarms","hithands","hitlegs"]) }) then
    {
        if (_unit getVariable ["incapacitated",false]) exitWith {
            _damage = 0.9;
        };

        // Decide whether this is a kill or down
        if (random 1 < [0.5, 0.75] select (_hitPoint == "hithead")) exitWith {
            _unit removeEventHandler ["HandleDamage", _thisEventHandler];
        };
        [_unit, _injurer, true] call _makeUnconscious;
        _damage = 0.9;
    };
};

_damage
