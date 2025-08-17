params ["_roleName"];

/*
Okay, think think think....
Infinite riflemen for sure. -1 return for that.
All other roles can feasibly have the same cap, right? Medic/Engi are the chokepoints anyways
OK, numbers time. We're not involving command here
Current behavior: 6 roles @ 38 players. Probably reasonable for balance.
Can probably just linearly scale it...but what's the minimum?
Desmos time!
Fuck, how do you do "slope through a point"
Other point is 2 players, where roles start to become important. Two options:
2 @ 2, 3 @ 11, 4 @ 20, 5 @ 29, 6 @ 38
3 @ 2, 4 @ 14, 5 @ 26, 6 @ 38
Command is alo a medic...
Ah, got a miscalculation. 38 shouldnt be the final point, it should be 39 that's one role higher. So we're looking for 7 @ 39.
2 @ 3, 3 @ 10, 4 @ 17, 5 @ 24, 6 @ 31, 7 @ 39
Even 2-3 medics in a squad is pretty slim for low-pop. Increase minimum.
3 @ 3, 4 @ 12, 5 @ 21, 6 @ 30, 7 @ 39
Honestly probably good enough.
Could hardcode the numbers...no need to.
Oh yeah, make sure to floor this
*/

if (_roleName == in ["rifleman", "commander"]) exitWith { -1 };

_playerCount = count (allPlayers - (entities "HeadlessClient_F"));
floor (((_playerCount - 3) / 9) + 3); // 3-11 players = 3, 12-20 = 4, 21-29 = 5, 30-38 = 6, 39+ = 7