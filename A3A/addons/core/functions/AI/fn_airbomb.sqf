#define OFFSET      250

/*  Creates the bombs for airstrikes, should be started 250 meters before the actual bomb run

*/

params ["_plane", "_bombType", "_bombCount", "_bombRunLength"];
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
Debug_1("Executing on: %1", clientOwner);

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
        Error_1("Invalid bomb type, given was %1", _bombType);
    };
};

if(_ammo == "") exitWith {};

private _speedInMeters = (speed _plane) / 3.6;
private _metersPerBomb = _bombRunLength / _bombCount;
//Decrease it a bit, to avoid scheduling erros
private _timeBetweenBombs = (_metersPerBomb / _speedInMeters) - 0.05;

sleep ((_timeBetweenBombs/2) + (_bombOffset/_speedInMeters));
for "_i" from 1 to _bombCount do
{
    sleep _timeBetweenBombs;
    if (alive _plane) then
    {
        private _bombPos = (getPosATL _plane) vectorAdd [0, 0, -5];
        _bomb = _ammo createvehicle _bombPos;
        _bomb setDir (getDir _plane);
        _bomb setVelocity [0,0,-50];
        _bomb setShotParents [_plane, driver _plane];           // server exec, really?
        if (_bombType == "NAPALM") then
        {
            // Pass the position in because it might detonate pre-spawn
            [_bomb, _bombPos, side group _plane] spawn
            {
                params ["_bomb", "_bombPos", "_bombSide"];
                while {!isNull _bomb} do
                {
                    _bombPos = getPosATL _bomb;
                    sleep 0.1;
                };
                [_bombPos, _bombSide] remoteExec ["A3A_fnc_napalm",2];
            };
        };
    };
};
