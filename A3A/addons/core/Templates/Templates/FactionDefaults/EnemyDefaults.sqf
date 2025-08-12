//////////////////////////
//  Mission/HQ Objects  //
//////////////////////////

// All of bellow are optional overrides.
["firstAidKits", ["FirstAidKit"]] call _fnc_saveToTemplate;  // However, item is tested for for help and reviving.
["mediKits", ["Medikit"]] call _fnc_saveToTemplate;  // However, item is tested for for help and reviving.

// The bellow are optional overrides
["placeIntel_desk", ["Land_CampingTable_F",0]] call _fnc_saveToTemplate;  // [classname,azimuth].
["placeIntel_itemMedium", ["Land_Document_01_F",-155,false]] call _fnc_saveToTemplate;  // [classname,azimuth,isComputer].
["placeIntel_itemLarge", ["Land_Laptop_unfolded_F",-25,true]] call _fnc_saveToTemplate;  // [classname,azimuth,isComputer].

["vehiclesLightTanks", []] call _fnc_saveToTemplate;
["vehiclesHeavyTanks", []] call _fnc_saveToTemplate;

["vehiclesAirPatrol", []] call _fnc_saveToTemplate;
["attributesVehicles", []] call _fnc_saveToTemplate;

["faces", ["GreekHead_A3_02","GreekHead_A3_03","GreekHead_A3_04","GreekHead_A3_05","GreekHead_A3_06","GreekHead_A3_07","GreekHead_A3_08","GreekHead_A3_09","Ioannou","Mavros"]] call _fnc_saveToTemplate;
["voices", ["Male01GRE","Male02GRE","Male03GRE","Male04GRE","Male05GRE","Male06GRE"]] call _fnc_saveToTemplate;
"GreekMen" call _fnc_saveNames;