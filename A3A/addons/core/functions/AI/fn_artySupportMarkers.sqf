params ["_mainParams","_strikeTime"];
_mainParams params ["_group","_typeAmmunition","_shortName","_strikeType","_rounds","_startPos","_detail"];
private _fnc_makeEllipse = {
    params ["_mrkEllipse", ["_strikeType", "point"],["_detail", 30]];
    _mrkEllipse setMarkerShapeLocal "ELLIPSE";
    _mrkEllipse setMarkerBrushLocal "FDIAGONAL";
    private _radius = [30, _detail] select (_strikeType == "suppress");
    _mrkEllipse setMarkerSizeLocal [_radius, _radius];
    _mrkEllipse setMarkerColor "ColorGUER";
};
private _fnc_makeFinal = {
    params ["_mrkFinal"];
    _mrkFinal setMarkerShapeLocal "ICON";
    _mrkFinal setMarkerTypeLocal "hd_dot";
    _mrkFinal setMarkerColor "ColorBlack";
};
private _mrkEllipse1 = createMarkerLocal [format ["Arty%1", random 100], _startPos];
[_mrkEllipse1] call _fnc_makeEllipse;
private _mrkFinal1 = createMarkerLocal [format ["Arty%1", random 100], _startPos];
[_mrkFinal1] call _fnc_makeFinal;
private _markers = [_mrkEllipse1, _mrkFinal1];
private _notiString = "";
switch (_strikeType) do {
    case ("point"): 
    {
        private _mrkText1 = format ["Point strike: %1x %2", str _rounds, _shortName];
        _mrkFinal1 setMarkerText _mrkText1;
        _notiString = format ["point strike: %1x %2", str _rounds, _shortName];
    };
    case ("barrage"): 
    {
        private _endPos = _detail;
        private _mrkEllipse2 = createMarkerLocal [format ["Arty%1", random 100], _endPos];
        [_mrkEllipse2] call _fnc_makeEllipse;
        private _mrkFinal2 = createMarkerLocal [format ["Arty%1", random 100], _endPos];
        [_mrkFinal2] call _fnc_makeFinal;
        _ang = _startPos getDir _endPos;
        _barrageCenterX = (_startPos#0 + _endPos#0)/2;
        _barrageCenterY = (_startPos#1 + _endPos#1)/2;
        private _mrkBarrageLine = createMarkerLocal [format ["ArtyBarrage%1", random 100], [_barrageCenterX,_barrageCenterY]];
        _mrkBarrageLine setMarkerShapeLocal "RECTANGLE";
        _mrkBarrageLine setMarkerDirLocal _ang;
        _mrkBarrageLine setMarkerColorLocal "ColorGUER";
        _mrkBarrageLine setMarkerBrushLocal "FDIAGONAL";
        _distance = _startPos distance2D _endPos;
        _mrkBarrageLine setMarkerSizeLocal [30, _distance/2];
        private _mrkTextBarrage = format ["Barrage: %1x %2", str _rounds, _shortName];
        _mrkFinal1 setMarkerText _mrkTextBarrage;
        _markers append [_mrkBarrageLine, _mrkEllipse2, _mrkFinal2];
        _notiString = format ["barrage: %1x %2", str _rounds, _shortName];
    };
    case ("suppress"): 
    {
        private _mrkText1 = format ["Mortar suppression: %1x %2", str _rounds, _shortName];
        _mrkFinal1 setMarkerText _mrkText1;
        _mrkEllipse1 setMarkerSize [_detail, _detail];
        _notiString = format ["suppression: %1x %2", str _rounds, _shortName]; 
    };
    case ("cont"): 
    {
        private _mrkText1 = format ["Continuous fire: 1 %1 every %2s", _shortName, str _detail];
        _mrkFinal1 setMarkerText _mrkText1;
        _notiString = format ["continuous fire: %1x %2", str _rounds, _shortName];
    };
};
//Broadcast message to nearby players
private _fullNotiString = ["Mortars inbound",_notiString] joinString ", ";
private _nearbyPlayers = allPlayers select {(_x distance2D _startPos) <= 500};
if(count _nearbyPlayers > 0) then
{
    ["MessageHQ", [_fullNotiString]] remoteExec ["BIS_fnc_showNotification",_nearbyPlayers];
};
waitUntil {sleep 1; time > _strikeTime};
[petros,"sideChat",localize "STR_A3A_fn_ai_artySupport_splash"] remoteExec ["A3A_fnc_commsMP",[teamPlayer,civilian]];
sleep _rounds*4;
{deleteMarker _x} forEach _markers;