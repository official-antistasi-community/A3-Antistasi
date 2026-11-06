// @description: Site upgrade bonuses of levels 3 to 7: HR pool and cap, Fortified compound garrison and free rebuild, Company town, Smugglers
// @timeout: 120
// @start: new
// @world: Altis
#include "\x\A3A_autotest\test.hpp"

// A resource with a town close enough for Company town, a second resource, and a seaport
private _resTown = "";
private _town = "";
{
    private _resPos = markerPos _x;
    private _near = citiesX select { !(_x in destroyedSites) and {markerPos _x distance2D _resPos < 1500} };
    if (_near isNotEqualTo [] and {!(_x in destroyedSites)}) exitWith {
        _resTown = _x;
        _town = [_near, _resPos] call BIS_fnc_nearestPosition;
    };
} forEach resourcesX;
ASSERT(_resTown != "", "a resource with a town within 1.5 km exists");
private _res2 = resourcesX select { _x != _resTown and {!(_x in destroyedSites)} } select 0;
private _sea = seaports select { !(_x in destroyedSites) } select 0;
private _sites = [_resTown, _res2, _sea];
private _oldSides = _sites apply { sidesX getVariable [_x, sideUnknown] };
private _oldTownSide = sidesX getVariable [_town, sideUnknown];
private _oldTownData = +(A3A_cityData getVariable _town);
private _oldDestroyed = +destroyedSites;
private _oldFunds = server getVariable ["resourcesFIA", 0];
server setVariable ["resourcesFIA", 1000000, true];

private _fnc_despawned = { (spawner getVariable [_this, 0]) == 2 };
{
    private _despawned = WAIT_UNTIL(_x call _fnc_despawned, 20);
    ASSERT(_despawned, "site despawned before the side change");
    [teamPlayer, _x, true] call A3A_fnc_markerChange;
} forEach _sites;
sleep 3;
private _settled = WAIT_UNTIL(!resourcesIsChanging, 10);
ASSERT(_settled, "faction money settled");

// Release cap: resources and seaports to 7, factories at least 2
private _capRes = A3A_siteUpgradeLevelCap get "resource";
private _capSea = A3A_siteUpgradeLevelCap get "seaport";
private _capFact = A3A_siteUpgradeLevelCap get "factory";
ASSERT_EQ(_capRes, 7, "resource cap");
ASSERT_EQ(_capSea, 7, "seaport cap");
ASSERT(_capFact >= 2, "factory cap");
[_res2, 2] call A3A_fnc_siteLevelSet;
private _refusal3 = [_res2, 3] call A3A_fnc_siteUpgradeRefusal;
ASSERT_EQ(_refusal3, "", "resource level 3 on sale");

// HR: Local workers share the pool over all resources, Foreign volunteers add per seaport
private _pool = A3A_siteUpgradeResHRPool / count resourcesX;
private _hr0 = ([] call A3A_fnc_siteUpgradeIncome) # 3;
ASSERT_EQ(_hr0, 0, "no HR below level 3");
[_resTown, 3] call A3A_fnc_siteLevelSet;
private _hr1 = ([] call A3A_fnc_siteUpgradeIncome) # 3;
ASSERT(abs (_hr1 - _pool) < 0.001, "one level 3 resource gives its share of the pool");
[_res2, 5] call A3A_fnc_siteLevelSet;
[_sea, 5] call A3A_fnc_siteLevelSet;
private _hr2 = ([] call A3A_fnc_siteUpgradeIncome) # 3;
private _expectedHR2 = 2 * _pool + A3A_siteUpgradeSeaHR;
ASSERT(abs (_hr2 - _expectedHR2) < 0.001, "two resources and a level 5 seaport");
private _oldCap = A3A_siteUpgradeHRCap;
A3A_siteUpgradeHRCap = 0.25;
private _hrCapped = ([] call A3A_fnc_siteUpgradeIncome) # 3;
A3A_siteUpgradeHRCap = _oldCap;
ASSERT_EQ(_hrCapped, 0.25, "HR capped");
// An enemy-held level 5 seaport gives nothing
[Occupants, _sea, true] call A3A_fnc_markerChange;
private _hrNoSea = ([] call A3A_fnc_siteUpgradeIncome) # 3;
ASSERT(abs (_hrNoSea - 2 * _pool) < 0.001, "enemy-held seaport gives no volunteers");
private _seaStored = [_sea, false] call A3A_fnc_siteLevel;
ASSERT_EQ(_seaStored, 4, "captured seaport dropped one level");
[teamPlayer, _sea, true] call A3A_fnc_markerChange;
[_sea, 3] call A3A_fnc_siteLevelSet;

