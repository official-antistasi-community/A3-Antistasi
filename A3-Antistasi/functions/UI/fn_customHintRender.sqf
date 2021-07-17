/*
Function:
    A3A_fnc_customHintRender

Description:
    Renders top item on customHint queue.
    Adds the Icon and footer around the message.
    This should not be called outside of the render loop in A3A_fnc_customHintInit.

Scope:
    <LOCAL> Execute on each player to draw from individual hint queue.

Environment:
    <ANY>

Returns:
    <BOOLEAN> true if it hasn't crashed; nil if it has crashed.

Examples:
    call A3A_fnc_customHintRender;

Authors: Caleb Serafin
License: MIT License, Copyright (c) 2019 Barbolani & The Official AntiStasi Community
*/

private _filename = "fn_customHintRender.sqf";

if (!hasInterface || !A3A_customHintEnable) exitWith {false;}; // Disabled for server & HC.

if (A3A_customHint_MSGs isEqualTo []) then {
    hintSilent "";
} else{
    private _autoDismiss = 15;  // Number of seconds for message lifetime  // Constant Value
    if (serverTime - A3A_customHint_UpdateTime > _autoDismiss) exitWith {
        [true] call A3A_fnc_customHintDismiss;
    };
    private _alphaHex = [(((_autoDismiss + A3A_customHint_UpdateTime - serverTime) min (_autoDismiss-5)) / (_autoDismiss-5)) ] call A3A_fnc_shader_ratioToHex;
    private _dismissKey = actionKeysNames ["User12",1];
    private _topMSGIndex = count A3A_customHint_MSGs - 1;
    private _keyBind = (["<br/><t size='0.8' color='#",_alphaHex,"e5b348' shadow='1' shadowColor='#",_alphaHex,"000000' valign='top' >"+ localize "STR_antistasi_customHint_render1"+" <t color='#",_alphaHex,"f0d498' >",[_dismissKey,"Use Action 12"] select (_dismissKey isEqualTo ""),"</t>"," "+localize "STR_antistasi_customHint_render2"+" ",str _topMSGIndex,"</t>"] joinString ""); // Needs to be added to string table.
    private _previousNotifications = ["<t color='#",_alphaHex,"e5b348' font='RobotoCondensed' align='center' valign='middle' underline='0' shadow='1' shadowColor='#",_alphaHex,"000000' shadowOffset='0.0625'>"];
    if (_topMSGIndex < 4) then {
        private _size = (-20/(8-_topMSGIndex) +4.6);
        _previousNotifications append ["<img size='",_size,"' color='#",_alphaHex,"ffffff' shadowOffset='",_size*0.03,"' image='functions\UI\images\logo.paa' /><br/>"];
    };
    for "_i" from 0 max (4-_topMSGIndex) to 3 do {
        _previousNotifications append ["<t size='",-10/(_i+5) +2.3,"'>",A3A_customHint_MSGs#(_topMSGIndex-4+_i)#0,"</t><br/>"];
    };
    _previousNotifications pushBack "</t>";
    _previousNotifications = _previousNotifications joinString "";

    _structuredText = composeText [parseText _previousNotifications,A3A_customHint_MSGs#(_topMSGIndex)#1, parseText _keyBind];
    if (A3A_customHint_MSGs#(_topMSGIndex)#2) then {
        hintSilent _structuredText;
    } else {
        hint _structuredText;
        A3A_customHint_MSGs#(_topMSGIndex) set [2,true]; // so it does not ping more than once.
    };
};
true;

// Arma 3 Apex #218a36 // BIS Website Differs incorrectly from in-game
// Arma 3 #c48214
// Custom Orange #e5b348
// Custom Peach #f0d498
