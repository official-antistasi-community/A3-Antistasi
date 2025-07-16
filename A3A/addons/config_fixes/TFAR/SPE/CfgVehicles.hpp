//TFAR/SPE - CfgVehicles.hpp

class CfgVehicles 
{
    class B_SPE_AssaultPack_Base;

    class B_SPE_Milice_Radio : B_SPE_AssaultPack_Base
    {
        scope = 2;
        scopeCurator = 2;
        tf_dialog = "anprc155_radio_dialog";
        tf_dialogUpdate = "call TFAR_fnc_updateLRDialogToChannel;";
        tf_encryptionCode = "tf_independent_radio_code";
        tf_hasLRradio = 1;
        tf_range = 5000;
        tf_subtype = "digital_lr";
    };
};