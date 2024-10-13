
_typeGroup = (_faction get "groupPolice");
Verbose_2("Side: %1 spawning group composition: %2", _sideX, _typeGroup);
_groupX = [_positionX, _sideX, _typeGroup, true] call A3A_fnc_spawnGroup;
_groups pushBack _groupX;
_typeGroup = (_faction get "groupPolice");
_groupX = [_positionX, _sideX, _typeGroup, true] call A3A_fnc_spawnGroup;
_groups pushBack _groupX;
{[_x, "Patrol_Defend", 0, 50*(1+_forEachIndex*2), -1, true, _positionX, false] call A3A_fnc_patrolLoop;} forEach _groups;