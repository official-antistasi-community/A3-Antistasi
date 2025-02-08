//-- display --\\
#define HR_GRG_IDD_Garage 17001

//-- pixelGrid --\\
#define pixelScale    0.50
#define GRID_NOUISCALE_W (pixelW * pixelGridNoUIScale * pixelScale)
#define GRID_NOUISCALE_H (pixelH * pixelGridNoUIScale * pixelScale)

//-- Screen edge coordinates --\\
#define SCREEN_TOP safeZoneY
#define SCREEN_BOTTOM safeZoneH + safeZoneY
#define SCREEN_LEFT safeZoneX
#define SCREEN_RIGHT safeZoneW + safeZoneX

//-- Text sizes --\\
#define TEXT_SIZE_SMALL GRID_NOUISCALE_H * 2
#define TEXT_SIZE_MEDIUM GRID_NOUISCALE_H * 2.4
#define TEXT_SIZE_LARGE GRID_NOUISCALE_H * 3

//-- Category --\\
#define HR_GRG_IDC_CatCar 1700100
#define HR_GRG_IDC_CatArmored 1700101
#define HR_GRG_IDC_CatAir 1700102
#define HR_GRG_IDC_CatBoat 1700103
#define HR_GRG_IDC_CatStatic 1700104
#define HR_GRG_IDC_BttnCars 1700105
#define HR_GRG_IDC_BttnArmor 1700106
#define HR_GRG_IDC_BttnAir 1700107
#define HR_GRG_IDC_BttnBoats 1700108
#define HR_GRG_IDC_BttnStatics 1700109

//-- extra --\\
#define HR_GRG_IDC_BttnMounts 1700170
#define HR_GRG_IDC_BttnTexture 1700171
#define HR_GRG_IDC_BttnAnim 1700172
#define HR_GRG_IDC_BttnPylons 1700173
#define HR_GRG_IDC_ExtraMounts 1700150
#define HR_GRG_IDC_ExtraTexture 1700151
#define HR_GRG_IDC_ExtraAnim 1700152
#define HR_GRG_IDC_ExtraPylonsContainer 1700153 // Outer controlsgroup
#define HR_GRG_IDC_ExtraPylonsMirrorCheckbox 1700154
#define HR_GRG_IDC_ExtraPylonsMirrorLabel 1700155
#define HR_GRG_IDC_ExtraPylonsPresetsCombo 1700156
#define HR_GRG_IDC_ExtraPylons 1700157 // Controlsgroup containing all the actual pylons
#define HR_GRG_IDC_PylonsFirstIDC 1715300
#define checkboxTextures [tolower gettext (configfile >> "RscCheckBox" >> "textureUnchecked"),tolower gettext (configfile >> "RscCheckBox" >> "textureChecked")]

//-- General --\\
#define HR_GRG_IDC_Cancel 170011
#define HR_GRG_IDC_tLock 170012
#define HR_GRG_IDC_Confirm 170013
#define HR_GRG_IDC_InfoPanel 170014
#define HR_GRG_IDC_SellVeh 170015
#define HR_GRG_IDC_SourcePanelAmmo 1700141
#define HR_GRG_IDC_SourcePanelFuel 1700142
#define HR_GRG_IDC_SourcePanelRepair 1700143
#define HR_GRG_IDC_CatText 170016
#define HR_GRG_IDC_ExtrasText 170017
#define HR_GRG_IDC_KeyBindHint 170018
#define HR_GRG_IDC_CapacityCount 170019

//icons
#define CheckOutIcon "\a3\ui_f\data\Map\Diary\Icons\diaryLocateTask_ca.paa"
#define LockIcon "\a3\ui_f\data\GUI\Rsc\RscDisplayMain\infoDLCs_ca.paa"
#define TexturesIcon "\a3\ui_f\data\GUI\Rsc\RscDisplayGarage\textureSources_ca.paa"
#define AnimationsIcon "\a3\ui_f\data\GUI\Rsc\RscDisplayArcadeMap\icon_debug_ca.paa"
#define PylonsIcon "\a3\ui_f\data\GUI\Cfg\Hints\warhead_types_ca.paa"

#define CarIcon "\a3\ui_f\data\GUI\Rsc\RscDisplayGarage\car_ca.paa"
#define ArmoredIcon "\a3\ui_f\data\GUI\Rsc\RscDisplayGarage\tank_ca.paa"
#define AirIcon "\a3\ui_f\data\GUI\Rsc\RscDisplayGarage\helicopter_ca.paa"
#define BoatIcon "\a3\ui_f\data\GUI\Rsc\RscDisplayGarage\naval_ca.paa"
#define StaticIcon "\a3\ui_f\data\GUI\Rsc\RscDisplayGarage\static_ca.paa"

#define DriverIcon "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_driver_ca.paa"
#define GunnerIcon "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_gunner_ca.paa"
#define CommanderIcon "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_commander_ca.paa"
#define CargoIcon "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\role_cargo_ca.paa"

#define CrateIcon "\a3\ui_f\data\Map\VehicleIcons\iconCrateWpns_ca.paa"
#define VehCargoIcon "\a3\ui_f\data\IGUI\Cfg\VehicleToggles\VehicleCargoIconOn2_ca.paa"
#define SpeedIcon "\a3\ui_f\data\GUI\Rsc\RscDisplayOptionsVideo\icon_performance.paa"
#define EngineIcon "\a3\ui_f\data\IGUI\Cfg\Actions\engine_on_ca.paa"
#define MassIcon "\a3\ui_f\data\GUI\Cfg\Cursors\raise_gs.paa"
#define RearmIcon "\a3\ui_f\data\IGUI\Cfg\Actions\reload_ca.paa"
#define RefuelIcon "\a3\ui_f\data\IGUI\Cfg\Actions\refuel_ca.paa"
#define RepairIcon "\a3\ui_f\data\IGUI\Cfg\Actions\repair_ca.paa"

#define TutorialIcon "\a3\ui_f\data\IGUI\Cfg\simpleTasks\types\unknown_ca.paa"
#define cameraIcon "\a3\ui_f\data\GUI\Cfg\KeyframeAnimation\IconCamera_CA.paa"
#define moveIcon "\a3\ui_f\data\GUI\Cfg\Cursors\move_gs.paa"
#define zoomIcon "\a3\ui_f\data\IGUI\Cfg\Actions\autohover_ca.paa"

//Cfg macros
#define cfgPreview(className) getText(configfile >> "CfgVehicles" >> className >> "editorPreview")
#define cfgIcon(className) getText(configfile >> "CfgVehicles" >> className >> "picture")
#define cfgDispName(className) getText(configfile >> "CfgVehicles" >> className >> "displayName")
#define cfgVehClass(className) getText(configfile >> "CfgVehicles" >> className >> "vehicleClass")
#define cfgEditorCat(className) getText(configfile >> "CfgVehicles" >> className >> "editorSubCategory")
#define cfgMaxSpeed(className) getNumber(configfile >> "CfgVehicles" >> className >> "maxSpeed")
#define cfgEnginePower(className) getNumber(configfile >> "CfgVehicles" >> className >> "enginePower")
#define cfgAceCargo(className) getNumber(configfile >> "CfgVehicles" >> className >> "ace_cargo_space")
