/*
    Author: [Håkon]
    [Description]


    Arguments:
        0. <Object> Vehicle to get damage state from

    Return Value:
        <Array> [
            <Scalar> Overall damage
            <Array> Optional: Hitpoint damage
            <Scalar> Repair cargo
        ] Damage state
        or 
        <Scalar> Overall damage

    Scope: Any
    Environment: Any
    Public: Yes
    Dependencies:

    Example:

    License: APL-ND
*/
params ["_vehicle"];
private _restoreState = [0,1] select (HR_GRG_hasRepairSource && !HR_GRG_ServiceDisabled_Repair);

private _output = [damage _vehicle min 0.89];
private _hitPointDamage = getAllHitPointsDamage _vehicle;
if (_hitPointDamage isNotEqualTo []) then { //ensure it has hitpoints
    // Skip storing hitpoints if damage is low or we can repair it
    if (HR_GRG_reduceState and (selectMax (_hitPointDamage#2) < 0.15 or _restoreState == 1)) exitWith {};
    _output pushBack _hitPointDamage#2;
};

// Set repair cargo only if it exists
if (getNumber (configOf _vehicle/"transportRepair") > 0) then { _output set [2, getRepairCargo _vehicle] };

// If we only have overall damage, just return that
if (count _output == 1) exitWith { _output#0 };
_output;
