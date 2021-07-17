ts1 = 0;
ts2 = 0;
[] spawn {
	while{true}do{
		ts1= ts1 +1;
	};
};

ts2 = 2;




_veh = _this select 0;
_vehType = typeof cursorObject;
_cfg = (configfile >> "CfgVehicles" >> _vehType >> "HitPoints");
_type = "";

if(count _cfg == 0)then{
	_type =  "static";
	_array = [["HULL",0]];
}else{

	if( isClass (_cfg >> "HitLBWheel"))then{
		_type =  "car";
		_array = [["HULL",0],["ENG",0],["FUEL",0],["WHS",0]];
	}else{
		if( isClass (_cfg >> "HitHRotor"))then{
			_array = [["HULL",0],["ENG",0],["INST",0],["ATRQ",0],["MROT",0]];
		}else{
			if( isClass (_cfg >> "HitLAileron"))then{
				_type =  "plane";
				_array = [["HULL",0],["ENG",0],["FUEL",0],["CTRL",0],["INST",0],["GEAR",0]];
			}else{

				if( isClass (_cfg >> "HitRTrack"))then{
					_type =  "tank";
					_array = [["HULL",0],["ENG",0],["GUN",0],["L-TR",0],["R-TR",0],["TRRT",0]];
				}else{
					_type =  "ship";
					_array = [["ENG",0]];
				};
			};
		};
	};
};





this addAction [
	localize "str_act_gameOptions", {
		[localize "STR_disp_options_game_options", format ["Arma 3 - Antistasi<br/><br/>Version: %1",antistasiVersion]] call A3A_fnc_customHint;
		nul=CreateDialog "game_options_commander";
	},nil,0,false,true,"","(isPlayer _this) and (_this == Slowhand) and (_this == _this getVariable ['owner',objNull])"
];

this addAction [
	localize "str_act_gameOptions", {
		[localize "STR_disp_options_game_options", format ["Arma 3 - Antistasi<br/><br/>Version: %1",antistasiVersion]] call A3A_fnc_customHint;
		nul=CreateDialog "game_options_player";
	},nil,0,false,true,"","(isPlayer _this) and !(_this == Slowhand) and (_this == _this getVariable ['owner',objNull])"
];
this addAction [localize "str_act_mapInfo", {nul = [] execVM "cityinfo.sqf";},nil,0,false,true,"","(isPlayer _this) and (_this == _this getVariable ['owner',objNull])"];
this addAction [localize "str_act_tfar", {nul=CreateDialog "tfar_menu";},nil,0,false,true,"","(isClass (configFile >> ""CfgPatches"" >> ""task_force_radio""))", 5];
this addAction [localize "str_act_moveAsset", "moveObject.sqf",nil,0,false,true,"","(_this == Slowhand)", 5];


[] spawn {
	_car = vehicle player;
	_dir = direction _car;
	_pos = {position _car};
	sleep 0.1;
	_nr = 0;
	_testList = [];
	_p1 = objNull;
	_q = "M_Titan_AT"  createVehicle (position _car vectoradd [(vectordir _car select 0) * 4,(vectordir _car select 1) * 4, 20]);
	_test = objNull;

	[_q,_testList] spawn {
		_q = _this select 0;
		_testList = _this select 1;
		while {! (isNull _q)}do{

			{
				_s = velocity _x vectorMultiply -0.9;
				_s = _s vectoradd [0,0,100];
				_x addforce [_s,[0,0,0]];
			} forEach _testList;
			_q setVelocity (velocity _q vectorMultiply (100/(speed _q+1)));
			sleep 0.1;
		};

		{
			_t = "SatchelCharge_Remote_Ammo" createVehicle position _x;
			_t setDamage 1;
			deleteVehicle _x;
		} forEach _testList;
	};

	while {_nr <= 11}do{
		_nr = _nr + 1;
		_p2 = "B_UAV_01_F" createVehicle (position _car vectoradd [(vectordir _car select 0) * 4,(vectordir _car select 1) * 4,_nr/3]);
		_p2 allowDamage false;
		if(isNull _test)then{

			_test = _p2;

			_test attachTo [_q ,[0,-0.5,0]];



		}else{
			ropeCreate [_p1, [0,0,0], _p2, [0,0,0], 20];
			sleep 0.7;
		};

		_y = _dir;_p = 0; _r = 0;
		switch _nr do
		{
			case 1: {;_p = 90;};
			case 2: {;_p = 80;};
			case 3: {;_p = 70;};
			case 4: {;_p = 60;};
			case 5: {;_p = 50;};
			case 6: {;_p = 45;};
			case 7: {;_p = 45;};
			case 8: {;_p = 20;};
			case 9: {;_p = 10;};
			case 10: {;_p = 0;};
			case 11: {;_p = -10;};
			default {_y = _dir;_p = -45;};
		};
		_q setVectorDirAndUp [
			[ sin _y * cos _p,cos _y * cos _p,sin _p],
			[ [ sin _r,-sin _p,cos _r * cos _p],-_y] call BIS_fnc_rotateVector2D
		];

		_p1 = _p2;
		_testList pushBack _p2;

	};

};


