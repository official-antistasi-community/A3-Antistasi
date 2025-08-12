private ["_pos","_siteX","_city","_textX"];

_siteX = _this select 0;

_pos = getMarkerPos _siteX;

_textX = "";


if (_siteX in citiesX) then
	{
	_textX = format ["%1",_siteX];
	}
else
	{
	_city = [citiesX,_pos] call BIS_fnc_nearestPosition;
	if (_siteX in outpostsFIA) then {_textX = format [localize "STR_A3A_fn_base_localizar_watchpost",_city]};
	if (isOnRoad _pos) then {_textX = format [localize "STR_A3A_fn_base_localizar_roadblock",_city]}; //For friendly roadblocks, next checks will overwrite it if neccesary
	if (_siteX in airportsX) then {_textX = format [localize "STR_A3A_fn_base_localizar_airport",_city]};
	if (_siteX in resourcesX) then {_textX = format [localize "STR_A3A_fn_base_localizar_resource",_city]};
	if (_siteX in factories) then {_textX = format [localize "STR_A3A_fn_base_localizar_factory",_city]};
	if (_siteX in outposts) then {_textX = format [localize "STR_A3A_fn_base_localizar_outpost",_city]};
	if (_siteX in seaports) then {_textX = format [localize "STR_A3A_fn_base_localizar_seaport",_city]};
	if (_siteX in controlsX) then
		{
		if (isOnRoad _pos) then
			{
			_textX = format [localize "STR_A3A_fn_base_localizar_roadblock",_city]
			}
		else
			{
			_textX = format [localize "STR_A3A_fn_base_localizar_forest",_city]
			};
		};
	};
_textX