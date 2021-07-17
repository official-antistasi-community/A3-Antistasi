//usage: place on the map markers covering the areas where you want the AAF operate, and put names depending on if they are powerplants,resources, bases etc.. The marker must cover the whole operative area, it's buildings etc.. (for example in an airport, you must cover more than just the runway, you have to cover the service buildings etc..)
//markers cannot have more than 500 mts size on any side or you may find "insta spawn in your nose" effects.
//do not do it on cities and hills, as the mission will do it automatically
//the naming convention must be as the following arrays, for example: first power plant is "power", second is "power_1" thir is "power_2" after you finish with whatever number.
//to test automatic zone creation, init the mission with debug = true in init.sqf
//of course all the editor placed objects (petros, flag, respawn marker etc..) have to be ported to the new island
//deletion of a marker in the array will require deletion of the corresponding marker in the editor
//only touch the commented arrays
scriptName "initZones.sqf";
#include "..\..\Includes\common.inc"
FIX_LINE_NUMBERS()
Info("initZones started");

forcedSpawn = [];
citiesX = [];

[] call A3A_fnc_prepareMarkerArrays;

private ["_name", "_sizeX", "_sizeY", "_size", "_pos", "_mrk"];


if ((toLower worldName) in ["altis", "chernarus_summer"]) then {

	"((getText (_x >> ""type"")) == ""Hill"") &&
	!((getText (_x >> ""name"")) isEqualTo """") &&
	!(configName _x isEqualTo ""Magos"")"
	configClasses (configfile >> "CfgWorlds" >> worldName >> "Names") apply {

		_name = configName _x;
		_sizeX = getNumber (_x >> "radiusA");
		_sizeY = getNumber (_x >> "radiusB");
		_size = [_sizeX, _sizeY] select (_sizeX <= _sizeY);
		_pos = getArray (_x >> "position");
		_size = [_size, 50] select (_size < 10);
		_mrk = createmarker [format ["%1", _name], _pos];
		_mrk setMarkerSize [_size, _size];
		_mrk setMarkerShape "ELLIPSE";
		_mrk setMarkerBrush "SOLID";
		_mrk setMarkerColor "ColorRed";
		_mrk setMarkerText _name;
		controlsX pushBack _name;
	};
};  //this only for Altis and Cherno
if (debug) then {
    Debug_1("Setting Spawn Points for %1.", worldname);
};
//We're doing it this way, because Dedicated servers world name changes case, depending on how the file is named.
//And weirdly, == is not case sensitive.
//this comments has not an information about the code

(seaMarkers + seaSpawn + seaAttackSpawn + spawnPoints + detectionAreas) apply {_x setMarkerAlpha 0};
defaultControlIndex = (count controlsX) - 1;
outpostsFIA = [];
destroyedSites = [];
garrison setVariable ["Synd_HQ", [], true];
markersX = airportsX + resourcesX + factories + outposts + seaports + controlsX + ["Synd_HQ"];
if (debug) then {
    Debug_1("Building roads for %1.",worldname);
};
markersX apply {
	_x setMarkerAlpha 0;
	spawner setVariable [_x, 2, true];
};	//apply faster then forEach and look better


// setup hardcoded population counts for towns
private _hardcodedPop = true;
switch (toLower worldName) do {
	case "tanoa": {
		{server setVariable [_x select 0,_x select 1]} forEach
		[["Lami01",277],["Lifou01",350],["Lobaka01",64],["LaFoa01",38],["Savaka01",33],["Regina01",303],["Katkoula01",413],["Moddergat01",195],["Losi01",83],
		["Tanouka01",380],["Tobakoro01",45],["Georgetown01",347],["Kotomo01",160],["Rautake01",113],["Harcourt01",325],["Buawa01",44],["SaintJulien01",353],
		["Balavu01",189],["Namuvaka01",45],["Vagalala01",174],["Imone01",31],["Leqa01",45],["Blerick01",71],["Yanukka01",189],["OuaOue01",200],["Cerebu01",22],
		["Laikoro01",29],["Saioko01",46],["Belfort01",240],["Oumere01",333],["Muaceba01",18],["Nicolet01",224],["Lailai01",23],["Doodstil01",101],["Tavu01",178],
		["Lijnhaven01",610],["Nani01",19],["PetitNicolet01",135],["PortBoise01",28],["SaintPaul01",136],["Nasua01",60],["Savu01",184],["Murarua01",258],["Momea01",159],
		["LaRochelle01",532],["Koumac01",51],["Taga01",31],["Buabua01",27],["Penelo01",189],["Vatukoula01",15],["Nandai01",130],["Tuvanaka01",303],["Rereki01",43],
		["Ovau01",226],["IndPort01",420],["Ba01",106]];
	};
	case "altis": {
		{server setVariable [_x select 0,_x select 1]} forEach
		[["Therisa",154],["Zaros",371],["Poliakko",136],["Katalaki",95],["Alikampos",115],["Neochori",309],["Stavros",122],["Lakka",173],["AgiosDionysios",84],
		["Panochori",264],["Topolia",33],["Ekali",9],["Pyrgos",531],["Orino",45],["Neri",242],["Kore",133],["Kavala",660],["Aggelochori",395],["Koroni",32],["Gravia",291],
		["Anthrakia",143],["Syrta",151],["Negades",120],["Galati",151],["Telos",84],["Charkia",246],["Athira",342],["Dorida",168],["Ifestiona",48],["Chalkeia",214],
		["AgiosKonstantinos",39],["Abdera",89],["Panagia",91],["Nifi",24],["Rodopoli",212],["Kalithea",36],["Selakano",120],["Frini",69],["AgiosPetros",11],["Feres",92],
		["AgiaTriada",8],["Paros",396],["Kalochori",189],["Oreokastro",63],["Ioannina",48],["Delfinaki",29],["Sofia",179],["Molos",188]];
	};
	case "chernarus_summer": {
		{server setVariable [_x select 0,_x select 1]} forEach
		[["vill_NovySobor",129],["city_StarySobor",149],["vill_Guglovo",26],["vill_Vyshnoye",41],["vill_Kabanino",86],["vill_Rogovo",66],["vill_Mogilevka",104],["city_Gorka",115],
		["vill_Grishino",168],["vill_Shakhovka",55],["vill_Pogorevka",57],["vill_Pulkovo",26],["vill_Nadezhdino",109],["city_Vybor",180],["vill_Polana",118],["vill_Staroye",115],
		["vill_Dubrovka",86],["vill_Pustoshka",163],["vill_Kozlovka",100],["vill_Pusta",52],["vill_Dolina",83],["vill_Gvozdno",78],["vill_Prigorodki",145],["vill_Drozhino",58],
		["vill_Sosnovka",54],["vill_Msta",96],["vill_Lopatino",159],["city_Zelenogorsk",280],["vill_Orlovets",65],["city_Berezino",340],["vill_Myshkino",49],["vill_Petrovka",45],
		["city_Chernogorsk",761],["vill_Bor",46],["vill_Nizhnoye",146],["vill_Balota",147],["vill_Khelm",110],["city_Krasnostav",194],["vill_Komarovo",127],["city_Elektrozavodsk",745],
		["city_Solnychniy",224],["vill_Kamyshovo",196],["vill_Tulga",35],["vill_Pavlovo",99],["vill_Kamenka",127],["vill_Olsha",20]];
	};
	case "chernarus_winter": {
		{server setVariable [_x select 0,_x select 1]} forEach
		[["vill_NovySobor",129],["city_StarySobor",149],["vill_Guglovo",26],["vill_Vyshnoye",41],["vill_Kabanino",86],["vill_Rogovo",66],["vill_Mogilevka",104],["city_Gorka",115],
		["vill_Grishino",168],["vill_Shakhovka",55],["vill_Pogorevka",57],["vill_Pulkovo",26],["vill_Nadezhdino",109],["city_Vybor",180],["vill_Polana",118],["vill_Staroye",115],
		["vill_Dubrovka",86],["vill_Pustoshka",163],["vill_Kozlovka",100],["vill_Pusta",52],["vill_Dolina",83],["vill_Gvozdno",78],["vill_Prigorodki",145],["vill_Drozhino",58],
		["vill_Sosnovka",54],["vill_Msta",96],["vill_Lopatino",159],["city_Zelenogorsk",280],["vill_Orlovets",65],["city_Berezino",340],["vill_Myshkino",49],["vill_Petrovka",45],
		["city_Chernogorsk",761],["vill_Bor",46],["vill_Nizhnoye",146],["vill_Balota",147],["vill_Khelm",110],["city_Krasnostav",194],["vill_Komarovo",127],["city_Elektrozavodsk",745],
		["city_Solnychniy",224],["vill_Kamyshovo",196],["vill_Tulga",35],["vill_Pavlovo",99],["vill_Kamenka",127],["vill_Olsha",20]];
	};
    //To improve Performance, reduces pop from 13972 to 4850
	case "enoch": {
		{server setVariable [_x select 0,_x select 1]} forEach
		[["Adamow",200],["Bielawa",150],["Borek",150],["Brena",150],["Dolnik",100],["Gieraltow",400],["Gliniska",150],["Grabin",250],["Huta",150],["Karlin",50],["Kolembrody",100],
		["Lembork",50],["Lipina",100],["Lukow",200],["Muratyn",50],["Nadbor",600],["Nidek",100],["Olszanka",100],["Polana",100],["Radacz",150],["Radunin",150],["Roztoka",50],
		["Sitnik",150],["Sobotka",100],["Tarnow",200],["Topolin",650],["Zalesie",150],["Zapadlisko",100]];
	};
	case "vt7": {
		{server setVariable [_x select 0,_x select 1]} forEach
		[["aarre",80],["Alapihlaja",90],["Eerikkala",88],["haavisto",60],["Hailila",90],["Hanski",100],["Harju",100],["harjula",70],["hirvela",0],
		["Hurppu",80],["Hyypianvuori",60],["Jarvenkyla",100],["kallio",10],["Kirkonkyla",500],["Klamila",150],["Koivuniemi",100],["Korpela",80],
		["Kouki",90],["Kuusela",100],["Lansikyla",100],["Myllynmaki",60],["Nakarinmaki",90],["Niemela",60],["nopala",80],["Ojala",80],["Onnela",100],
		["Pajunlahti",90],["piispa",100],["Pyterlahti",390],["Rannanen",80],["Ravijoki",90],["Riko",100],["Santaniemi",100],["Skippari",80],["suopelto",80],
		["Sydankyla",150],["Tinkanen",80],["toipela",0],["uski",80],["Uutela",100],["Vilkkila",110],["Virojoki",500],["Ylapaa",80],["Ylapihlaja",80],
		["Souvio",70]];
	};
	//Reduced Pop for performance 16761 to 15350, minimum Pop per Town set to 100 to ensure Vehicle spawning
	case "cam_lao_nam": {
		{server setVariable [_x select 0,_x select 1]} forEach
		[["haiphong",500],["hanoi",1000],["hue",2000],["saigon",700],["sihanoukville",200],["nodallho",100],["bru",100],["attapeu",100],
		["dakrong",100],["lumphat",100],["cuchi",100],["baria",100],["danang",600],["kenglat",100],["laichau",100],["paknoi",100],
		["phuan",100],["xomram",120],["xomgia",100],["tongmoo",100],["donlac",100],["cangon",100],["nalai",100],["baichai",100],
		["bachdang",100],["ketthuc",100],["vongxo",100],["banbon",100],["nongkhiaw",100],["horhog",100],["langmau",100],
		["baria2",100],["anhoa",100],["binhminh",100],["buoisang",100],["hoalien",100],["lacmy",100],["cacan",100],["tanhop",100],
		["hanoi2",1200],["gansong",100],["zokcarbora",100],["banhtrung",100],["yentinh",100],["thunglungcao",100],["baibiendep",100],
		["phoduc",100],["baove",100],["ngatu",100],["binhyen",100],["bosong",100],["marble",180],["niemtin",100],
		["krosang",100],["banlen",100],["comngon",100],["saigonport",100],["cauhai",100]];
	};
	default { _hardcodedPop = false };
};
    //Disables Towns/Villages, Names can be found in configFile >> "CfgWorlds" >> "WORLDNAME" >> "Names"
private ["_nameX", "_roads", "_numCiv", "_roadsProv", "_roadcon", "_dmrk", "_info"];

"(getText (_x >> ""type"") in [""NameCityCapital"", ""NameCity"", ""NameVillage"", ""CityCenter""]) &&
!(getText (_x >> ""Name"") isEqualTo """") &&
!((configName _x) in [""Lakatoro01"", ""Galili01"",""Sosovu01"", ""Ipota01"", ""Malden_C_Airport"", ""FobNauzad"", ""FobObeh"", ""22"",
""23"", ""toipela"", ""hirvela"", ""Kuusela"", ""Niemela"", ""fob4"", ""daumau"", ""fob1"", ""quanloi"", ""stagingarea"", ""fob2"",
""pleimei"", ""fob6"", ""berchtesgaden"", ""fob3"", ""khegio"", ""fob5"", ""thudridge"", ""halongnavybase"", ""plainofjars"", ""pleikuboatbase"",
""banhoang"", ""vinhau"", ""kechau"", ""quanbo"", ""huecitadel"", ""bimat"", ""danthemthem"", ""daophai"", ""phuquoc"", ""dharmadocks"",
 ""dharma"", ""patmep"", ""phokham"", ""rungcung"", ""tiengtai"", ""vacang"", ""hanoi3"", ""saigonport"", ""ansungsong"", ""vanchu"",
 ""sangha"", ""hoxanx"", ""congtroi"", ""boave"", ""longhai"", ""honba"", ""kiemtra"", ""baibiendiep"", ""nuocbun"", ""cantho"",
 ""nhenden"", ""soctrang"", ""mekongdelta"", ""tampep"", ""segbegat"", ""che"", ""tandi"", ""lahot"", ""alieng"", ""thiengling"",
 ""phaonoi"", ""timho"", ""quyen"", ""caloi"", ""thuphac"", ""diemdang"", ""bandao"", ""mantau"",""dongxa"", ""tauphabang"", ""horgoat"",
 ""samsong"", ""muylai"", ""caymo"", ""docon"", ""paradiseisland"", ""mien"", ""giuaho"", ""daotrai""])"
configClasses (configfile >> "CfgWorlds" >> worldName >> "Names") apply {

	_nameX = configName _x;
	_sizeX = getNumber (_x >> "radiusA");
	_sizeY = getNumber (_x >> "radiusB");
	_size = [_sizeY, _sizeX] select (_sizeX > _sizeY);
	_pos = getArray (_x >> "position");
	_size = [_size, 400] select (_size < 400);
	_numCiv = 0;

	if (_hardcodedPop) then
	{
		_numCiv = server getVariable _nameX;
		if (isNil "_numCiv" || {!(_numCiv isEqualType 0)}) then
		{
            Error_1("Bad population count data for %1", _nameX);
			_numCiv = (count (nearestObjects [_pos, ["house"], _size]));
		};
	}
	else {
		_numCiv = (count (nearestObjects [_pos, ["house"], _size]));
	};

	_roads = nearestTerrainObjects [_pos, ["MAIN ROAD", "ROAD", "TRACK"], _size, true, true];
	if (count _roads > 0) then {
		// Move marker position to the nearest road, if any
		_pos = _roads select 0;
	};
	_numVeh = (count _roads) min (_numCiv / 3);

	_mrk = createmarker [format ["%1", _nameX], _pos];
	_mrk setMarkerSize [_size, _size];
	_mrk setMarkerShape "RECTANGLE";
	_mrk setMarkerBrush "SOLID";
	_mrk setMarkerColor colorOccupants;
	_mrk setMarkerText _nameX;
	_mrk setMarkerAlpha 0;
	citiesX pushBack _nameX;
	spawner setVariable [_nameX, 2, true];
	_dmrk = createMarker [format ["Dum%1", _nameX], _pos];
	_dmrk setMarkerShape "ICON";
	_dmrk setMarkerType "loc_Ruin";
	_dmrk setMarkerColor colorOccupants;

	sidesX setVariable [_mrk, Occupants, true];
	_info = [_numCiv, _numVeh, prestigeOPFOR, prestigeBLUFOR];
	server setVariable [_nameX, _info, true];
};	//find in congigs faster then find location in 25000 radius
if (debug) then {
    Debug_1("Roads built in %1.", worldName);
};


markersX = markersX + citiesX;
sidesX setVariable ["Synd_HQ", teamPlayer, true];
sidesX setVariable ["NATO_carrier", Occupants, true];
sidesX setVariable ["CSAT_carrier", Invaders, true];

antennasDead = [];
banks = [];
mrkAntennas = [];
private _posAntennas = [];
private _blacklistPos = [];
private _posBank = [];
private _banktypes = ["Land_Offices_01_V1_F"];
private _antennatypes = ["Land_TTowerBig_1_F", "Land_TTowerBig_2_F", "Land_Communication_F",
"Land_Vysilac_FM","Land_A_TVTower_base","Land_Telek1", "Land_vn_tower_signal_01"];
private ["_antenna", "_mrkFinal", "_antennaProv"];
if (debug) then {
    Debug("Setting up Radio Towers.");
};

// Land_A_TVTower_base can't be destroyed, Land_Communication_F and Land_Vysilac_FM are not replaced with "Ruins" when destroyed.
// This causes issues with persistent load and rebuild scripts, so we replace those with antennas that work properly.
private _replaceBadAntenna = {
	params ["_antenna"];
	if ((typeof _antenna) in ["Land_Communication_F", "Land_Vysilac_FM", "Land_A_TVTower_Base"]) then {
		hideObjectGlobal _antenna;
		if (typeof _antenna == "Land_A_TVTower_Base") then {
			// The TV tower is composed of 3 sections - need to hide them all
			private _otherSections = nearestObjects [_antenna, ["Land_A_TVTower_Mid", "Land_A_TVTower_Top"], 200];
			{ hideObjectGlobal _x; } forEach _otherSections;
		};
		private _antennaPos = getPos _antenna;
		_antennaPos set [2, 0];
		private _antennaClass = if (worldName == "chernarus_summer") then { "Land_Telek1" } else { "Land_TTowerBig_2_F" };
		_antenna = createVehicle [_antennaClass, _antennaPos, [], 0, "NONE"];
	};
	_antenna;
};

switch (toLower worldName) do {
	case "tanoa": {
		_posAntennas =
		[[2682.94,2592.64,-0.000686646], [4701.6,3165.23,0.0633469], [2437.25,7224.06,0.0264893], [2563.15,9017.1,0.291538],
		[6617.95,7853.57,0.200073], [11008.8,4211.16,-0.00154114], [6005.47,10420.9,0.20298], [7486.67,9651.9,1.52588e-005],
		[2690.54,12323,0.0372467], [2965.33,13087.1,0.191544], [7278.8,12846.6,0.0838776], [12889.2,8578.86,0.228729],
		[10114.3,11743.1,9.15527e-005], [10949.8,11517.3,0.14209], [11153.3,11435.2,0.210876], [13775.8,10976.8,0.170441]];	// All antennas to be bases or to ignore.
		_blacklistPos = [9, 14];		// Ignore Antenna at <Index> in _posAntennas.
		_posBank = [[5893.41,10253.1,-0.687263], [9507.5,13572.9,0.133848]];	// same as RT for Bank buildings, select the biggest buildings in your island, and make a DB with their positions.
		antennas = [];
	};
	case "altis": {
		_posAntennas =
		[[14451.5,16338,0.000354767], [15346.7,15894,-3.8147e-005], [16085.1,16998,7.08781], [17856.7,11734.1,0.863045],
		[9496.2,19318.5,0.601898], [9222.87,19249.1,0.0348206], [20944.9,19280.9,0.201118], [20642.7,20107.7,0.236603],
		[18709.3,10222.5,0.716034], [6840.97,16163.4,0.0137177], [19319,9716.22,0.442627], [19351.9,9693.04,0.639175],
		[10317.3,8704.65,0.117233], [8268.76,10051.6,0.0100708], [4583.61,15401.1,0.262543],[4555.65,15383.2,0.0271606],
		[4263.82,20664.1,-0.0102234], [26274.6,22188.1,0.0139847], [26455.4,22166.3,0.0223694]];
		_blacklistPos = [4, 10, 12, 15, 17];
		_posBank = [[16586.6,12834.5,-0.638584], [16545.8,12784.5,-0.485485], [16633.3,12807,-0.635017], [3717.34,13391.2,-0.164862], [3692.49,13158.3,-0.0462074], [3664.31,12826.5,-0.379545], [3536.99,13006.6,-0.508585], [3266.42,12969.9,-0.549738]];
		antennas = [];
	};
	case "chernarus_summer": {
		_posAntennas =
		[[3029.11,2350.27,0.229149], [4547.68,3132.05,0.693176], [3715.81,5984.25,0], [6563.68,3405.56,0.0547333],
		[5264.35,5314.45,-0.00253296], [6443.78,6545.48,0.0928955], [4967.81,9966.56,0], [8127.52,9151.57,0],
		[13477.6,3345.84,0.0730896], [13010.1,5964.96,-0.0163116], [12937,12763.6,0.164017]];
		_blackListPos = [0, 4, 8, 9];
		antennas = [];
	};
	case "chernarus_winter": {
		_posAntennas =
		[[3029.11,2350.27,0.229149], [4547.68,3132.05,0.693176], [3715.81,5984.25,0], [6563.68,3405.56,0.0547333],
		[5264.35,5314.45,-0.00253296], [6443.78,6545.48,0.0928955], [4967.81,9966.56,0], [8127.52,9151.57,0],
		[13477.6,3345.84,0.0730896], [13010.1,5964.96,-0.0163116], [12937,12763.6,0.164017]];
		_blackListPos = [0, 4, 8, 9];
		antennas = [];
	};
	case "enoch": {
		_posAntennas =
		[[3830.61,1827.19,0], [5007.39,2131.27,0], [1583.47,7162.08,0.000152588], [3146.07,7024.41,0.00133514],
		[1408.43,8675.08,-1.00183], [8894.99,2049.1,0.00387573], [2382.53,11479.5,3.05176e-005], [6293.86,9910.17,-7.62939e-006],
		[3585.76,11540.7,-0.000236511], [7906.11,9917.2,0.0120544], [7776.88,10082.3,0.0262146], [7866.34,10102.5,3.05176e-005],
		[6908.45,11119.5,-2.40052], [9257.02,10282.7,0.0631027], [10610.4,10890.6,0.166985], [11172.6,11424.1,-2.82624]];
		_blackListPos = [2, 3, 4, 6, 8, 11, 12, 13, 14, 15];
		antennas = [];
	};
	case "tembelan": {
		_posAntennas =
		[[502.398,348.476,0.000190735], [4310.99,844.668,0.0271759], [1724.15,4777.62,-1.14441e-005], [2916.02,4174.11,1.14441e-005],
		[3020.15,8111.37,0.517868], [4133.57,8028.41,0.30658], [7080.68,5748.77,0.500134], [9160.06,4707.45,0.19401],
		[9542.17,5029,0.0381298], [9191.69,6012.89,0], [9238.39,6075.66,0.160484]];
		_blackListPos = [1, 4, 6, 8, 9];
		antennas = [];
	};
	case "vt7": {
		_posAntennas =
		[[907.35,2955.65,0], [6644.62,7275.58,0.00256348], [6242.47,13009.4,0.39426], [13061.2,6487.81,0.760155],
		[1768.36,15526.1,0.00277328], [15449.2,16603.3,0]];
		_blackListPos = [];
		antennas = [];
	};
	case "takistan": {
		_posAntennas =
		[[4014.64,3089.66,0.150604], [5249.37,3709.48,-0.353882], [3126.7,8223.88,-0.649429], [8547.92,3897.03,-0.56073], [5578.24,9072.21,-0.842239], [2239.98,12630.7,-0.575844]];
		_blacklistPos = [];
		antennas = [];
	};
	case "cam_lao_nam": {
		_posAntennas =
		[[2247.39,3986.44,0.00225067], [6918.17,5419.54,0], [2947.57,8719.32,0.00744534], [3971.88,10207.1,0], [11382.5,5747.82,8.39233e-005],
		[8700.25,10425.1,-0.00531006], [4898.78,13640.6,-0.120941], [3272.04,15538.2,0], [15266.2,4664.97,0.000167847], [13743.9,8425.6,-0.171967],
		[14864.6,6866.28,-0.00304413], [16101.4,3639.34,-0.115108], [16074.1,7125.38,0.000450134], [5279.59,16872.8,0.446297], [16120.6,7510.5,0.00740814],
		[16798.7,6349.54,-0.134335], [17358.3,5560.4,-0.15237], [16567.1,7649.92,-6.48499e-005], [16915.2,7431.9,-9.53674e-006], [11481,14497.6,0.093338],
		[9002.38,16557.6,0.00338745], [16704,9187.21,-6.29425e-005], [14135,12825.5,0.106886], [16193.1,10991.2,-0.0359497], [16956.7,10360.2,-6.67572e-005],
		[18696.2,8463.42,-0.26639], [20109.3,6538.61,9.53674e-007], [20062.7,7258.82,0.0105629], [14532.3,16441.8,-0.00198364], [14754.2,18335.2,0.000380516]];
		_blackListPos = [11, 15, 17, 21, 24, 27];
		antennas = [];
	};
	case "sara": {
		_posAntennas =
		[[3142.96,2739.15,0.18647], [8514.74,7996.98,0.0240936], [11464.1,6307.43,-0.0322723], [11885.1,6210.11,-15.4125],
		[9617.11,9829.03,0], [10214.7,9348.09,0.0702515], [9738.74,9966.7,-0.226944], [10415.5,9761.01,-0.0189056],
		[12621.4,7490.31,0.1297], [12560.1,8362.11,-0.157566], [13328.6,9055.83,0.350442], [4940.89,15457.6,-0.18277],
		[12327.2,15031.4,0], [14788,12762.9,-15.4287], [11068.1,16903.5,-0.0132771], [13964.6,15752.9,-15.429],
		[17263.3,14160.1,-0.1]];
		_blackListPos = [1, 3, 4, 5, 9, 11, 13, 16, 17];
		antennas = [];
	};
	default {
		antennas = nearestObjects [[worldSize /2, worldSize/2], _antennatypes, worldSize];

		banks = nearestObjects [[worldSize /2, worldSize/2], _banktypes, worldSize];

		private _replacedAntennas = [];
		{ _replacedAntennas pushBack ([_x] call _replaceBadAntenna); } forEach antennas;
		antennas = _replacedAntennas;

		antennas apply {
			_mrkFinal = createMarker [format ["Ant%1", mapGridPosition _x], position _x];
			_mrkFinal setMarkerShape "ICON";
			_mrkFinal setMarkerType "loc_Transmitter";
			_mrkFinal setMarkerColor "ColorBlack";
			_mrkFinal setMarkerText localize "STR_a3_cfgmarkers_loc_transmitter";
			mrkAntennas pushBack _mrkFinal;
			_x addEventHandler [
				"Killed",
				{
					_antenna = _this select 0;
					_antenna removeAllEventHandlers "Killed";

					citiesX apply {
						if ([antennas,_x] call BIS_fnc_nearestPosition == _antenna) then {
							[_x, false] spawn A3A_fnc_blackout;
						};
					};

					_mrk = [mrkAntennas, _antenna] call BIS_fnc_nearestPosition;
					antennas = antennas - [_antenna];
					antennasDead pushBack _antenna;
					deleteMarker _mrk;
					publicVariable "antennas";
					publicVariable "antennasDead";
					["TaskSucceeded", ["", localize "STR_antistasi_notification_radioDestroy"]] remoteExec ["BIS_fnc_showNotification", teamPlayer];
					["TaskFailed", ["", localize "STR_antistasi_notification_radioDestroy"]] remoteExec ["BIS_fnc_showNotification", Occupants];
				}
			];
		};
	};
};
if (debug) then {
    Debug("Radio Tower built.");
    Debug("Finding broken Radio Towers.");
};
if (count _posAntennas > 0) then {
	for "_i" from 0 to (count _posAntennas - 1) do {
		_antennaProv = nearestObjects [_posAntennas select _i, _antennaTypes, 35];

		if (count _antennaProv > 0) then {
			_antenna = _antennaProv select 0;

			if (_i in _blacklistPos) then {
				_antenna setdamage 1;
			} else {
				_antenna = ([_antenna] call _replaceBadAntenna);
				antennas pushBack _antenna;
				_mrkFinal = createMarker [format ["Ant%1", mapGridPosition _antenna], _posAntennas select _i];
				_mrkFinal setMarkerShape "ICON";
				_mrkFinal setMarkerType "loc_Transmitter";
				_mrkFinal setMarkerColor "ColorBlack";
				_mrkFinal setMarkerText localize "STR_a3_cfgmarkers_loc_transmitter";
				mrkAntennas pushBack _mrkFinal;

				_antenna addEventHandler [
					"Killed",
					{
						_antenna = _this select 0;
						_antenna removeAllEventHandlers "Killed";

						citiesX apply {
							if ([antennas, _x] call BIS_fnc_nearestPosition == _antenna) then {
								[_x, false] spawn A3A_fnc_blackout
							};
						};

						_mrk = [mrkAntennas, _antenna] call BIS_fnc_nearestPosition;
						antennas = antennas - [_antenna];
						antennasDead pushBack  _antenna;
						deleteMarker _mrk;
						publicVariable "antennas";
						publicVariable "antennasDead";
						["TaskSucceeded", ["", localize "STR_antistasi_notification_radioDestroy"]] remoteExec ["BIS_fnc_showNotification", teamPlayer];
						["TaskFailed", ["", localize "STR_antistasi_notification_radioDestroy"]] remoteExec ["BIS_fnc_showNotification", Occupants];
					}
				];
			};
		};
	};
};
if (debug) then {
	Error("Broken Radio Towers identified.");
};
if (count _posBank > 0) then {
	for "_i" from 0 to (count _posBank - 1) do {
		_bankProv = nearestObjects [_posBank select _i, _banktypes, 30];

		if (count _bankProv > 0) then {
			private _banco = _bankProv select 0;
			banks = banks + [_banco];
		};
	};
};

// Make list of markers that don't have a proper road nearby
blackListDest = (markersX - controlsX - ["Synd_HQ"] - citiesX) select {
	private _nearRoads = (getMarkerPos _x) nearRoads (([_x] call A3A_fnc_sizeMarker) * 1.5);
//	_nearRoads = _nearRoads inAreaArray _x;
	private _badSurfaces = ["#GdtForest", "#GdtRock", "#GdtGrassTall"];
	private _idx = _nearRoads findIf { !(surfaceType (position _x) in _badSurfaces) && { count roadsConnectedTo _x != 0 } };
	if (_idx == -1) then {true} else {false};
};

publicVariable "blackListDest";
publicVariable "markersX";
publicVariable "citiesX";
publicVariable "airportsX";
publicVariable "resourcesX";
publicVariable "factories";
publicVariable "outposts";
publicVariable "controlsX";
publicVariable "seaports";
publicVariable "destroyedSites";
publicVariable "forcedSpawn";
publicVariable "outpostsFIA";
publicVariable "seaMarkers";
publicVariable "spawnPoints";
publicVariable "antennas";
publicVariable "antennasDead";
publicVariable "mrkAntennas";
publicVariable "banks";
publicVariable "seaSpawn";
publicVariable "seaAttackSpawn";
publicVariable "defaultControlIndex";
publicVariable "detectionAreas";

if (isMultiplayer) then {
	[petros, "hint","Zones Init Completed"] remoteExec ["A3A_fnc_commsMP", -2]
};

Info("initZones completed");
