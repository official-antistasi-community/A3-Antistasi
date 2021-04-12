params ["_supportType", "_side", "_position"];

/*  Checks if the given support is available for use

    Execution on: Server

    Scope: External

    Params:
        _supportType: STRING : The type of support that should be checked
        _side: SIDE : The side for which the availability should be checked

    Returns:
        -1 if not available, the index of the timer otherwise
*/
private _fileName = "supportAvailable";
private _timerIndex = -1;
private _arrays = [];

switch (_supportType) do
{
    case ("QRF"):           //Normal quick responce force
    {
        _timerIndex = [_side, _position] call A3A_fnc_SUP_QRFAvailable;
    };
    case ("AIRSTRIKE"):     //Normal airstrike
    {
        _timerIndex = [_side] call A3A_fnc_SUP_airstrikeAvailable;
        _arrays = if(_side == Occupants) then {occupantsAirstrikeTimer} else {invadersAirstrikeTimer};
    };
    case ("MORTAR"):        //Normal mortar barrage
    {
        _timerIndex = [_side] call A3A_fnc_SUP_mortarAvailable;
        _arrays = if(_side == Occupants) then {occupantsMortarTimer} else {invadersMortarTimer};
    };
    case ("ORBSTRIKE"):     //Orbital strike
    {
        _timerIndex = [_side, _position] call A3A_fnc_SUP_orbitalStrikeAvailable;
        _arrays = if(_side == Occupants) then {occupantsOrbitalStrikeTimer} else {invadersOrbitalStrikeTimer};
    };
    case ("MISSILE"):       //Cruise missile
    {
        _timerIndex = [_side, _position] call A3A_fnc_SUP_cruiseMissileAvailable;
        _arrays = if(_side == Occupants) then {occupantsCruiseMissileTimer} else {invadersCruiseMissileTimer};
    };
    case ("SAM"):           //Surface to air missile
    {
        _timerIndex = [_side, _position] call A3A_fnc_SUP_SAMAvailable;
        _arrays = if(_side == Occupants) then {occupantsSAMTimer} else {invadersSAMTimer};
    };
    case ("CARPETBOMB"):    //Carpet bombing
    {
        _timerIndex = [_side] call A3A_fnc_SUP_carpetBombsAvailable;
        _arrays = if(_side == Occupants) then {occupantsCarpetBombTimer} else {invadersCarpetBombTimer};
    };
    case ("CAS"):           //Close air support
    {
        _timerIndex = [_side] call A3A_fnc_SUP_CASAvailable;
        _arrays = if(_side == Occupants) then {occupantsCASTimer} else {invadersCASTimer};
    };
    case ("ASF"):       //Air superiority fighters
    {
        _timerIndex = [_side] call A3A_fnc_SUP_ASFAvailable;
        _arrays = if(_side == Occupants) then {occupantsASFTimer} else {invadersASFTimer};
    };
    case ("GUNSHIP"):       //Heavily armed plane
    {
        _timerIndex = [_side] call A3A_fnc_SUP_gunshipAvailable;
        _arrays = if(_side == Occupants) then {occupantsGunshipTimer} else {invadersGunshipTimer};
    };
    /*  NOT YET IMPLEMENTED

    case ("CANNON"):        //Long range artillery
    {

    }
    case ("EMP"):           //Electromagnetic puls
    {

    }
    case ("AIRDROP"):       //Airborne vehicle insertion
    {

    }
    case ("RECON"):         //Airbased recon
    {

    }
    case ("SEAD"):          //Suppression of Enemy Air Defense bomber
    {

    }
    */
    default
    {
        //If unknown, set not available
        [3, format ["Unknown support %1, returning -1", _supportType], _fileName] call A3A_fnc_log;
        _timerIndex = -1;
    };
};

[3, format ["Support check for %1 returns %2, array is %3", _supportType, _timerIndex, _arrays], _fileName] call A3A_fnc_log;

_timerIndex;
