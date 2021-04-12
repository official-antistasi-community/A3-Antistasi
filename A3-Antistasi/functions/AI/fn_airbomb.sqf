#define OFFSET      250

/*  Creates the bombs for airstrikes, should be started 250 meters before the actual bomb run

*/

params ["_pilot", "_bombType", "_bombCount", "_bombRunLength"];
private _filename = "fn_airbomb";
[3, format ["Executing on: %1", clientOwner], _filename] call A3A_fnc_log;

//Ensure reasonable bomb run lenght
if(_bombRunLength < 100) then {_bombRunLength = 100};

private _ammo = "";
private _bombOffset = 0;
switch (_bombType) do
{
    case ("HE"):
    {
        _ammo = "Bo_Mk82";
        _bombOffset = 180;
    };
	case ("CLUSTER"):
    {
        _ammo = "BombCluster_03_Ammo_F";
        _bombOffset = 10;
	};
	case ("NAPALM"):
    {
		_ammo = "ammo_Bomb_SDB";
        _bombOffset = 170;
	};
	default
    {
		[1, format ["Invalid bomb type, given was %1", _bombType], _filename] call A3A_fnc_log;
	};
};

if(_ammo == "") exitWith {};

private _speedInMeters = (speed _pilot) / 3.6;
private _metersPerBomb = _bombRunLength / _bombCount;
//Decrease it a bit, to avoid scheduling erros
private _timeBetweenBombs = (_metersPerBomb / _speedInMeters) - 0.05;

sleep ((_timeBetweenBombs/2) + (_bombOffset/_speedInMeters));
for "_i" from 1 to _bombCount do
{
	sleep _timeBetweenBombs;
	if (alive _pilot) then
	{
        private _bombPos = (getPos _pilot) vectorAdd [0, 0, -5];
		_bomb = _ammo createvehicle _bombPos;
		waituntil {!isnull _bomb};
		_bomb setDir (getDir _pilot);
		_bomb setVelocity [0,0,-50];
		if (_bombType == "NAPALM") then
		{
			[_bomb] spawn
			{
                private _bomba = _this select 0;
                private _pos = [];
                while {!isNull _bomba} do
                {
                    _pos = getPos _bomba;
                    sleep 0.1;
                };
                [_pos] remoteExec ["A3A_fnc_napalm",2];
			};
		};
	};
};
//_bomba is used to track when napalm bombs hit the ground in order to call the napalm script on the correct position
