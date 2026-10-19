/*
Function:
    A3A_fnc_customHintInit

Description:
   Adds EH to detect key/mouse presses to hide hints.
   Defines many important variables for customHintXXX and shader_ratioToHex.
   Starts loops for key detection/hint rendering.
   Setting A3A_customHintEnable to false executes will allow it to use the simpler fall-back system.

Scope:
    <LOCAL> Execute on each player ONCE to add necessary EHs and variables.

Environment:
    <ANY>

Returns:
    <BOOLEAN> true if successful; false if already initialised/server/HC; nil if it has crashed.

Examples:
    [] call A3A_fnc_customHintInit;

Author: Caleb Serafin
License: MIT License, Copyright (c) 2019 Barbolani & The Official Antistasi Community
*/

private _filename = "fn_customHintInit.sqf";

if (!hasInterface) exitWith {false;}; // Disabled for server & HC.
if !(isNil {A3A_customHint_InitComplete}) exitWith {false;};
// These var names don't need to be limited to 16chars for performance as they are not public.
A3A_customHint_MSGs = [];  // Operates as a upside-down stack (new messages pushed-Back are displayed.)
A3A_customHint_UpdateTime = 0;
A3A_customHint_RenderFrameCount = 1;
A3A_customHint_WasShowing = false;  // true while an A3A hint occupies the hint box; cleared when queue drains.
if (isNil {A3A_customHintEnable}) then {A3A_customHintEnable = true}; // isNil check in case value was set before this initialises.

A3A_customHint_hexChars = ["0","1","2","3","4","5","6","7","8","9","A","B","C","D","E","F"];

addMissionEventHandler ["EachFrame", {
    if (A3A_customHint_RenderFrameCount >= 15) then {  // Render loop does not need to run every frame. 4Hz should be enough.
        A3A_customHint_RenderFrameCount = 1;
        [] call A3A_fnc_customHintRender;
    } else {
        A3A_customHint_RenderFrameCount = A3A_customHint_RenderFrameCount + 1;
    };
}];

A3A_customHint_InitComplete = true;
true;

/*
# Global/Public variables used by custom hint system.

All public created variables:
| Name                              | Type          | Machine   | Domain            | Description                                                           |
|-----------------------------------|---------------|-----------|-------------------|-----------------------------------------------------------------------|
| A3A_customHint_hexChars           | ARRAY<STRING> | Client    | missionNamespace  | All hexadecimal symbols in order. Used in shader_ratioToHex.          |
| A3A_customHint_InitComplete       | BOOLEAN       | Client    | missionNamespace  | Defines if customHintInit should be called.                           |
| A3A_customHint_MSGs               | ARRAY<CUSTOM> | Client    | missionNamespace  | Stack of hint notifications. <_headerText,_structuredText,_isSilent>  |
| A3A_customHintEnable              | BOOLEAN       | Local     | missionNamespace  | Whether queuing and dismissing is enabled. Defined on all, not synced.|
| A3A_customHint_UpdateTime         | SCALAR        | Client    | missionNamespace  | ServerTime of last update to the visible message.                     |
| A3A_customHint_RenderFrameCount   | SCALAR        | Client    | missionNamespace  | Determines intensity of hint footer fading.                           |
| A3A_customHint_WasShowing         | BOOLEAN       | Client    | missionNamespace  | True while A3A owns the hint box. Prevents clearing external hints.   |

Worker processes:
| Script Name                       | Machine   | Description                                                                               |
|-----------------------------------|-----------|-------------------------------------------------------------------------------------------|
| undefined                         | Client    | In customHintInit. EachFrame. Checks key press. Refreshes hint display. FrameCount++      |
*/
