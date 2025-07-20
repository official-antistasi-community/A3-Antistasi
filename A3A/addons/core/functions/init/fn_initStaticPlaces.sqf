/*
// old spawning code example
private _dir = (getDir _building) - 180;
private _zpos = AGLToASL (_building buildingPos 1);
private _pos = _zpos getPos [1.5, _dir];			// zeroes Z value because BIS
_pos = ASLToATL ([_pos select 0, _pos select 1, _zpos select 2]);
private _veh = createVehicle ["I_HMG_02_high_F", _pos, [], 0, "CAN_COLLIDE"];
_veh setDir _dir;

// new spawning code:
private _building = cursorObject;
private _pos = _building modelToWorld [-2.34473,-0.65332,-0.560341];
private _veh = createVehicle ["I_HMG_02_high_F", _pos, [], 0, "CAN_COLLIDE"];
_veh setDir (180 + getDir _building);

// Data collection. Place statics on building, then run this while looking at building:
_building = cursorObject;
_statics = [];
{
	_pos = _building worldToModel (getPosATL _x);
	_dir = getDir _x - getDir _building;
	_statics pushBack ["staticMG", _pos, _dir];
} forEach vehicles;
_statics;
*/

// Should move all this to config? Could actually put stuff in config_fixes to take advantage of inheritance

private _buildingData = [

    // Short vanilla MG towers
    [["Land_Cargo_Patrol_V1_F", "Land_Cargo_Patrol_V2_F", "Land_Cargo_Patrol_V3_F", "Land_Cargo_Patrol_V4_F"],
        ["MG", [-2.345,-0.653,-0.560], 180]
    ],

    // Elevated MG tower (CUP & VN versions identical)
    [["Land_Hlaska", "Land_vn_hlaska"],
        ["MG", [0.285,0.616,3.783], 0]
    ],

    // Short vanilla HQ buildings
    [["Land_Cargo_HQ_V1_F", "Land_Cargo_HQ_V2_F", "Land_Cargo_HQ_V3_F"],
        ["AA", [0.004,0.004,-0.735], 0]
    ],

    // Giant vanilla towers
    [["Land_Cargo_Tower_V1_F", "Land_Cargo_Tower_V1_No1_F", "Land_Cargo_Tower_V1_No2_F", "Land_Cargo_Tower_V1_No3_F", "Land_Cargo_Tower_V1_No4_F", "Land_Cargo_Tower_V1_No5_F", "Land_Cargo_Tower_V1_No6_F", "Land_Cargo_Tower_V1_No7_F", "Land_Cargo_Tower_V2_F", "Land_Cargo_Tower_V3_F", "Land_Cargo_Tower_V4_F"],
        ["MG", [5.883,-0.759,4.973], -270],
        ["MG", [-1.886,5.042,4.973], 0],
        ["MG", [-4.435,-4.998,4.973], -180]
    ],

    // Ground-level vanilla sandbag bunkers. Offset for some reason?
    [["Land_BagBunker_Small_F", "Land_BagBunker_01_small_green_F", "Land_vn_bagbunker_01_small_green_f", "Land_vn_bagbunker_small_f", "Land_vn_bunker_small_01"], 
        ["MG", [-0.998,-0.249,-0.946], 180]
    ],

    // Large wooden VN bunker
    [["Land_vn_o_shelter_05"],
        ["MG", [-1.727,0.0708,-1.206], 270]
    ],

    // Ground-level CUP sandbag bunkers
    [["Land_fortified_nest_small_EP1", "Land_fortified_nest_small", "Fort_Nest"],
        ["MG", [-0.243,-0.100,-0.951], 180]
    ],

    // Some sort of military building with open roof. Tanoa? VN not tested
    [["Land_Radar_01_HQ_F", "Land_vn_radar_01_hq_f"],
        ["AA", [-0.016,-0.031,3.841], 0]
    ],

    // Camouflaged wooden tower
    [["Land_vn_o_tower_02"],
        ["MG", [-1.499,0.987,0.816], 270]
    ],

    [["Land_vn_hut_tower_01"],
        ["MG", [-0.219,-0.165,3.172], 180]
    ],

    // Opening too low on one, other too open
    //[["Land_vn_o_platform_05", "Land_vn_o_platform_06"],

    // Two-level bunker
    [["Land_vn_b_trench_bunker_04_01"],
        ["AA", [3.965,0.490,0.721], 90]
    ],

    // Large factory buildings 
    [["Land_vn_cementworks_01_brick_f", "Land_vn_cementworks_01_grey_f"],
        ["AA", [0,0,5.70116], 0]
    ],

    // Building with tall center roof
    [["Land_vn_a_office01"], 
        ["AA", [-1.243,3.108,6.203], 0]
    ]
];

// Compile building classes into hashmap for faster lookup
// Would change if data is converted to config
private _buildingHM = createHashMap;
{
    private _classes = _x#0;
    private _statics = _x select [1, count _x];
    {
        if !(isClass (configFile >> "CfgVehicles" >> _x)) then { continue };
        _buildingHM set [_x, _statics];
    } forEach _classes;
} forEach _buildingData;

params ["_markers"];

private _usedBuildings = [];

{
    private _radius = vectorMagnitude markerSize _x;
    private _buildings = nearestObjects [markerPos _x, keys _buildingHM, _radius, true];
    _buildings = _buildings inAreaArray _x;

    private _places = A3A_spawnPlacesHM get _x;        // should be generated already for other place types
    {
        if (_x in _usedBuildings) then {continue};       // don't re-use same building for different markers
        _usedBuildings pushBack _x;

        private _building = _x;
        private _buildingPlaces = (_buildingHM get typeof _x);
        if (isNil "_buildingPlaces") then { continue };             // currently possible due to isKindOf matching
        {
            private _pos = _building modelToWorld _x#1;
            private _dir = (_x#2 + getDir _building + 360) % 360;
            _places pushBack ["static"+(_x#0), _pos, _dir, _building];

        } forEach _buildingPlaces;
    } forEach _buildings;
} forEach _markers;
