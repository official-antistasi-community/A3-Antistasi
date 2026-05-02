
class tem_vinjesvingenc {
    population[] = {
        {"Vinjesvingen",20}
        ,{"Vinje",57}
        ,{"Kjetusland",32}
        ,{"Brekka",13}
        ,{"Vinjerui",19}
        ,{"Listoyl",17}
        ,{"Nistog",46}
        ,{"Smorklepp",47}
        ,{"Kose",31}
        ,{"Huso",20}
        ,{"Vesas",8}
        ,{"Myrbo",55}
        ,{"Skatter",25}
        ,{"Floten",218}
        ,{"Sundrisland",69}
        ,{"Autsbo",21}
        ,{"Bru",40}
        ,{"Levad",50}
        ,{"Nystog",36}
    };
    disabledTowns[] = {"vinjeAirfield","Campabo","Northfactory","Gasstation","Factory","Sawmill","Heii","Brauti","Solhaug"};
    antennas[] = {
        {5095.85,1018.74,0},{1790.87,5817.86,0.00408936}
    };
    antennasBlacklistIndex[] = {};
    banks[] = {};
    garrison[] = {
        {"outpost_10"},{"control_10","control_18","control_19","control_20","control_24","control_25"},{},{"control_10","control_18","control_19","control_20","control_24","control_25"}
    };
    fuelStationTypes[] = {
        "Land_FuelStation_Feed_F","Land_fs_feed_F","Land_FuelStation_01_pump_malevil_F","Land_FuelStation_01_pump_F","Land_FuelStation_02_pump_F","Land_FuelStation_03_pump_F"
    };
    climate = "temperate";
    buildObjects[] = {
        // Large vanilla tropical structures
        {"Land_BagBunker_01_large_green_F", 300}, {"Land_HBarrier_01_tower_green_F", 300}, {"Land_BagBunker_01_small_green_F", 60},
        {"Land_Shed_09_F", 120}, {"Land_Shed_10_F", 140},
        // vanilla tropical sandbag walls
        {"Land_BagFence_01_short_green_F", 10}, {"Land_BagFence_01_round_green_F", 10}, {"Land_BagFence_01_long_green_F", 10},
        // Non-camo vanilla stuff
        {"Land_SandbagBarricade_01_half_F", 20}, {"Land_SlumWall_01_s_2m_F", 5}, {"Land_PillboxBunker_01_hex_F", 200},
        {"Land_Barricade_01_4m_F", 30}, {"Land_GuardBox_01_brown_F", 80}, {"Land_Tyres_F", 10}
    };
};
