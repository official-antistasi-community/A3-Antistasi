private _filename = "fn_salvageRope.sqf";

//Deploy action
A3A_SR_canDeployWinch = { //can deploy winch if player is not in a vehicle, is within 10m, theres no rope deployed yet and the vehicle can load cargo
    private _vehicle = cursorTarget;
    if (_vehicle isKindOf "Ship") then {
        vehicle player == player && player distance _vehicle < 10 && isNil {_vehicle getVariable "WinchRope"} && !([_vehicle, boxX] call A3A_Logistics_fnc_canLoad isEqualTo -7);
    } else {
        false;
    };
};

A3A_SR_DeployWinch = {
    if (captive player) then {player setCaptive false};
    params ["_player"];
    private _vehicle = cursorTarget;
    private _helper = "Land_Can_V1_F" createVehicle [random 100,random 100, random 100];
    _helper hideObjectGlobal true;
    _helper attachTo [_player,[0,0.1,0], "pelvis"];
    _vehicle setVariable ["WinchRope", (ropeCreate [_vehicle, [0,-2.8,-0.8], _helper, [0,0,0], 10]), true];
    _vehicle setVariable ["WinchHelper", _helper, true];
    player setVariable ["WinchHelperObj", _helper];
    [_player, _vehicle] call A3A_SR_adjustRope;
};

A3A_SR_cleanHelper = {
    params ["_helper", "_vehicle"];
    private _player = attachedTo _helper;
    detach _helper;
    deleteVehicle _helper;
    _vehicle setVariable ["WinchHelper", nil];
    _player setVariable ["WinchHelperObj", nil];
};


A3A_SR_adjustRope = {
    params ["_player", "_vehicle"];
    private _rope = _vehicle getVariable "WinchRope";
    private _helper = _vehicle getVariable ["WinchHelper", objNull];
    while {!isNull ropeAttachedTo _helper && alive attachedTo _helper} do {
        private _dist = _vehicle distance _player;
        private _optimalDist = _dist + 3;
        private _maxDist = _dist + 7;
        if ((ropeLength _rope) < _dist) then {
            ropeUnwind [_rope, 10, _optimalDist];
        } else {
            if ((ropeLength _rope) > _maxDist) then {
                ropeUnwind [_rope, 10, _optimalDist];
            };
        };
        sleep 0.1;
    };
    if (alive _helper) then { //vehicle destroyed, rope broken or player died
        [_helper, _vehicle] call A3A_SR_cleanHelper;
        ropeDestroy (_vehicle getVariable "WinchRope");
        _vehicle setVariable ["WinchRope", nil, true];
    };
};

//Stow action
A3A_SR_canStow = { //can stow when the player is not in a vehicle, is within 10m, rope attached to the player or no one, not recovering cargo
    private _vehicle = cursorTarget;
    if (isNull _vehicle) exitWith {false};
    if (isNull (_vehicle getVariable ["WinchRope", objNull])) exitWith {false}; //winch deployed
    private _helper = _vehicle getVariable ["WinchHelper", objNull];
    if (isNull _helper) exitWith {false};//this is the case when retrieving cargo
    private _attachedPlayer = attachedTo _helper;
    vehicle player == player && player distance _vehicle < 10 && (!alive _attachedPlayer || player == _attachedPlayer); //only attached player unless dead
};

A3A_SR_stowRope = {
    params ["_player"];
    private _vehicle = cursorTarget;
    [_vehicle getVariable "WinchHelper", _vehicle] call A3A_SR_cleanHelper;
    ropeDestroy (_vehicle getVariable "WinchRope");
    _vehicle setVariable ["WinchRope", nil, true];
};

A3A_SR_LoadSalvage = {
    params ["_vehicle", "_cargo"];
    ["Loading cargo"] remoteExec ["systemChat"];
    _return = [_vehicle, _cargo] call A3A_Logistics_fnc_canLoad;
    if (_return isEqualType 0) exitWith {
        private _cargoName = getText (configFile >> "CfgVehicles" >> typeOf _object >> "displayName");
        private _vehicleName = getText (configFile >> "CfgVehicles" >> typeOf _vehicle >> "displayName");
        [localize "STR_A3A_logi_title", format [localize "STR_A3A_logi_salvagerope_nospace", _vehicleName, _cargoName]] remoteExec ["A3A_fnc_customHint", remoteExecutedOwner];
    };
    _return spawn A3A_Logistics_fnc_load;
};

//Attach action
A3A_SR_canAttach = { //whitelisted objs (SalvageCrate) thats within 13m (finicky with low distance) and thats under water can be attached while the player has a rope
    _cargo = cursorTarget;
    if (isNull _cargo) exitWith {false};
    if !(_cargo getVariable ["SalvageCrate", false]) exitWith {false}; //not whitelisted
    if ((getPosASLW _cargo#2)>0) exitWith {false}; //above water
    private _helper = player getVariable ["WinchHelperObj", objNull];//get helper from player
    player distance _cargo <= 13 && !isNull(ropeAttachedTo _helper); //close enough and has rope
};

A3A_SR_attachRope = {
    private _cargo = cursorTarget;
    private _helper = player getVariable ["WinchHelperObj", objNull];
    private _vehicle = ropeAttachedTo _helper;

    //calculate unwind distance and wait time, break undercover
    player setCaptive false;
    private _distance = _vehicle distance _cargo;
    private _unwind = _distance - 0.5;
    private _time = time + 5 + (_unwind*2);

    //destroy rope between player and boat
    [_helper, _vehicle] call A3A_SR_cleanHelper;
    ropeDestroy (_vehicle getVariable "WinchRope");

    //create rope between cargo and boat
    private _rope = ropeCreate [_vehicle, [0,-2.8,-0.8], _cargo, [0,0,0], _distance];
    _vehicle setVariable ["WinchRope", _rope, true];

    //winch the cargo up to the boat
    sleep 1;
    ropeUnwind [_rope, 0.5, -(_unwind), true];
    waitUntil {time > _time || isNull _rope};
    if (isNull _rope) exitWith {};

    //load cargo onto boat
    ropeDestroy _rope;
    [[_vehicle, _cargo], A3A_SR_LoadSalvage] remoteExecCall ["call", 2];
    [_cargo] call A3A_Logistics_fnc_addLoadAction;

    _vehicle setVariable ["WinchRope",nil,true];
};

//adding of actions
A3A_SR_addplayerWinchActions = {
    player addAction [localize "STR_A3A_fn_salvRope_addact_deploy", {
        [player] call A3A_SR_DeployWinch;
    }, nil, 0, false, true, "", "call A3A_SR_canDeployWinch"];

    player addAction [localize "STR_A3A_fn_salvRope_addact_stow", {
        [player] call A3A_SR_stowRope;
    }, nil, 0, false, true, "", "call A3A_SR_canStow"];

    player addAction [localize "STR_A3A_fn_salvRope_addact_attach", {
        [player] call A3A_SR_attachRope;
    }, nil, 0, false, true, "", "call A3A_SR_canAttach"];

    if (isMultiplayer) then {
        player addEventHandler ["Respawn",{
            player setVariable ["SalvageRopeAction",false];
        }];
    };
};

[] spawn {
    private _missionComplete = false;
    while {!_missionComplete} do {
        if (!isNull player && isplayer player) then {
            if !(player getVariable ["SalvageRopeAction",false]) then {
                [] call A3A_SR_addplayerWinchActions;
                player setVariable ["SalvageRopeAction",true];
            };
        };
        sleep 2;
        _missionComplete = "LOG" call BIS_fnc_taskCompleted;
    };
};
