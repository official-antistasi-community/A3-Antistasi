private ["_display","_childControl","_costs","_costHR","_unitsX","_formatX"];
if (!([player] call A3A_fnc_hasRadio)) exitWith {if !(A3A_hasIFA) then {[localize "STR_antistasi_customHint_squad_recruit", localize "STR_antistasi_customHint_minefields_noradio"] call A3A_fnc_customHint;} else {["Squad Recruit", "You need a Radio Man in your group to be able to give orders to other squads"] call A3A_fnc_customHint;}};
_nul = createDialog "squad_recruit";

sleep 1;
disableSerialization;

_display = findDisplay 100;

if (str (_display) != "no display") then
{
	_ChildControl = _display displayCtrl 104;
	_costs = 0;
	_costHR = 0;
	//_formatX = (cfgSDKInf >> (groupsSDKSquad select 0));
	//_unitsX = [_formatX] call groupComposition;
	//{_costs = _costs + (server getVariable (_x select 0)); _costHR = _costHR +1} forEach groupsSDKSquad;
	//_ChildControl  ctrlSetTooltip format ["Cost: %1 €. HR: %2",_costs,_costHR];

	_ChildControl = _display displayCtrl 105;
	_costs = 0;
	_costHR = 0;
	//_formatX = (cfgSDKInf >> (groupsSDKmid select 0));
	//_unitsX = [_formatX] call groupComposition;
	{_costs = _costs + (server getVariable (_x select 0)); _costHR = _costHR +1} forEach groupsSDKmid;
	_ChildControl  ctrlSetTooltip format [localize "STR_antistasi_tooltip_cost_HR",_costs,_costHR];

	_ChildControl = _display displayCtrl 106;
	_costs = 0;
	_costHR = 0;
	//_formatX = (cfgSDKInf >> (groupsSDKAT select 0));
	//_unitsX = [_formatX] call groupComposition;
	{_costs = _costs + (server getVariable (_x select 0)); _costHR = _costHR +1} forEach groupsSDKAT;
	_ChildControl  ctrlSetTooltip format [localize "STR_antistasi_tooltip_cost_HR",_costs,_costHR];

	_ChildControl = _display displayCtrl 107;
	_costs = 0;
	_costHR = 0;
	//_unitsX = [SDKSL,SDKSL];
	{_costs = _costs + (server getVariable (_x select 0)); _costHR = _costHR +1} forEach groupsSDKSniper;
	_ChildControl  ctrlSetTooltip format [localize "STR_antistasi_tooltip_cost_HR",_costs,_costHR];

	_ChildControl = _display displayCtrl 108;
	_costs = (2*(server getVariable staticCrewTeamPlayer));
	_costHR = 2;
	//_unitsX = [SDKGL,SDKRifleman];
	_costs = _costs + ([SDKMGStatic] call A3A_fnc_vehiclePrice);
	_ChildControl  ctrlSetTooltip format [localize "STR_antistasi_tooltip_cost_HR",_costs,_costHR];


	_ChildControl = _display displayCtrl 109;
	_costs = (2*(server getVariable staticCrewTeamPlayer));
	_costHR = 2;
	_costs = _costs + ([vehSDKAT] call A3A_fnc_vehiclePrice);
	_ChildControl  ctrlSetTooltip format [localize "STR_antistasi_tooltip_cost_HR",_costs,_costHR];

	_ChildControl = _display displayCtrl 110;
	_costs = (2*(server getVariable staticCrewTeamPlayer));
	_costHR = 2;
	_costs = _costs + ([vehSDKTruck] call A3A_fnc_vehiclePrice) + ([staticAAteamPlayer] call A3A_fnc_vehiclePrice);
	_ChildControl  ctrlSetTooltip format [localize "STR_antistasi_tooltip_cost_HR",_costs,_costHR];

	_ChildControl = _display displayCtrl 111;
	_costs = (2*(server getVariable staticCrewTeamPlayer));
	_costHR = 2;
	_costs = _costs + ([SDKMortar] call A3A_fnc_vehiclePrice);
	_ChildControl  ctrlSetTooltip format [localize "STR_antistasi_tooltip_cost_HR",_costs,_costHR];
};
