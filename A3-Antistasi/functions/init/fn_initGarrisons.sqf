//Original Author: Barbolani
//Edited and updated by the Antistasi Community Development Team
scriptName "fn_initGarrisons";
#include "..\..\Includes\common.inc"
FIX_LINE_NUMBERS()
Info("InitGarrisons started");

_fnc_initMarker =
{
	params ["_mrkCSAT", "_target", "_mrkType", "_mrkText", ["_useSideName", false]];

	{
		private _pos = getMarkerPos _x;
		private _mrk = createMarker [format ["Dum%1", _x], _pos];
		//TODO Multilanguage variable insted text
		_mrk setMarkerShape "ICON";

		if (_useSideName) then
		{
			killZones setVariable [_x, [], true];
			server setVariable [_x, 0, true];

			private _sideName = if (_x in _mrkCSAT) then {nameInvaders} else {nameOccupants};
			_mrk setMarkerText format [_mrkText, _sideName];
		}
		else
		{
			_mrk setMarkerText _mrkText;
		};

		if (_x in airportsX) then
		{
			private _flagType = if (_x in _mrkCSAT) then {flagCSATmrk} else {flagNATOmrk};
			_mrk setMarkerType _flagType;
		}
		else
		{
			_mrk setMarkerType _mrkType;
		};

		if (_x in _mrkCSAT) then
		{
			if !(_x in airportsX) then {_mrk setMarkerColor colorInvaders;} else {_mrk setMarkerColor "Default"};
			sidesX setVariable [_x, Invaders, true];
		}
		else
		{
			if !(_x in airportsX) then {_mrk setMarkerColor colorOccupants;} else {_mrk setMarkerColor "Default"};
			sidesX setVariable [_x, Occupants, true];
		};

		[_x] call A3A_fnc_createControls;
	} forEach _target;
};


_fnc_initGarrison =
{
	params ["_markerArray", "_type"];
	private ["_side", "_groupsRandom", "_garrNum", "_garrisonOld", "_marker"];
	{
	    _marker = _x;
			_garrNum = ([_marker] call A3A_fnc_garrisonSize) / 8;
			_side = sidesX getVariable [_marker, sideUnknown];
			if(_side != Occupants) then
			{
				_groupsRandom = [groupsCSATSquad, groupsFIASquad] select ((_marker in outposts) && (gameMode == 4));
			}
			else
			{
				if(_type != "Airport" && {_type != "Outpost"}) then
				{
					_groupsRandom = groupsFIASquad;
				}
				else
				{
	 				_groupsRandom = groupsNATOSquad;
				};
			};
			//Old system, keeping it intact for the moment
			_garrisonOld = [];
			for "_i" from 1 to _garrNum do
			{
				_garrisonOld append (selectRandom _groupsRandom);
			};
			//

			//Old system, keeping it runing for now
			garrison setVariable [_marker, _garrisonOld, true];

	} forEach _markerArray;
};

private _mrkNATO = [];
private _mrkCSAT = [];
private _controlsNATO = [];
private _controlsCSAT = [];

if (debug) then
{
    Debug_1("Setting Control Marks for Worldname: %1", worldName);
};

