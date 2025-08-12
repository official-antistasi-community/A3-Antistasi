#include "..\script_component.hpp"
#define BOUNDRYFORWARD [0,0.4,0]
#define BOUNDRYBACKWARDS [0,-0.4,0]
#define COLORRED [0.9,0.1,0.2,1]
#define COLORGREEN [0.1,0.9,0.2,1]
#define COLORWHITE [0.9,0.9,0.9,1]

params [
    ["_vehicle",objNull, [objNull]]
  , ["_cargo",objNull, [objNull]]
  , ["_params", [], [[]]]
  , ["_modelBased", true, [true]]
];

if (isNull _vehicle || isNull _cargo) exitWith {"invalid params: null object(s)"};

//get vehicle nodes
private _nodes = ([_vehicle] call FUNC(getVehicleNodes)) apply {_x#1};
if (_nodes isEqualTo []) exitWith {localize "STR_A3A_logi_gencargo_lacknodes"};

private _nodeConfig = [_vehicle] call FUNC(getNodeConfig);

_params params [
    ["_offset", [0,0,0], [[]], 3]
  , ["_rotation", [0,1,0], [[]], 3]
  , ["_size", 1, [0]]
  , ["_isWeapon", 0, [0,true]]
  , ["_recoil", 0, [0]]
];
if (_isWeapon isEqualType 0) then {_isWeapon = _isWeapon isEqualTo 1};

if (count _nodes < _size) exitWith {localize "STR_A3A_logi_gencargo_lackcapacity" + str count _nodes};
if (_isWeapon && 0 == getNumber (_nodeConfig/"canLoadWeapon")) exitWith {localize "STR_A3A_logi_gencargo_lackavailability"};

//calc general use data
private _firstNode = _nodes#0;
private _lastNode = _nodes#(_size-1);
GVAR(hardpoint) = _lastNode vectorAdd ((_firstNode vectorDiff _lastNode) vectorMultiply 0.5); //get the midpoint between the first and last node

//calc render data
//cargo plane
private _tl = _firstNode vectorAdd BOUNDRYFORWARD vectorAdd [-0.6,0,0];
private _tr = _firstNode vectorAdd BOUNDRYFORWARD vectorAdd [0.6,0,0];
private _bl = _lastNode vectorAdd BOUNDRYBACKWARDS vectorAdd [-0.6,0,0];
private _br = _lastNode vectorAdd BOUNDRYBACKWARDS vectorAdd [0.6,0,0];

GVAR(renderLinePairs_vehicle) = [
    [_tl,_tr]
    ,[_tr,_br]
    ,[_br,_bl]
    ,[_bl,_tl]
];

//cargo bb
private _bb_cargo = 0 boundingBoxReal _cargo;
private _bbMin = _bb_cargo#0;
private _bbMax = _bb_cargo#1;
_bbMin params ["_bbMinX","_bbMinY","_bbMinZ"];
_bbMax params ["_bbMaxX","_bbMaxY","_bbMaxZ"];

GVAR(renderLinePairs_cargo) = [
    //square x min
    [[_bbMinX, _bbMinY, _bbMinZ], [_bbMinX, _bbMinY, _bbMaxZ]]
    ,[[_bbMinX, _bbMinY, _bbMaxZ], [_bbMinX, _bbMaxY, _bbMaxZ]]
    ,[[_bbMinX, _bbMaxY, _bbMaxZ], [_bbMinX, _bbMaxY, _bbMinZ]]
    ,[[_bbMinX, _bbMaxY, _bbMinZ], [_bbMinX, _bbMinY, _bbMinZ]]

    //square x max
    ,[[_bbMaxX, _bbMinY, _bbMinZ], [_bbMaxX, _bbMinY, _bbMaxZ]]
    ,[[_bbMaxX, _bbMinY, _bbMaxZ], [_bbMaxX, _bbMaxY, _bbMaxZ]]
    ,[[_bbMaxX, _bbMaxY, _bbMaxZ], [_bbMaxX, _bbMaxY, _bbMinZ]]
    ,[[_bbMaxX, _bbMaxY, _bbMinZ], [_bbMaxX, _bbMinY, _bbMinZ]]

    //square conectors
    ,[[_bbMinX, _bbMinY, _bbMinZ], [_bbMaxX, _bbMinY, _bbMinZ]]
    ,[[_bbMinX, _bbMaxY, _bbMinZ], [_bbMaxX, _bbMaxY, _bbMinZ]]
    ,[[_bbMinX, _bbMinY, _bbMaxZ], [_bbMaxX, _bbMinY, _bbMaxZ]]
    ,[[_bbMinX, _bbMaxY, _bbMaxZ], [_bbMaxX, _bbMaxY, _bbMaxZ]]

    //diagonal
    ,[_bbMin, _bbMax]
];

GVAR(cargoAttachmentPoint) = [0,0,_bbMinZ];

//attach cargo at position with rotation specified
private _attachmentPoint = GVAR(hardpoint) vectorAdd _offset;
_cargo attachTo [_vehicle, _attachmentPoint];
if (clientOwner isEqualTo (owner _cargo)) then {
    _cargo setVectorDirAndUp [_rotation,[0,0,1]];
} else {
    [_cargo, [_rotation,[0,0,1]]] remoteExecCall ["setVectorDirAndUp", owner _cargo];
};

GVAR(renderTime) = time + 60;
GVAR(vehicle) = _vehicle;
GVAR(cargo) = _cargo;

private _className = if (_modelBased) then { ( (getText ((configOf _cargo)/"model")) splitString "\.") joinString "_" } else {typeOf _cargo};

private _return = text format [
    "class %1 : TRIPLES(ADDON,Cargo,Base)%7{%7%2%3%4%5%6%7};%7",
    _className,
    "    offset[] = {" + (str _offset select [1, count str _offset - 2]) + "};" + endl,
    "    rotation[] = {" + (str _rotation select [1, count str _rotation - 2]) + "};" + endl,
    "    size = "+ str _size + ";",
    endl + "    recoil = " + str _recoil + ";",
    ["", endl + "    isWeapon = 1;"] select _isWeapon,
    endl
];

if !(isNil QGVAR(render)) exitWith {_return};
GVAR(render) = addMissionEventHandler ["Draw3D", {

    //draw cargo plane
    {
        drawLine3D  [GVAR(vehicle) modelToWorldVisual (_x#0), GVAR(vehicle) modelToWorldVisual (_x#1), COLORRED];
    } forEach GVAR(renderLinePairs_vehicle);

    //draw cargo bb
    {
        drawLine3D  [GVAR(cargo) modelToWorldVisual (_x#0), GVAR(cargo) modelToWorldVisual (_x#1), COLORWHITE];
    } forEach GVAR(renderLinePairs_cargo);

    //draw hardpoint and cargo base
    drawIcon3D ["\a3\ui_f\data\map\markers\military\dot_ca.paa", COLORGREEN, GVAR(vehicle) modelToWorldVisual GVAR(hardpoint), 0.6, 0.6, 0, "", true, 0.03, "TahomaB", "center"];
    drawIcon3D ["\a3\ui_f\data\map\markers\military\dot_ca.paa", COLORGREEN, GVAR(cargo) modelToWorldVisual GVAR(cargoAttachmentPoint), 0.6, 0.6, 0, "", true, 0.03, "TahomaB", "center"];

    //cleanup
    if (GVAR(renderTime) < time || isNull GVAR(vehicle)) then {
        removeMissionEventHandler ["Draw3D", GVAR(render)];
        GVAR(render) = nil;
        GVAR(vehicle) = nil;
        GVAR(cargo) = nil;
        GVAR(renderLinePairs_vehicle) = nil;
        GVAR(renderLinePairs_cargo) = nil;
        GVAR(hardpoint) = nil;
        GVAR(cargoAttachmentPoint) = nil;
        GVAR(renderTime) = nil;
    };

}];

_return
