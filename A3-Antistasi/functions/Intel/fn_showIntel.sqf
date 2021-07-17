params ["_text"];

/*  Shows the intel how players are used to it
*   Params:
*       _text : STRING : The text which should be shown
*
*   Returns:
*       Nothing
*/

if(_text == "") exitWith {};

private _outText = format ["<t size='0.6' color='#C1C0BB'>" + localize "STR_antistasi_intel_found" + "<br/><t size='0.5' color='#C1C0BB'><br/>"];
_outText = format ["%1 %2", _outText, _text];

[_outText, [safeZoneX, (0.2 * safeZoneW)], [0.25, 0.5], 30, 0, 0, 4] spawn bis_fnc_dynamicText;