// Fortified compound: +50% of the base on top of the level bonus, resources only
if (A3A_rebelGarrisonLimit != -1) then {
    private _limit5 = [_res2] call A3A_fnc_getGarrisonLimit;
    private _expected5 = round (A3A_rebelGarrisonLimit * 0.5 * (1 + 0.2 * 5 + 0.5));
    ASSERT_EQ(_limit5, _expected5, "level 5 resource garrison limit");
    private _limit3 = [_resTown] call A3A_fnc_getGarrisonLimit;
    private _expected3 = round (A3A_rebelGarrisonLimit * 0.5 * (1 + 0.2 * 3));
    ASSERT_EQ(_limit3, _expected3, "level 3 resource has no Fortified bonus");
};

// Fortified compound: the destroyed level 5 resource is rebuilt for free, a level 3 one costs 5000
destroyedSites pushBackUnique _res2;
destroyedSites pushBackUnique _resTown;
publicVariable "destroyedSites";
private _fundsBefore = server getVariable "resourcesFIA";
[_res2] call A3A_fnc_rebuildAssets;
ASSERT(!(_res2 in destroyedSites), "level 5 resource rebuilt");
sleep 2;
private _rebuildSettled = WAIT_UNTIL(!resourcesIsChanging, 10);
ASSERT(_rebuildSettled, "money settled after the free rebuild");
private _fundsFree = server getVariable "resourcesFIA";
ASSERT_EQ(_fundsFree, _fundsBefore, "free rebuild charged nothing");
[_resTown] call A3A_fnc_rebuildAssets;
ASSERT(!(_resTown in destroyedSites), "level 3 resource rebuilt");
private _charged = WAIT_UNTIL((server getVariable "resourcesFIA") == _fundsBefore - 5000, 10);
ASSERT(_charged, "paid rebuild charged 5000");

// Company town: +1 support for the nearest rebel town, civilian death losses halved
sidesX setVariable [_town, teamPlayer, true];
private _fnc_support60 = { private _data = +_oldTownData; _data set [1, 60]; A3A_cityData setVariable [_town, _data] };
call _fnc_support60;
[_resTown, 7] call A3A_fnc_siteLevelSet;
private _rebelTowns = citiesX select { sidesX getVariable [_x, sideUnknown] == teamPlayer and {!(_x in destroyedSites)} and {markerPos _x distance2D markerPos _resTown <= A3A_siteUpgradeCompanyTownRange} };
private _expectedTown = [_rebelTowns, markerPos _resTown] call BIS_fnc_nearestPosition;
[] call A3A_fnc_siteUpgradeTickBonuses;
ASSERT(_expectedTown in A3A_siteCompanyTowns, "nearest rebel town is a Company town");
private _uniqueTowns = A3A_siteCompanyTowns arrayIntersect A3A_siteCompanyTowns;
ASSERT_EQ(count _uniqueTowns, count A3A_siteCompanyTowns, "each town counted once");
if (_expectedTown == _town) then {
    private _support = (A3A_cityData getVariable _town) # 1;
    ASSERT(_support > 60 and {_support <= 63}, "Company town added support once");
    call _fnc_support60;
    [-1, _town, false, true] call A3A_fnc_citySupportChange;
    private _afterDeath = (A3A_cityData getVariable _town) # 1;
    private _expectedDeath = 60 - A3A_townUpgradeClinicDeathMult;
    ASSERT(abs (_afterDeath - _expectedDeath) < 0.001, "civilian death loss halved");
} else {
    INFO("another rebel town is nearer than the chosen one, support checks skipped");
};
[_resTown, 6] call A3A_fnc_siteLevelSet;
[] call A3A_fnc_siteUpgradeTickBonuses;
ASSERT(!(_town in A3A_siteCompanyTowns), "no Company town below level 7");

// Smugglers: a level 3 seaport adds a batch of enemy magazines
private _smuggled = [true] call A3A_fnc_siteUpgradeTickBonuses;
ASSERT(count A3A_siteSmugglerPool > 0, "enemy magazine pool found");
ASSERT_EQ(_smuggled, A3A_siteUpgradeSmugglerMags, "one batch for one level 3 seaport");
[_sea, 2] call A3A_fnc_siteLevelSet;
private _noSmuggling = [true] call A3A_fnc_siteUpgradeTickBonuses;
ASSERT_EQ(_noSmuggling, 0, "no Smugglers below level 3");
private _report = [10, 1000, 0, 0, 0, false, "", 5] call A3A_fnc_incomeReportText;
private _smugglerLine = format [localize "STR_A3A_fn_siteUpgrades_smugglers", 5];
ASSERT(_smugglerLine in _report, "income report has the Smugglers line");

// Restore
A3A_siteLevels = createHashMap;
publicVariable "A3A_siteLevels";
A3A_siteCompanyTowns = [];
A3A_cityData setVariable [_town, _oldTownData];
sidesX setVariable [_town, _oldTownSide, true];
{
    if (sidesX getVariable _x != (_oldSides # _forEachIndex)) then { [_oldSides # _forEachIndex, _x, true] call A3A_fnc_markerChange };
} forEach _sites;
destroyedSites = _oldDestroyed;
publicVariable "destroyedSites";
sleep 3;
server setVariable ["resourcesFIA", _oldFunds, true];
