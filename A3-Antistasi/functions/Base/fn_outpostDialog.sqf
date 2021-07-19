#include "..\..\Includes\common.inc"
FIX_LINE_NUMBERS()
private _groupData = FactionGet(reb,"groups");
private ["_typeX","_costs","_groupX","_unit","_radiusX","_roads","_road","_pos","_truckX","_textX","_mrk","_hr","_exists","_positionTel","_isRoad","_typeGroup","_resourcesFIA","_hrFIA"];

if ("outpostsFIA" in A3A_activeTasks) exitWith {["Outposts/Roadblocks", "We can only deploy / delete one Observation Post or Roadblock at a time."] call A3A_fnc_customHint;};
if (!([player] call A3A_fnc_hasRadio)) exitWith {if !(A3A_hasIFA) then {["Radio Required", "You need a radio in your inventory to be able to give orders to other squads"] call A3A_fnc_customHint;} else {["Radio-man Required", "You need a Radio Man in your group to be able to give orders to other squads"] call A3A_fnc_customHint;}};

_typeX = _this select 0;

if (!visibleMap) then {openMap true};
positionTel = [];
if (_typeX != "delete") then {["Outposts/Roadblocks", "Click on the position you wish to build the Observation Post or Roadblock. <br/><br/> Remember: to build Roadblocks you must click exactly on a road map section"] call A3A_fnc_customHint;} else {["Outposts/Roadblocks", "Click on the Observation Post or Roadblock to delete."] call A3A_fnc_customHint;};

onMapSingleClick "positionTel = _pos;";

waitUntil {sleep 1; (count positionTel > 0) or (not visiblemap)};
onMapSingleClick "";

if (!visibleMap) exitWith {};

_positionTel = positionTel;
_pos = [];

if ((_typeX == "delete") and (count outpostsFIA < 1)) exitWith {["Outposts/Roadblocks", "No Posts or Roadblocks deployed to delete"] call A3A_fnc_customHint;};
if ((_typeX == "delete") and ({(alive _x) and (!captive _x) and ((side _x == Occupants) or (side _x == Invaders)) and (_x distance _positionTel < 500)} count allUnits > 0)) exitWith {["Outposts/Roadblocks", "You cannot delete a Post while enemies are near it"] call A3A_fnc_customHint;};

_costs = 0;
_hr = 0;

if (_typeX != "delete") then
	{
	_isRoad = isOnRoad _positionTel;

	_typeGroup = _groupData get "groupsSnipers";

	if (_isRoad) then
		{
		_typeGroup = _groupData get "AT";
		_costs = _costs + ([FactionGet(reb,"vehicleLightArmed")] call A3A_fnc_vehiclePrice) + (server getVariable (_groupData get "staticCrew"));
		_hr = _hr + 1;
		};

	//_formatX = (configfile >> "CfgGroups" >> "teamPlayer" >> "Guerilla" >> "Infantry" >> _typeGroup);
	//_unitsX = [_formatX] call groupComposition;
	{_costs = _costs + (server getVariable _x); _hr = _hr +1} forEach _typeGroup;
	}
else
	{
	_mrk = [outpostsFIA,_positionTel] call BIS_fnc_nearestPosition;
	_pos = getMarkerPos _mrk;
	if (_positionTel distance _pos >10) exitWith {["Outposts/Roadblocks", "No post nearby"] call A3A_fnc_customHint;};
	};
//if ((_typeX == "delete") and (_positionTel distance _pos >10)) exitWith {hint "No post nearby"};

_resourcesFIA = server getVariable "resourcesFIA";
_hrFIA = server getVariable "hr";

if (((_resourcesFIA < _costs) or (_hrFIA < _hr)) and (_typeX!= "delete")) exitWith {["Outposts/Roadblocks", format ["You lack of resources to build this Outpost or Roadblock <br/><br/> %1 HR and %2 € needed",_hr,_costs]] call A3A_fnc_customHint;};

if (_typeX != "delete") then
	{
	[-_hr,-_costs] remoteExec ["A3A_fnc_resourcesFIA",2];
	};

 [_typeX,_positionTel] remoteExec ["A3A_fnc_createOutpostsFIA", 2];
