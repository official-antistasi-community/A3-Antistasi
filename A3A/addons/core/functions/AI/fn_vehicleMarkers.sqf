private ["_veh","_text","_mrkFinal","_pos","_side","_typeX","_newPos","_road","_friendlies"];

_veh = _this select 0;
_text = _this select 1;
_convoy = false;
if ((_text == "Convoy Objective") or (_text == "Mission Vehicle") or (_text == "Supply Box")) then {_convoy = true};
_side = side (group (driver _veh));
_typeX = "_unknown";
_formatX = "";
_color = colorOccupants;
_typeX = switch (true) do {
	case (_veh isKindOf "Wheeled_APC_F"): {"_mech_inf"};
	case (_veh isKindOf "Tank"): {"_armor"};
	case (_veh isKindOf "Plane_Base_F"): {"_plane"};
	case (_veh isKindOf "UAV_02_base_F"): {"_uav"};
	case (_veh isKindOf "Helicopter"): {"_air"};
	case (_veh isKindOf "Boat_F"): {"_naval"};
	case (_veh isKindOf "Truck"): {"_motor_inf"};
	case (_veh isKindOf "Car"): {"_motor_inf"};
	default {"_motor_inf"};
};

if ((_side == teamPlayer) or (_side == sideUnknown)) then
	{
	_enemyX = false;
	_formatX = "n";
	_color = colorTeamPlayer;
	}
else
	{
	// Civilian hack to prevent errors with convoy missions. Replace once we have proper vehicle spawning functions.
	if ((_side == Occupants) or (_side == civilian)) then
		{
		_formatX = "b";
		}
	else
		{
		if (_side == Invaders) then
			{
			_formatX = "o";
			_color = colorInvaders;
			};
		};
	};

_typeX = format ["%1%2",_formatX,_typeX];

if ((side group (driver _veh) != teamPlayer) and (side driver _veh != sideUnknown)) then {["TaskSucceeded", ["", format ["%1 Spotted",_text]]] spawn BIS_fnc_showNotification};

_mrkFinal = createMarkerLocal [format ["%2%1", random 100,_text], position _veh];
_mrkFinal setMarkerShapeLocal "ICON";
_mrkFinal setMarkerTypeLocal _typeX;
_mrkFinal setMarkerColorLocal _color;
_mrkFinal setMarkerTextLocal _text;

while {(alive _veh) and !(isNull _veh) and (revealX or _convoy or (_veh getVariable ["revealed",false]))} do
	{
	_pos = getPos _veh;
	_mrkFinal setMarkerPosLocal _pos;
	sleep 60;
	};
deleteMarkerLocal _mrkFinal;
//if (alive _veh) then {_veh setVariable ["revealed",false,true]};