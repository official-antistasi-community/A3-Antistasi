// Server-side, unscheduled
// sends specified garrison data to the new-UI function on the server

params [_marker]        //, [_userCall, false]];

//if (_userCall) then { A3A_viewedGarrison = 

// should only send if the commander is/was recently in the UI...
// Alternatively, *only* update on requested changes. Simpler control flow...

if !(_marker in A3A_garrison) exitWith {
    Error_1("Garrison %1 does not exist", _marker);
};

["garrisonDataSent", [_marker, A3A_garrison get _marker]] remoteExecCall ["A3A_GUI_fnc_hqDialog", theBoss];
