#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
////////////////////////////////////
//      ILBE ITEMS LIST          ///
////////////////////////////////////
Info("Creating ILBE Items List");
ilbeRadioBackpacks = [
	"tfw_ilbe_blade_black", // [ILBE] RT-1523G (ASIP) + VHF Blade Antenna (Black)
	"tfw_ilbe_blade_coy", // [ILBE] RT-1523G (ASIP) + VHF Blade Antenna (Coyote)
	"tfw_ilbe_blade_gr", // [ILBE] RT-1523G (ASIP) + VHF Blade Antenna (Green)
	"tfw_ilbe_DD_black", // [ILBE] RT-1523G (ASIP) + VHF/UHF Antenna (Black)
	"tfw_ilbe_DD_coy", // [ILBE] RT-1523G (ASIP) + VHF/UHF Antenna (Coyote)
	"tfw_ilbe_DD_gr", // [ILBE] RT-1523G (ASIP) + VHF/UHF Antenna (Green)
	"tfw_ilbe_whip_black", // [ILBE] RT-1523G (ASIP) + Whip Antenna (Black)
	"tfw_ilbe_whip_coy", // [ILBE] RT-1523G (ASIP) + Whip Antenna (Coyote)
	"tfw_ilbe_whip_gr" // [ILBE] RT-1523G (ASIP) + Whip Antenna (Green)
];

ilbeAntennas = [
	"tfw_rf3080Item", // SATCOM Antenna
	"tfw_blade", // VHF Blade Antenna
	"tfw_whip", // VHF Whip Antenna
	"tfw_dd" // VHF/UHF Antenna
];

publicVariable "ilbeRadioBackpacks";
publicVariable "ilbeAntennas";

if (startWithILBERadios) then {
	FactionGet(reb, "initialRebelEquipment") append ilbeRadioBackpacks;
	FactionGet(reb, "initialRebelEquipment") append ilbeAntennas;
};
