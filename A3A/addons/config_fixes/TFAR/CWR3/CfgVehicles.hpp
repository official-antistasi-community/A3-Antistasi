//TFAR/CWR3 - CfgVehicles.hpp

class CfgVehicles 
{
    class cwr3_b_backpack_alice_base;

    class cwr3_b_backpack_radio : cwr3_b_backpack_alice_base
    {
        tf_dialog = "anprc155_radio_dialog";
        tf_dialogUpdate = "call TFAR_fnc_updateLRDialogToChannel;";
        tf_encryptionCode = "tf_independent_radio_code";
        tf_hasLRradio = 1;
        tf_range = 20000;
        tf_subtype = "digital_lr";
    };

    class cwr3_o_backpack_rd54_base;

    class cwr3_o_backpack_rd54_r148 : cwr3_o_backpack_rd54_base
    {
        tf_dialog = "anprc155_radio_dialog";
        tf_dialogUpdate = "call TFAR_fnc_updateLRDialogToChannel;";
        tf_encryptionCode = "tf_independent_radio_code";
        tf_hasLRradio = 1;
        tf_range = 20000;
        tf_subtype = "digital_lr";
    };
};