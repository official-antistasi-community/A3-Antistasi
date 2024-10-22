/*
    Reveal a unit to another unit. Only used for aaReveal, can be expanded if neccesary
Parameters:
    0. <OBJECT> Unit to reveal to. Typically the machine remoteExeced onto
    1. <OBJECT> Unit to be revealed
Returns:
    Nothing
Environment:
    Scheduled, any machine
*/

params ["_unit","_veh"];
private _accuracy = linearConversion [250,2000,_unit distance2D _veh,4,2,true];
_unit reveal [_veh,_accuracy];
if (getAttackTarget _unit isKindOf "Air") exitWith {diag_log "Unit has air target already, exiting."};
_unit commandTarget _veh;
