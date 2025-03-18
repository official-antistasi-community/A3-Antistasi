//CUP-SFP - sfp_air.hpp

class CUP_B_UH60S_USN;
class CUP_MH60S_Unarmed_USN;
class CUP_MH60S_Unarmed_FFV_USN;

class a3a_SFP_B_UH60S_USN : CUP_B_UH60S_USN
{
    displayName = "UH-60M (M3M)";
    textureList[] = {"Black", 1};
    animationList[] = {"Navyclan_hide",1,"Navyclan2_hide",1,"Filters_Hide",1,"mainRotor_folded",1,"mainRotor_unfolded",0,"Hide_ESSS2x",1,"Hide_ESSS4x",1,"Hide_Nose",0,"Blackhawk_Hide",0,"Hide_FlirTurret",1,"Hide_Probe",1,"Doorcock_Hide",0};
};
class a3a_SFP_MH60S_Unarmed_USN : CUP_MH60S_Unarmed_USN
{
    displayName = "UH-60M (Unarmed)";
    textureList[] = {"Black", 1};
    animationList[] = {"Navyclan_hide",1,"Navyclan2_hide",1,"Filters_Hide",1,"mainRotor_folded",1,"mainRotor_unfolded",0,"Hide_ESSS2x",1,"Hide_ESSS4x",1,"Hide_Nose",0,"Blackhawk_Hide",0,"Hide_FlirTurret",0,"Hide_Probe",1,"Doorcock_Hide",0};
};
class a3a_SFP_MH60S_Unarmed_FFV_USN : CUP_MH60S_Unarmed_FFV_USN
{
    displayName = "UH-60M (Unarmed/FFV)";
    textureList[] = {"Black", 1};
    animationList[] = {"Navyclan_hide",1,"Navyclan2_hide",1,"Filters_Hide",1,"mainRotor_folded",1,"mainRotor_unfolded",0,"Hide_ESSS2x",1,"Hide_ESSS4x",1,"Hide_Nose",0,"Blackhawk_Hide",0,"Hide_FlirTurret",0,"Hide_Probe",1,"Doorcock_Hide",0};
};