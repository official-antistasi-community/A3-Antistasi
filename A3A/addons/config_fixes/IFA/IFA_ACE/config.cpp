//IFA - config.cpp

#include "..\..\script_component.hpp"


class CfgPatches 
{
    class A3A_config_fixes_IFA;
    class PATCHNAME(IFA_ACE) : A3A_config_fixes_IFA
    {
        name = COMPONENT_NAME;
        requiredAddons[] = {"A3A_config_fixes_IFA","IFA3_COMP_ACE_main","IFA3_COMP_ACE_mortar"};
    };
};

#include "..\CfgVehicles.hpp"
#include "..\CfgWeapons.hpp"
#include "..\CfgAmmo.hpp"