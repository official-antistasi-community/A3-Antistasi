private ["_pos","_siteX","_city","_textX"];

_siteX = _this select 0;

_pos = getMarkerPos _siteX;

_textX = "";


if (_siteX in citiesX) then
	{
	_textX = format ["%1",[_siteX,false] call A3A_fnc_location];
	}
else
	{
	_city = [citiesX,_pos] call BIS_fnc_nearestPosition;
	_city = [_city,false] call A3A_fnc_location;
	if (_siteX in airportsX) then {_textX = format ["%1 " + localize "STR_A3_Campaign_C_EB_Marker_Airbase",_city]};
	if (_siteX in resourcesX) then {_textX = format [localize "STR_antistasi_resources" + " " + localize "STR_a3_bis_fnc_locationdescription_near",_city]};
	if (_siteX in factories) then {_textX = format [localize "STR_a3_cfgvehicles_land_factory_main_f0" + " " + localize "STR_a3_bis_fnc_locationdescription_near",_city]};
	if (_siteX in outposts) then {_textX = format [localize "STR_a3_exp_m01_respawnoutpost" + " " + localize "STR_a3_bis_fnc_locationdescription_near",_city]};
	if (_siteX in seaports) then {_textX = format [localize "STR_a3_cfgeditorsubcategories_edsubcat_seaports0" + " " + localize "STR_a3_bis_fnc_locationdescription_near",_city]};
	if (_siteX in controlsX) then
		{
		if (isOnRoad getMarkerPos _siteX) then
			{
			_textX = format [localize "STR_a3_cfggroups_empty_military_roadblocks_roadblock2" + " " + localize "STR_a3_bis_fnc_locationdescription_near",_city]
			}
		else
			{
			_textX = format [localize "STR_dn_forest" + " " + localize "STR_a3_bis_fnc_locationdescription_near",_city]
			};
		}
	else{
		if ((_siteX == "NATO_carrier") or (_siteX == "CSAT_carrier")) then {_textX = "their carrier"};
		};
	};
_textX