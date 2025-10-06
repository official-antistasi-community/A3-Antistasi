/*
Author: Wurzel0701, John Jordan
    Adds the needed code to give artillery a smoke trail, so you can see where it is coming from
    Also makes nearby AI go prone at the point where they'd hear the incoming shell

Arguments:
    <OBJECT> The artillery vehicle that the smoke should be added to

Return Value:
    <NIL>

Scope: Server (so Fired EH triggers reliably)
Environment: Any
Public: No
Dependencies:
    <NIL>

Example:
    [_myMortar] call A3A_fnc_addArtilleryTrailEH;
*/

params ["_artillery"];

_artillery addEventHandler ["Fired", {

    params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_gunner"];

    // Artillery trail generation
    _projectile spawn
    {
        sleep 0.05;

        private _smoke = "SmokeShell_Infinite" createVehicle (getPos _this);
        _smoke attachTo [_this, [0, -1, 0]];

        waitUntil {sleep 0.1; !(alive _this)};
        deleteVehicle _smoke;
    };

    // Calculate mirrored landing point
    private _shellPos = getPosASL _projectile;
    private _shellVel = velocity _projectile;
    private _velZ = _shellVel # 2;
    private _peakTime = _velZ / 9.81;
    private _velLin = [_shellVel#0, _shellVel#1];
    private _landPos = _shellPos vectorAdd (_velLin vectorMultiply 2*_peakTime);

    // Adjustment for altitude difference
    private _landOffTime = (ASLtoATL _landPos # 2) / _velZ;          // negative if above firing pos
    _landPos = _landPos vectorAdd (_velLin vectorMultiply _landOffTime) vectorAdd [0,0,-_velZ*_landOffTime];
    private _travTime = 2*_peakTime + _landOffTime;

    // Signal nearby AIs when shell is 3s from landing 
    [_travTime, _landPos, _unit] spawn {
        params ["_travTime", "_landPos", "_unit"];
        sleep (_travTime - 3.5);
        private _nearUnits = allUnits inAreaArray [_landPos, 50, 50]
            select { vehicle _x == _x } select { !isPlayer _x } select { _x call A3A_fnc_canFight };
        {
            _x remoteExec ["A3A_fnc_duckMortar", _x];
        } forEach _nearUnits;

        // Send signal to garrison too
        private _nearMarkers = markersX inAreaArrayIndexes [_landPos, 600, 600] apply { markersX#_x };
        private _inIndex = _nearMarkers findIf { _landPos inArea _x };
        if (_inIndex == -1) exitWith {};
        private _nearMrk = _nearMarkers#_inIndex;

        if (_nearMrk in A3A_garrisonMachine) then {
            ["enemyInfo", [_nearMrk, "mortar", _unit, 1.5]] call A3A_fnc_garrisonOp;
        };
    };
}];
