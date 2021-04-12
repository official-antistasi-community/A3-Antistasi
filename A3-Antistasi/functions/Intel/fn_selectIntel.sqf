//Define results for small intel
#define TROOPS          100
#define TIME_LEFT       101
#define DECRYPTION_KEY  102
#define CONVOY          103

//Define results for medium intel
#define ACCESS_ARMOR    200
#define ACCESS_AIR      201
#define ACCESS_HELI     202
#define CONVOYS         203
#define COUNTER_ATTACK  204

//Define results for large intel
#define WEAPON          300
#define TRAITOR         301
#define MONEY           302

params ["_intelType", "_side"];

/*  Selects, creates and executes the intel of the given type and side
*   Params:
*       _intelType : STRING : One of "Small", "Medium" or "Large"
*       _side : SIDE : The enemy side, which the intel belongs to
*
*   Returns:
*       _text : STRING : The text of the selected intel
*/

private _fileName = "selectIntel";
if(isNil "_intelType") exitWith
{
    [1, "No intel type given!", _fileName] call A3A_fnc_log;
};
if(isNil "_side") exitWith
{
    [1, "No side given!", _fileName] call A3A_fnc_log;
};

private _text = "";
private _sideName = "";
private _intelContent = "";
if(_side == Occupants) then
{
    _sideName = nameOccupants
}
else
{
    _sideName = nameInvaders
};

if(_intelType == "Small") then
{
    _intelContent = selectRandomWeighted [TROOPS, 0, TIME_LEFT, 0.3, DECRYPTION_KEY, 0.35, CONVOY, 0.35];
    switch (_intelContent) do
    {
        case (TROOPS):
        {
            //Case not yet implemented as system is not usable right now
            //This can be added when the new garrison system is active
        };
        case (TIME_LEFT):
        {
            private _nextAttack = 0;
            if(_side == Occupants) then
            {
                _nextAttack = attackCountdownOccupants + (random 600) - 300;
            }
            else
            {
                _nextAttack = attackCountdownInvaders + (random 600) - 300;
            };
            private _sideName = if (_side == Occupants) then {nameOccupants} else {nameInvaders};
            if(_nextAttack < 300) then
            {
                _text = format ["%1 attack is imminent!", _sideName];
            }
            else
            {
                _text = format ["%1 attack expected in %2 minutes", _sideName, round (_nextAttack / 60)];
            };
        };
        case (DECRYPTION_KEY):
        {
            if(_side == Occupants) then
            {
                occupantsRadioKeys = occupantsRadioKeys + 1;
                publicVariable "occupantsRadioKeys";
            }
            else
            {
                invaderRadioKeys = invaderRadioKeys + 1;
                publicVariable "invaderRadioKeys";
            };
            _text = format ["You found a %1 decryption key!<br/>It allows your faction to fully decrypt the next support call.", _sideName];
        };
        case (CONVOY):
        {
            private _convoyMarker = "";
            [] call A3A_fnc_cleanConvoyMarker;
            if(_side == Occupants) then
            {
                _convoyMarker = (server getVariable ["convoyMarker_Occupants", []]);
            }
            else
            {
                _convoyMarker = (server getVariable ["convoyMarker_Invaders", []]);
            };
            if(count _convoyMarker != 0) then
            {
                (selectRandom _convoyMarker) setMarkerAlpha 1;
                _text = format ["We found the tracking data for a %1 convoy.<br/>Convoy position marked on map!", _sideName];
            }
            else
            {
                _text = format ["There are currently no %1 convoys driving around!", _sideName];
            };
        };
    };
};
if(_intelType == "Medium") then
{
    _intelContent = selectRandomWeighted [ACCESS_AIR, 0.2, ACCESS_HELI, 0.3, ACCESS_ARMOR, 0.3, CONVOYS, 0.2, COUNTER_ATTACK, 0];
    switch (_intelContent) do
    {
        case (ACCESS_AIR):
        {
            _text = format ["%1 currently has access to<br/>%2", _sideName, ([_side, ACCESS_AIR] call A3A_fnc_getVehicleIntel)];
        };
        case (ACCESS_HELI):
        {
            _text = format ["%1 currently has access to<br/>%2", _sideName, ([_side, ACCESS_HELI] call A3A_fnc_getVehicleIntel)];
        };
        case (ACCESS_ARMOR):
        {
            _text = format ["%1 currently has access to<br/>%2", _sideName, ([_side, ACCESS_ARMOR] call A3A_fnc_getVehicleIntel)];
        };
        case (CONVOYS):
        {
            [] call A3A_fnc_cleanConvoyMarker;
            private _convoyMarkers = [];
            if(_side == Occupants) then
            {
                _convoyMarkers = server getVariable ["convoyMarker_Occupants", []];
            }
            else
            {
                _convoyMarkers = server getVariable ["convoyMarker_Invaders", []];
            };
            {
                _x setMarkerAlpha 1;
            } forEach _convoyMarkers;
            _text = format ["We found the %1 convoy GPS decryption key!<br/>%2 convoys are marked on the map", _sideName, count _convoyMarkers];
        };
        case (COUNTER_ATTACK):
        {
            //Not yet implemented, needs a rework of the attack script
        };
    };
};
if(_intelType == "Large") then
{
    if(["AS"] call BIS_fnc_taskExists) then
    {
        _intelContent = selectRandomWeighted [TRAITOR, 0.3, WEAPON, 0.3, MONEY, 0.4];
    }
    else
    {
        _intelContent = selectRandomWeighted [WEAPON, 0.4, MONEY, 0.6];
    };
    switch (_intelContent) do
    {
        case (TRAITOR):
        {
            _text = "You found data on the family of the traitor, we don't think he will do any more trouble";
            traitorIntel = true; publicVariable "traitorIntel";
        };
        case (WEAPON):
        {
            private _notYetUnlocked = allWeapons - unlockedWeapons;
            private _newWeapon = selectRandom _notYetUnlocked;
            [_newWeapon] remoteExec ["A3A_fnc_unlockEquipment", 2];

            private _weaponName = getText (configFile >> "CfgWeapons" >> _newWeapon >> "displayName");
            _text = format ["You found the supply data for the<br/> %1<br/> You have unlocked this weapon!", _weaponName];
        };
        case (MONEY):
        {
            private _money = ((round (random 50)) + (10 * tierWar)) * 100;
            _text = format ["You found some confidential data, you sold it for %1 on the black market!", _money];
            [0, _money] remoteExec ["A3A_fnc_resourcesFIA",2];
        };
    };
};

_text;
