private _saveString = [localize"STR_antistasi_customHint_save_info",
    localize"STR_antistasi_customHint_save_info2"] joinString "<br/><br/>";
_saveString = if (autoSave) then { [_saveString,localize "STR_antistasi_customHint_autosave_info"+" <t color='#f0d498'>",(autoSaveInterval/60) toFixed 0," "+localize "str_a3_rscattributeskiptime_minutes"+"</t>."] joinString "" }
    else { [_saveString,localize"STR_antistasi_customHint_autosave_off"] joinString "" };

[localize"str_cfg_markers_warning", _saveString] call A3A_fnc_customHint;

[true] call A3A_fnc_loadPreviousSession;

[] spawn A3A_fnc_credits;
