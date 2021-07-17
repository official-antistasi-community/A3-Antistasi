/*
Maintainer: Wurzel0701
    Activates undercover if possible and controls its status till undercover is broken/ended

Arguments:
    <NIL>

Return Value:
    <NIL>

Scope: Local
Environment: Scheduled
Public: Yes
Dependencies:
    <OBJECT> A3A_faction_civ
    <ARRAY> reportedVehs
    <ARRAY> controlsX
    <ARRAY> airportsX
    <ARRAY> outposts
    <ARRAY> seaports
    <ARRAY> undercoverVehicles
    <BOOL> A3A_hasACE
    <SIDE> Occupants
    <STRING> civHeli
    <ARRAY> civBoats
    <SIDE> Invaders
    <ARRAY> detectionAreas
    <NAMESPACE> sidesX
    <SIDE> teamPlayer
    <NUMBER> aggressionOccupants
    <NUMBER> aggressionInvaders
    <NUMBER> tierWar

Example:
    [] call A3A_fnc_goUndercover;
*/
#include "..\..\Includes\common.inc"
FIX_LINE_NUMBERS()

private _result = [] call A3A_fnc_canGoUndercover;

if(!(_result select 0)) exitWith
{
    if((_result select 1) == "Spotted by enemies") then
    {
        if !(isNull (objectParent player)) then
        {
            reportedVehs pushBackUnique (objectParent player);
            publicVariable "reportedVehs";
            {
                if ((isPlayer _x) && (captive _x)) then
                {
                    [_x, false] remoteExec["setCaptive"];
                    _x setCaptive false;
                };
            } forEach ((crew(objectParent player)) + (assignedCargo(objectParent player)) - [player]);
        };
    };
};

[localize "STR_antistasi_undercover_ON", 0, 0, 4, 0, 0, 4] spawn bis_fnc_dynamicText;

[player, true] remoteExec["setCaptive", 0, player];
player setCaptive true;
[] spawn A3A_fnc_statistics;
if (player == leader group player) then
{
    {
        if ((!isplayer _x) && (local _x) && (_x getVariable["owner", _x] == player)) then
        {
            [_x] spawn A3A_fnc_undercoverAI;
        };
    } forEach units group player;
};

private _roadblocks = controlsX select {isOnRoad(getMarkerPos _x)};
private _secureBases = airportsX + outposts + seaports + _roadblocks;
private _isInRoadblock = false;
private _reason = "";

while {_reason == ""} do
{
    private _healingTarget = objNull;
    if !(isNil {player getVariable "ace_medical_treatment_endInAnim"}) then
    {
        _healingTarget = currentAceTarget;
    };

    sleep 1;

    if (!captive player) exitWith
    {
        _reason = "Reported";
    };

    private _veh = objectParent player;
    if !(isNull _veh) then
    {
        private _vehType = typeOf _veh;
        if (!(_vehType in undercoverVehicles)) exitWith
        {
            _reason = "VNoCivil"
        };

        if (_veh in reportedVehs) exitWith
        {
            _reason = "VCompromised"
        };

        if (A3A_hasACE) then
        {
            if (((position player nearObjects["DemoCharge_Remote_Ammo", 5]) select 0) mineDetectedBy Occupants) exitWith
            {
                _reason = "SpotBombTruck";
            };
            if (((position player nearObjects["SatchelCharge_Remote_Ammo", 5]) select 0) mineDetectedBy Occupants) exitWith
            {
                _reason = "SpotBombTruck";
            };
        };

        if(_reason != "") exitWith {};

        if(_veh getVariable ["NoFlyZoneDetected", ""] != "") exitWith
        {
            _reason = "NoFly";
        };

        if ((_vehType != civHeli) && (!(_vehType in civBoats))) then
        {
            if (!(isOnRoad position _veh) && {count (_veh nearRoads 50) == 0}) then
            {
                if ({((side _x == Invaders) || (side _x == Occupants)) && ((_x knowsAbout player > 1.4) || (_x distance player < 350))} count allUnits > 0) then
                {
                    _reason = "Highway";
                };
            };

            if(_reason != "") exitWith {};

            private _base = [_secureBases, player] call BIS_fnc_nearestPosition;
            private _onDetectionMarker = (detectionAreas findIf {player inArea _x} != -1);
            private _onBaseMarker = (player inArea _base);
            private _baseSide = (sidesX getVariable [_base, sideUnknown]);
            if ((_onBaseMarker || _onDetectionMarker) && (_baseSide != teamPlayer)) then
            {
                if !(_isInRoadblock) then
                {
                    private _aggro = if (_baseSide == Occupants) then {aggressionOccupants + (tierWar * 10)} else {aggressionInvaders + (tierWar * 10)};
                    //Probability of being spotted. Unless we're in an airfield - then we're always spotted.
                    if (_base in airportsX || _onDetectionMarker || random 100 < _aggro) then
                    {
                        if (_base in _roadblocks) then
                        {
                            _reason = "distanceX";
                        }
                        else
                        {
                            _reason = "Control";
                        };
                    }
                    else
                    {
                        _isInRoadblock = true;
                    };
                };
            }
            else
            {
                _isInRoadblock = false;
            };
        };
    }
    else
    {
        if (_healingTarget != objNull && {side _healingTarget != civilian && {_healingTarget isKindOf "Man"}}) exitWith
        {
            if ({((side _x == Invaders) or(side _x == Occupants)) and((_x knowsAbout player > 1.4) or(_x distance player < 350))} count allUnits > 0) then
            {
                _reason = "BadMedic2";
            }
            else
            {
                _reason = "BadMedic";
            };
        };
        if ((primaryWeapon player != "") || (secondaryWeapon player != "") || (handgunWeapon player != "") || (vest player != "") || (getNumber(configfile >> "CfgWeapons" >> headgear player >> "ItemInfo" >> "HitpointsProtectionInfo" >> "Head" >> "armor") > 2) || (hmd player != "") || (!(uniform player in (A3A_faction_civ getVariable "uniforms")))) exitWith
        {
            if ({((side _x == Invaders) or (side _x == Occupants)) and ((_x knowsAbout player > 1.4) or (_x distance player < 350))} count allUnits > 0) then
            {
                _reason = "clothes2"
            }
            else
            {
                _reason = "clothes"
            };
        };
        if (dateToNumber date < (player getVariable ["compromised", 0])) exitWith
        {
            _reason = "Compromised";
        };
    };
};

