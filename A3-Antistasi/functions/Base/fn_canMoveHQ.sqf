/*
Maintainer: Wurzel0701
    Checks if the HQ can currently be moved

Arguments:
    <NIL>

Return Value:
    <ARRAY> If the HQ can be moved right now, first element bool, every other afterwards string, at least 2 elements

Scope: Local
Environment: Any
Public: Yes
Dependencies:
    <OBJECT> theBoss
    <OBJECT> boxX
    <OBJECT> petros

Example:
[] call A3A_fnc_canMoveHQ;
*/

private _result = [false];
if (player != theBoss) then
{
    [localize "STR_antistasi_journal_entry_header_commander_5", localize "STR_antistasi_customHint_only_comander"] call A3A_fnc_customHint;
    _result pushBack "Commander only";
};

if ((count weaponCargo boxX >0) or (count magazineCargo boxX >0) or (count itemCargo boxX >0) or (count backpackCargo boxX >0)) then
{
    if(count _result == 1) then
    {
        [localize "STR_antistasi_journal_entry_header_commander_5", localize "STR_antistasi_customHint_moveHQ_noEmpty"] call A3A_fnc_customHint;
    };
    _result pushBack "Arsenal inventory must be empty";
};

if !(isNull attachedTo petros) then
{
    if(count _result == 1) then
    {
        [localize "STR_antistasi_journal_entry_header_commander_5", localize "STR_antistasi_customHint_moveHQ_petros!"] call A3A_fnc_customHint;
    };
    _result pushBack "Petros currently picked up";
};

if(count _result != 1) exitWith
{
    _result;
};

[true, ""];