//SHOOT PLANES
vehicle player removeAllEventHandlers "Fired";

vehicle player addEventHandler ["Fired", {
	_this select 6 spawn{
		sleep 0.01;
		_p = "I_C_Plane_Civil_01_F" createVehicle [0,0,0];
		_p setPosWorld (getPosWorld _this);
		_p setVectorDirAndUp [vectorDir _this, vectorup _this];
		_p setVelocity (velocity _this);
		[_p] spawn{
			sleep 10;
			deleteVehicle (_this select 0);
		};
	};

}]


player allowDamage false;
vehicle player removeAllEventHandlers "Fired";
vehicle player addEventHandler ["Fired", {
	_this select 6 spawn{
		_p = player;
		_p setPosWorld (getPosWorld _this);
		_p setVectorDirAndUp [vectorDir _this, vectorup _this];
		_p setVelocity (velocity _this);
	};

}]



//max rotation on turret
[] spawn {
	while{vehicle player != player}do{
		sleep 0.1;
		_turret = vehicle player;
		_rot = _turret animationSourcePhase "MainGun";
		diag_log ["MainGun", _rot];
		if(_rot > 0.3)then{
			_turret animateSource ["MainGun",0.3,1];
		};
		if(_rot < -0.3)then{
			_turret animateSource ["MainGun",-0.3,1];
		};
	};
};

