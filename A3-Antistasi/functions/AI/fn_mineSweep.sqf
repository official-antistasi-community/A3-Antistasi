#include "..\..\Includes\common.inc"
FIX_LINE_NUMBERS()
private _groupData = FactionGet(reb,"groups");
#define GROUP(VAR) (_groupData get VAR)
if (!isServer and hasInterface) exitWith {};

private ["_costs","_groupX","_unit","_minesX","_radiusX","_roads","_truckX","_mineX","_countX"];

_costs = server getVariable GROUP("Exp") + ([FactionGet(reb,"vehicleRepair")] call A3A_fnc_vehiclePrice);

[-1,-1*_costs] remoteExec ["A3A_fnc_resourcesFIA",2];

_groupX = createGroup teamPlayer;

_unit = [_groupX, GROUP("Exp"), getMarkerPos respawnTeamPlayer, [], 0, "NONE"] call A3A_fnc_createUnit;
_groupX setGroupIdGlobal [format ["MineSw%1",{side (leader _x) == teamPlayer} count allGroups]];
_minesX = [];
sleep 1;
_road = [getMarkerPos respawnTeamPlayer] call A3A_fnc_findNearestGoodRoad;
_pos = position _road findEmptyPosition [1,30,"B_G_Van_01_transport_F"];

_truckX = FactionGet(reb,"vehicleRepair") createVehicle _pos;

[_truckX, teamPlayer] call A3A_fnc_AIVEHinit;
[_unit] spawn A3A_fnc_FIAinit;

_groupX addVehicle _truckX;
[_unit] orderGetIn true;
//_unit setBehaviour "SAFE";
theBoss hcSetGroup [_groupX];

while {alive _unit} do
	{
	waitUntil {sleep 1;(!alive _unit) or (unitReady _unit)};
	if (alive _unit) then
		{
		if (alive _truckX) then
			{
			if ((count magazineCargo _truckX > 0) and (_unit distance (getMarkerPos respawnTeamPlayer) < 50)) then
				{
				[_truckX,boxX] remoteExec ["A3A_fnc_ammunitionTransfer",2];
				sleep 30;
				};
			};
		_minesX = allmines select {(_x distance _unit) < 100};
		if (count _minesX == 0) then
			{
			waitUntil {sleep 1;(!alive _unit) or (!unitReady _unit)};
			}
		else
			{
			moveOut _unit;
			[_unit] orderGetin false;
			_minesX = [_minesX,[],{_unit distance _x},"ASCEND"] call BIS_fnc_sortBy;
			_countX = 0;
			_total = count _minesX;
			while {(alive _unit) and (_countX < _total)} do
				{
				_mineX = _minesX select _countX;
				[_unit] orderGetin false;
				_unit doMove position _mineX;
				_timeOut = time + 15;
				waitUntil {sleep 0.5; (_unit distance _mineX < 8) or (!alive _unit) or (time > _timeOut)};
				if (alive _unit) then
					{
					_unit action ["Deactivate",_unit,_mineX];
					//_unit action ["deactivateMine", _unit];
					sleep 3;
					_toDelete = nearestObjects [position _unit, ["WeaponHolderSimulated", "GroundWeaponHolder", "WeaponHolder"], 9];
					if (count _toDelete > 0) then
						{
						_wh = _toDelete select 0;
						if (alive _truckX) then {_truckX addMagazineCargoGlobal [((magazineCargo _wh) select 0),1]};
						deleteVehicle _mineX;
						deleteVehicle _wh;
						};
					_countX = _countX + 1;
					};
				};
			if(alive _unit) then
				{
				[_unit] orderGetIn true;
				};
			};
		};
	sleep 1;
	};
