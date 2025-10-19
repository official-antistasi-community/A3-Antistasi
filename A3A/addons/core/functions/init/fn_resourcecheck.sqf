#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
if (!isServer) exitWith {
    Error("Server-only function miscalled");
};

while {true} do
{
	// what's wrong with sleep 600, really?
	//sleep 600;//600
	nextTick = time + 600;
	waitUntil {sleep 15; time >= nextTick};
    waitUntil {sleep 10; A3A_activePlayerCount > 0};

	private _resAdd = 50;//0
	private _hrAdd = 2; // A3A_balancePlayerScaleBase;

	private _suppBoost = 0.5 * (1+ ({sidesX getVariable [_x,sideUnknown] == teamPlayer} count seaports));
	private _resBoost = 1 + (0.25*({(sidesX getVariable [_x,sideUnknown] == teamPlayer) and !(_x in destroyedSites)} count factories));

	{
		private _city = _x;
		if (_city in destroyedSites) then { continue };

		private _cityData = A3A_cityData getVariable _city;
		_cityData params ["_numCiv", "_supportReb"];

		private _ownerMul = [0.5, 1] select (sidesX getVariable _city == teamPlayer);
		private _resAddCity = _ownerMul * sqrt _numCiv * (_supportReb / 100);
		private _hrAddCity = _ownerMul * sqrt _numCiv * (_supportReb / 10000);

		_resAdd = _resAdd + _resAddCity;
		_hrAdd = _hrAdd + _hrAddCity;

	} forEach citiesX;

	[] call A3A_fnc_tierCheck;
	[] spawn A3A_fnc_checkCampaignEnd; // check for population win

	{
		if ((sidesX getVariable [_x,sideUnknown] == teamPlayer) and !(_x in destroyedSites)) then
		{
			_resAdd = _resAdd + (300 * _resBoost);
		};
	} forEach resourcesX;

	Debug_2("Occupant radio keys: %1 - Invader radio keys: %2", occRadioKeys, invRadioKeys);

	server setVariable ["hr", _hrAdd + (server getVariable "hr"), true];
	server setVariable ["resourcesFIA", ceil _resAdd + (server getVariable "resourcesFIA"), true];

	private _newBombRuns = bombRuns + 0.25 * ({sidesX getVariable [_x,sideUnknown] == teamPlayer} count airportsX);
	bombRuns = _newBombRuns min (4 + tierWar*2);
	publicVariable "bombRuns";

	// Add & delete enemy camps and roadblocks
	call A3A_fnc_updateMinorSites;

	// Regular income of finite starting weapons
	private _equipMul = A3A_balancePlayerScale / 30;		// difficulty scaled. Hmm.
	{
		if (_x isEqualType "") then { continue };
		_x params ["_class", "_initCount"];
		private _count = _initCount * _equipMul;
		_count = if (_count % 1 > random 1) then { ceil _count } else { floor _count };
		private _arsenalTab = _class call jn_fnc_arsenal_itemType;
		[_arsenalTab, _class, _count] call jn_fnc_arsenal_addItem;
	} forEach (A3A_faction_reb get "initialRebelEquipment");
    private _textX = format ["<t size='0.6' color='#C1C0BB'>" + (localize "STR_A3A_fn_init_resourceCheck_income"), _hrAdd toFixed 1, ceil _resAdd];
	private _textArsenal = [] call A3A_fnc_arsenalManage;
	if (_textArsenal != "") then {_textX = format ["%1<br/>" + localize "STR_A3A_fn_init_resourceCheck_arsenal" + "<br/><br/>%2", _textX, _textArsenal]};
	[petros, "taxRep", _textX] remoteExec ["A3A_fnc_commsMP", [teamPlayer, civilian]];

	[] call A3A_fnc_generateRebelGear;

	[] call A3A_fnc_FIAradio;

    // Random-walk the defence multipliers for markers to add some persistent variation
    // Maybe add some logic to this later
/*    {
        private _r = _x#4 - 0.1 + random 0.2;
        _x set [4, 0.5 max _r min 1.0];
    } forEach A3A_supportMarkerTypes;
*/
	if (isMultiplayer) then
	{
		[] spawn A3A_fnc_promotePlayer;
		[] call A3A_fnc_assignBossIfNone;
	};

	// Clear out plank objects that haven't been constructed and have exceeded the timeout
	call A3A_fnc_processBuildingTimeouts;

	// Decrease HQ knowledge values, old ones faster than current
	if (A3A_curHQInfoOcc < 1) then { A3A_curHQInfoOcc = 0 max (A3A_curHQInfoOcc - 0.01) };
	if (A3A_curHQInfoInv < 1) then { A3A_curHQInfoInv = 0 max (A3A_curHQInfoInv - 0.01) };
 	A3A_oldHQInfoOcc = A3A_oldHQInfoOcc select { _x set [2, _x#2 - 0.1]; _x#2 > 0 };			// arrays of [xpos, ypos, knowledge]
	A3A_oldHQInfoInv = A3A_oldHQInfoInv select { _x set [2, _x#2 - 0.1]; _x#2 > 0 };

	private _missionChance = 5 * A3A_activePlayerCount;
	if ((!bigAttackInProgress) and (random 100 < _missionChance)) then {[] spawn A3A_fnc_missionRequest};

	[] spawn A3A_fnc_reinforcementsAI;

	{
	_veh = _x;
	if ((_veh isKindOf "StaticWeapon") and ({isPlayer _x} count crew _veh == 0) and (alive _veh)) then
		{
		_veh setDamage 0;
		[_veh,1] remoteExec ["setVehicleAmmo",_veh];
		};
	} forEach vehicles;
	sleep 3;

	// 20% chance of spawning a radio tower repair mission
    if ({ !alive _x } count A3A_antennas > 0 && round random 100 < 20 && !("REP" in A3A_activeTasks)) then
	{
		private _potentials = [];
		{
			private _marker = A3A_antennaMap get netId _x;
			if (sidesX getVariable _marker == Occupants and spawner getVariable _marker == 2) then {
				_potentials pushBack [_marker, _x];
			};
		} forEach (A3A_antennas select { !alive _x });

		if (_potentials isEqualTo []) exitWith {};
		private _missionTarg = selectRandom _potentials;
		_missionTarg spawn A3A_fnc_REP_Antenna;
	}
	else
	{
		_changingX = false;
		{
		_chance = 5;
		if ((_x in resourcesX) and (sidesX getVariable [_x,sideUnknown] == Invaders)) then {_chance = 20};
		if (random 100 < _chance) then
			{
			_changingX = true;
			destroyedSites = destroyedSites - [_x];
			_nameX = [_x] call A3A_fnc_localizar;
			["TaskSucceeded", ["", format [localize "STR_A3A_fn_base_rebasset_done_1",_nameX]]] remoteExec ["BIS_fnc_showNotification",[teamPlayer,civilian]];
			sleep 2;
			};
		} forEach ((destroyedSites - citiesX) select {sidesX getVariable [_x,sideUnknown] != teamPlayer});
		if (_changingX) then {publicVariable "destroyedSites"};
	};

	sleep 4;
};
