//TFAR - CfgVehicles.hpp

class CfgVehicles 
{
    class rhs_r148;

    class a3a_rhs_r148 : rhs_r148
    {
        scope = 2;
        scopeCurator = 2;
        tf_dialog = "mr3000_radio_dialog"; // east dialog for east radio
        tf_dialogUpdate = "call TFAR_fnc_updateLRDialogToChannel;";
        tf_encryptionCode = "tf_independent_radio_code";
        tf_hasLRradio = 1;
        tf_range = 10000; // shorter range for tiny bag
        tf_subtype = "digital_lr";
    };
};