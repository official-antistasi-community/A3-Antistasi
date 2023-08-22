#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
if (!isServer) exitWith {};

private ["_typeX","_costs","_groupX","_unit","_radiusX","_roads","_road","_pos","_truckX","_textX","_mrk","_hr","_unitsX","_formatX"];

_typeX = _this select 0;
_positionTel = _this select 1;

if (_typeX == "delete") exitWith {["Create Outpost", "Deprecated option. Use Remove Garrison from HQ instead."] call A3A_fnc_customHint;};

_isRoad = isOnRoad _positionTel;

_textX = format ["%1 Watchpost",FactionGet(reb,"name")];
_typeGroup = FactionGet(reb,"groupSniper");
_typeVehX = (FactionGet(reb,"vehiclesBasic")) # 0;
private _tsk = "";
if (_isRoad) then
	{
	_textX = format ["%1 Roadblock",FactionGet(reb,"name")];
	_typeGroup = FactionGet(reb,"groupAT") + [FactionGet(reb,"unitCrew")];
	_typeVehX = (FactionGet(reb,"vehiclesTruck")) # 0;
	};

_mrk = createMarkerLocal [format ["FIAPost%1", mapGridPosition _positionTel], _positionTel];
if (_mrk == "") exitWith {["Create Outpost", "There's already a rebel outpost near that position"]};
_mrk setMarkerShape "ICON";

_dateLimit = [date select 0, date select 1, date select 2, date select 3, (date select 4) + 60];
_dateLimitNum = dateToNumber _dateLimit;
private _taskId = "outpostsFIA" + str A3A_taskCount;
[[teamPlayer,civilian],_taskId,["We are sending a team to establish a Watchpost/Roadblock. Use HC to send the team to their destination.","Post \ Roadblock Deploy",_mrk],_positionTel,false,0,true,"Move",true] call BIS_fnc_taskCreate;
[_taskId, "outpostsFIA", "CREATED"] remoteExecCall ["A3A_fnc_taskUpdate", 2];

_groupX = [getMarkerPos respawnTeamPlayer, teamPlayer, _typeGroup] call A3A_fnc_spawnGroup;
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

if ({(alive _x) and (_x distance _positionTel < 10)} count units _groupX > 0) then {
	if (isPlayer leader _groupX) then
		{
		_owner = (leader _groupX) getVariable ["owner",leader _groupX];
		(leader _groupX) remoteExec ["removeAllActions",leader _groupX];
		_owner remoteExec ["selectPlayer",leader _groupX];
		//(leader _groupX) setVariable ["owner",_owner,true];
		//{[_x] joinsilent group _owner} forEach units group _owner;
		//[group _owner, _owner] remoteExec ["selectLeader", _owner];
		waitUntil {!(isPlayer leader _groupX)};
		sleep 5;			// Give client & server time to resolve the selectPlayer before we delete anything
		};

	[_taskId, "outpostsFIA", "SUCCEEDED"] call A3A_fnc_taskSetState;

	private _unitTypes = units _groupX select { alive _x } apply { _x getVariable "unitType" };
	private _vehTypes = [[], [FactionGet(reb,"vehiclesLightArmed")#0]] select _isRoad;
	[_mrk, _textX, _unitTypes, _vehTypes] remoteExecCall ["A3A_fnc_createRebelControl", 2];
} else {
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
