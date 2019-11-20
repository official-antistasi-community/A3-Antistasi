private _fileName = "fn_initPetros";
[2,"initPetros started",_fileName] call A3A_fnc_log;
scriptName "fn_initPetros";
removeHeadgear petros;
removeGoggles petros;
petros setSkill 1;
petros setVariable ["respawning",false];
petros allowDamage false;
[petros,(selectRandom unlockedRifles), 8, 0] call BIS_fnc_addWeapon;
petros selectWeapon (primaryWeapon petros);
petros addEventHandler
[
    "HandleDamage",
    {
    _part = _this select 1;
    _damage = _this select 2;
    _injurer = _this select 3;

    _victim = _this select 0;
    _instigator = _this select 6;
    if(!isNull _instigator && isPlayer _instigator && _victim != _instigator && side _instigator == teamPlayer && _damage > 0.1) then
    {
        [_instigator, 60, 1, _victim] remoteExec ["A3A_fnc_punishment",_instigator];
    };
    if (isPlayer _injurer) then
    {
        _damage = (_this select 0) getHitPointDamage (_this select 7);
    };
    if ((isNull _injurer) or (_injurer == petros)) then {_damage = 0};
        if (_part == "") then
        {
            if (_damage > 1) then
            {
                if (!(petros getVariable ["INCAPACITATED",false])) then
                {
                    petros setVariable ["INCAPACITATED",true,true];
                    _damage = 0.9;
                    if (!isNull _injurer) then {[petros,side _injurer] spawn A3A_fnc_unconscious} else {[petros,sideUnknown] spawn A3A_fnc_unconscious};
                }
                else
                {
                    _overall = (petros getVariable ["overallDamage",0]) + (_damage - 1);
                    if (_overall > 1) then
                    {
                        petros removeAllEventHandlers "HandleDamage";
                    }
                    else
                    {
                        petros setVariable ["overallDamage",_overall];
                        _damage = 0.9;
                    };
                };
            };
        };
    _damage;
    }
];

petros addMPEventHandler ["mpkilled",
{
    removeAllActions petros;
    _killer = _this select 1;
    if (isServer) then
	{
        if ((side _killer == Invaders) or (side _killer == Occupants) and !(isPlayer _killer) and !(isNull _killer)) then
		{
			_nul = [] spawn {
				garrison setVariable ["Synd_HQ",[],true];
				_hrT = server getVariable "hr";
				_resourcesFIAT = server getVariable "resourcesFIA";
				[-1*(round(_hrT*0.9)),-1*(round(_resourcesFIAT*0.9))] remoteExec ["A3A_fnc_resourcesFIA",2];
				waitUntil {count allPlayers > 0};
				if (!isNull theBoss) then {
					[] remoteExec ["A3A_fnc_placementSelection",theBoss];
				} else {
					private _playersWithRank =
						playableUnits
						select {(side (group _x) == teamPlayer) && isPlayer _x && _x == _x getVariable ["owner", _x]}
						apply {[([_x] call A3A_fnc_numericRank) select 0, _x]};
					_playersWithRank sort false;
					
					 [] remoteExec ["A3A_fnc_placementSelection", _playersWithRank select 0 select 1];
				};
			};
			{
				if (side _x == Occupants) then {_x setPos (getMarkerPos respawnOccupants)};
			} forEach playableUnits;
		}
        else
		{
            [] call A3A_fnc_createPetros;
		};
	};
}];
[] spawn {sleep 120; petros allowDamage true;};
//Disable ACE Interactions
if (hasACE) then {
    [typeOf petros, 0,["ACE_ApplyHandcuffs"]] call ace_interact_menu_fnc_removeActionFromClass;
    [typeOf petros, 0,["ACE_MainActions", "ACE_JoinGroup"]] call ace_interact_menu_fnc_removeActionFromClass;
};
[2,"initPetros completed",_fileName] call A3A_fnc_log;
