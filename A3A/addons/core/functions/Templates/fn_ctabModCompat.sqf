#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
////////////////////////////////////
//      cTab ITEMS LIST          ///
////////////////////////////////////
Info("Creating cTab Items List");
ctabGPS = [
	"ItemMicroDAGR", // MicroDAGR
	"ItemcTab", // Rugged Tablet
	"ItemAndroid" // S7 Android
];

ctabMiscItems = [
	"ItemcTabHCam", // Helmet Camera
	"ItemMicroDAGRMisc", // MicroDAGR
	"ItemcTabMisc", // Rugged Tablet
	"ItemAndroidMisc" // S7 Android
];

publicVariable "ctabGPS";
publicVariable "ctabMiscItems";

if (startWithcTabItems) then {
	FactionGet(reb, "initialRebelEquipment") append ctabGPS;
	FactionGet(reb, "initialRebelEquipment") append ctabMiscItems;
};
