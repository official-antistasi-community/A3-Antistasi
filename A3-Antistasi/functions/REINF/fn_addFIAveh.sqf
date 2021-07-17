
if (!(isNil "placingVehicle") && {placingVehicle}) exitWith {[localize "STR_antistasi_customHint_veh", localize "STR_antistasi_customHint_veh_placing"] call A3A_fnc_customHint;};
if (player != player getVariable ["owner",player]) exitWith {[localize "STR_antistasi_customHint_veh", localize "STR_antistasi_customHint_veh_ctrlAI"] call A3A_fnc_customHint;};
if ([player,300] call A3A_fnc_enemyNearCheck) exitWith {[localize "STR_antistasi_customHint_veh", localize "STR_antistasi_customHint_veh_enemy"] call A3A_fnc_customHint;};


private _typeVehX = _this select 0;
if (_typeVehX == "not_supported") exitWith {[localize "STR_antistasi_customHint_veh", localize "STR_antistasi_customHint_veh_modset"] call A3A_fnc_customHint;};

vehiclePurchase_cost = [_typeVehX] call A3A_fnc_vehiclePrice;

private _resourcesFIA = 0;
if (!isMultiPlayer) then {_resourcesFIA = server getVariable "resourcesFIA"} else
	{
	if (player != theBoss) then
		{
		_resourcesFIA = player getVariable "moneyX";
		}
	else
		{
		_resourcesFIA = server getVariable "resourcesFIA";
		//if ((_typeVehX == SDKMortar) or (_typeVehX == staticATteamPlayer) or (_typeVehX == staticAAteamPlayer) or (_typeVehX == SDKMGStatic)) then {_resourcesFIA = server getVariable "resourcesFIA"} else {_resourcesFIA = player getVariable "moneyX"};
		};
	};

if (_resourcesFIA < vehiclePurchase_cost) exitWith {[localize "STR_antistasi_customHint_veh", format [localize "STR_antistasi_customHint_veh_noMoney",vehiclePurchase_cost]] call A3A_fnc_customHint;};
vehiclePurchase_nearestMarker = [markersX select {sidesX getVariable [_x,sideUnknown] == teamPlayer},player] call BIS_fnc_nearestPosition;
if !(player inArea vehiclePurchase_nearestMarker) exitWith {[localize "STR_antistasi_customHint_veh", localize "STR_antistasi_customHint_veh_noFlag"] call A3A_fnc_customHint;};

private _extraMessage =	format ["Buying vehicle for $%1", vehiclePurchase_cost];

[_typeVehX, [], [], nil, false, "BUYFIA"] call HR_GRG_fnc_confirmPlacement;
