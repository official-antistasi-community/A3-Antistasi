
params ["_mode"];

if (_mode == "pairs") exitWith {

    private _fnc_drawLineMarker = {
        params ["_pos1", "_pos2", "_name", "_weight"];
        private _mid = _pos1 vectorAdd _pos2 vectorMultiply 0.5;

        deleteMarkerLocal _name;
        private _lineMarker = createMarkerLocal [_name, _mid];
        _lineMarker setMarkerShapeLocal "RECTANGLE";
        _lineMarker setMarkerBrushLocal "SOLID";
        _lineMarker setMarkerColorLocal "ColorBlack";
        _lineMarker setMarkerDirLocal (_pos1 getDir _pos2);
        _lineMarker setMarkerSizeLocal [25, _mid distance2d _pos1];

        deleteMarkerLocal (_name + "wt");
        private _weightMarker = createMarkerLocal [_name + "wt", _mid];
        _weightMarker setMarkerShapeLocal "ICON";
        _weightMarker setMarkerTypeLocal "mil_dot";
        _weightMarker setMarkerTextLocal (_weight toFixed 3);
        _weightMarker setMarkerAlpha 0.75;
    };

    {
        [markerPos (_y#0), markerPos (_y#1), "rbp" + str _forEachIndex, _y#2] call _fnc_drawLineMarker;
    } forEach A3A_roadblockPairsHM;
};

if (_mode == "sites") exitWith {

    private _fnc_drawSiteMarker = {
        params ["_pos", "_text", "_color", "_name"];
        deleteMarkerLocal _name;
        private _textMarker = createMarkerLocal [_name, _pos];
        _textMarker setMarkerShapeLocal "ICON";
        _textMarker setMarkerTypeLocal "mil_dot";
        _textMarker setMarkerTextLocal _text;
        _textMarker setMarkerColorLocal _color;
        _textMarker setMarkerAlpha 0.75;
    };

    {
        private _text = if (_y#1 == "camp") then {_x} else {_y#3};
        private _color = [colorOccupants, colorInvaders] select (_y#2 == Invaders);
        [_y#0, _text, _color, "rbmark" + str _forEachIndex] call _fnc_drawSiteMarker;
    } forEach A3A_minorSitesHM;
};

/*
if (_mode == "sitesByLink") exitWith {


    {
        [_y#0, _x, "rbmark" + str _forEachIndex] call _fnc_drawRoadblockMarker;
    } forEach A3A_minorSitesHM;
};

if (_mode == "sitesByName") exitWith {


};
*/