private ["_siteX","_textX","_garrison","_size","_positionX"];

_siteX = _this select 0;

_garrison = garrison getVariable [_siteX,[]];

_size = [_siteX] call A3A_fnc_sizeMarker;
_positionX = getMarkerPos _siteX;
_estatic = if (_siteX in outpostsFIA) then {localize "STR_antistasi_garrisons_technicals"} else {localize "STR_antistasi_garrisons_mortars"};
_textX = format ["<br/><br/>"+localize "STR_antistasi_garrisons_info", count _garrison, {_x in SDKSL} count _garrison, {_x == staticCrewTeamPlayer} count _garrison, {_x in SDKMil} count _garrison, {_x in SDKMG} count _garrison,{_x in SDKMedic} count _garrison,{_x in SDKGL} count _garrison,{_x in SDKSniper} count _garrison,{_x in SDKATman} count _garrison, {_x distance _positionX < _size} count staticsToSave, _estatic];

_textX