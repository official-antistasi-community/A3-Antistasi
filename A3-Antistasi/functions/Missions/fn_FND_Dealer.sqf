//Mission: Find dealer
if (!isServer and hasInterface) exitWith{};

private _markerX = _this select 0;
private _positionX = (getMarkerPos _markerX) getPos [random 100, random 360];
private _difficultX = if (random 10 < tierWar) then {true} else {false};

private _timeLimit = if (_difficultX) then {30} else {60};
if (hasIFA) then {_timeLimit = _timeLimit * 2};
private _dateLimit = [date select 0, date select 1, date select 2, date select 3, (date select 4) + _timeLimit];
private _dateLimitNum = dateToNumber _dateLimit;
_dateLimit = numberToDate [date select 0, _dateLimitNum];//converts datenumber back to date array so that time formats correctly
private _displayTime = [_dateLimit] call A3A_fnc_dateToTimeString;//Converts the time portion of the date array to a string for clarity in hints
private _nameDest = [_markerX] call A3A_fnc_localizar;

// TODO: The object placement could use some work
/** Spawn Objects (next to the road) */
private _positionCamp = _positionX;
private _directionToRoad = 0;
private _nearRoads = _positionX nearRoads 50;
if (_nearRoads isEqualType [] && count _nearRoads > 0) then {
	private _road = selectRandom _nearRoads;
	_positionCamp = [(getPos _road), 8, 0] call BIS_fnc_relPos;
	_directionToRoad = [_positionCamp, (getPos _road)] call BIS_fnc_dirTo;
};
private _objects = [_positionCamp, _directionToRoad, [
	["Land_Money_F",[0.636719,0.349609,-9.53674e-007],360,1,0,[],"","",true,false],
	["Box_IED_Exp_F",[-0.973633,0.149414,0.0162439],260.747,1,0.00984005,[],"","",true,false],
	["Land_Suitcase_F",[0.755859,0.780273,0.000113964],291.007,1,0,[],"","",true,false],
	["Land_WoodenCounter_01_F",[-0.568848,1.0874,0.000607014],186.437,1,0.0135358,[],"","",true,false],
	["Box_Syndicate_Wps_F",[1.40918,0.457031,0],133.35,1,0,[],"","",true,false],
	["Oil_Spill_F",[-1.56055,-1.18994,0],0,1,0,[],"","",true,false],
	["Box_IED_Exp_F",[-1.87061,0.322266,-9.53674e-007],328.642,1,0.11798,[],"","",true,false],
	["Land_PlasticCase_01_medium_F",[-1.90674,-0.555664,0],307.385,1,0.00975709,[],"","",true,false],
	["Land_ClothShelter_02_F",[-1.62744,-0.431641,0.0836663],0,1,0,[],"","",true,false],
	["Land_Sign_Mines_F",[-2.52246,-0.0322266,0],293.566,1,0,[],"","",true,false],
	["Land_GasTank_01_blue_F",[-1.66797,-2.09961,5.67436e-005],359.973,1,0,[],"","",true,false],
	["Land_Sacks_goods_F",[-2.64063,1.04541,0],0,1,0,[],"","",true,false],
	["Land_FireExtinguisher_F",[-1.64453,-2.47803,0.000132561],359.969,1,0,[],"","",true,false],
	["Item_ToolKit",[-1.40576,-2.72314,0],64.2028,1,0,[],"","",true,false],
	["Land_Wreck_Van_F",[-3.37012,-1.62598,0],153.82,1,0,[],"","",true,false],
	["Land_WeldingTrolley_01_F",[-1.17236,-3.84766,1.19209e-005],0.00173577,1,0,[],"","",true,false]
]] call BIS_fnc_ObjectsMapper;

{
	call {
		if (str typeof _x find "Box_Syndicate_Wps_F" > -1) exitWith {
			dealerCrate = _x;
			clearMagazineCargoGlobal dealerCrate;
			clearWeaponCargoGlobal dealerCrate;
			clearItemCargoGlobal dealerCrate;
			clearBackpackCargoGlobal dealerCrate;
		};
		if (str typeof _x find "Box_IED_Exp_F" > -1) exitWith {
			clearMagazineCargoGlobal _x;
			clearWeaponCargoGlobal _x;
			clearItemCargoGlobal _x;
			clearBackpackCargoGlobal _x;
		};
	};
} forEach _objects;
/** END */

/** Spawn Dealer */
// TODO: Should killing dealer result in prestige punish?
private _dealerGroup = createGroup [civilian, true];
private _dealer = _dealerGroup createUnit ["C_Nikos", _positionCamp, [], 0.9, "NONE"];
Dealer = _dealer;
publicVariable "Dealer";
_dealer allowDamage false;
sleep 2;
_dealer setDir _directionToRoad;
_dealer removeWeaponGlobal (primaryWeapon _dealer);
_dealer disableAI "move";
_dealer setunitpos "up";
// TODO: Name isn't set in-game
_dealer setIdentity "Devin"; // Devin, as known from JA2 -- bow down to the masters at Sir-Tech!
_dealerGroup setBehaviour "CARELESS";
_dealerGroup setSpeedMode "LIMITED";
/** END */

