#include "..\..\Includes\common.inc"
FIX_LINE_NUMBERS()
// Create a new rebel unit in a garrison that's already spawned
private _groupData = FactionGet(reb,"groups");
_markerX = _this select 0;
_typeX = _this select 1;
_positionX = getMarkerPos _markerX;
if (_typeX isEqualType "") then {
	// Select a suitable group from the current garrison for this unit
    _groups = if (_typeX == (_groupData get "staticCrew")) then {[]} else {
        allGroups select {
            (leader _x getVariable ["markerX",""] == _markerX)
            and (count units _x < 8) and (vehicle (leader _x) == leader _x)
            and (side _x == teamPlayer)				// can happen with surrendered enemy garrison
        };
    };

    _groupX = if (_groups isEqualTo []) then {
        createGroup teamPlayer
    } else {
        _groups select 0;
    };

    _unit = [_groupX, _typeX, _positionX, [], 0, "NONE"] call A3A_fnc_createUnit;
    [_unit,_markerX] call A3A_fnc_FIAinitBases;
    if (_typeX isEqualTo (_groupData get "Mil")) then { [_markerX] remoteExec ["A3A_fnc_updateRebelStatics", 2] };

    if (_typeX == (_groupData get "staticCrew")) then {
    private _veh = FactionGet(reb,"staticMortar") createVehicle _positionX;
    _nul=[_veh] execVM "scripts\UPSMON\MON_artillery_add.sqf";//TODO need delete UPSMON link
    _unit assignAsGunner _veh;
    _unit moveInGunner _veh;
    [_veh, teamPlayer] call A3A_fnc_AIVEHinit;
    };

    if (_groups isEqualTo []) then {
        _nul = [leader _groupX, _markerX, "SAFE","SPAWNED","NOVEH2","NOFOLLOW"] execVM "scripts\UPSMON.sqf";//TODO need delete UPSMON link
    };

    [_unit,_markerX] spawn {
        private _groupData = FactionGet(reb,"groups");
        private _unit = _this select 0;
        private _markerX = _this select 1;
        waitUntil {sleep 1; (spawner getVariable _markerX == 2)};
        if (alive _unit) then {
            private _groupX = group _unit;
            if ((_unit getVariable "unitType") isEqualTo (_groupData get "staticCrew")) then {deleteVehicle (vehicle _unit)};
            deleteVehicle _unit;
            if (count units _groupX == 0) then {deleteGroup _groupX};
        };
    };
};
