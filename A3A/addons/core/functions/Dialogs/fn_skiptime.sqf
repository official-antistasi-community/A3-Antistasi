private _titleStr = localize "STR_A3A_fn_dialogs_skiptime_title";

params [["_time",8,[0]]];

_error = call A3A_fnc_canSkiptime;

if (_error isEqualTo "") then {
	[_time] remoteExec ["A3A_fnc_resourcecheckSkipTime", 0];
} else {
	[_titleStr,_error] call A3A_fnc_customHint;
};
