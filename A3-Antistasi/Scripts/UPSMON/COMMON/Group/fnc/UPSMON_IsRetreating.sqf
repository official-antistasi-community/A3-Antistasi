
if (true) exitWith {}; //BARBOLANI: will disable this feature as Antistasi has all UPSMon units as garrisoned ones and it's very bugged.

private ["_grp","_dist","_ratio","_supstatus","_unitsneedammo","_typeofgrp","_assignedvehicles","_attackpos"];

_grp = _this select 0;
_dist = _this select 1;
_ratio = _this select 2;
_supstatus = _this select 3;
_unitsneedammo = _this select 4;
_typeofgrp = _this select 5;
_attackpos = _this select 6;
_assignedvehicles = _this select 7;


If (_grp getvariable ["UPSMON_Grpmission",""] != "RETREAT") then
{
	If (!("static" in _typeofgrp)) then
	{
		If (_ratio > 2 || (count units _grp) == count _unitsneedammo || (_supstatus != "INCAPACITED") || ("arti" in _typeofgrp) || ("support" in _typeofgrp)) then
		{
			If (_dist >= 300) then
			{
				If (_supstatus != "SUPRESSED") then
				{
					If (!(fleeing (leader _grp))) then
					{
						//If ((random 100) <= (call (compile format ["UPSMON_%1_RETREAT",(_grp getvariable ["UPSMON_Origin",[]]) select 5]))) then//modified to avoid .rpt bugs
						If ((random 100) <= 10) then
						{
							[_grp,_attackpos,_typeofgrp,_assignedvehicles] spawn UPSMON_DORETREAT;
							_grp setvariable ["UPSMON_Grpmission","RETREAT"];
							_grpstatus = "BLUE";
							If (_AttackPos select 0 != 0 && _AttackPos select 1 != 0) then
								{
                                //Never called, ignore it, will be replaced by VCOM at some point
								//if (side (leader _grp) != teamPlayer) then {[[_attackPos,(side(leader _grp)),"",false],"A3A_fnc_patrolCA"] remoteExec ["A3A_fnc_scheduler",2]};
								};//by Barbolani so AAF UPSMon garrisons call QRF
						};
					};
				};
			};
		};
	};
};
