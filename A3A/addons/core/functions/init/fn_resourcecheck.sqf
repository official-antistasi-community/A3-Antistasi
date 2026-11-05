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
	private _upgradeRes = 0;		// extra income from town upgrades, for the report
	private _upgradeHR = 0;

	//private _suppBoost = 0.5 * (1+ ({sidesX getVariable [_x,sideUnknown] == teamPlayer} count seaports));
	{
		private _city = _x;
		if (_city in destroyedSites) then { continue };

		private _cityData = A3A_cityData getVariable _city;
		_cityData params ["_numCiv", "_supportReb"];

		private _ownerMul = [0.5, 1] select (sidesX getVariable _city == teamPlayer);
		private _resAddCity = _ownerMul * sqrt _numCiv * (_supportReb / 100) * A3A_rebelCashPopMult;
		private _hrAddCity = _ownerMul * sqrt _numCiv * (_supportReb / 100) * A3A_rebelHRTickMult;

		// Town upgrades, only present while the town is rebel-held
		private _upgrades = A3A_cityInvest getOrDefault [_city, createHashMap];
		if ("office" in _upgrades) then {
			(A3A_townUpgradeHM get "office") params ["", "", "", "", "_moneyMult", "_hrMult"];
			private _bonusRes = _resAddCity * (_moneyMult - 1);
			_resAddCity = _resAddCity + _bonusRes;
			_upgradeRes = _upgradeRes + _bonusRes;
			private _bonusHR = _hrAddCity * (_hrMult - 1);
			_hrAddCity = _hrAddCity + _bonusHR;
			_upgradeHR = _upgradeHR + _bonusHR;
		};
		if ("clinic" in _upgrades) then {
			[(A3A_townUpgradeHM get "clinic") # 4, _city, false] remoteExecCall ["A3A_fnc_citySupportChange", 2];
		};

		_resAdd = _resAdd + _resAddCity;
		_hrAdd = _hrAdd + _hrAddCity;

	} forEach citiesX;

	[] call A3A_fnc_tierCheck;
	[] spawn A3A_fnc_checkCampaignEnd; // check for population win

	// Resources add money, factories and seaports the multiplier. Each site upgrade level adds 10% of the site's part
	([] call A3A_fnc_siteUpgradeIncome) params ["_siteRes", "_siteFact", "_siteSea", "_siteHR", "_baseRes", "_baseFact", "_baseSea"];
	private _resBoost = 1 + _siteFact + _siteSea;
	// What the site levels added, after the multiplier, goes into the report's upgrade line
	_upgradeRes = _upgradeRes + (_resAdd + _siteRes) * _resBoost - (_resAdd + _baseRes) * (1 + _baseFact + _baseSea);
	_resAdd = (_resAdd + _siteRes) * _resBoost;
	_hrAdd = _hrAdd + _siteHR;
	_upgradeHR = _upgradeHR + _siteHR;

	Debug_2("Occupant radio keys: %1 - Invader radio keys: %2", occRadioKeys, invRadioKeys);

	server setVariable ["hr", _hrAdd + (server getVariable "hr"), true];
	server setVariable ["resourcesFIA", ceil _resAdd + (server getVariable "resourcesFIA"), true];

	private _newBombRuns = bombRuns + 0.1 * ({sidesX getVariable [_x,sideUnknown] == teamPlayer} count airportsX);
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
	// Reward tax already went into the faction fund as missions completed, report the total since the last tick
	private _taxCollected = missionNamespace getVariable ["A3A_rewardTaxCollected", 0];
	private _showTax = (missionNamespace getVariable ["A3A_rewardTaxPercent", 0]) > 0;
	A3A_rewardTaxCollected = 0;
	private _textArsenal = [] call A3A_fnc_arsenalManage;
	private _textX = [_hrAdd, _resAdd, _upgradeRes, _upgradeHR, _taxCollected, _showTax, _textArsenal] call A3A_fnc_incomeReportText;
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

	// Decrease HQ knowledge values, old ones faster than current
	if (A3A_curHQInfoOcc < 1) then { A3A_curHQInfoOcc = 0 max (A3A_curHQInfoOcc - 0.01) };
	if (A3A_curHQInfoInv < 1) then { A3A_curHQInfoInv = 0 max (A3A_curHQInfoInv - 0.01) };
 	A3A_oldHQInfoOcc = A3A_oldHQInfoOcc select { _x set [2, _x#2 - 0.1]; _x#2 > 0 };			// arrays of [xpos, ypos, knowledge]
	A3A_oldHQInfoInv = A3A_oldHQInfoInv select { _x set [2, _x#2 - 0.1]; _x#2 > 0 };

	// Enemies forget about vehicle threat eventually 
	{
		private _killThreat = _x getVariable "A3A_killThreat";
		if (_killThreat < 20) then { _x setVariable ["A3A_killThreat", nil]; continue };
		_x setVariable ["A3A_killThreat", _killThreat - 20];
	} forEach (vehicles select {!(_x isNil "A3A_killThreat")});

	[] spawn A3A_fnc_reinforcementsAI;

/*	{
	_veh = _x;
	if ((_veh isKindOf "StaticWeapon") and ({isPlayer _x} count crew _veh == 0) and (alive _veh)) then
		{
		_veh setDamage 0;
		[_veh,1] remoteExec ["setVehicleAmmo",_veh];
		};
	} forEach vehicles;
*/
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
