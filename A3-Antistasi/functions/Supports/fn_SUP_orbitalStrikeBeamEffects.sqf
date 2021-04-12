params ["_strikeObject"];

/*	The beam particle effects

	Scope: Internal

	Execution on: Client

	Params:
		_strikeObject: OBJECT : The object, which is leading the beam

	Returns:
		Nothing
*/
playSound "StrikeThunder";

private _mainBeamParticle = "#particlesource" createVehicleLocal (getpos _strikeObject);
_mainBeamParticle setParticleCircle [0, [0, 0, -3]];
_mainBeamParticle setParticleRandom [0, [0.25, 0.25, 0], [0.175, 0.175, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
_mainBeamParticle setParticleParams [["\A3\data_f\cl_exp", 1, 0, 1], "", "Billboard", 1, 8, [0, 0, 0], [0, 0, 0], 150, 1, 0, 0, [15,11,7,3], [[1, 1, 1, 1],[1, 1, 1, 1], [1, 1, 1, 1], [1, 1, 1, 1]], [0.08], 1, 0, "", "", _strikeObject];
_mainBeamParticle setDropInterval 0.002;

[_mainBeamParticle, _strikeObject] spawn
{
	waitUntil {sleep 0.25; (getPosATL (_this select 1)) select 2 < 10};
	deleteVehicle (_this select 0);
};

private _beamLightningParticle = "#particlesource" createVehicleLocal (getpos _strikeObject);
_beamLightningParticle setParticleCircle [0, [0, 0, -3]];
_beamLightningParticle setParticleRandom [0, [0.25, 0.25, 0], [0.175, 0.175, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
_beamLightningParticle setParticleParams [["\A3\data_f\VolumeLight", 1, 0, 1], "", "SpaceObject", 1, 8, [0, 0, 0], [0, 0, 0], 150, 1, 0, 0, [6,4,2,1], [[1, 1, 1, 1],[1, 1, 1, 1], [1, 1, 1, 1], [1, 1, 1, 1]], [0.08], 1, 0, "", "", _strikeObject];
_beamLightningParticle setDropInterval 0.002;

_beamLightningParticle spawn
{
	waitUntil {sleep 0.25; beamImpactDone};
	sleep 4;
	deleteVehicle _this;
};
