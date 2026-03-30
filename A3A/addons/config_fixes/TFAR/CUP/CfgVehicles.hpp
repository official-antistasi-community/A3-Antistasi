//TFAR/CUP - CfgVehicles.hpp

class CfgVehicles 
{
    class CUP_B_Predator_Base;

    class CUP_B_Kombat_Radio_Olive : CUP_B_Predator_Base
    {
        scopeCurator = 2;
        tf_dialog = "anprc155_radio_dialog";
        tf_dialogUpdate = "call TFAR_fnc_updateLRDialogToChannel;";
        tf_encryptionCode = "tf_independent_radio_code";
        tf_hasLRradio = 1;
        tf_range = 20000;
        tf_subtype = "digital_lr";
    };

    class CUP_B_Motherlode_Radio_MTP : CUP_B_Predator_Base
    {
        scopeCurator = 2;
        tf_dialog = "anprc155_radio_dialog";
        tf_dialogUpdate = "call TFAR_fnc_updateLRDialogToChannel;";
        tf_encryptionCode = "tf_independent_radio_code";
        tf_hasLRradio = 1;
        tf_range = 20000;
        tf_subtype = "digital_lr";
    };

    class CUP_B_Predator_Radio_MTP : CUP_B_Predator_Base
    {
        scopeCurator = 2;
        tf_dialog = "anprc155_radio_dialog";
        tf_dialogUpdate = "call TFAR_fnc_updateLRDialogToChannel;";
        tf_encryptionCode = "tf_independent_radio_code";
        tf_hasLRradio = 1;
        tf_range = 20000;
        tf_subtype = "digital_lr";
    };
};