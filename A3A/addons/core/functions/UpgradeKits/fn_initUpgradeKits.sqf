/*
Maintainer: Shoter
    Sets up the shared upgrade kit layer: the registry of kit kinds, the list of kit crates in transit and the crate class.
    Called from initVarServer before the modules that register their kinds (A3A_fnc_initTownUpgrades registers "town").
    A3A_upgradeKitKinds and A3A_upgradeKitCrateClass are broadcast with the other server variables, A3A_upgradeKits stays on the server.

    A3A_upgradeKitKinds: kind -> name of the kind's handler function, called as [mode, args] call handler.
    Modes every handler answers (args in brackets):
        title          []                   hint title
        valid          [id, target]         BOOL, the id and target exist, used before creating or buying a crate
        name           [id, target]         kit name shown in actions, labels and hints
        targetName     [id, target]         name of the place the kit is bound to
        validate       [id, target]         "" when the kit may be bought now, otherwise the refusal text
        price          [id, target]         price in faction money, computed on the server again when buying
        bought         [id, target, price]  hint text after a purchase
        label          [id, target]         [line 1, line 2] drawn over the crate
        canInstall     [crate]              BOOL, show the install action (evaluated every frame, keep it cheap)
        installStart   [crate]              client: start installing the crate

    Every crate carries A3A_upgradeKit = [kind, id, target, paid], paid is the money taken and the refund on return.

Arguments:
    None

Return Value:
    <nil>

Scope: Server
Environment: Unscheduled
Public: No
Dependencies:

Example:
    call A3A_fnc_initUpgradeKits;
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

A3A_upgradeKitKinds = createHashMap;
A3A_upgradeKits = [];

// Kit crate class, the first one in the loaded config. Needs a logistics cargo entry (logistics\Cargo) so it can be loaded into vehicles
private _crateClasses = ["Land_PaperBox_01_open_boxes_F", "Land_PlasticCase_01_medium_F"];
private _index = _crateClasses findIf { isClass (configFile >> "CfgVehicles" >> _x) };
A3A_upgradeKitCrateClass = if (_index == -1) then { "" } else { _crateClasses # _index };
if (A3A_upgradeKitCrateClass == "") then { Error_1("No upgrade kit crate class available, tried %1", _crateClasses) };
