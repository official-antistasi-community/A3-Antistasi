// Server-only

// ok, so this just shows info...

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_marker", "_client"];

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

    private _text = format ["%7<br/><br/>Total pop: %1<br/>%6 Support: %2<br/>%5 Support: %3 <br/><br/>Murdered Pop: %4<br/><br/>Click on the zone",
        _pop, _popReb, _popOcc, _popDead, FactionGet(occ,"name"), FactionGet(reb,"name"), getText (configfile >> "CfgWorlds" >> worldname >> "description")];
    ["City Information", _text] remoteExecCall ["A3A_fnc_customHint", _client];
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
        if (_marker in destroyedSites) exitWith { format ["%1<br/><br/>DESTROYED", _marker] };

        (server getVariable _marker) params ["_numCiv", "", "_suppReb", "_suppOcc"];
        private _text = format ["%1<br/><br/>Pop %2<br/>%6 Support: %3 %5<br/>%7 Support: %4 %5",
            _marker, _numCiv, _suppOcc, _suppReb, "%", FactionGet(occ,"name"), FactionGet(reb,"name")];

        private _power = [_marker] call A3A_fnc_getSideRadioTowerInfluence;
        private _powerName = if (_power == sideUnknown) then {"NONE"} else { Faction(_power) get "name" };
        format ["%1<br/>Influence: %2", _text, _powerName];
    };
    if (_marker in airportsX) exitWith {
        _goodCount = 40;
        format ["%1 Airport", _nameFaction];
    };
    if (_marker in outposts) exitWith {
        _goodCount = 24;
        format ["%1 Grand Outpost", _nameFaction];
    };
    if (_marker in seaports) exitWith {
        _goodCount = 20;
        format ["%1 Seaport", _nameFaction];
    };
    if (_marker in resourcesX) exitWith {
        _goodCount = 16;
        if (_marker in destroyedSites) exitWith { format ["%1 Resource<br/>DESTROYED", _nameFaction] };
        format ["%1 Resource", _nameFaction];
    };
    if (_marker in factories) exitWith {
        _goodCount = 16;
        if (_marker in destroyedSites) exitWith { format ["%1 Factory<br/>DESTROYED", _nameFaction] };
        format ["%1 Factory", _nameFaction];
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
    private _garrLevel = if (_troopCount >= _goodCount) then {"Good"} else { if (_troopCount >= _goodCount/2) then {"Weakened"} else {"Decimated"} };
    _text = format ["%1<br/>Garrison: %2", _text, _garrLevel];
};

["City Information", _text] remoteExecCall ["A3A_fnc_customHint", _client];
