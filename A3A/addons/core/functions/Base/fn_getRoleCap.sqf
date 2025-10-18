params ["_roleName"];

/*
Ah, got a miscalculation. 38 shouldnt be the final point, it should be 39 that's one role higher. So we're looking for 7 @ 39.
2 @ 3, 3 @ 10, 4 @ 17, 5 @ 24, 6 @ 31, 7 @ 39
Even 2-3 medics in a squad is pretty slim for low-pop. Increase minimum.
3 @ 3, 4 @ 12, 5 @ 21, 6 @ 30, 7 @ 39
*/

if (_roleName in ["rifleman", "commander"]) exitWith { -1 };

private _playerCount = count (allPlayers - (entities "HeadlessClient_F"));
floor (((_playerCount - 3) / 9) + 3); // 3-11 players = 3, 12-20 = 4, 21-29 = 5, 30-38 = 6, 39+ = 7