#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

Info("InitBases started");

// This is called pre-setup so that the map looks vaguely plausible

private _fnc_initMarkerList =
{
	params ["_mrkCSAT", "_markers", "_mrkType", "_mrkText", ["_useSideName", false]];

	{
        private _isInvader = _x in _mrkCSAT;
		private _pos = getMarkerPos _x;
		private _mrkD = createMarkerLocal [format ["Dum%1", _x], _pos];
		_mrkD setMarkerShapeLocal "ICON";

        if (_x in airportsX) then {
            _mrkD setMarkerTypeLocal (["flag_NATO", "flag_CSAT"] select _isInvader);
            _mrkD setMarkerColorLocal "Default";
        } else {
            _mrkD setMarkerTypeLocal _mrkType;
            _mrkD setMarkerColorLocal ([colorOccupants, colorInvaders] select _isInvader);
        };
        _mrkD setMarkerText format [_mrkText, ["Occupant", "Invader"] select _isInvader];

        // arguable whether this should be done here? could be delayed until game start
        sidesX setVariable [_x, [Occupants, Invaders] select _isInvader, true];
        garrison setVariable [_x, [], true];
		if (_useSideName) then {             // in this case it's an airport or outpost
			killZones setVariable [_x, [], true];
			server setVariable [_x, 0, true];           // TODO: check if these two need to be global
        };

	} forEach _markers;
};


private _mapInfoRoot = if (isClass (missionConfigFile/"A3A"/"mapInfo"/toLower worldName)) then {missionConfigFile} else {configFile};
getArray (_mapInfoRoot/"A3A"/"mapInfo"/toLower worldName/"garrison") params ["", ["_mrkCSAT",[],[[]]], "", ["_controlsCSAT",[],[[]]]];

[_mrkCSAT, airportsX, "flag_NATO", localize "STR_A3A_fn_init_initBases_airbase", true] call _fnc_initMarkerList;
[_mrkCSAT, resourcesX, "loc_rock", localize "STR_A3A_fn_init_initBases_resources"] call _fnc_initMarkerList;
[_mrkCSAT, factories, "u_installation", localize "STR_A3A_fn_init_initBases_factory"] call _fnc_initMarkerList;
[_mrkCSAT, outposts, "loc_bunker", localize "STR_A3A_fn_init_initBases_outpost", true] call _fnc_initMarkerList;
[_mrkCSAT, seaports, "b_naval", localize "STR_A3A_fn_init_initBases_seaPort"] call _fnc_initMarkerList;

Info("InitBases completed");
