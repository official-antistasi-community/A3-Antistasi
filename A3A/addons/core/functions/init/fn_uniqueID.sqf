private _idSource = if (isServer) then {call A3A_fnc_collectSaveData} else {A3A_setup_saveData};
private _allIDs = _idSource apply { _x get "gameID" };
private _newID = str(floor(random(90000) + 10000));
while { _newID in _allIDs } do { _newID = str(floor(random(90000) + 10000)) };
_newID;