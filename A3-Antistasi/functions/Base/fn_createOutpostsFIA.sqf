if (!isServer) exitWith {};

private ["_typeX","_costs","_groupX","_unit","_radiusX","_roads","_road","_pos","_truckX","_textX","_mrk","_hr","_unitsX","_formatX"];

_typeX = _this select 0;
_positionTel = _this select 1;

if (_typeX == "delete") exitWith {[localize "STR_antistasi_customHint_op_rb", localize "STR_antistasi_customHint_op_rb_deprecated"] call A3A_fnc_customHint;};

_isRoad = isOnRoad _positionTel;

_textX = format ["%1 "+localize "STR_antistasi_markers_watchpost",nameTeamPlayer];
_typeGroup = groupsSDKSniper;
_typeVehX = vehSDKBike;
private _tsk = "";
if (_isRoad) then
	{
	_textX = format ["%1 "+localize "STR_a3_cfggroups_empty_military_roadblocks_roadblock2",nameTeamPlayer];
	_typeGroup = groupsSDKAT;
	_typeVehX = vehSDKTruck;
	};

_mrk = createMarker [format ["FIAPost%1", random 1000], _positionTel];
_mrk setMarkerShape "ICON";

_dateLimit = [date select 0, date select 1, date select 2, date select 3, (date select 4) + 60];
_dateLimitNum = dateToNumber _dateLimit;
private _taskId = "outpostsFIA" + str A3A_taskCount;
[[teamPlayer,civilian],_taskId,[localize "STR_antistasi_mission_OP_RB_text",localize "STR_antistasi_mission_OP_RB_name",_mrk],_positionTel,false,0,true,"Move",true] call BIS_fnc_taskCreate;
[_taskId, "outpostsFIA", "CREATED"] remoteExecCall ["A3A_fnc_taskUpdate", 2];

_formatX = [];
{
if (random 20 <= skillFIA) then {_formatX pushBack (_x select 1)} else {_formatX pushBack (_x select 0)};
} forEach _typeGroup;
_groupX = [getMarkerPos respawnTeamPlayer, teamPlayer, _formatX] call A3A_fnc_spawnGroup;
_groupX setGroupId ["Post"];
_road = [getMarkerPos respawnTeamPlayer] call A3A_fnc_findNearestGoodRoad;
_pos = position _road findEmptyPosition [1,30,"B_G_Van_01_transport_F"];
_truckX = _typeVehX createVehicle _pos;
//_nul = [_groupX] spawn dismountFIA;
_groupX addVehicle _truckX;
{[_x] call A3A_fnc_FIAinit} forEach units _groupX;
leader _groupX setBehaviour "SAFE";
(units _groupX) orderGetIn true;
theBoss hcSetGroup [_groupX];

waitUntil {sleep 1; ({alive _x} count units _groupX == 0) or ({(alive _x) and (_x distance _positionTel < 10)} count units _groupX > 0) or (dateToNumber date > _dateLimitNum)};

if ({(alive _x) and (_x distance _positionTel < 10)} count units _groupX > 0) then
	{
	if (isPlayer leader _groupX) then
		{
		_owner = (leader _groupX) getVariable ["owner",leader _groupX];
		(leader _groupX) remoteExec ["removeAllActions",leader _groupX];
		_owner remoteExec ["selectPlayer",leader _groupX];
		(leader _groupX) setVariable ["owner",_owner,true];
		{[_x] joinsilent group _owner} forEach units group _owner;
		[group _owner, _owner] remoteExec ["selectLeader", _owner];
		waitUntil {!(isPlayer leader _groupX)};
		};
	outpostsFIA = outpostsFIA + [_mrk]; publicVariable "outpostsFIA";
	sidesX setVariable [_mrk,teamPlayer,true];
	markersX = markersX + [_mrk];
	publicVariable "markersX";
	spawner setVariable [_mrk,2,true];
	[_taskId, "outpostsFIA", "SUCCEEDED"] call A3A_fnc_taskSetState;
	_nul = [-5,5,_positionTel] remoteExec ["A3A_fnc_citySupportChange",2];
	_mrk setMarkerType "loc_bunker";
	_mrk setMarkerColor colorTeamPlayer;
	_mrk setMarkerText _textX;
	if (_isRoad) then
		{
		_garrison = [staticCrewTeamPlayer];
		{
		if (random 20 <= skillFIA) then {_garrison pushBack (_x select 1)} else {_garrison pushBack (_x select 0)};
		} forEach groupsSDKAT;
		garrison setVariable [_mrk,_garrison,true];
		};
	}
else
	{
	[_taskId, "outpostsFIA", "FAILED"] call A3A_fnc_taskSetState;
	sleep 3;
	deleteMarker _mrk;
	};

theBoss hcRemoveGroup _groupX;
{deleteVehicle _x} forEach units _groupX;
deleteVehicle _truckX;
deleteGroup _groupX;
sleep 15;

[_taskId, "outpostsFIA", 0] spawn A3A_fnc_taskDelete;
