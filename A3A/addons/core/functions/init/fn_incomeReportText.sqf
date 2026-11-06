/*
Maintainer: Shoter
    Builds the text of the 10-minute income report that A3A_fnc_resourcecheck shows to the rebels.
    Each optional line is formatted on its own before it is appended, so the placeholders of a
    localized line never pick up the report built so far.

Arguments:
    <SCALAR> HR added this tick
    <SCALAR> Money added this tick
    <SCALAR> Money from town upgrades, included in the money above (0 hides the line)
    <SCALAR> HR from town upgrades, included in the HR above (0 hides the line)
    <SCALAR> Reward tax collected since the last report
    <BOOL> Whether the reward tax line is shown even when nothing was collected
    <STRING> Names of newly unlocked arsenal items, "" when nothing was unlocked
    <SCALAR> Magazines the Smugglers of upgraded seaports added (0 hides the line) [DEFAULT = 0]

Return Value:
    <STRING> Structured text for A3A_fnc_commsMP "taxRep"

Scope: Any
Environment: Any
Public: No
Dependencies:
    None

Example:
    [12.5, 2400, 300, 1.5, 150, true, ""] call A3A_fnc_incomeReportText;
*/
params [
    ["_hrAdd", 0, [0]],
    ["_resAdd", 0, [0]],
    ["_upgradeRes", 0, [0]],
    ["_upgradeHR", 0, [0]],
    ["_taxCollected", 0, [0]],
    ["_showTax", false, [false]],
    ["_textArsenal", "", [""]],
    ["_smuggled", 0, [0]]
];

private _textX = "<t size='0.6' color='#C1C0BB'>" + format [localize "STR_A3A_fn_init_resourceCheck_income", _hrAdd toFixed 1, ceil _resAdd];
if (_upgradeRes > 0 or _upgradeHR > 0) then {
    _textX = _textX + "<br/>" + format [localize "STR_A3A_fn_townUpgrades_income", ceil _upgradeRes, _upgradeHR toFixed 1];
};
if (_taxCollected > 0 or _showTax) then {
    _textX = _textX + "<br/>" + format [localize "STR_A3A_fn_init_resourceCheck_tax", round _taxCollected];
};
if (_smuggled > 0) then {
    _textX = _textX + "<br/>" + format [localize "STR_A3A_fn_siteUpgrades_smugglers", _smuggled];
};
if (_textArsenal != "") then {
    _textX = _textX + "<br/>" + localize "STR_A3A_fn_init_resourceCheck_arsenal" + "<br/><br/>" + _textArsenal;
};
_textX
