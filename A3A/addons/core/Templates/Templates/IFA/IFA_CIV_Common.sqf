//////////////////////////
//       Vehicles       //
//////////////////////////    
["vehiclesCivCar", [ 
    "LIB_GazM1", 1.5, 
    "LIB_GazM1_dirty", 2.5,
    "LIB_CIV_FFI_CitC4", 0.125, 
    "LIB_CIV_FFI_CitC4_2", 0.125, 
    "LIB_CIV_FFI_CitC4_3", 0.125
    ]] call _fnc_saveToTemplate;             //this line determines civilian cars -- Example: ["vehiclesCivCar", ["C_Offroad_01_F"]] -- Array, can contain multiple assets

["vehiclesCivIndustrial", [
    "LIB_CIV_FFI_CitC4", 0.25, 
    "LIB_CIV_FFI_CitC4_2", 0.25, 
    "LIB_CIV_FFI_CitC4_3", 0.25
]] call _fnc_saveToTemplate;             //this line determines civilian trucks -- Example: ["vehiclesCivIndustrial", ["C_Truck_02_transport_F"]] -- Array, can contain multiple assets

["vehiclesCivHeli", []] call _fnc_saveToTemplate;             //this line determines civilian helis -- Example: ["vehiclesCivHeli", ["C_Heli_Light_01_civil_F"]] -- Array, can contain multiple assets

["vehiclesCivBoat", ["B_Boat_Transport_01_F", 0.2]] call _fnc_saveToTemplate;             //this line determines civilian boats -- Example: ["vehiclesCivBoat", ["C_Boat_Civil_01_F"]] -- Array, can contain multiple assets

//Do we want vehicles of these kinds in this modset?
["vehiclesCivRepair", []] call _fnc_saveToTemplate;            //this line determines civilian repair vehicles

["vehiclesCivMedical", []] call _fnc_saveToTemplate;        //this line determines civilian medic vehicles

["vehiclesCivFuel", []] call _fnc_saveToTemplate;            //this line determines civilian fuel vehicles

/////////////////////
///  Identities   ///
/////////////////////

["faces", ["LivonianHead_6","WhiteHead_02","WhiteHead_04","WhiteHead_05","WhiteHead_09","WhiteHead_11","WhiteHead_13","WhiteHead_20","WhiteHead_21"]] call _fnc_saveToTemplate;

//////////////////////////
//       Loadouts       //
//////////////////////////

private _civUniforms = [
"U_LIB_CIV_Citizen_1",
"U_LIB_CIV_Citizen_2",
"U_LIB_CIV_Citizen_3",
"U_LIB_CIV_Citizen_4",
"U_LIB_CIV_Citizen_5",
"U_LIB_CIV_Citizen_6",
"U_LIB_CIV_Citizen_7",
"U_LIB_CIV_Citizen_8",
"U_LIB_CIV_Villager_1",
"U_LIB_CIV_Villager_2",
"U_LIB_CIV_Villager_3",
"U_LIB_CIV_Villager_4",
"U_LIB_CIV_Woodlander_1",
"U_LIB_CIV_Woodlander_2",
"U_LIB_CIV_Woodlander_3",
"U_LIB_CIV_Woodlander_4",
"U_LIB_CIV_Worker_1",
"U_LIB_CIV_Worker_2",
"U_LIB_CIV_Worker_3",
"U_LIB_CIV_Worker_4"
];          //Uniforms given to Normal Civs

private _workerUniforms = [
"U_LIB_CIV_Worker_1",
"U_LIB_CIV_Worker_2",
"U_LIB_CIV_Worker_3",
"U_LIB_CIV_Worker_4"
];           //Uniforms given to Workers at Factories/Resources