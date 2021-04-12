params ["_strikeObject", "_impactPosition"];

/*	The impact effects of the weapon

	Execution on: Client

	Scope: Internal

	Parameter:
		_strikeObject: OBJECT : The object which is leading the beam
		_impactPosition: POSITION : The impact position in format posASL

	Returns:
		Nothing
*/

private _shockWaveParticle = "#particlesource" createVehicleLocal getPos _strikeObject;
_shockWaveParticle setParticleParams [["A3\Data_F\ParticleEffects\Universal\universal.p3d", 16, 7, 48], "", "Billboard", 1, 7, [0, 0, 0], [0, 0, 0], 0, 500, 1, 0, [50, 100], [[0.1, 0.1, 0.1, 0.5], [0.5, 0.5, 0.5, 0.5], [1, 1, 1, 0.3], [1, 1, 1, 0]], [1,0.5], 0.1, 1, "", "", _strikeObject];
_shockWaveParticle setParticleRandom [2, [20, 20, 20], [5, 5, 0], 0, 0, [0, 0, 0, 0.1], 0, 0];
_shockWaveParticle setParticleCircle [50, [-80, -80, 2.5]];
_shockWaveParticle setDropInterval 0.0005;

_shockWaveParticle spawn
{
	waitUntil {sleep 0.25; beamImpactDone};
	deleteVehicle _this;
};

_fn_playSoundTillDead =
{
	params ["_sound", "_strikeObject", "_earthquakeStrength"];
	while {!(isNull _strikeObject)} do
	{
		playSound _sound;
		addCamShake [_earthquakeStrength, 20, 5];
		sleep 7;
	};
};

private _distance = player distance _impactPosition;
if(_distance > 2000) exitWith {};
if(_distance < 1000) then
{
	if(_distance < 500) then
	{
		["EarthquakeHeavy", _strikeObject, 15] spawn _fn_playSoundTillDead;
	}
	else
	{
		["EarthquakeMore", _strikeObject, 10] spawn _fn_playSoundTillDead;
	};
}
else
{
	if(_distance < 1500) then
	{
		["EarthquakeLess", _strikeObject, 5] spawn _fn_playSoundTillDead;
	}
	else
	{
		["EarthquakeLight", _strikeObject, 3] spawn _fn_playSoundTillDead;
	};
};

[] spawn
{
	playSound "StrikeImpact";
	sleep 1;
	playSound "StrikeSound";
};

[_distance] spawn
{
	private _distance = _this select 0;
	cutText ["", "WHITE OUT", 1];
	titleCut ["", "WHITE IN", 1];
	private _value = 0;
	if(_distance < 1250) then
	{
		_value = 50 * (1 - (_distance/1250));
	};
	"dynamicBlur" ppEffectEnable true;
	"dynamicBlur" ppEffectAdjust [_value];
	"dynamicBlur" ppEffectCommit 0;
	"dynamicBlur" ppEffectAdjust [0.0];
	"dynamicBlur" ppEffectCommit 5;
	sleep 6;
	"dynamicBlur" ppEffectEnable false;
};

if(_distance < 750) then
{
	sleep (_distance/120);
	addCamShake [30 * (1 - (_distance/1000)), 6, 60];
};