if (captive player) then
{
    [player, false] remoteExec["setCaptive"];
    player setCaptive false;
};

if !(isNull (objectParent player)) then
{
    {
        if (isPlayer _x) then
        {
            [_x, false] remoteExec["setCaptive", 0, _x];
            _x setCaptive false;
        }
    } forEach((assignedCargo(vehicle player)) + (crew(vehicle player)) - [player]);
};

[localize "STR_antistasi_undercover_OFF", 0, 0, 4, 0, 0, 4] spawn bis_fnc_dynamicText;
[] spawn A3A_fnc_statistics;

switch (_reason) do
{
    case "Reported":
    {
        [localize "STR_antistasi_undercover", localize "STR_antistasi_undercover_RepSpot"] call A3A_fnc_customHint;
        if (vehicle player != player) then
        {
            reportedVehs pushBackUnique (objectParent player);
            publicVariable "reportedVehs";
        }
        else
        {
            player setVariable["compromised", (dateToNumber[date select 0, date select 1, date select 2, date select 3, (date select 4) + 30])];
        };
    };
    case "VNoCivil":
    {
        [localize "STR_antistasi_undercover", localize "STR_antistasi_undercover_noCivVeh"] call A3A_fnc_customHint;
    };
    case "VCompromised":
    {
        [localize "STR_antistasi_undercover", localize "STR_antistasi_undercover_repVeh"] call A3A_fnc_customHint;
    };
    case "SpotBombTruck":
    {
        [localize "STR_antistasi_undercover", localize "STR_antistasi_undercover_explo"] call A3A_fnc_customHint;
        reportedVehs pushBackUnique (objectParent player);
        publicVariable "reportedVehs";
    };
    case "Highway":
    {
        [localize "STR_antistasi_undercover", localize "STR_antistasi_undercover_road"] call A3A_fnc_customHint;
        reportedVehs pushBackUnique (objectParent player);
        publicVariable "reportedVehs";
    };
    case "clothes":
    {
        [localize "STR_antistasi_undercover", localize "STR_antistasi_undercover_info"] call A3A_fnc_customHint;
    };
    case "clothes2":
    {
        [localize "STR_antistasi_undercover", localize "STR_antistasi_undercover_info_wanted"] call A3A_fnc_customHint;
        player setVariable["compromised", dateToNumber[date select 0, date select 1, date select 2, date select 3, (date select 4) + 30]];
    };
    case "BadMedic":
    {
        [localize "STR_antistasi_undercover", localize "STR_antistasi_undercover_heal"] call A3A_fnc_customHint;
    };
    case "BadMedic2":
    {
        [localize "STR_antistasi_undercover", localize "STR_antistasi_undercover_heal_wanted"] call A3A_fnc_customHint;
        player setVariable["compromised", dateToNumber[date select 0, date select 1, date select 2, date select 3, (date select 4) + 30]];
    };
    case "Compromised":
    {
        [localize "STR_antistasi_undercover", localize "STR_antistasi_undercover_vehStill"] call A3A_fnc_customHint;
    };
    case "distanceX":
    {
        [localize "STR_antistasi_undercover", localize "STR_antistasi_undercover_zone_gotten"] call A3A_fnc_customHint;
        if !(isNull objectParent player) then
        {
            reportedVehs pushBackUnique (objectParent player);
            publicVariable "reportedVehs";
        }
        else
        {
            player setVariable["compromised", (dateToNumber[date select 0, date select 1, date select 2, date select 3, (date select 4) + 30])];
        };
    };
    case "NoFly":
    {
        private _veh = objectParent player;
        private _detectedBy = _veh getVariable "NoFlyZoneDetected";
        [localize "STR_antistasi_undercover", format [localize "STR_antistasi_undercover_zoneAir", [_detectedBy] call A3A_fnc_localizar]] call A3A_fnc_customHint;
        reportedVehs pushBackUnique _veh;
        publicVariable "reportedVehs";
        _veh setVariable ["NoFlyZoneDetected", nil, true];
    };
    case "Control":
    {
        [localize "STR_antistasi_undercover", localize "STR_antistasi_undercover_recognised"] call A3A_fnc_customHint;
        reportedVehs pushBackUnique(vehicle player);
        publicVariable "reportedVehs";
    };
    default
    {
        Error_1("Unknown reason given, was %1", _reason);
        [localize "STR_antistasi_undercover", localize "STR_antistasi_undercover_error"] call A3A_fnc_customHint;
    };
};
