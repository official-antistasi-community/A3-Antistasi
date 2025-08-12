/*  Shows the intercepted radio message to the players

    Execution on: Server

    Scope: Internal

    Parameters:
        _reveal: NUMBER : 0-1, determines how much info will be revealed
        _position: POSITION : The position where the support is called to
        _side: SIDE : The side which called in the support
        _supportType: STRING : The type string of the support (not the support name)
        _markerType: NUMBER or OBJECT : Either the radius (for area attacks) or target object for the marker
        _markerLifeTime: NUMBER : Time in seconds for the marker to survive

    Returns:
        Nothing
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_reveal", "_position", "_side", "_supportType", "_markerType", "_markerLifeTime"];

//Nothing will be revealed
if(_reveal <= 0.2) exitWith {};

private _text = "";
private _markerText = "";
private _sideName = if(_side == Occupants) then {FactionGet(occ,"name")} else {FactionGet(inv,"name")};
if (_reveal <= 0.5) then
{
    //Side and call is reveal
    _text = format [localize "STR_A3A_fn_support_showIntSPTCll_execute", _sideName];
}
else
{
    switch (toupper _supportType) do
    {
        case ("QRFLAND"):
        {
            _text = format [localize "STR_A3A_fn_support_showIntSPTCll_QRFLANDLONG", _sideName];
            _markerText = localize "STR_A3A_fn_support_showIntSPTCll_QRFLANDTITLE";
        };
        case ("QRFAIR"):
        {
            _text = format [localize "STR_A3A_fn_support_showIntSPTCll_QRFAIRLONG", _sideName];
            _markerText = localize "STR_A3A_fn_support_showIntSPTCll_QRFAIRTITLE";
        };
        case ("AIRSTRIKE"):
        {
            _text = format [localize "STR_A3A_fn_support_showIntSPTCll_AIRSTRIKELONG", _sideName];
            _markerText = localize "STR_A3A_fn_support_showIntSPTCll_AIRSTRIKETITLE";
        };
        case ("ARTILLERY"):
        {
            _text = format [localize "STR_A3A_fn_support_showIntSPTCll_ARTILLERYLONG", _sideName];
            _markerText = localize "STR_A3A_fn_support_showIntSPTCll_ARTILLERYTITLE";
        };
        case ("MORTAR"):
        {
            _text = format [localize "STR_A3A_fn_support_showIntSPTCll_MORTARLONG", _sideName];
            _markerText = localize "STR_A3A_fn_support_showIntSPTCll_MORTARTITLE";
        };
        case ("ORBITALSTRIKE"):
        {
            _text = format [localize "STR_A3A_fn_support_showIntSPTCll_ORBITALSTRIKELONG", _sideName];
            _markerText = localize "STR_A3A_fn_support_showIntSPTCll_ORBITALSTRIKETITLE";
        };
        case ("CRUISEMISSILE"):
        {
            _text = format [localize "STR_A3A_fn_support_showIntSPTCll_CRUISEMISSILELONG", _sideName];
            _markerText = localize "STR_A3A_fn_support_showIntSPTCll_CRUISEMISSILETITLE";
        };
        case ("SAM"):
        {
            _text = format [localize "STR_A3A_fn_support_showIntSPTCll_SAMLONG", _sideName];
            _markerText = localize "STR_A3A_fn_support_showIntSPTCll_SAMTITLE";
        };
        case ("CARPETBOMBS"):
        {
            _text = format [localize "STR_A3A_fn_support_showIntSPTCll_CARPETBOMBSLONG", _sideName];
            _markerText = localize "STR_A3A_fn_support_showIntSPTCll_CARPETBOMBSTITLE";
        };
        case ("ASF"):
        {
            _text = format [localize "STR_A3A_fn_support_showIntSPTCll_ASFLONG", _sideName];
            _markerText = localize "STR_A3A_fn_support_showIntSPTCll_ASFTITLE";
        };
        case ("CAS"):
        {
            _text = format [localize "STR_A3A_fn_support_showIntSPTCll_CASLONG", _sideName];
            _markerText = localize "STR_A3A_fn_support_showIntSPTCll_CASTITLE";
        };
        case ("GUNSHIP"):
        {
            _text = format [localize "STR_A3A_fn_support_showIntSPTCll_GUNSHIPLONG", _sideName];
            _markerText = localize "STR_A3A_fn_support_showIntSPTCll_GUNSHIPTITLE";
        };
        default
        {
            _text = format [localize "STR_A3A_fn_support_showIntSPTCll_UNKNOWNLONG", _sideName, _supportType];
            _markerText = format [localize "STR_A3A_fn_support_showIntSPTCll_UNKNOWNTITLE", _supportType];
        };
    };

    if(_reveal < 0.8) exitWith {};

    _text = [_text,localize "STR_A3A_fn_support_showIntSPTCll_TARGET"] joinString " ";
    private _targetMarker = format ["%1_target_%2", _supportType, A3A_supportMarkerCount];
    private _textMarker = format ["%1_text_%2", _supportType, A3A_supportMarkerCount];
    A3A_supportMarkerCount = A3A_supportMarkerCount + 1;

    if (_markerType isEqualType 0) then
    {
        createMarkerLocal [_targetMarker, _position];
        _targetMarker setMarkerShapeLocal "ELLIPSE";
        _targetMarker setMarkerBrushLocal "Grid";
        _targetMarker setMarkerSizeLocal [_markerType, _markerType];        // actually a radius
        _targetMarker setMarkerColorLocal (if(_side == Occupants) then { colorOccupants } else { colorInvaders });
        _targetMarker setMarkerAlpha 1;

        createMarkerLocal [_textMarker, _position];
        _textMarker setMarkerShapeLocal "ICON";
        _textMarker setMarkerTypeLocal "mil_dot";
        _textMarker setMarkerTextLocal _markerText;
        _textMarker setMarkerAlpha 0.75;

        [_textMarker, _targetMarker, _markerLifeTime] spawn {
            params ["_textMarker", "_targetMarker", "_lifeTime"];
            sleep _lifeTime;
            deleteMarker _textMarker;
            deleteMarker _targetMarker;
        };
    }
    else
    {
        createMarkerLocal [_textMarker, _position];
        _textMarker setMarkerShapeLocal "ICON";
        _textMarker setMarkerTypeLocal "mil_objective";
        _textMarker setMarkerTextLocal _markerText;
        _textMarker setMarkerAlphaLocal 0.75;

        [_textMarker, _markerType, time + _markerlifeTime] spawn {
            params ["_marker", "_target", "_timeout"];
            while { time < _timeout and alive _target } do {
                _marker setMarkerPos getPos _target;
                sleep 5;
            };
            deleteMarker _marker;
        };
    };
};

//Broadcast message to nearby players
private _nearbyPlayers = allPlayers select {(_x distance2D _position) <= 2000};
if(count _nearbyPlayers > 0) then
{
    ["RadioIntercepted", [_text]] remoteExec ["BIS_fnc_showNotification",_nearbyPlayers];
};
