if (!isServer and hasInterface) exitWith{};

private ["_pos","_side","_newPos","_road"];

params ["_veh", "_text", ["_stuckHacks", true]];

private _convoy = (_text == localize "STR_antistasi_markers_convoy") or (_text == localize "STR_antistasi_markers_missionVehicle") or (_text == localize "STR_antistasi_markers_supplyBox");

waitUntil {sleep 1; (not(isNull driver _veh)) or _convoy};

if (debug) then {revealX = true};

_veh setVariable ["revealed",false];
while {alive _veh} do
	{
	if (!(_veh getVariable ["revealed",false])) then
		{
		if ((teamPlayer knowsAbout _veh > 1.4) or revealX or _convoy) then
			{
			_veh setVariable ["revealed",true,true];
			[_veh,_text] remoteExec  ["A3A_fnc_vehicleMarkers",[teamPlayer,civilian]];
			};
		}
	else
		{
		if ((teamPlayer knowsAbout _veh <= 1.4) and !(revealX) and !(_convoy)) then
			{
			_veh setVariable ["revealed",false,true];
			};
		};
	_pos = getPos _veh;
	sleep 60;
	_newPos = getPos _veh;

	_driverX = driver _veh;
	if (_stuckHacks and (_newPos distance _pos < 5) and (_text != localize "STR_antistasi_markers_supplyBox") and !(isNull _driverX)) then
		{
		if (_veh isKindOf "Air") then
			{
			if (isTouchingGround _veh) then
				{
				{
				unAssignVehicle _x;
	   			moveOut _x;
	   			sleep 1.5;
				} forEach assignedCargo _veh;
				};
			}
		else
			{
			if (not(_veh isKindOf "Ship")) then
				{
				if ({_x distance _newPos < 500} count (allPlayers - (entities "HeadlessClient_F")) == 0) then
					{
					_bridges = nearestObjects [_newPos, ["Land_Bridge_01_PathLod_F","Land_Bridge_Asphalt_PathLod_F","Land_Bridge_Concrete_PathLod_F","Land_Bridge_HighWay_PathLod_F","Land_BridgeSea_01_pillar_F","Land_BridgeWooden_01_pillar_F"], 50];
					if !(_bridges isEqualTo []) then
						{
						_nextWaypoint = currentWaypoint (group _driverX);
						_wpPos = waypointPosition ((waypoints (group _driverX)) select _nextWaypoint);
						_ang = [_newPos, _wpPos] call BIS_fnc_DirTo;
						_newPos = _newPos getPos [100,_ang];
						};
					_road = [_newPos,100] call BIS_fnc_nearestRoad;
					if (!isNull _road) then
						{
						_veh setPos getPos _road;
						if (!isMultiplayer) then {{ _x hideObject true } foreach (nearestTerrainObjects [position _road,["tree","bush"],15])} else {{[_x,true] remoteExec ["hideObjectGlobal",2]} foreach (nearestTerrainObjects [position _road,["tree","bush"],15])};
						};
					};
				};
			};
		};
	};
