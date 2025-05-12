//TODO: add header
private _autoSaveInterval = [false,(autoSaveInterval/60)] select autoSave;
_autoSaveInterval = "<t color='#f0d498'>" + str _autoSaveInterval + "</t>";

private _saveString = (localize "STR_A3A_fn_dialogs_createDialog_SLPS_line1") + "<br/><br/>";
_saveString = if (autoSave) then { [_saveString,format[localize "STR_A3A_fn_dialogs_createDialog_SLPS_line2", _autoSaveInterval]] joinString "" }
    else { [_saveString,localize "STR_A3A_fn_dialogs_createDialog_SLPS_line3"] joinString "" };

[localize "STR_A3A_fn_dialogs_createDialog_SLPS_line4", _saveString] call A3A_fnc_customHint;

[true] call A3A_fnc_loadPreviousSession;

[] spawn A3A_fnc_credits;