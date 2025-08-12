/*
Description:
    Server-side function to cleanup unbuilt buildings when they exceed timeout
    Called by resourceCheck loop

Environment: Server, scheduled
Arguments: None
*/

// Protection required to prevent running in parallel with buildingComplete
// Should be fine run in parallel with placeBuilderObjects because it only adds to the end

isNil {
    private _unbuiltObjectsChanged = false;
    {
        private _object = _x;
        if (time <= _object getVariable ["A3A_build_timeout", 0]) then { continue };

        // refund? Arguable
        private _price = _object getVariable ["A3A_build_price", 0];
        if (_price >= 0) then { [0, _price] spawn A3A_fnc_resourcesFIA; };

        // remove the object from the list
        A3A_unbuiltObjects deleteAt _forEachIndex;
        _unbuiltObjectsChanged = true;
        deleteVehicle _object;

    } forEachReversed A3A_unbuiltObjects;

    if (_unbuiltObjectsChanged) then { publicVariable "A3A_unbuiltObjects" };
};
