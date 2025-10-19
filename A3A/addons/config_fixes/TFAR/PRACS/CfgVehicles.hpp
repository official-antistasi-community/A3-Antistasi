//TFAR - CfgVehicles.hpp

class CfgVehicles 
{
    class B_AssaultPack_Base;

    class PRACS_RTO_BP : B_AssaultPack_Base
    {
        scopeCurator = 2;
        tf_dialog = "anprc155_radio_dialog";
        tf_dialogUpdate = "call TFAR_fnc_updateLRDialogToChannel;";
        tf_encryptionCode = "tf_independent_radio_code";
        tf_hasLRradio = 1;
        tf_range = 20000;
        tf_subtype = "digital_lr";
    };

    class PRACS_RTO_BP_M : B_AssaultPack_Base
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