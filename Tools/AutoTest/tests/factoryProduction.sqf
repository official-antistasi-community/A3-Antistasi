// @description: Factory production: list and level bands, build start and refusals, paused income, ticks and garage delivery, full garage queue, capture discards the build, save and load
// @timeout: 150
// @start: new
// @world: Altis
#include "\x\A3A_autotest\test.hpp"

private _listReady = WAIT_UNTIL(!isNil "A3A_factoryBuildList", 90);
ASSERT(_listReady, "production list built");
ASSERT(count A3A_factoryBuildList > 0, "production list has vehicles");
private _band1 = A3A_factoryBuildList select { _x # 1 == 1 };
private _band3 = A3A_factoryBuildList select { _x # 1 == 3 };
ASSERT(count _band1 > 0, "band 1 has vehicles");
ASSERT(count _band3 > 0, "band 3 has vehicles");
private _badTicks = A3A_factoryBuildList select { _x # 2 < 1 or {_x # 2 > 6 * A3A_factoryBuildMaxHours} };
ASSERT_EQ(count _badTicks, 0, "build times within the allowed range");

private _fact = factories select { !(_x in destroyedSites) } select 0;
private _oldSide = sidesX getVariable [_fact, sideUnknown];
private _oldMembership = membershipEnabled;
membershipEnabled = false;
private _oldCap = HR_GRG_VehCap;
private _builderGroup = createGroup teamPlayer;
private _builder = _builderGroup createUnit [typeOf petros, markerPos "Synd_HQ", [], 0, "NONE"];
if (isNil "HR_GRG_Vehicles") then { [] call HR_GRG_fnc_initServer };
private _fnc_despawned = { (spawner getVariable [_fact, 0]) == 2 };

private _despawned = WAIT_UNTIL(call _fnc_despawned, 20);
ASSERT(_despawned, "factory despawned before the side change");
[teamPlayer, _fact, true] call A3A_fnc_markerChange;
private _capFact = A3A_siteUpgradeLevelCap get "factory";
ASSERT_EQ(_capFact, 7, "factory cap at 7");

// Level 0 cannot build, level 1 builds band 1 only
private _class1 = _band1 # 0 # 0;
private _class3 = _band3 # 0 # 0;
private _refusal0 = [_fact, _class1, _builder] call A3A_fnc_factoryBuildRefusal;
ASSERT(_refusal0 != "", "level 0 factory cannot build");
[_fact, 1] call A3A_fnc_siteLevelSet;
private _refusalBand = [_fact, _class3, _builder] call A3A_fnc_factoryBuildRefusal;
ASSERT(_refusalBand != "", "band 3 vehicle refused at level 1");
private _refusalUnknown = [_fact, "notAVehicle", _builder] call A3A_fnc_factoryBuildRefusal;
ASSERT(_refusalUnknown != "", "unknown class refused");

// Income: the factory's share of the multiplier is off while it builds
private _incomeIdle = [] call A3A_fnc_siteUpgradeIncome;
private _started = [_fact, _class1, _builder] call A3A_fnc_factoryBuildStart;
ASSERT(_started, "build started");
private _build = A3A_factoryBuilds get _fact;
private _expectedTicks = _band1 # 0 # 2;
ASSERT_EQ(_build # 0, _class1, "build class recorded");
ASSERT_EQ(_build # 1, _expectedTicks, "build ticks from the list");
private _incomeBuilding = [] call A3A_fnc_siteUpgradeIncome;
private _factDrop = (_incomeIdle # 1) - (_incomeBuilding # 1);
private _expectedDrop = A3A_rebelCashFactMult * 1.1;
ASSERT(abs (_factDrop - _expectedDrop) < 0.001, "building factory adds nothing to the multiplier");
private _busy = [_fact, _class1, _builder] call A3A_fnc_factoryBuildStart;
ASSERT(!_busy, "second build refused while one runs");

// Ticks count down, the finished vehicle goes to the garage
_build set [1, 2];
private _stored = 0;
{ _stored = _stored + count _x } forEach HR_GRG_Vehicles;
private _delivered1 = [] call A3A_fnc_factoryBuildTick;
ASSERT_EQ(_delivered1, [], "nothing delivered before the end");
private _left = (A3A_factoryBuilds get _fact) # 1;
ASSERT_EQ(_left, 1, "one tick left");
private _delivered2 = [] call A3A_fnc_factoryBuildTick;
ASSERT_EQ(_delivered2, [_class1], "vehicle delivered when the build ends");
ASSERT(!(_fact in A3A_factoryBuilds), "build removed when finished");
private _storedAfter = 0;
{ _storedAfter = _storedAfter + count _x } forEach HR_GRG_Vehicles;
ASSERT_EQ(_storedAfter, _stored + 1, "garage holds one more vehicle");

// Full garage: the vehicle waits in the queue until a slot is free
HR_GRG_VehCap = { 0 };
[_fact, _class1, _builder] call A3A_fnc_factoryBuildStart;
(A3A_factoryBuilds get _fact) set [1, 1];
private _deliveredFull = [] call A3A_fnc_factoryBuildTick;
ASSERT_EQ(_deliveredFull, [], "nothing delivered into a full garage");
ASSERT_EQ(A3A_factoryDeliveryQueue, [_class1], "finished vehicle waits in the queue");
HR_GRG_VehCap = _oldCap;
private _deliveredLater = [] call A3A_fnc_factoryBuildTick;
ASSERT_EQ(_deliveredLater, [_class1], "queued vehicle delivered once there is room");
ASSERT_EQ(A3A_factoryDeliveryQueue, [], "queue empty");

// Save and load keep the ticks left and the queue
[_fact, _class1, _builder] call A3A_fnc_factoryBuildStart;
(A3A_factoryBuilds get _fact) set [1, 5];
A3A_factoryDeliveryQueue = [_class1];
private _saved = ([] call A3A_fnc_siteUpgradeSaveData) # 2;
A3A_factoryBuilds = createHashMap;
A3A_factoryDeliveryQueue = [];
["factoryBuilds", _saved] call A3A_fnc_loadStat;
private _loaded = A3A_factoryBuilds getOrDefault [_fact, []];
private _loadedTicks = _loaded param [1, -1];
ASSERT_EQ(_loadedTicks, 5, "ticks left loaded");
ASSERT_EQ(A3A_factoryDeliveryQueue, [_class1], "queue loaded");
A3A_factoryDeliveryQueue = [];

// Capture discards the running build
private _despawned2 = WAIT_UNTIL(call _fnc_despawned, 20);
ASSERT(_despawned2, "factory despawned before the capture");
[Occupants, _fact, true] call A3A_fnc_markerChange;
ASSERT(!(_fact in A3A_factoryBuilds), "capture discards the build");

// A saved build at a factory the rebels do not hold is dropped on load
["factoryBuilds", _saved] call A3A_fnc_loadStat;
ASSERT(!(_fact in A3A_factoryBuilds), "build at an enemy-held factory not loaded");

// Restore
A3A_factoryBuilds = createHashMap;
publicVariable "A3A_factoryBuilds";
A3A_factoryDeliveryQueue = [];
A3A_siteLevels = createHashMap;
publicVariable "A3A_siteLevels";
if (sidesX getVariable _fact != _oldSide) then { [_oldSide, _fact, true] call A3A_fnc_markerChange };
deleteVehicle _builder;
deleteGroup _builderGroup;
membershipEnabled = _oldMembership;
