/*
    Create plank objects from array in the format, ["_className", "_repairObj", "_position", "_direction", "_holdTime", "_price"]
    Add actions to clients for construct & cancel.

Environment: Server, Unscheduled
Arguments:
    1. <array> Containing arrays:
        1. <string> Classname of object to construct or repair
        2. <object> Object to repair, otherwise objNull
        2. <position> Position to construct object, or nil if repair
        3. <number> Direction to construct object, or nil if repair
        4. <number> Price of object
*/

params [["_objects",[],[[]]]];

private _constructionObjects = [
    ["Land_Pallets_F", 30],
    ["Land_CinderBlocks_01_F", 100],
    ["Land_WoodenPlanks_01_messy_pine_F", 999999]
];

// other options:
// Land_FoodSacks_01_large_brown_F
// Land_FoodSacks_01_small_brown_F - might make more sense if most of the small stuff is sandbag or concrete walls?
// Land_WoodPile_02_F
// Land_Bricks_V2_F

{
    _x params ["_className", "_repairObj", "_position", "_direction", "_price"];

    private _plankIndex = _constructionObjects findIf { _price <= _x#1 };
    private _plankClass = _constructionObjects # _plankIndex # 0;
    private _planks = createVehicle [_plankClass, [0,0,0], [], 0, "CAN_COLLIDE"];
    _planks setVariable ["A3A_build_timeout", time + 1200];
    _planks setVariable ["A3A_build_price", _price];
 
    // Most stuff only needs to be server visible
    private _buildName = getText (configFile / "CfgVehicles" / _className / "displayName");
    if (isNull _repairObj) then
    {
        // Construction, create planks on spot
        //_planks setPos [_position#0, _position#1, 0];

        // find an empty position instead of place on ground... a little safer, just a little
        private _emptyPosition = ([_position#0, _position#1, 0] findEmptyPosition [0, 50, _plankClass]);
        if(_emptyPosition isNotEqualTo []) then { _planks setPos _emptyPosition; } else { _planks setPos _position; };
        _planks setDir random 360;

        _planks setVariable ["A3A_build_pos", _position];
        _planks setVariable ["A3A_build_dir", _direction];
        _planks setVariable ["A3A_build_class", _className];
        _buildName = "Build " + _buildName;
    }
    else
    {
        // Repair, create planks nearby
        _position = getPosATL _repairObj findEmptyPosition [0, 50, _plankClass];
        if (_position isEqualTo []) then { _position = _repairObj getPos [10, random 360] };
        _planks setPosATL _position;

        _planks setVariable ["A3A_build_repairObj", _repairObj];
        _buildName = "Repair " + _buildName;
    };

    // Only one needed for client?
    _planks setVariable ["A3A_build_name", _buildName, true];

    A3A_unbuiltObjects pushBack _planks;

    // Should be the only actions on this object, so we can just JIP on the object
    private _holdTime = 1.6 * sqrt _price;
    [_planks, _holdTime] remoteExecCall ["A3A_fnc_addBuildingActions", 0, _planks];

    // TODO: could trigger on unbuiltObjects change instead

    // unscheduled at the moment...
    //sleep 0.2; 			// increase network sync performance

} forEach _objects;

publicVariable "A3A_unbuiltObjects";
