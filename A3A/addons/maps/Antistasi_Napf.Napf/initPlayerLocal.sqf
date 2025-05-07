{_x allowDamage false; _x  enableSimulation false;} forEach nearestObjects [[worldSize / 2, worldSize / 2], ["nav_pier_c_t20","nav_pier_c_t10","nav_pier_c_t15","nav_pier_c_r30","nav_pier_c_r10","nav_pier_c_r""nav_pier_c_l30","nav_pier_c_l10","nav_pier_c_l","nav_pier_c_big","nav_pier_c_90","nav_pier_c_270","nav_pier_c2_end","nav_pier_c2","nav_pier_c"], worldSize * sqrt 2 / 2, true];

_this call A3A_fnc_initClient;
