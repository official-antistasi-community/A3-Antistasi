
private ["_textX","_dataX","_numCiv","_prestigeOPFOR","_prestigeBLUFOR","_power","_busy","_siteX","_positionTel","_garrison"];
positionTel = [];

_popFIA = 0;
_popAAF = 0;
_popCSAT = 0;
_pop = 0;
{
_dataX = server getVariable _x;
_numCiv = _dataX select 0;
_prestigeOPFOR = _dataX select 2;
_prestigeBLUFOR = _dataX select 3;
_popFIA = _popFIA + (_numCiv * (_prestigeBLUFOR / 100));
_popAAF = _popAAF + (_numCiv * (_prestigeOPFOR / 100));
_pop = _pop + _numCiv;
if (_x in destroyedSites) then {_popCSAT = _popCSAT + _numCIV};
} forEach citiesX;
_popFIA = round _popFIA;
_popAAF = round _popAAF;
[localize "STR_antistasi_customHint_city_info", format [localize "STR_antistasi_customHint_stat_map",_pop, _popFIA, _popAAF, _popCSAT,nameOccupants,nameTeamPlayer,worldName]] call A3A_fnc_customHint;

if (!visibleMap) then {openMap true};

onMapSingleClick "positionTel = _pos;";


//waitUntil {sleep 1; (count positionTel > 0) or (not visiblemap)};
while {visibleMap} do
	{
	sleep 1;
	if (count positionTel > 0) then
		{
		_positionTel = positionTel;
		_siteX = [markersX, _positionTel] call BIS_Fnc_nearestPosition;
		_textX = "Click on the zone";
		_nameFaction = if (sidesX getVariable [_siteX,sideUnknown] == teamPlayer) then {nameTeamPlayer} else {if (sidesX getVariable [_siteX,sideUnknown] == Occupants) then {nameOccupants} else {nameInvaders}};
		if (_siteX == "Synd_HQ") then
			{
			_textX = format [localize "STR_antistasi_customHint_stat_hq",[_siteX] call A3A_fnc_garrisonInfo,nameTeamPlayer];
			};
		if (_siteX in citiesX) then
			{
			_dataX = server getVariable _siteX;

			_numCiv = _dataX select 0;
			_prestigeOPFOR = round (_dataX select 2);
			_prestigeBLUFOR = round (_dataX select 3);
			_power = [_siteX] call A3A_fnc_getSideRadioTowerInfluence;
			_textX = format [localize "STR_antistasi_customHint_stat_city",[_siteX,false] call A3A_fnc_location,_numCiv,_prestigeOPFOR,_prestigeBLUFOR,"%",nameOccupants,nameTeamPlayer];
			_positionX = getMarkerPos _siteX;
			_result = "NONE";
			switch (_power) do
				{
				case teamPlayer: {_result = format ["%1",nameTeamPlayer]};
				case Occupants: {_result = format ["%1",nameOccupants]};
				case Invaders: {_result = format ["%1",nameInvaders]};
				};
			/*_ant1 = [antennas,_positionX] call BIS_fnc_nearestPosition;
			_ant2 = [antennasDead, _positionX] call BIS_fnc_nearestPosition;
			if (_ant1 distance _positionX > _ant2 distance _positionX) then
				{
				_result = "NONE";
				}
			else
				{
				_outpost = [markersX,_ant1] call BIS_fnc_NearestPosition;
				if (sidesX getVariable [_siteX,sideUnknown] == teamPlayer) then
					{
					if (sidesX getVariable [_outpost,sideUnknown] == teamPlayer) then {_result = format ["%1",nameTeamPlayer]} else {if (sidesX getVariable [_outpost,sideUnknown] == Invaders) then {_result = "NONE"}};
					}
				else
					{
					if (sidesX getVariable [_outpost,sideUnknown] == teamPlayer) then {_result = format ["%1",nameTeamPlayer]} else {if (sidesX getVariable [_outpost,sideUnknown] == Invaders) then {_result = "NONE"}};
					};
				};
			*/
			_textX = format ["%1<br/>"+localize "STR_antistasi_customHint_stat_city_influence"+" %2",_textX,_result];
			if (_siteX in destroyedSites) then {_textX = format ["%1<br/>"+localize "STR_antistasi_customHint_stat_destroyed",_textX]};
			if (sidesX getVariable [_siteX,sideUnknown] == teamPlayer) then {_textX = format ["%1<br/>%2",_textX,[_siteX] call A3A_fnc_garrisonInfo]};
			};
		if (_siteX in airportsX) then
			{
			if (not(sidesX getVariable [_siteX,sideUnknown] == teamPlayer)) then
				{
				_textX = format ["%1"+localize "STR_A3_malden_c_airport0",_nameFaction];
				_busy = [_siteX,true] call A3A_fnc_airportCanAttack;
				if (_busy) then {_textX = format ["%1<br/>"+localize "STR_antistasi_customHint_stat_idle",_textX]} else {_textX = format ["%1<br/>"+localize "STR_antistasi_customHint_stat_busy",_textX]};
				_garrison = count (garrison getVariable [_siteX, []]);
				if (_garrison >= 40) then {_textX = format ["%1<br/>"+localize "STR_antistasi_customHint_stat_garrisonGood",_textX]} else {if (_garrison >= 20) then {_textX = format ["%1<br/>"+localize "STR_antistasi_customHint_stat_garrisonWeakened",_textX]} else {_textX = format ["%1<br/>"+localize "STR_antistasi_customHint_stat_garrisonDecimated",_textX]}};
				}
			else
				{
				_textX = format ["%2 "+localize "STR_A3_malden_c_airport0"+"%1",[_siteX] call A3A_fnc_garrisonInfo,_nameFaction];
				};
			};
		if (_siteX in resourcesX) then
			{
			if (not(sidesX getVariable [_siteX,sideUnknown] == teamPlayer)) then
				{
				_textX = format ["%1 "+localize "STR_antistasi_resources",_nameFaction];
				_garrison = count (garrison getVariable [_siteX, []]);
				if (_garrison >= 30) then {_textX = format ["%1<br/>"+localize "STR_antistasi_customHint_stat_garrisonGood",_textX]} else {if (_garrison >= 10) then {_textX = format ["%1<br/>"+localize "STR_antistasi_customHint_stat_garrisonWeakened",_textX]} else {_textX = format ["%1<br/>"+localize "STR_antistasi_customHint_stat_garrisonDecimated",_textX]}};
				}
			else
				{
				_textX = format ["%2 "+localize "STR_antistasi_resources"+"%1",[_siteX] call A3A_fnc_garrisonInfo,_nameFaction];
				};
			if (_siteX in destroyedSites) then {_textX = format ["%1<br/>"+localize"STR_antistasi_customHint_stat_destroyed",_textX]};
			};
		if (_siteX in factories) then
			{
			if (not(sidesX getVariable [_siteX,sideUnknown] == teamPlayer)) then
				{
				_textX = format ["%1 "+localize "STR_a3_cfgvehicles_land_factory_main_f0",_nameFaction];
				_garrison = count (garrison getVariable [_siteX, []]);
				if (_garrison >= 16) then {_textX = format ["%1<br/>"+localize "STR_antistasi_customHint_stat_garrisonGood",_textX]} else {if (_garrison >= 8) then {_textX = format ["%1<br/>"+localize "STR_antistasi_customHint_stat_garrisonWeakened",_textX]} else {_textX = format ["%1<br/>"+localize "STR_antistasi_customHint_stat_garrisonDecimated",_textX]}};
				}
			else
				{
				_textX = format ["%2 "+localize "STR_a3_cfgvehicles_land_factory_main_f0"+"%1",[_siteX] call A3A_fnc_garrisonInfo,_nameFaction];
				};
			if (_siteX in destroyedSites) then {_textX = format ["%1<br/>"+localize"STR_antistasi_customHint_stat_destroyed",_textX]};
			};
		if (_siteX in outposts) then
			{
			if (not(sidesX getVariable [_siteX,sideUnknown] == teamPlayer)) then
				{
				_textX = format ["%1 "+localize "str_a3_exp_m01_respawnoutpost",_nameFaction];
				_busy = [_siteX,true] call A3A_fnc_airportCanAttack;
				if (_busy) then {_textX = format ["%1<br/>"+localize "STR_antistasi_customHint_stat_idle",_textX]} else {_textX = format ["%1<br/>"+localize "STR_antistasi_customHint_stat_busy",_textX]};
				_garrison = count (garrison getVariable [_siteX, []]);
				if (_garrison >= 16) then {_textX = format ["%1<br/>"+localize "STR_antistasi_customHint_stat_garrisonGood",_textX]} else {if (_garrison >= 8) then {_textX = format ["%1<br/>"+localize "STR_antistasi_customHint_stat_garrisonWeakened",_textX]} else {_textX = format ["%1<br/>"+localize "STR_antistasi_customHint_stat_garrisonDecimated",_textX]}};
				}
			else
				{
				_textX = format ["%2 "+localize "str_a3_exp_m01_respawnoutpost"+"%1",[_siteX] call A3A_fnc_garrisonInfo,_nameFaction];
				};
			};
		if (_siteX in seaports) then
			{
			if (not(sidesX getVariable [_siteX,sideUnknown] == teamPlayer)) then
				{
				_textX = format ["%1 "+localize "STR_a3_cfgeditorsubcategories_edsubcat_seaports0",_nameFaction];
				_garrison = count (garrison getVariable [_siteX, []]);
				if (_garrison >= 20) then {_textX = format ["%1<br/>"+localize "STR_antistasi_customHint_stat_garrisonGood",_textX]} else {if (_garrison >= 8) then {_textX = format ["%1<br/>"+localize "STR_antistasi_customHint_stat_garrisonWeakened",_textX]} else {_textX = format ["%1<br/>"+localize "STR_antistasi_customHint_stat_garrisonDecimated",_textX]}};
				}
			else
				{
				_textX = format ["%2 "+localize "STR_a3_cfgeditorsubcategories_edsubcat_seaports0"+"%1",[_siteX] call A3A_fnc_garrisonInfo,_nameFaction];
				};
			};
		if (_siteX in outpostsFIA) then
			{
			if (isOnRoad (getMarkerPos _siteX)) then
				{
				_textX = format ["%2 "+localize "STR_a3_cfggroups_empty_military_roadblocks_roadblock2"+"%1",[_siteX] call A3A_fnc_garrisonInfo,_nameFaction];
				}
			else
				{
				_textX = format ["%1 "+localize "STR_antistasi_markers_watchpost",_nameFaction];
				};
			};
		[localize "STR_antistasi_customHint_city_info", _textX] call A3A_fnc_customHint;
		};
	positionTel = [];
	};
onMapSingleClick "";
