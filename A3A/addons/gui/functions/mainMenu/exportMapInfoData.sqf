// Not in cfgfunctions, not called directly, likely useful in future.

params [["_map", "", ["",[]]]];

_map = [];
if (_map isEqualTo "") then {_map = worldName};
if (_map isEqualTo "") exitWith {"No map selected"};
private _mapInfoPath = configFile/"A3A"/"mapInfo";
if (_map isEqualTo []) then {_map = ("isClass (configFile >> 'CfgWorlds' >> configName _x)" configClasses (_mapInfoPath)) apply {configName _x};};

if (_map isEqualType "") then {_map = [_map]};

private _dataList = [];
{
	private _map = _x;
	private _sizeM = _map call BIS_fnc_mapSize;
	private _sizeKM = ((round (_sizeM / 100)) / 10);
	private _mapInfo = _mapInfoPath/toLower worldName;
	private _disabledTowns = getArray (_mapInfo/"disabledTowns");
	private _cityCountRaw = count (
	"(toLower getText (_x >> ""type"") in [""namecitycapital"",""namecity"",""namevillage"",""citycenter""]) &&
	!(getText (_x >> ""Name"") isEqualTo """") &&
	!((configName _x) in _disabledTowns)"
	configClasses (configfile >> "CfgWorlds" >> _map >> "Names"));
	private _formatted = format ["size = %1;cityCount = %2;",_sizeKM, _cityCountRaw];
	_dataList pushBack [_map,_formatted];
} forEach _map;

_dataList;

/*
[["altis",
"size = 30.7;cityCount = 48;"],
["cam_lao_nam",
"size = 20.5;cityCount = 58;"],
["chernarus",
"size = 15.4;cityCount = 46;"],
["chernarus_summer",
"size = 0;cityCount = 46;"],
["chernarus_winter",
"size = 0;cityCount = 46;"],
["cup_chernarus_A3",
"size = 15.4;cityCount = 72;"],
["enoch",
"size = 12.8;cityCount = 28;"],
["gm_weferlingen_summer",
"size = 20.5;cityCount = 49;"],
["gm_weferlingen_winter",
"size = 20.5;cityCount = 49;"],
["isladuala3",
"size = 10.2;cityCount = 55;"],
["kunduz",
"size = 5.1;cityCount = 12;"],
["malden",
"size = 12.8;cityCount = 15;"],
["mehland",
"size = 20.5;cityCount = 103;"]
["Napf",
"size = 20.5;cityCount = 62;"],
["NapfWinter",
"size = 20.5;cityCount = 62;"],
["pulau",
"size = 12.3;cityCount = 21;"],
["regero",
"size = 10.2;cityCount = 28;"],
["sara",
"size = 20.5;cityCount = 41;"],
["SPE_Mortain",
"size = 8.2;cityCount = 27;"],
["SPE_Normandy",
"size = 12.3;cityCount = 92;"],
["stratis",
"size = 8.2;cityCount = 8;"],
["takistan",
"size = 12.8;cityCount = 30;"],
["tanoa",
"size = 15.4;cityCount = 56;"],
["tembelan",
"size = 30.7;cityCount = 26;"],
["tem_anizay",
"size = 10.2;cityCount = 34;"],
["tem_kujari",
"size = 16.4;cityCount = 60;"],
["umb_colombia",
"size = 20.5;cityCount = 40;"],
["vn_khe_sanh",
"size = 15.4;cityCount = 92;"],
["vt7",
"size = 18;cityCount = 38;"]]
*/