params ["_sleepTime", "_launcher", "_side", "_supportName"];

private _fileName = "SUP_SAMRoutine";
sleep _sleepTime;

private _rounds = 4;
private _onlineTime = 900;

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

        private _dir = _launcher getDir _targetObj;
        private _pos = _launcher getPos [250, _dir];
        _pos = _pos vectorAdd [0,0,300];
        if !(terrainIntersect [_pos vectorAdd [0, 0, 50], getPos _targetObj]) then
        {
            _launcher setVariable ["_currentTarget", _targetObj];
            _launcher doWatch _pos;
            _launcher reveal [_targetObj, 4];
            sleep 10;
            _launcher fireAtTarget [_targetObj];
            _launcher doWatch objNull;
            sleep 1;
            [_reveal, getPos _targetObj, _side, "SAM", _launcher getVariable ["currentTextmarker", ""], ""] spawn A3A_fnc_showInterceptedSupportCall;
            _rounds = _rounds - 1;
            _onlineTime = _onlineTime - 11;
        };
    };

    if(_rounds <= 0) exitWith
    {
        [2, format ["%1 has no missiles left to fire, aborting", _supportName], _fileName] call A3A_fnc_log;
    };

    sleep 10;
    _onlineTime = _onlineTime - 10;
};

waitUntil {sleep 10; allPlayers findIf {getPos _x distance2D (getPos _launcher) < 1000} == -1};
deleteVehicle _launcher;

[_supportName, _side] spawn A3A_fnc_endSupport;