/** Create task */
private _tskTitle = localize "STR_antistasi_task_title_FND_Dealer";
private _tskDesc = localize "STR_antistasi_task_desc_FND_Dealer";
private _posTsk = _positionX getPos [random 100, random 360];
[[teamPlayer,civilian],"FND",[format [_tskDesc,_nameDest,_displayTime],"Find the Crazy Irishman",_markerX],_posTsk,false,0,true,"Find",true] call BIS_fnc_taskCreate;
missionsX pushBack ["FND","CREATED"]; publicVariable "missionsX";
/** END */

/** TODO: (optional) Enemy QRF spawn near */
/** END */

// waitUntil {sleep 1; (dateToNumber date > _dateLimitNum) || !(alive _dealer) || ({(side _x isEqualTo Occupants) && (_x distance _dealer < 200)} count allPlayers > 0)};
// {if (isPlayer _x) then {[petros,"hint","Don't ask Devin about the Holy Handgrenade of Antioch. Just don't."] remoteExec ["commsMP",_x]}} forEach ([200,0,_dealer,"BLUFORSpawn"] call distanceUnits);

/** Finish task */
waitUntil {sleep 1; (dateToNumber date > _dateLimitNum) || !(alive _dealer) || ({((side _x isEqualTo Occupants) || (side _x isEqualTo civilian)) && (_x distance _dealer < 10)} count allPlayers > 0)};

if ({((side _x isEqualTo Occupants) || (side _x isEqualTo civilian)) && (_x distance _dealer < 10)} count allPlayers > 0) then {
	["FND",[format [_tskDesc,_nameDest,_displayTime],"Find the Crazy Irishman",_markerX],_posTsk,"SUCCEEDED"] call A3A_fnc_taskUpdate;
	private _addActionParams = [localize "STR_antistasi_action_buy_dealer", {
		_target = _this select 0;
		_caller = _this select 1;
		if (side _caller == civilian) then { // TODO: Should we also deny opfor/blufor?
			[_target,"localChat","I have no interest in dealing with civilians"] remoteExec ["A3A_fnc_commsMP",[0, -2] select isDedicated]; // TODO: LOCALIZE
		} else {
			_nul = CreateDialog "dealer_menu";
			[_target,"localChat","Top of the day to ya. Haven't made yer acquaintance."] remoteExec ["A3A_fnc_commsMP",[0, -2] select isDedicated]; // TODO: LOCALIZE
		};
	},nil,0,false,true,"","(isPlayer _this) and (_this == _this getVariable ['owner',objNull]) and (_originalTarget getVariable ['showBuyOption',false])"];
	[_dealer, _addActionParams] remoteExec ["addAction", [0, -2] select isDedicated, true];

	private _dealerMarker = createMarker ["Dealer", _positionX];
	_dealerMarker setMarkerShape "ICON";
	_dealerMarker setMarkerType "flag_Croatia";

	private _marker = createMarker ["DevPat", _positionX]; // TODO: What is this for? (give it a good name)
	_marker setMarkerSize [100,100];
    _marker setMarkerShape "RECTANGLE";
    _marker setMarkerBrush "SOLID";
    _marker setMarkerColor "ColorUNKNOWN";
    _marker setMarkerText "Devin";
    _marker setMarkerAlpha 0;

    _dealer allowDamage true;

	_dealer setVariable ["showBuyOption", true, true]; // Show the addAction on the dealer
}
else {
	["FND",[format [_tskDesc,_nameDest,_displayTime],"Find the Crazy Irishman",_markerX],_posTsk,"FAILED"] call A3A_fnc_taskUpdate;
};
/** END */

/** CLEANUP */
waitUntil {sleep 10; (dateToNumber date > _dateLimitNum) || !(alive _dealer)};

if (alive _dealer) then {
	_dealer enableAI "ANIM";
	_dealer enableAI "MOVE";
	_dealer stop false;
	_dealer doMove getMarkerPos (selectRandom citiesX); // Make it look like the dealer walks away
};

_dealer setVariable ["showBuyOption", false, true]; // Hide the addAction on the dealer

deleteMarker "Dealer";
deleteMarker "DevPat"; // TODO: What is this for? (give it a good name)
private _nul = [60 * 15,"FND"] spawn A3A_fnc_deleteTask; // TODO: balance the delete time

sleep 10;

{
	deleteVehicle _x
} forEach _objects;

sleep 20; // Make him able to walk away, into the distance, for X seconds

deleteVehicle _dealer;
deleteGroup _dealerGroup;

Dealer = nil;
publicVariable "Dealer";

// TODO: Show some sort of notification that the dealer has left?
/** END */