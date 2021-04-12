params ["_vehicle", "_crewGroup", "_cargoGroup", "_posDestination", "_markerOrigin", "_landPosBlacklist"];

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

    Returns:
        _landPosBlacklist: ARRAY : The updated list of blocked positions
*/

private _landPos = [_posDestination, getPos _vehicle, false, _landPosBlacklist] call A3A_fnc_findSafeRoadToUnload;
private _posOrigin = getMarkerPos _markerOrigin;
_posOrigin set [2, 50];

switch (true) do
{
    case (_vehicle isKindOf "APC"):
    {
        {_x disableAI "MINEDETECTION"} forEach (units _crewGroup);

        //(units _groupX) joinSilent _crewGroup;
        //deleteGroup _groupX;
        //Dont unify these two groups, so the vehicle and the group can attack different targets
        _crewGroup spawn A3A_fnc_attackDrillAI;

        //Set up vehicle waypoints
        [getPos _vehicle, _landPos, _crewGroup] call A3A_fnc_WPCreate;
        private _vehWP0 = (wayPoints _crewGroup) select 0;
        _vehWP0 setWaypointBehaviour "SAFE";
        private _vehWP1 = _crewGroup addWaypoint [_landPos,count (wayPoints _crewGroup)];
        _vehWP1 setWaypointType "TR UNLOAD";
        _vehWP1 setWaypointBehaviour "AWARE";
        _vehWP1 setWaypointStatements ["true", "[vehicle this] call A3A_fnc_smokeCoverAuto"];
        private _vehWP2 = _crewGroup addWaypoint [_posDestination, count (wayPoints _crewGroup)];
        _vehWP2 setWaypointType "SAD";
        _vehWP2 setWaypointBehaviour "COMBAT";
        //God AI
        //_vehWP2 setWaypointStatements ["true","{if (side _x != side this) then {this reveal [_x,4]}} forEach allUnits"];

        //Set the waypoints for cargoGroup
        private _cargoWP0 = _cargoGroup addWaypoint [_landpos, 0];
        _cargoWP0 setWaypointType "GETOUT";
        _cargoWP0 setWaypointStatements ["true", "(group this) spawn A3A_fnc_attackDrillAI"];
        private _cargoWP1 = _cargoGroup addWaypoint [_posDestination, 1];
        _cargoWP1 setWaypointType "SAD";
        _cargoWP1 setWaypointBehaviour "COMBAT";
        _cargoWP1 setWaypointSpeed "FULL";

        //Link the waypoints
        _vehWP1 synchronizeWaypoint [_cargoWP0];

        //This keeps units from moving out of APC if disabled, do we want that?
        _vehicle allowCrewInImmobile true;
        [_vehicle,"APC"] spawn A3A_fnc_inmuneConvoy;
    };
    case (_vehicle isKindOf "Tank"):
    {
        {_x disableAI "MINEDETECTION"} forEach (units _crewGroup);

        //Assing the waypoints
        [getPos _vehicle, _posDestination, _crewGroup] call A3A_fnc_WPCreate;
        private _vehWP0 = (wayPoints _crewGroup) select 0;
        _vehWP0 setWaypointBehaviour "SAFE";

        private _vehWP1 = _crewGroup addWaypoint [_posDestination, count (waypoints _crewGroup)];
        _vehWP1 setWaypointType "SAD";
        _vehWP1 setWaypointBehaviour "COMBAT";
        //God AI
        //_vehWP1 setWaypointStatements ["true","{if (side _x != side this) then {this reveal [_x,4]}} forEach allUnits"];

        //This keeps units from moving out of tanks if disabled, do we want that?
        _vehicle allowCrewInImmobile true;
        [_vehicle,"Tank"] spawn A3A_fnc_inmuneConvoy;
    };
    case (_vehicle isKindOf "Plane"):
    {
        //Attack plane or drone
        private _vehWP0 = _crewGroup addWaypoint [_posDestination, 0];
        _vehWP0 setWaypointBehaviour "COMBAT";
        _vehWP0 setWaypointType "SAD";
        _crewGroup setCombatMode "RED";
    };
    case (_vehicle isKindOf "Helicopter" && {(typeof _vehicle) in vehTransportAir}):
    {
        //Transport helicopter
        _landPos = [_posDestination, 100, 150, 10, 0, 0.12, 0, [], [[0,0,0],[0,0,0]]] call BIS_fnc_findSafePos;

        {
            if(_x distance2D _landPos < 20) exitWith
            {
                _landPos = [0, 0, 0];
            };
        } forEach _landPosBlacklist;

        if !(_landPos isEqualTo [0,0,0]) then
        {
            _landPos set [2, 0];
            private _pad = createVehicle ["Land_HelipadEmpty_F", _landpos, [], 0, "NONE"];
            //Create despawn routine for heli pad
            [_pad, _vehicle] spawn
            {
                params ["_pad", "_heli"];
                waitUntil {sleep 60; (isNull _heli) || !(alive _heli)};
                deleteVehicle _pad;
            };
            _vehicle setVariable ["LandingPad", _pad, true];
            _vehicle setVariable ["PosDestination", _posDestination, true];
            _vehicle setVariable ["PosOrigin", _posOrigin, true];

            //Create the waypoints for the crewGroup
            private _vehWP0 = _crewGroup addWaypoint [_landpos, 0];
            _vehWP0 setWaypointType "MOVE";
            _vehWP0 setWaypointSpeed "FULL";
            _vehWP0 setWaypointCompletionRadius 150;
            _vehWP0 setWaypointBehaviour "CARELESS";

            [_vehicle, _landPos] spawn
            {
                params ["_vehicle", "_landPos"];
                waitUntil {sleep 1; (_vehicle distance2D _landPos) < 600};
                [_vehicle] spawn A3A_fnc_combatLanding
            };

            _landPosBlacklist pushBack _landPos;
        }
        else
        {
            if ((typeOf _vehicle) in vehFastRope) then
            {
                [_vehicle, _cargoGroup, _posDestination, _posOrigin, _crewGroup] spawn A3A_fnc_fastrope;
            }
            else
            {
                [_vehicle, _cargoGroup, _posDestination, _markerOrigin] spawn A3A_fnc_airdrop;
            };
        };
    };
    case (_vehicle isKindOf "Helicopter" && {!((typeof _vehicle) in vehTransportAir)}):
    {
        //Attack helicopter
        private _vehWP0 = _crewGroup addWaypoint [_posDestination, 0];
        _vehWP0 setWaypointBehaviour "AWARE";
        _vehWP0 setWaypointType "SAD";
    };
    case ((typeof _vehicle) in vehTransportAir && {!(_vehicle isKindOf "Helicopter")}):
    {
        //Dropship with para units
        [_vehicle, _cargoGroup, _posDestination, _markerOrigin] spawn A3A_fnc_airdrop;
    };
    default
    {
        //Move cargo group into crew group
        (units _cargoGroup) joinSilent _crewGroup;
        deleteGroup _cargoGroup;

        _crewGroup spawn A3A_fnc_attackDrillAI;

        //Unassign driver from being the group leader
        if (count units _crewGroup > 1) then
        {
            _crewGroup selectLeader (units _crewGroup select 1)
        };

        //Assign the waypoints
        [getPos _vehicle, _landPos, _crewGroup] call A3A_fnc_WPCreate;
        private _vehWP0 = (wayPoints _crewGroup) select 0;
        _vehWP0 setWaypointBehaviour "SAFE";

        private _vehWP1 = _crewGroup addWaypoint [_landPos, count (wayPoints _crewGroup)];
        _vehWP1 setWaypointType "GETOUT";

        private _vehWP2 = _crewGroup addWaypoint [_posDestination, count (wayPoints _crewGroup)];
        //Ever wondered why AI have instant pinpoint accuracy?
        //_vehWP2 setWaypointStatements ["true","{if (side _x != side this) then {this reveal [_x,4]}} forEach allUnits"];
        //We could add the UPSMON routines here
        _vehWP2 setWaypointType "SAD";
        _vehWP2 setWaypointBehaviour "COMBAT";
        [_vehicle,"Inf Truck."] spawn A3A_fnc_inmuneConvoy;
    };
};

_landPosBlacklist pushBack _landPos;
_landPosBlacklist;
