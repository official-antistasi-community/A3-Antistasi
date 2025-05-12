// Server-only

// ok, so this just shows info...

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_marker", "_client"];

private _titleStr = localize "STR_A3A_fn_init_cityinfo_title";

if (_marker == "") exitWith {
    private _popReb = 0;
    private _popOcc = 0;
    private _popDead = 0;
    private _pop = 0;
    {
        (server getVariable _x) params ["_numCiv", "", "_suppReb", "_suppOcc"];
        _pop = _pop + _numCiv;
        if (_x in destroyedSites) then { _popDead = _popDead + _numCiv; continue };
        _popReb = _popReb + (_numCiv * (_suppReb / 100));
        _popOcc = _popOcc + (_numCiv * (_suppOcc / 100));
    } forEach citiesX;
    _popReb = round _popReb;
    _popOcc = round _popOcc;

    private _text = format [localize "STR_A3A_fn_init_cityinfo_overview_1",
        _pop, _popReb, _popOcc, _popDead, FactionGet(occ,"name"), FactionGet(reb,"name"), getText (configfile >> "CfgWorlds" >> worldname >> "description")];
    [_titleStr, _text] remoteExecCall ["A3A_fnc_customHint", _client];
};

private _side = sidesX getVariable [_marker,sideUnknown];
private _faction = Faction(_side);
private _nameFaction = _faction get "name";
private _goodCount = 0;

private _text = call {
    if (_marker == "Synd_HQ") exitWith {
        format ["%1 HQ", FactionGet(reb,"name")];
    };
    if (_marker in citiesX) exitWith {
        if (_marker in destroyedSites) exitWith { format [localize "STR_A3A_fn_init_cityinfo_destr", _marker] };

        (server getVariable _marker) params ["_numCiv", "", "_suppReb", "_suppOcc"];
        private _text = format [localize "STR_A3A_fn_init_cityinfo_overview_2",
            _marker, _numCiv, _suppOcc, _suppReb, "%", FactionGet(occ,"name"), FactionGet(reb,"name")];

        private _power = [_marker] call A3A_fnc_getSideRadioTowerInfluence;
        private _powerName = if (_power == sideUnknown) then {"NONE"} else { Faction(_power) get "name" };
        format [[localize "STR_A3A_fn_init_cityinfo_influ", _text, _powerName];
    };
    if (_marker in airportsX) exitWith {
        _goodCount = 40;
        format [localize "STR_A3A_fn_init_cityinfo_airp_1", _nameFaction];
    };
    if (_marker in outposts) exitWith {
        _goodCount = 24;
        format [localize "STR_A3A_fn_init_cityinfo_goutp_2", _nameFaction];
    };
    if (_marker in seaports) exitWith {
        _goodCount = 20;
        format [localize "STR_A3A_fn_init_cityinfo_seap_1", _nameFaction];
    };
    if (_marker in resourcesX) exitWith {
        _goodCount = 16;
        if (_marker in destroyedSites) exitWith { format ["%1 Resource<br/>DESTROYED", _nameFaction] };
        format [localize "STR_A3A_fn_init_cityinfo_reso_1", _nameFaction];
    };
    if (_marker in factories) exitWith {
        _goodCount = 16;
        if (_marker in destroyedSites) exitWith { format ["%1 Factory<br/>DESTROYED", _nameFaction] };
        format [localize "STR_A3A_fn_init_cityinfo_fact_1", _nameFaction];
    };
    if (_marker in outpostsFIA) exitWith {
        format ["%1 %2", _nameFaction, ["Watchpost", "Roadblock"] select isOnRoad markerPos _marker];
    };
};

// Add on the garrison info if it's rebel
if (_side == teamPlayer) then {
    private _garrInfo = [_marker] call A3A_fnc_garrisonInfo;
    _text = format ["%1<br/><br/>%2", _text, _garrInfo];
} else {
    private _troopCount = A3A_garrison get _marker get "troops";
    private _garrLevel = if (_troopCount >= _goodCount) then {
        localize "STR_A3A_fn_garrison_getGarrisonStatus_good"
    } else {
        if (_troopCount >= _goodCount/2) then {
            localize "STR_A3A_fn_garrison_getGarrisonStatus_weakened"
        } else {
            localize "STR_A3A_fn_garrison_getGarrisonStatus_decimated"
        };
    };
    _text = format ["%1<br/>Garrison: %2", _text, _garrLevel];
};

[_titleStr, _text] remoteExecCall ["A3A_fnc_customHint", _client];