if (gameMode == 1) then
{
	_controlsNATO = controlsX;
	switch (toLower worldName) do {
		case "tanoa": {
			_mrkCSAT = ["airport_1", "seaport_5", "outpost_10", "control_20"];
			_controlsCSAT = ["control_20"];
		};
		case "altis": {
			_mrkCSAT = ["airport_2", "seaport_4", "outpost_5", "control_52", "control_33"];
			_controlsCSAT = ["control_52", "control_33"];
		};
		case "chernarus_summer": {
			_mrkCSAT = ["outpost_21"];
		};
		case "tem_anizay": {
			_mrkCSAT = ["outpost_8", "control_19", "control_44", "control_45"];
			_controlsCSAT = ["control_19", "control_44", "control_45"];
		};
		case "chernarus_winter": {
			_mrkCSAT = ["outpost_21", "control_30"];
			_controlsCSAT = ["control_30"];
		};
		case "kunduz": {
			_mrkCSAT = ["outpost"];
		};
		case "enoch": {
			_mrkCSAT = ["airport_3", "control_14"];
			_controlsCSAT = ["control_14"];
		};
		case "tembelan": {
			_mrkCSAT = ["airport_4"];
		};
		case "malden": {
			_mrkCSAT = ["airport", "seaport_7"];
		};
		case "tem_kujari": {
			_mrkCSAT = [];
		};
		case "vt7": {
			_mrkCSAT = ["airport_2", "control_25", "control_29", "control_30", "control_31", "control_32", "Seaport_1", "Outpost_3"];
			_controlsCSAT = ["control_25", "control_29", "control_30", "control_31", "control_32"];
		};
		case "stratis": {
			_mrkCSAT = ["outpost_3"];
		};
		case "takistan": {
			_mrkCSAT = ["airport_1", "outpost_5", "outpost_6", "outpost_7", "outpost_8", "resource", "resource_5", "resource_6"];
			_controlsCSAT = ["control", "control_1", "control_2", "control_5", "control_13", "control_20", "control_21", "control_22", "control_24", "control_25", "control_31"];
		};
		case "sara": {
			_mrkCSAT = ["airport_1", "seaport_6", "outpost_22", "outpost_15", "resource_9", "outpost_19", "outpost_14", "resource_11"];
			_controlsCSAT = ["control_28", "control_27"];
		};
		case "cam_lao_nam": {
			_mrkCSAT = ["airport_5", "outpost_33", "outpost_34", "resource_4", "seaport_3", "outpost_15", "outpost_22", "outpost_8", "outpost_4", "resource_9", "outpost_21", "resource_14", "outpost_3", "outpost_2", "factory_3", "outpost_1", "outpost_7", "seaport_2", "outpost_32", "airport_1", "outpost_23", "outpost_10", "outpost_5", "outpost_16", "outpost_6", "outpost_11", "resource_6", "resource_20", "outpost_9", "outpost_38"];
            _controlsCSAT = ["control_1", "control_2", "control_3", "control_4", "control_5", "control_6", "control_7", "control_8", "control_9", "control_10", "control_11", "control_12", "control_13", "control_14", "control_15", "control_16", "control_17", "control_18", "control_19", "control_20", "control_21", "control_22", "control_23", "control_24", "control_25", "control_26", "control_27", "control_28", "control_29"];
		}
	};
    _controlsNATO = _controlsNATO - _controlsCSAT;
	_mrkNATO = markersX - _mrkCSAT - ["Synd_HQ"];

	if (debug) then {
        Debug_1("_mrkCSAT: %1", _mrkCSAT);
        Debug_1("_mrkNATO: %1", _mrkNATO);
	};
}
else
{
	if (gameMode == 4) then
	{
		_mrkCSAT = markersX - ["Synd_HQ"];
		_controlsCSAT = controlsX;
	}
	else
	{
		_mrkNATO = markersX - ["Synd_HQ"];
		_controlsNATO = controlsX;
	};
};

{sidesX setVariable [_x, Occupants, true]} forEach _controlsNATO;
{sidesX setVariable [_x, Invaders, true]} forEach _controlsCSAT;

[_mrkCSAT, airportsX, flagCSATmrk, "%1 "+ localize "STR_A3_Campaign_C_EB_Marker_Airbase", true] call _fnc_initMarker;
[_mrkCSAT, resourcesX, "loc_rock", localize "STR_antistasi_resources"] call _fnc_initMarker;
[_mrkCSAT, factories, "u_installation", localize "STR_a3_cfgvehicles_land_factory_main_f0"] call _fnc_initMarker;
[_mrkCSAT, outposts, "loc_bunker", "%1 "+ localize "STR_a3_exp_m01_respawnoutpost", true] call _fnc_initMarker;
[_mrkCSAT, seaports, "b_naval", localize "STR_a3_cfgeditorsubcategories_edsubcat_seaports0"] call _fnc_initMarker;

if (!(isNil "loadLastSave") && {loadLastSave}) exitWith {};

//Set carrier markers to the same as airbases below.
if (isServer) then {"NATO_carrier" setMarkertype flagNATOmrk};
if (isServer) then {"CSAT_carrier" setMarkertype flagCSATmrk};

if (debug) then {
    Debug("Setting up Airbase stuff.");
};

[airportsX, "Airport"] call _fnc_initGarrison;								//Old system
[airportsX, "Airport", [0,0,0]] call A3A_fnc_createGarrison;	//New system

if (debug) then {
    Debug("Setting up Resource stuff.");
};

[resourcesX, "Resource"] call _fnc_initGarrison;							//Old system
[resourcesX, "Other", [0,0,0]] call A3A_fnc_createGarrison;	//New system

if (debug) then {
    Debug("Setting up Factory stuff.");
};

[factories, "Factory"] call _fnc_initGarrison;
[factories, "Other", [0,0,0]] call A3A_fnc_createGarrison;

if (debug) then {
    Debug("Setting up Outpost stuff.");
};

[outposts, "Outpost"] call _fnc_initGarrison;
[outposts, "Outpost", [1,1,0]] call A3A_fnc_createGarrison;

if (debug) then {
    Debug("Setting up Seaport stuff.");
};

[seaports, "Seaport"] call _fnc_initGarrison;
[seaports, "Other", [1,0,0]] call A3A_fnc_createGarrison;

//New system, adding cities
[citiesX, "City", [0,0,0]] call A3A_fnc_createGarrison;

publicVariable "controlsX";		// because it adds to the array

Info("InitGarrisons completed");
