params [["_veh","",objNull]];
private _titleStr = localize "STR_A3A_fn_base_unlockveh_unlockveh";

if (_veh isEqualTo objNull) then {
    _veh = cursorObject;
};

if (isNull _veh) exitWith {[_titleStr, localize "STR_A3A_fn_base_unlockveh_no_looking"] call A3A_fnc_customHint;};

if (!alive _veh) exitWith {[_titleStr, localize "STR_A3A_fn_base_unlockveh_no_destr"] call A3A_fnc_customHint;};

if (_veh isKindOf "Man") exitWith {[_titleStr, format [localize "STR_A3A_fn_base_unlockveh_no_no1",name _veh]] call A3A_fnc_customHint;};

if (not(_veh isKindOf "AllVehicles")) exitWith {[_titleStr, localize "STR_A3A_fn_base_unlockveh_no_no2"] call A3A_fnc_customHint;};
_ownerX = _veh getVariable "ownerX";

if (isNil "_ownerX") exitWith {[_titleStr, localize "STR_A3A_fn_base_unlockveh_no_owner1"] call A3A_fnc_customHint;};

if (_ownerX != getPlayerUID player) exitWith {[_titleStr, localize "STR_A3A_fn_base_unlockveh_no_owner2"] call A3A_fnc_customHint;};

if (isNil { _veh getVariable "A3A_locked"} ) then {
    _veh setVariable ["A3A_locked",true,true];
    [_titleStr, localize "STR_A3A_fn_base_unlockveh_locked"] call A3A_fnc_customHint;
} else {
    _veh setVariable ["A3A_locked",nil,true];
    [_titleStr, localize "STR_A3A_fn_base_unlockveh_unlocked"] call A3A_fnc_customHint;	
};