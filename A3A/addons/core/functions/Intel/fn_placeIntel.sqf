params["_marker", "_isLarge"];

/*  Places the physical intel objects on markers
*   Params:
*       _marker : STRING : The name of the marker where the intel should be placed
*       _isLarge : BOOLEAN : Determines whether the intel is large or medium
*
*   Returns:
*       Nothing
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

private _intelSize = if (_isLarge) then {"large"} else {"medium"};
ServerDebug_2("Spawning %2 intel on marker %1", _marker, _intelSize);

//Catch invalid cases
if(!(_marker  in airportsX || {_marker in outposts})) exitWith
{
    Error_1("Marker %1 is not suited to have intel!", _marker);
};

//Search for building to place intel in
private _side = sidesX getVariable _marker;
private _size = markerSize _marker;
private _radius = sqrt ((_size select 0) * (_size select 0) + (_size select 1) * (_size select 1));

private _listStaticTower = ["Land_Cargo_Tower_V1_F","Land_Cargo_Tower_V1_No1_F","Land_Cargo_Tower_V1_No2_F","Land_Cargo_Tower_V1_No3_F","Land_Cargo_Tower_V1_No4_F","Land_Cargo_Tower_V1_No5_F","Land_Cargo_Tower_V1_No6_F","Land_Cargo_Tower_V1_No7_F","Land_Cargo_Tower_V2_F", "Land_Cargo_Tower_V3_F"];
private _listStaticHQ = ["Land_Cargo_HQ_V1_F", "Land_Cargo_HQ_V2_F", "Land_Cargo_HQ_V3_F"];
private _listEnochRadar = ["Land_Radar_01_HQ_F"];
private _listvnbarracks06f = ["Land_vn_barracks_06_f"];
private _listvncontroltower01F = ["Land_vn_controltower_01_f"];
private _listControlTower02F = ["Land_ControlTower_02_F"];
private _listvnslum = ["Land_vn_slum_03_01_f","Land_vn_slum_03_f"];

private _allBuildings = nearestObjects [getMarkerPos _marker, _listStaticHQ + _listStaticTower + _listEnochRadar + _listvnbarracks06f + _listvncontroltower01F + _listControlTower02F, _radius, true];

if(count _allBuildings == 0) exitWith
{
	ServerInfo_1("No suitable buildings found on marker %1", _marker);
};

private _building = selectRandom _allBuildings;

private _buildingType = typeOf _building;

//Placing the intel desk
private _spawnParameters = switch (true) do {
	case (_buildingType in _listStaticTower): {[_building buildingPos 9, -90]};
	case (_buildingType in _listStaticHQ): {[_building buildingPos 1, -180]};
	case (_buildingType in _listEnochRadar): {[_building buildingPos 24, -90]};
	case (_buildingType in _listvnbarracks06f): {[_building buildingPos 7, 0]};
	case (_buildingType in _listvncontroltower01F): {[_building buildingPos 13, -0.5]};
	case (_buildingType in _listControlTower02F): {[_building buildingPos 6, -0.3]};
	case (_buildingType in _listvnslum): {
		private _zpos = _building buildingPos 21;
		private _pos = _zpos getPos [0.5, (getDir _building) + 110]; //first 0 added distance, secodn 0 moving direction
		_pos set[2, _zpos #2];
		[_pos, 0]
	}; //0 is table rotation
};
if (_spawnParameters isEqualType true) exitWith { Error_1("No spawn parameters for building %1", typeOf _building) };


private _faction = Faction(_side);
(_faction get "placeIntel_desk") params ["_classname_desk","_azimuth"];
private _desk = createVehicle [_classname_desk, [0, 0, 0], [], 0, "CAN_COLLIDE"];
_desk setDir (getDir _building + (_spawnParameters select 1) + _azimuth);
if (surfaceIsWater (_spawnParameters select 0)) then {
	_desk setPosASLW (_spawnParameters select 0);
} else {
	_desk setPosATL (_spawnParameters select 0);
};
_desk setVelocity [0, 0, -1];

//Await until desk have hit the group, it tend to stuck in the air otherwise  // Let the desk to settle on the floor, otherwise it's likely that it will be floating.
sleep 5;
_desk enableSimulation false;

(
	_faction get (["placeIntel_itemMedium","placeIntel_itemLarge"] select _isLarge)
) params ["_intelType","_azimuth","_isComputer"];

private _intel = createVehicle [_intelType, [0,0,0], [], 0, "CAN_COLLIDE"];
[_desk, _intel, [0.5, 0, 0.82], _azimuth] call BIS_fnc_relPosObject;
_intel enableSimulation false;
_intel allowDamage false;
_intel setVariable ["side", _side, true];
_intel setVariable ["marker", _marker, true];

private _intelSize = switch (true) do {
	case (!_isLarge): { "Intel_Medium" };
	case (!_isComputer): { "Intel_Encrypted" };
	default { "Intel_Large" };	// isLarge and isComputer
};
[_intel, _intelSize] remoteExec ["A3A_fnc_flagaction",[teamPlayer,civilian],_intel];

if (_isLarge && _isComputer) then {
	//Place light on laptop
	private _light = "#lightpoint" createVehicle (getPos _intel);
	_light setLightBrightness 1.0;
	_light setLightAmbient [0.005, 0.05, 0.07];
	_light setLightColor [0.05, 0.05, 0.07];
	_light setLightAttenuation [1,90,90,85,0,1];
	_light lightAttachObject [_intel, [0,0,0]];

	private _isTrap = (random 100 < (20 + (4 * tierWar)));
	if(_isTrap) then
	{
		ServerDebug_1("Large intel on %1 is selected as trap, spawning explosives", _marker);
		private _bomb = "DemoCharge_F" createVehicle [0,0,0];
		_bomb setVectorDirAndUp [(vectorDir _intel), [0,0,-1]];
		_bomb setPosWorld ((getPosWorld _intel) vectorAdd [0,0,-0.2]);
		_intel setVariable ["trapBomb", _bomb, true];
		[
			_bomb,
			localize "STR_A3A_fn_intel_place_disarm",
			"\Orange\Addons\ui_f_orange\Data\CfgVehicleIcons\iconExplosiveUXO_ca.paa",
			"\Orange\Addons\ui_f_orange\Data\CfgVehicleIcons\iconExplosiveUXO_ca.paa",
			"(_this distance _target < 3) and (_this call A3A_fnc_isEngineer)",
			"_caller distance _target < 3",
			{},
			{},
			{ deleteVehicle _target },
			{},
			[],
			12,
			0,
			true,
			false
		] remoteExec ["BIS_fnc_holdActionAdd", 0, _bomb];
	};
};

_building setVariable ["A3A_buildingIntel", _intel];
_building setVariable ["A3A_buildingDesk", _desk];

//prevent desks from hanging in the air (affects mostly multistory buildings)
private _ehId = _building addEventHandler ["Killed", {
	params ["_building"];
	private _intel = _building getVariable ["A3A_buildingIntel", objNull];
	private _desk = _building getVariable ["A3A_buildingDesk", objNull];

	if (!isNull _intel) then {
		private _bomb = _intel getVariable ["trapBomb", objNull];

		if (!isNull _bomb) then {
			deleteVehicle _bomb;
		};

		deleteVehicle _intel;
	};

	if (!isNull _desk && {!simulationEnabled _desk}) then {
		[_desk, true] remoteExec ["enableSimulationGlobal",2];
	};

	_building removeEventHandler ["Killed",_thisEventHandler];
}];

_nil = [_marker, _desk, _intel, _building, _ehId] spawn {
	params ["_marker", "_desk", "_intel", "_building", "_ehId"];
	waitUntil{sleep 10; (spawner getVariable _marker == 2)};
	deleteVehicle _desk;
	if(!isNil "_intel") then {
		_bomb = _intel getVariable ["trapBomb", objNull];
		deleteVehicle _bomb;
		deleteVehicle _intel;
	};

	_building removeEventHandler ["Killed",_ehId];
	terminate _thisScript;
};