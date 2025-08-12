#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
private _titleStr = localize "STR_A3A_fn_init_cityinfo_title";
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
[_titleStr, format [localize "STR_A3A_fn_init_cityinfo_overview_1",_pop, _popFIA, _popAAF, _popCSAT,FactionGet(occ,"name"),FactionGet(reb,"name"),getText (configfile >> "CfgWorlds" >> worldname >> "description")]] call A3A_fnc_customHint;

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
		_textX = localize "STR_A3A_fn_init_cityinfo_click";
        private _side = sidesX getVariable [_siteX,sideUnknown];
        private _faction = Faction(_side);
		_nameFaction = _faction get "name";
		if (_siteX == "Synd_HQ") then
			{
			_textX = format [localize "STR_A3A_fn_init_cityinfo_hq",[_siteX] call A3A_fnc_garrisonInfo,FactionGet(reb,"name")];
			};
		if (_siteX in citiesX) then
			{
			_dataX = server getVariable _siteX;

			_numCiv = _dataX select 0;
			_prestigeOPFOR = round (_dataX select 2);
			_prestigeBLUFOR = round (_dataX select 3);
			_power = [_siteX] call A3A_fnc_getSideRadioTowerInfluence;
			_textX = format [localize "STR_A3A_fn_init_cityinfo_overview_2",_siteX,_numCiv,_prestigeOPFOR,_prestigeBLUFOR,"%",FactionGet(occ,"name"),FactionGet(reb,"name")];
			_positionX = getMarkerPos _siteX;
			_result = "NONE";
			_result = switch (_power) do
				{
				case teamPlayer: {FactionGet(reb,"name")};
				case Occupants: {FactionGet(occ,"name")};
				case Invaders: {FactionGet(inv,"name")};
                default {"NONE"};
				};
			_textX = format [localize "STR_A3A_fn_init_cityinfo_influ",_textX,_result];
			if (_siteX in destroyedSites) then {_textX = format [localize "STR_A3A_fn_init_cityinfo_destr",_textX]};
			if (sidesX getVariable [_siteX,sideUnknown] == teamPlayer) then {_textX = format ["%1<br/>%2",_textX,[_siteX] call A3A_fnc_garrisonInfo]};
			};
		if (_siteX in airportsX) then
			{
			if (not(sidesX getVariable [_siteX,sideUnknown] == teamPlayer)) then
				{
				_textX = format [localize "STR_A3A_fn_init_cityinfo_airp_1",_nameFaction];
				_busy = [_siteX,true] call A3A_fnc_airportCanAttack;
				if (_busy) then {_textX = format [localize "STR_A3A_fn_init_cityinfo_status_idle",_textX]} else {_textX = format [localize "STR_A3A_fn_init_cityinfo_status_busy",_textX]};
				_garrison = count (garrison getVariable [_siteX, []]);
				if (_garrison >= 40) then {_textX = format [localize "STR_A3A_fn_init_cityinfo_garr_good",_textX]} else {if (_garrison >= 20) then {_textX = format [localize "STR_A3A_fn_init_cityinfo_garr_weak",_textX]} else {_textX = format [localize "STR_A3A_fn_init_cityinfo_garr_deci",_textX]}};
				}
			else
				{
				_textX = format [localize "STR_A3A_fn_init_cityinfo_airp_2",[_siteX] call A3A_fnc_garrisonInfo,_nameFaction];
				};
			};
		if (_siteX in resourcesX) then
			{
			if (not(sidesX getVariable [_siteX,sideUnknown] == teamPlayer)) then
				{
				_textX = format [localize "STR_A3A_fn_init_cityinfo_reso_1",_nameFaction];
				_garrison = count (garrison getVariable [_siteX, []]);
				if (_garrison >= 30) then {_textX = format [localize "STR_A3A_fn_init_cityinfo_garr_good",_textX]} else {if (_garrison >= 10) then {_textX = format [localize "STR_A3A_fn_init_cityinfo_garr_weak",_textX]} else {_textX = format [localize "STR_A3A_fn_init_cityinfo_garr_deci",_textX]}};
				}
			else
				{
				_textX = format [localize "STR_A3A_fn_init_cityinfo_reso_2",[_siteX] call A3A_fnc_garrisonInfo,_nameFaction];
				};
			if (_siteX in destroyedSites) then {_textX = format [localize "STR_A3A_fn_init_cityinfo_destr",_textX]};
			};
		if (_siteX in factories) then
			{
			if (not(sidesX getVariable [_siteX,sideUnknown] == teamPlayer)) then
				{
				_textX = format [localize "STR_A3A_fn_init_cityinfo_fact_1",_nameFaction];
				_garrison = count (garrison getVariable [_siteX, []]);
				if (_garrison >= 16) then {_textX = format [localize "STR_A3A_fn_init_cityinfo_garr_good",_textX]} else {if (_garrison >= 8) then {_textX = format [localize "STR_A3A_fn_init_cityinfo_garr_weak",_textX]} else {_textX = format [localize "STR_A3A_fn_init_cityinfo_garr_deci",_textX]}};
				}
			else
				{
				_textX = format [localize "STR_A3A_fn_init_cityinfo_fact_2",[_siteX] call A3A_fnc_garrisonInfo,_nameFaction];
				};
			if (_siteX in destroyedSites) then {_textX = format [localize "STR_A3A_fn_init_cityinfo_destr",_textX]};
			};
		if (_siteX in outposts) then
			{
			if (not(sidesX getVariable [_siteX,sideUnknown] == teamPlayer)) then
				{
				_textX = format [localize "STR_A3A_fn_init_cityinfo_goutp_2",_nameFaction];
				_busy = [_siteX,true] call A3A_fnc_airportCanAttack;
				if (_busy) then {_textX = format [localize "STR_A3A_fn_init_cityinfo_status_idle",_textX]} else {_textX = format [localize "STR_A3A_fn_init_cityinfo_status_busy",_textX]};
				_garrison = count (garrison getVariable [_siteX, []]);
				if (_garrison >= 16) then {_textX = format [localize "STR_A3A_fn_init_cityinfo_garr_good",_textX]} else {if (_garrison >= 8) then {_textX = format [localize "STR_A3A_fn_init_cityinfo_garr_weak",_textX]} else {_textX = format [localize "STR_A3A_fn_init_cityinfo_garr_deci",_textX]}};
				}
			else
				{
				_textX = format [localize "STR_A3A_fn_init_cityinfo_goutp_1",[_siteX] call A3A_fnc_garrisonInfo,_nameFaction];
				};
			};
		if (_siteX in seaports) then
			{
			if (not(sidesX getVariable [_siteX,sideUnknown] == teamPlayer)) then
				{
				_textX = format [localize "STR_A3A_fn_init_cityinfo_seap_1",_nameFaction];
				_garrison = count (garrison getVariable [_siteX, []]);
				if (_garrison >= 20) then {_textX = format [localize "STR_A3A_fn_init_cityinfo_garr_good",_textX]} else {if (_garrison >= 8) then {_textX = format [localize "STR_A3A_fn_init_cityinfo_garr_weak",_textX]} else {_textX = format [localize "STR_A3A_fn_init_cityinfo_garr_deci",_textX]}};
				}
			else
				{
				_textX = format [localize "STR_A3A_fn_init_cityinfo_seap_2",[_siteX] call A3A_fnc_garrisonInfo,_nameFaction];
				};
			};
		if (_siteX in outpostsFIA) then
			{
			if (isOnRoad (getMarkerPos _siteX)) then
				{
				_textX = format [localize "STR_A3A_fn_init_cityinfo_road_2",[_siteX] call A3A_fnc_garrisonInfo,_nameFaction];
				}
			else
				{
				_textX = format [localize "STR_A3A_fn_init_cityinfo_watch_1",_nameFaction];
				};
			};
		[_titleStr, _textX] call A3A_fnc_customHint;
		};
	positionTel = [];
	};
onMapSingleClick "";
