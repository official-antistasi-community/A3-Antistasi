
_resourcesFIA = server getVariable "resourcesFIA";

if (_resourcesFIA < 5000) exitWith {[localize "STR_antistasi_dialogs_hq_button_rebuild_assets_text", format [localize "STR_antistasi_customHint_rebuild_no_money",5000]] call A3A_fnc_customHint;};

_destroyedSites = destroyedSites - citiesX;

if (!visibleMap) then {openMap true};
positionTel = [];
[localize "STR_antistasi_dialogs_hq_button_rebuild_assets_text", localize "STR_antistasi_customHint_rebuild_map"] call A3A_fnc_customHint;

onMapSingleClick "positionTel = _pos;";

waitUntil {sleep 1; (count positionTel > 0) or (not visiblemap)};
onMapSingleClick "";

if (!visibleMap) exitWith {};

_positionTel = positionTel;

_siteX = [markersX,_positionTel] call BIS_fnc_nearestPosition;

if (getMarkerPos _siteX distance _positionTel > 50) exitWith {[localize "STR_antistasi_dialogs_hq_button_rebuild_assets_text", localize "STR_antistasi_customHint_rebuild_near"] call A3A_fnc_customHint;};

if ((not(_siteX in _destroyedSites)) and (!(_siteX in outposts))) exitWith {[localize "STR_antistasi_dialogs_hq_button_rebuild_assets_text", localize "STR_antistasi_customHint_rebuild_cannot"] call A3A_fnc_customHint;};

_leave = false;
_antennaDead = objNull;
_textX = localize "STR_antistasi_customHint_rebuild_noDestroyed";
if (_siteX in outposts) then
	{
	_antennasDead = antennasDead select {_x inArea _siteX};
	if (count _antennasDead > 0) then
		{
		if (sidesX getVariable [_siteX, sideUnknown] != teamPlayer) then
			{
			_leave = true;
			_textX = format [localize "STR_antistasi_customHint_rebuild_noBelong",nameTeamPlayer];
			}
		else
			{
			_antennaDead = _antennasDead select 0;
			};
		}
	else
		{
		_leave = true
		};
	};

if (_leave) exitWith {[localize "STR_antistasi_dialogs_hq_button_rebuild_assets_text", format ["%1",_textX]] call A3A_fnc_customHint;};

if (isNull _antennaDead) then
	{
	_nameX = [_siteX] call A3A_fnc_localizar;

	[localize "STR_antistasi_dialogs_hq_button_rebuild_assets_text", format [localize "STR_antistasi_customHint_rebuild_rebuild",_nameX]] call A3A_fnc_customHint;

	[0,10,_positionTel] remoteExec ["A3A_fnc_citySupportChange",2];
    [Occupants, 10, 30] remoteExec ["A3A_fnc_addAggression",2];
    [Invaders, 10, 30] remoteExec ["A3A_fnc_addAggression",2];
	destroyedSites = destroyedSites - [_siteX];
	publicVariable "destroyedSites";
	}
else
	{
	[localize "STR_antistasi_dialogs_hq_button_rebuild_assets_text", localize "STR_antistasi_customHint_rebuild_radio"] call A3A_fnc_customHint;
	[_antennaDead] remoteExec ["A3A_fnc_rebuildRadioTower", 2];
	};
[0,-5000] remoteExec ["A3A_fnc_resourcesFIA",2];
