params [["_restTime",8,[0]]];
cutText [localize "STR_A3A_fn_base_resourcecheckSkipTime_begin","BLACK",5];
sleep 10;
skiptime _restTime;
forceWeatherChange;
cutText [localize "STR_A3A_fn_base_resourcecheckSkipTime_end","BLACK IN",10];
