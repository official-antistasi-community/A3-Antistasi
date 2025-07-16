
{_x allowDamage false; _x  enableSimulation false;} forEach nearestObjects [[worldSize / 2, worldSize / 2], ["Land_ibr_mostd_bez_lamp", "Land_ibr_mostd_stred30"], worldSize * sqrt 2 / 2, true];

_this call A3A_fnc_initClient;
