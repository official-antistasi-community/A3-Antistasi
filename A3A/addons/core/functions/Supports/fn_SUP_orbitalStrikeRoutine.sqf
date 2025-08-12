//Hugely inspired and partly copied from ALIAS https://www.armaholic.com/page.php?id=32556

/*	An orbital attack, resulting in an devastating beam

Environment: Server, must be spawned

Arguments:
    <STRING> Unique support name (mostly for logging)
    <SIDE> Side to send support from
    <SCALAR> Delay time in seconds
    <POS2D> Target position for airstrike
    <SCALAR> Amount of information to reveal to rebels, 0-1

*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_supportName", "_side", "_delay", "_impactPosition", "_reveal"];

sleep _delay;

//["_reveal", "_position", "_side", "_supportType", "_markerType", "_markerLifeTime"]
[_reveal, _impactPosition, _side, "ORBITALSTRIKE", 300, 120] spawn A3A_fnc_showInterceptedSupportCall;

//[_side, format ["%1_coverage", _supportName]] spawn A3A_fnc_clearTargetArea;

private _startPos = +_impactPosition;
_startPos set [2, (_startPos select 2) + 1000];

private _strikeObject = "Land_Battery_F" createVehicle _startPos;
_strikeObject setPosASL _startPos;
_strikeObject setVelocity [0,0,-200];

beamImpactDone = false;
publicVariable "beamImpactDone";

private _players = allPlayers select {(_x distance2D _impactPosition) < 3000};

[_strikeObject] remoteExec ["A3A_fnc_SUP_orbitalStrikeBeamEffects", _players];

private _beamLight = "#lightpoint" createVehicle (getpos _strikeObject);
_beamLight setLightBrightness 150;
_beamLight setLightAmbient[0,0.5,0.8];
_beamLight setLightColor[0,0.5,0.8];
_beamLight lightAttachObject [_strikeObject, [0,0,0]];

waitUntil {sleep 0.1; (getPosATL _strikeObject) select 2 < 10};
_strikeObject enableSimulation false;

[_strikeObject, _impactPosition] remoteExec ["A3A_fnc_SUP_orbitalStrikeImpactEffects", _players];

//Impact effects
private _nearObjects = (ASLtoAGL _impactPosition) nearObjects ["Static", 200];
_nearObjects append ((ASLtoAGL _impactPosition) nearEntities [["Man", "AllVehicles"], 250]);
_nearObjects append ( nearestTerrainObjects [ASLtoAGL _impactPosition, ["BUSH", "TREE", "WALL", "FENCE", "POWER LINES", "FUELSTATION"], 150, true]);
Info_1("Found %1 objects to destroy", count _nearObjects);
private _destroyCounter = 0;
{

    if(_x isKindOf "Man" || _x isKindOf "AllVehicles") then
    {
        private _dirVector = (getPosASL _x) vectorDiff _impactPosition;

        private _upForce = exp (- (0.0035 * (_dirVector select 2)) - (0.006 * (_x distance2D _impactPosition)));

        _dirVector set [2, 0];
        _dirVector = vectorNormalized _dirVector;

        _dirVector = _dirVector vectorMultiply 20;
        _dirVector set [2, 175 * _upForce];

        _x setVelocity _dirVector;

        if(_x isKindOf "Man") then
        {
            _x setDamage (1 - (((_x distance2D _impactPosition) - 100)/200));
        }
        else
        {
            _x setDamage 1;
        };
    }
    else
    {
        if !(_x in [mapX,flagX,vehicleBox,boxX,fireX]) then
        {
            if !(_x isKindOf "FlagCarrierCore") then
            {
                _x setDamage [1, false];
            };
        };
    };
    _destroyCounter = _destroyCounter + 1;
    if(_destroyCounter > 25) then
    {
        sleep 0.1;
        _destroyCounter = 0;
    };
} forEach _nearObjects;

beamImpactDone = true;
publicVariable "beamImpactDone";

[_beamLight] spawn
{
    private _light = _this select 0;
    private _lightCounter = 0;

    while {_lightCounter < 150} do
    {
        _light setLightBrightness (150 - _lightCounter);
        sleep (6/150);
        _lightCounter = _lightCounter + 1;
    };
};

sleep 8;
deleteVehicle _beamLight;
deleteVehicle _strikeObject;

private _citiesInRange = (citiesX - destroyedSites) select {((getMarkerPos _x) distance2D _impactPosition) < 200};
{
    ["TaskFailed", ["", format [localize "STR_A3A_fn_supports_cityDestroyed", [_x] call A3A_fnc_localizar]]] remoteExec ["BIS_fnc_showNotification",teamPlayer];
    destroyedSites = destroyedSites + [_x];
	publicVariable "destroyedSites";
    sidesX setVariable [_x, Invaders, true];
    garrison setVariable [_x, [], true];
    [_x] call A3A_fnc_mrkUpdate;
    sleep 10;
} forEach _citiesInRange;

if (_citiesInRange isNotEqualTo []) then {[] spawn A3A_fnc_checkCampaignEnd;}; // If a town is destroyed, check for loss

