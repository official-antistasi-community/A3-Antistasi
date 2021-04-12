params ["_launcher", "_side", "_supportName"];

private _fileName = "SUP_cruiseMissile";
sleep (random 90);

private _rounds = 4;
private _onlineTime = 3600;

while {_onlineTime > 0} do
{
    private _targetList = server getVariable [format ["%1_targets", _supportName], []];
    if (count _targetList > 0) then
    {
        private _target = _targetList deleteAt 0;
        server setVariable [format ["%1_targets", _supportName], _targetList, true];

        private _targetParams = _target select 0;
        private _reveal = _target select 1;

        private _targetObj = _targetParams select 0;
        private _precision = _targetParams select 1;

        //Show target to players if change is high enough
        private _textMarker = createMarker [format ["%1_text_%2", _supportName, _rounds], getPos _targetObj];
        _textMarker setMarkerShape "ICON";
        _textMarker setMarkerType "mil_objective";
        _textMarker setMarkerText "Cruise Missile Target";

        if(_side == Occupants) then
        {
            _textMarker setMarkerColor colorOccupants;
        }
        else
        {
            _textMarker setMarkerColor colorInvaders;
        };
        _textMarker setMarkerAlpha 0;

        [_textMarker, _targetObj] spawn
        {
            params ["_textMarker", "_targetObj"];
            private _maxTime = 300;
            while {_maxTime > 0} do
            {
                _textMarker setMarkerPos (getPos _targetObj);

                sleep 0.5;
                _maxTime = _maxTime - 0.5;

                if(isNull _targetObj || {!(alive _targetObj)}) exitWith {};
            };
            deleteMarker _textMarker;
        };

        [_reveal, getPos _targetObj, _side, "MISSILE", _textMarker, ""] spawn A3A_fnc_showInterceptedSupportCall;

        //Creates the laser target to mark the target
        private _laser = createVehicle ["LaserTargetE", (getPos _targetObj), [], 0, "CAN_COLLIDE"];
        [2, format ["Trying to attack laser to %1", _targetObj], "_fileName"] call A3A_fnc_log;
        _laser attachTo [_targetObj, [0,0,0]];

        //Send the laser target to the launcher
        _side reportRemoteTarget [_laser, 300];
        _laser confirmSensorTarget [_side, true];
        _launcher fireAtTarget [_laser, "weapon_vls_01"];

        _rounds = _rounds - 1;
    };

    if(_rounds <= 0) exitWith
    {
        [2, format ["%1 has no missiles left to fire, aborting", _supportName], _fileName] call A3A_fnc_log;
    };

    sleep 30;
    _onlineTime = _onlineTime - 30;
};

private _holdObject = attachedTo _launcher;
deleteVehicle _holdObject;
deleteVehicle _launcher;

[_supportName, _side] spawn A3A_fnc_endSupport;
