params ["_object"];
//diag_log ["addactionload"];
private _loadActionID = _object getVariable ["jnl_loadActionID",nil];

//Check if action exists already
if(!isnil "_loadActionID") then
{
	_object removeAction _loadActionID;
};

//We can be remote exec'd with this before JNL has initialised. If that's the case, initialise!
if (isNil "jnl_initCompleted") then {
	[] call JN_fnc_logistics_init;
};

//Check if this vehicle can be loaded with JNL
if((_object call jn_fnc_logistics_getCargoType) == -1) exitWith {};

//dont add for pvp
waitUntil { !isNull player }; //wait for player unit to be local and valid
if !((side group player) isEqualTo teamPlayer) exitWith {};

_text = "";

if (_object isKindOf "CAManBase") then {_text = format ["<img image='\A3\ui_f\data\IGUI\Cfg\Actions\arrow_up_gs.paa' /> " +localize"STR_antistasi_JN_loadVehicle"+"</t>",name _object]} else {_text = "<img image='\A3\ui_f\data\IGUI\Cfg\Actions\arrow_up_gs.paa' />  " +localize"STR_antistasi_JN_loadVehicle_cargo"+"</t>"};

_loadActionID = _object addAction [
	_text,
	{ //Action script
		private _cargo = _this select 0;
		private _player = _this select 1;
		//Search for vehicles able to load cargo of this type
		private _nearestVehicle = objNull;
		private _nearestDistance = 7;
		{
			_distance = _x distance _cargo;

			if(_distance < _nearestDistance && !(_x isEqualTo _cargo) && isnull (attachedTo _x)) then
			{
				if(_x call jn_fnc_garage_getVehicleIndex != -1 && _x call jn_fnc_garage_getVehicleIndex != 5) then
				{
					_nearestVehicle = _x;
					_nearestDistance = _distance;
				};
			};
		} forEach vehicles;

		_exit = false;
		if(isNull _nearestVehicle) then
		{
			[localize "STR_antistasi_JN_cargoLoad", localize "STR_antistasi_JN_closer"] call A3A_fnc_customHint;
			_exit = true;
		};
		if (_cargo isKindOf "CAManBase") then
			{
			if (([_cargo] call A3A_fnc_canFight) or !(isNull (_cargo getVariable ["helped",objNull])) or !(isNull attachedTo _cargo)) then
				{
				[localize "STR_antistasi_JN_cargoLoad", format [localize "STR_antistasi_JN_helped",name _cargo]] call A3A_fnc_customHint;
				_exit = true;
				};
			};
		if (_exit) exitWith {};
		private _nodeID = [_nearestVehicle, _cargo] call jn_fnc_logistics_canLoad;
		switch (_nodeID) do {
			case -4:
			{
				[localize "STR_antistasi_JN_cargoLoad", localize "STR_antistasi_JN_occupied"] call A3A_fnc_customHint;
			};
			case -3:
			{
				[localize "STR_antistasi_JN_cargoLoad", localize "STR_antistasi_JN_noCarry"] call A3A_fnc_customHint;
			};
		    case -2:
		    {
			   [localize "STR_antistasi_JN_cargoLoad", localize "STR_antistasi_JN_noSpace"] call A3A_fnc_customHint;
		    };
		    case -1:
		    {
			   [localize "STR_antistasi_JN_cargoLoad", localize "STR_antistasi_JN_noType"] call A3A_fnc_customHint;
		    };
		    default
		    {
			_player setCaptive false;			// break undercover
		   	[_nearestVehicle, _cargo, true, true] remoteexec ["jn_fnc_logistics_load", 2];
		    };
			};
	},
	nil, 1, true, false, "", "isnull attachedTo _target && vehicle player == player;", 3.5, false, ""
];

if (_object isKindOf "CAManBase") then {_text = format ["Load %1 in Vehicle",name _object]} else {_text = "Load Cargo in Vehicle"};
_object setUserActionText [
	_loadActionID,
	_text,
	"<t size='2'><img image='\A3\ui_f\data\IGUI\Cfg\Actions\arrow_up_gs.paa'/></t>"
];

_object setVariable ["jnl_loadActionID", _loadActionID, false];
