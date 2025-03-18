//RHS - CfgWeapons.hpp

class CfgWeapons 
{
    class Rifle_Base_F;
    class rhs_weap_m3a1_base : Rifle_Base_F {
        class FullAuto;
    };
    class rhs_weap_m3a1 : rhs_weap_m3a1_base {
        class Ai_Burst : FullAuto {
            aiRateOfFire = 1;
            aiRateOfFireDistance = 100;
            maxRange = 300;
            midRange = 150;
            minRange = 30;
            burst = 3;
            burstRangeMax=6;
            showToPlayer = 0;
			aiBurstTerminable = 1;
        };
        modes[] = {"FullAuto","Ai_Burst"};
    };
    class rhs_weap_m3a1_specops : rhs_weap_m3a1_base {
        class Ai_Burst : FullAuto {
            aiRateOfFire = 1;
            aiRateOfFireDistance = 100;
            maxRange = 300;
            midRange = 150;
            minRange = 30;
            burst = 3;
            burstRangeMax=6;
            showToPlayer = 0;
			aiBurstTerminable = 1;
        };
        modes[] = {"FullAuto","Ai_Burst"};
    };
};