//hold onto car
removeAllActions player;
player addAction ["Hold On", {
	private _nearestVehicle = objNull;
	private _nearestDistance = 3;
	{
		_distance = _x distance player;
		diag_log  ["dis",_distance];
		if(_distance < _nearestDistance && !(_x isEqualTo player)) then
		{
			diag_log  ["type",typeof _x];
			if(_x call jn_fnc_garage_getVehicleIndex != -1 && _x call jn_fnc_garage_getVehicleIndex != 5) then
			{
				_nearestVehicle = _x;
				_nearestDistance = _distance;
			};
		};
	} forEach vehicles;

	if(!isnil "_nearestVehicle")then{
		player attachto [_nearestVehicle];
		_index = (findDisplay 46) displayAddEventHandler ["KeyDown", "
			[localize 'STR_disp_options_game_options', str (_this select 1)] call A3A_fnc_customHint;
			if((_this select 1) in [17,30,31,32,57])then{
				detach player;
				_index = missionnamespace getVariable 'jn_hold';
				(findDisplay 46) displayRemoveEventHandler ['KeyDown',_index];
			};
		"];
		missionnamespace setVariable ["jn_hold",_index];
	};

}];

//

_base = cursorObject;
_array2 =[getText (configfile >> "CfgVehicles" >> typeOf _base >> "model")];
_array1 = [];
_locBase = getPosWorld  _base;
{
 _type = typeOf _x;
 _offset = (getPosWorld  _x);
 _dir = vectorDir _x;
 _up = vectorUp _x;
 _tex = getObjectTextures _x;
 _array1 pushBack [1, _offset, []];
}foreach (attachedObjects _base);
_array2 pushBack _array1;
copyToClipboard str _array2;

//fus ro da
jn_fnc_forceRagdoll = {
	params ["_target","_player"];
	if!(local _target)exitWith{};

	private _dis = _target distance _player;
	diag_log _dis;
	if(_dis > 2)exitWith{};

	private _loc = (getpos _target) vectordiff (getpos _player);
	_loc = vectorNormalized _loc;
	private _vel = _loc vectorMultiply (50/_dis);
	_vel set [2,20];


	_target allowDamage false;

	private _rag = "Land_Can_V3_F" createVehicleLocal [0,0,0];
    _rag setMass 1e10;
    _rag attachTo [_target, [0,0,0], "Spine3"];
    _rag setVelocity _vel;

    detach _rag;
    [_rag,_target] spawn {
    	params ["_rag","_target"];
        deleteVehicle _rag;
        sleep 4;
        _target allowDamage true;
    };
};

player addAction [
	"Hit Shit",
	{
		if (vehicle player != player) exitWith {};
	    private "_rag";
	    _rag = "Land_Can_V3_F" createVehicleLocal [0,0,0];
	    _rag setMass 1e10;
	    _rag attachTo [player, [0,0,0], "Spine3"];
	    _rag setVelocity [0,100,100];
	    player allowDamage false;
	    detach _rag;
	    0 = _rag spawn {
	        deleteVehicle _this;
	        player allowDamage true;
	    };
	}, Nil, 0, true, false, "fire", "", 5, false, ""
];

//PVP

_side = blufor;
_veh = false;

allplayers select {side _x isEqualTo _side && {!(_x isEqualTo vehicle _x)}};




//find close enemy
swithcAction = {player addAction["switch player",
{
	if(isnil "oldBody")then{oldBody = player};
	_closedAI = objNull;
	_closedDis = 10000;
	{
		_ai = _x;
		{
			_dis = _ai distance _x;
			if(_dis < _closedDis)then{
				_closedDis = _dis;
				_closedAI = _ai;
			};
		} forEach (allPlayers - [player]);
	}foreach (allunits select {side _x isEqualTo resistance && {!(_x in allplayers)}  } );
	_old = player;
	selectPlayer _closedAI;
	if((_old getVariable ["inconsciente",false]) || (_old getVariable ["ACE_isUnconscious",false]))then{
		_old setDamage 1;
	};
	if!(player getVariable ["swithcAction",false])then{
		player setVariable ["swithcAction",true]
		call swithcAction;
	};
},"",0,false,false,"watch"
];};


// moveback
selectPlayer oldBody;


//make helis attack
[] spawn{
	while{true}do{
		_knowsAbout = opfor knowsAbout player;
		if(_knowsAbout>1)then{
			a reveal [player,_knowsAbout];
			a commandSuppressiveFire player;
		};

		sleep 1;
	};
};


//copy car
_base = cursorObject;
_textures = getObjectTextures _base;
_array =[[typeof _base,_textures]];
_locBase = getPosWorld _base;
{
	_type = typeOf _x;
	_textures = getObjectTextures _x;
	_offset = (getPosWorld _x) vectorDiff +_locBase;
	_dir = vectorDir _x;
	_up = vectorUp _x;
	_array pushBack [_type,_textures,_offset,_dir,_up,[]];
}foreach (attachedObjects _base);

copyToClipboard str _array;

//submarine
_array = [["B_APC_Tracked_01_AA_F",["","","a3\boat_f_beta\sdv_01\data\sdv_ext_co.paa"],[0.352539,-6.82324,5.88606],[0.00397188,0.997882,0.0649255],[0.0814052,-0.0650332,0.994557],[]],["B_APC_Tracked_01_AA_F",["","","a3\boat_f_beta\sdv_01\data\sdv_ext_co.paa"],[0.649414,-30.1885,4.66342],[-0.00397149,-0.997882,-0.0649255],[0.0814052,-0.0650332,0.994557],[]],["B_APC_Wheeled_01_cannon_F",["","","a3\boat_f_beta\sdv_01\data\sdv_ext_co.paa"],[1.2627,14.1797,11.4319],[0.00397188,0.997882,0.0649255],[0.0814052,-0.0650332,0.994557],[]],["B_APC_Wheeled_01_cannon_F",["","","a3\boat_f_beta\sdv_01\data\sdv_ext_co.paa"],[1.22656,1.01465,10.5883],[-0.0039722,-0.997882,-0.0649255],[0.0814052,-0.0650332,0.994557],[]],["B_AAA_System_01_F",["a3\static_f_jets\aaa_system_01\data\aaa_system_01_co.paa","a3\static_f_jets\aaa_system_01\data\aaa_system_02_co.paa"],[1.2041,7.91309,12.1716],[0.00397188,0.997882,0.0649255],[0.0814052,-0.0650332,0.994557],[]],["B_T_MBT_01_mlrs_F",["","a3\boat_f_beta\sdv_01\data\sdv_ext_co.paa"],[0.665039,22.6182,7.24876],[0.00397188,0.997882,0.0649255],[0.0814052,-0.0650332,0.994557],[]],["Submarine_01_F",[],[0.381836,-6.28711,2.12048],[-0.00397197,-0.997882,-0.0649255],[0.0814052,-0.0650332,0.994557],[]],["B_T_MBT_01_arty_F",["","a3\boat_f_beta\sdv_01\data\sdv_ext_co.paa","a3\data_f\vehicles\turret_co.paa"],[0.672852,36.2266,6.9668],[-0.0172327,0.980712,-0.194697],[0.0796594,0.195454,0.977473],[]]];

_pos = getPosWorld player;
_pos set [2,200];
_base = "B_UAV_02_dynamicLoadout_F" createVehicle [0,0,0];
_base enableSimulation false;
_base setPosWorld _pos;
createVehicleCrew _base;
subDrone = _base;
arrayGuns = [];
{
	_this = _x;
	params ["_type","_textures","_offset","_dir","_up"];
	_object = _type createVehicle [0,0,0];
	_object enableSimulation false;
	{
		_object setObjectTextureGlobal [_foreachindex, _x];
	} forEach _textures;
	_object setPosWorld (_offset vectorAdd (getPosWorld _base));
	_object attachTo [_base];
	_object enableSimulation true;
	_object setVectorDirAndUp[_dir, _up];
	arrayGuns pushBack _object;
	createVehicleCrew _object;
} forEach _array;
_base enableSimulation true;
_base setVelocity [0,100,0];



//remove
{
	deleteVehicle _x;
} forEach (attachedObjects subDrone);
deleteVehicle subDrone;

//shoot all cannons
[]spawn{
	_targets = allunits select { !(side _x isEqualTo side (arrayGuns select 0)) && {(_x distance (arrayGuns select 0)) < 1000}};
	{
		_target = selectRandom _targets;
		_gun = weapons _x select 0;
		_x setVehicleAmmo 1;
		_x doWatch _target;
		sleep 0.5;
		_x commandSuppressiveFire _target;
		for "_i" from 1 to 20 do{
			sleep 0.1;
			_x fire _gun;
		};
	} forEach arrayGuns;
};

//rocket backpack
player addAction[
"shoot rocket",
{
	[]spawn{
		_launcher = player;
		_location = [0,-0.3,0.9];
		_targetLocation = player getpos [600,direction player];
		_target = cursorObject;
		if(isnull _target)exitWith{};
		[localize "STR_disp_options_game_options", str _count] call A3A_fnc_customHint;

		[_target,_launcher,_location]spawn {
			params["_target","_launcher","_location"];
			_missileType = if(vehicle _target isEqualTo _target)then{"M_Titan_AP"}else{"M_Titan_AT"};
			_missile = _missileType createVehicle [0,0,0];
			_missile attachto [_launcher,_location];
			_missile setVectorDirAndUp [[0,0,1],[0,1,0]];
			sleep 0.1;
			detach _missile;

			sleep 2;

			_turn1 = false;
			_turn2 = false;
			_p = 80;
			_r = 0;
			_y = direction player;
			_p = _p + (random 10) -5;
			_missile setVectorDirAndUp [
				[ sin _y * cos _p,cos _y * cos _p,sin _p],
				[ [ sin _r,-sin _p,cos _r * cos _p],-_y] call BIS_fnc_rotateVector2D
			];
			while {alive _missile}do{
				_yT = ([_target,_missile] call BIS_fnc_DirTo) + 180;
				_yC = direction _missile;
				_yD = _yT - _yC;
				if(_yD > 180)then{_yD = _yD - 360}else{
					if(_yD < -180)then{_yD = _yD + 360};
				};
				_y = _yC;
				if(_yD < 0)then{_y = _y - 4}else{_y = _y + 4};
				_y = _y + (random 10) -5;
				if(!_turn1 && {_p >= 10})then{
					_p = _p - 10;
				}else{
					if(!_turn1)then{_turn1 = true; _p = 3;};
					_pT = -atan (((getPosWorld _missile vectorDiff getPosWorld _target) select 2) / (_target distance2d _missile));
					if(_turn2 || {_pT < -30})then{
						_turn2 = true;
						_pD = _p - _pT;
						if(_pD < 0)then{_p = _p + 15}else{_p = _p - 15};
					};
				};

				_p = _p + (random 10) -5;
				_r = 0;
				_missile setVectorDirAndUp [
					[ sin _y * cos _p,cos _y * cos _p,sin _p],
					[ [ sin _r,-sin _p,cos _r * cos _p],-_y] call BIS_fnc_rotateVector2D
				];

				sleep (0.2);
			};
		};
	};
},"",0,false,false,"watch"
];

[subDrone]spawn{
	params["_launcher"];
	_location = [0,-3,10];
	private _targets = allunits select {side _x isEqualTo opfor && _x distance _launcher < 2000};
	_count = if(count _targets <= 30)then{count _targets}else{30};
	if(_count == 0)exitWith{};
	[localize "STR_disp_options_game_options", str _count] call A3A_fnc_customHint;
	for "_i" from 0 to (_count-1) do{
		sleep 0.5;
		_target = _targets select _i;
		[_target,_launcher,_location]spawn {
			params["_target","_launcher","_location"];
			_missileType = if(vehicle _target isEqualTo _target)then{"M_Titan_AP"}else{"M_Titan_AT"};
			_missile = _missileType createVehicle [0,0,0];
			_missile attachto [_launcher,_location];
			_missile setVectorDirAndUp [[0,0,1],[0,1,0]];
			sleep 0.1;
			detach _missile;

			_perSecondChecks = 1;
			_missileSpeed = 50;

			sleep 2;

			_turn1 = false;
			_turn2 = false;
			_p = 80;
			_p = _p + (random 10) -5;
			while {alive _missile && {_missile distance _target > _missileSpeed/20}}do{
				_yT = ([_target,_missile] call BIS_fnc_DirTo) + 180;
				_yC = direction _missile;
				_yD = _yT - _yC;
				if(_yD > 180)then{_yD = _yD - 360}else{
					if(_yD < -180)then{_yD = _yD + 360};
				};
				_y = _yC;
				if(_yD < 0)then{_y = _y - 4}else{_y = _y + 4};
				_y = _y + (random 10) -5;
				if(!_turn1 && {_p >= 10})then{
					_p = _p - 10;
				}else{
					if(!_turn1)then{_turn1 = true; _p = 0;};
					_pT = -atan (((getPosWorld _missile vectorDiff getPosWorld _target) select 2) / (_target distance2d _missile));
					if(_turn2 || {_pT < -30})then{
						_turn2 = true;
						_pD = _p - _pT;
						if(_pD < 0)then{_p = _p + 10}else{_p = _p - 10};
					};
				};

				_p = _p + (random 10) -5;
				_r = 0;
				_missile setVectorDirAndUp [
					[ sin _y * cos _p,cos _y * cos _p,sin _p],
					[ [ sin _r,-sin _p,cos _r * cos _p],-_y] call BIS_fnc_rotateVector2D
				];

				sleep (0.2);
			};
		};
	};
};