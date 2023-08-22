/*  Handles the despawn and cleanup of dead units
*   Params:
*       _victim : OBJECT : The dead unit
*
*   Returns:
*       Nothing
*/

params ["_victim"];
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
private _group = group _victim;

Debug("PostMortem Called");
if (isnull _victim)exitwith{Error("Function failed called with null param.")};

Debug_3("Pausing for %1 minutes before cleaning victim: %2 and group: %3", round cleantime/60, _victim, _group);
sleep cleantime;

if (_victim getVariable ["stopPostmortem", false]) exitWith {};

if !(isnull _victim) then
{
    Debug_1("Cleanup complete for %1 victim.", _victim);
    deleteVehicle _victim;
};

if !(isnull _group) then
{
    Debug_1("Cleanup complete for %1 group.", _group);
    deleteGroup _group;
};
