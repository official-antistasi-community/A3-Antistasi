/*  Create the logic for attacking units, how different units should attack and behave

    Execution on: HC or Server

    Scope: Internal

    Parameters:
        _vehicle: OBJECT : The vehicle that gets the order
        _crewGroup: GROUP : The group of crew units of _vehicle
        _cargoGroup: GROUP : The group of cargo units of _vehicle, grpNull if none
        _posDestination: POSITION : The position of the target
        _markerOrigin: STRING : The marker from which the units are send
        _landPosBlacklist: ARRAY : A list of already blocked positions
        _seaPath: ARRAY : Optional, needed for boats. Path of positions from landing point to deep sea

    Returns:
        _landPosBlacklist: ARRAY : The updated list of blocked positions
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
params ["_vehicle", "_crewGroup", "_cargoGroup", "_posDestination", "_markerOrigin", "_landPosBlacklist", "_seaPath"];


private _vehType = typeof _vehicle;
if (_vehicle isKindOf "Air") exitWith
{
    if (_vehType in FactionGet(all,"vehiclesHelisTransport") + FactionGet(all,"vehiclesHelisLight")) exitWith
    {
        //Transport helicopter
        _landPos = [_posDestination, 200, 400, 10, 0, 0.12, 0, [], [[0,0,0],[0,0,0]]] call BIS_fnc_findSafePos;
        private _posOrigin = getMarkerPos _markerOrigin;
        _posOrigin set [2, 50];

        {
            if(_x distance2D _landPos < 20) exitWith { _landPos = [0, 0, 0] };
        } forEach _landPosBlacklist;

        if !(_landPos isEqualTo [0,0,0]) then
        {
            _landPos set [2, 0];
            _landPosBlacklist pushBack _landPos;
            [_vehicle, _crewGroup, _cargoGroup, _posDestination, _posOrigin, _landPos] spawn A3A_fnc_combatLanding;
        }
        else
        {
            if ((typeOf _vehicle) in vehFastRope) then {
                [_vehicle, _cargoGroup, _posDestination, _posOrigin, _crewGroup] spawn A3A_fnc_fastrope;
            } else {
                [_vehicle, _cargoGroup, _posDestination, _markerOrigin] spawn A3A_fnc_paradrop;
            };
        };
    };
    if (_vehType in FactionGet(all,"vehiclesHelisAttack") + FactionGet(all,"vehiclesHelisLightAttack")) exitWith 
    {
        //Attack helicopter
        [_vehicle, _crewGroup, _posDestination] spawn A3A_fnc_attackHeli;
    };
    if (_vehType in FactionGet(all,"vehiclesTransportAir")) exitWith
    {
        //Dropship with para units
        [_vehicle, _cargoGroup, _posDestination, _markerOrigin] spawn A3A_fnc_paradrop;
    };

    Error_1("Obsolete/unidentified vehicle type %1", _vehType);
    //Attack plane or drone - should be unused now?
    private _vehWP0 = _crewGroup addWaypoint [_posDestination, 0];
    _vehWP0 setWaypointBehaviour "COMBAT";
    _vehWP0 setWaypointType "SAD";
    _crewGroup setCombatMode "RED";
    _landPosBlacklist;

};

if (_vehicle isKindOf "Ship") then {

    private _isAttack = typeOf _vehicle in (A3A_faction_all get "vehiclesGunBoats");
    _vehicle setVariable ["A3A_shipSpawnPos", getPosATL _vehicle];

    if (!isNull _cargoGroup) then {
        private _sideDir = _seaPath#0 vectorFromTo _seaPath#1;
        _sideDir = vectorNormalized [_sideDir#1, -(_sideDir#0), 0];
        if (random 1 < 0.5) then { _sideDir = _sideDir vectorMultiply -1 };
        
        // check along the coast until we find an unused location
        private _landPos = _seaPath#1;
        while { _landPosBlacklist inAreaArray [_landPos, 10, 10] isNotEqualTo [] } do {
            _landPos = _landPos vectorAdd (_sideDir vectorMultiply 15);
        };
        _landPosBlacklist pushBack _landPos;

        private _vehWP0 = _crewGroup addWaypoint [ASLtoATL _landPos, 0];
        _vehWP0 setWaypointType "TR UNLOAD";
        //_vehWP0 setWaypointCompletionRadius 200;
        _vehWP0 setWaypointBehaviour "AWARE";
        if !(_isAttack) then { _vehWP0 setWaypointStatements ["true","if !(local this) exitWith {}; [group this] spawn A3A_fnc_enemyReturnToBase"] };
    };

    if (_isAttack) then {
        private _vehWP1 = _crewGroup addWaypoint [ASLtoATL (_seaPath#2), 0];
        _vehWP1 setWaypointType "SAD";
        _vehWP1 setWaypointBehaviour "COMBAT";
    };

    private _cargoWP1 = _cargoGroup addWaypoint [_posDestination, 0];
}
else            // ground vehicle
{
    private _typeName = call {
        if (_vehType in FactionGet(all,"vehiclesTanks")) exitWith {"Tank"};
        if (_vehType in FactionGet(all,"vehiclesLightTanks")) exitWith {"Tank"};
        if (_vehType in FactionGet(all,"vehiclesHeavyTanks")) exitWith {"Tank"};
        if (_vehType in FactionGet(all,"vehiclesAA")) exitWith {"AA"};
        if (_vehType in FactionGet(all,"vehiclesArmor"))  exitWith {"APC"};
        if (_vehType in FactionGet(all,"vehiclesTrucks")) exitWith {"Truck"};
        "MRAP";
    };

    if (isNull _cargoGroup) exitWith
    {
        // Vehicle has no passengers, just kill stuff
        {_x disableAI "MINEDETECTION"} forEach (units _crewGroup);
        _vehicle allowCrewInImmobile true;

        //Adding the waypoints
        [getPosATL _vehicle, _posDestination, _crewGroup] call A3A_fnc_WPCreate;

        // Turn final waypoint into SAD
        private _attackWP = [_crewGroup, count waypoints _crewGroup - 1];
        _attackWP setWaypointType "SAD";
        _attackWP setWaypointBehaviour "COMBAT";

        [_vehicle, _typeName] spawn A3A_fnc_inmuneConvoy;
    };

    if (isNull gunner _vehicle and count units _cargoGroup < 4) exitWith
    {
        // Vehicle has no weapons(?) and small cargo, merge crew group into cargo group
        (units _crewGroup) joinSilent _cargoGroup;
        deleteGroup _crewGroup;
        _cargoGroup selectLeader driver _vehicle;

        //Create the path waypoints
        private _landPos = [_posDestination, getPosATL _vehicle, false, _landPosBlacklist] call A3A_fnc_findSafeRoadToUnload;
        _landPosBlacklist pushBack _landPos;
        [getPosATL _vehicle, _landPos, _cargoGroup] call A3A_fnc_WPCreate;

        //Turn final waypoint into disembark. Should still be behaviour SAFE...
        private _dismountWP = [_cargoGroup, count waypoints _cargoGroup - 1];
        //_dismountWP setWaypointType "GETOUT";         // better to leave it as move? GETOUT is pretty busted
        _dismountWP setWaypointStatements ["true", "if !(local this) exitWith {}; (group this) leaveVehicle (assignedVehicle this); (group this) spawn A3A_fnc_attackDrillAI"];

        private _attackWP = _cargoGroup addWaypoint [_posDestination, 0];
        _attackWP setWaypointBehaviour "AWARE";

        [_vehicle, _typeName] spawn A3A_fnc_inmuneConvoy;
    };

    if (count units _crewGroup == 1) exitWith
    {
        // driver + large cargo. Unload and RTB

        //Set up vehicle waypoints
        private _landPos = [_posDestination, getPosATL _vehicle, false, _landPosBlacklist] call A3A_fnc_findSafeRoadToUnload;
        _landPosBlacklist pushBack _landPos;
        [getPosATL _vehicle, _landPos, _crewGroup] call A3A_fnc_WPCreate;

        //Turn final waypoint into disembark. Should still be behaviour SAFE...
        private _vehWP0 = [_crewGroup, count waypoints _crewGroup - 1];
        _vehWP0 setWaypointType "TR UNLOAD";
        _vehWP0 setWaypointBehaviour "AWARE";
        _vehWP0 setWaypointStatements ["true", "if !(local this) exitWith {}; [group this] spawn A3A_fnc_enemyReturnToBase"];

        //Set the waypoints for cargoGroup
        private _cargoWP0 = _cargoGroup addWaypoint [_landpos, 0];
        //_cargoWP0 setWaypointType "GETOUT";
        _cargoWP0 setWaypointStatements ["true", "if !(local this) exitWith {}; (group this) leaveVehicle (assignedVehicle this); (group this) spawn A3A_fnc_attackDrillAI"];
        private _cargoWP1 = _cargoGroup addWaypoint [_posDestination, 0];
        _cargoWP1 setWaypointBehaviour "AWARE";
        //Link the dismount waypoints
        _vehWP0 synchronizeWaypoint [_cargoWP0];

        [_vehicle, _typeName] spawn A3A_fnc_inmuneConvoy;
    };

    if (true) exitWith
    {
        // weapons + separate cargo units
        {_x disableAI "MINEDETECTION"} forEach (units _crewGroup);
        if (_vehType in FactionGet(all,"vehiclesArmor")) then { _vehicle allowCrewInImmobile true };

        //Set up vehicle waypoints
        private _landPos = [_posDestination, getPosATL _vehicle, false, _landPosBlacklist] call A3A_fnc_findSafeRoadToUnload;
        _landPosBlacklist pushBack _landPos;
        [getPosATL _vehicle, _landPos, _crewGroup] call A3A_fnc_WPCreate;

        //Turn final waypoint into disembark. Should still be behaviour SAFE...
        private _vehWP0 = [_crewGroup, count waypoints _crewGroup - 1];
        _vehWP0 setWaypointType "TR UNLOAD";
        _vehWP0 setWaypointBehaviour "AWARE";
        _vehWP0 setWaypointStatements ["true", "if !(local this) exitWith {}; [vehicle this] call A3A_fnc_smokeCoverAuto"];
        private _vehWP1 = _crewGroup addWaypoint [_posDestination, 0];
        _vehWP1 setWaypointType "SAD";
        _vehWP1 setWaypointBehaviour "COMBAT";

        //Set the waypoints for cargoGroup
        private _cargoWP0 = _cargoGroup addWaypoint [_landpos, 0];
        //_cargoWP0 setWaypointType "GETOUT";
        _cargoWP0 setWaypointStatements ["true", "if !(local this) exitWith {}; (group this) leaveVehicle (assignedVehicle this); (group this) spawn A3A_fnc_attackDrillAI"];
        private _cargoWP1 = _cargoGroup addWaypoint [_posDestination, 0];
        _cargoWP1 setWaypointBehaviour "AWARE";
        //Link the dismount waypoints
        _vehWP0 synchronizeWaypoint [_cargoWP0];

        [_vehicle, _typeName] spawn A3A_fnc_inmuneConvoy;
    };
};

_landPosBlacklist;
