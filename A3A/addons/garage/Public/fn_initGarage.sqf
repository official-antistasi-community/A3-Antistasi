/*
    Author: [Håkon]
    [Description]
        Adds garage access to a object

    Arguments:
    0. <Object> Object to access the garage from

    Return Value:
    <Bool> Action added

    Scope: Clients
    Environment: Any
    Public: [Yes]
    Dependencies:

    Example: [_object] call HR_GRG_fnc_initGarage;

    License: APL-ND
*/
params [ ["_object", objNull, [objNull]] ];
if (isNull _object) exitWith {false};
private _oldID = _object getVariable ["HR_GRG_GarageID", -1];
_object removeAction _oldID;

private _id = _object addAction [
    localize "STR_HR_GRG_openGarage_Action"
    , "
        HR_GRG_accessPoint = _this#0;
        createDialog 'HR_GRG_VehicleSelect';
    ", nil, 1.5, true, true, ""
    , "
    ((isNil {HR_GRG_Placing}) || {!HR_GRG_Placing})
    && player isEqualTo vehicle player && _this == _this getVariable ['owner',objNull]
    ", 6
];
_object setVariable ["HR_GRG_GarageID", _id, true];
true;
