
class ace_medical_treatment_actions {
    
		class Epinephrine;
		class a3a_coagulant : Epinephrine {
            //condition = "params ['_medic', '_patient']; _medic == _patient;";
            displayName = "Inject Comp C";
            displayNameProgress = "Injecting Comp C";
            items[] = {"a3a_coagulant"};
		};
		class a3a_adrenaline : Epinephrine {
            //condition = "params ['_medic', '_patient']; _medic == _patient;";
            displayName = "Inject Comp A";
            displayNameProgress = "Injecting Comp A";
            items[] = {"a3a_adrenaline"};
		};

        class BloodIV;
        class a3a_coffeeIV : BloodIV {
            displayName = $STR_A3A_ESPRESSO_1000_GIVE;
            displayNameProgress = $STR_A3A_ESPRESSO_ACTION;
            items[] = {"a3a_coffeeIV"};
            callbackSuccess = "A3A_fnc_coffeeIV";
        }
        class a3a_coffeeIV_500 : a3a_coffeeIV {
            displayName = $STR_A3A_ESPRESSO_500_GIVE;
            items[] = {"a3a_coffeeIV_500"};
        }
        class a3a_coffeeIV_250 : a3a_coffeeIV {
            displayName = $STR_A3A_ESPRESSO_250_GIVE;
            items[] = {"a3a_coffeeIV_250"};
        }
        class FieldDressing;
        class ACE_Can_Spirit : FieldDressing {
            allowedSelections[] = {"Head"};
            category = "medication";
            condition = "params ['_medic', '_patient']; _medic == _patient;";
            consumeItem = 1; //Handled in callbackStart
            displayName = "Drink can of Spirit";
            displayNameProgress = "Drinking";
            items[] = {"ACE_Can_Spirit"};
            animationMedic = "";
            animationMedicProne = "";
            animationMedicSelf = ""; 
            animationMedicSelfProne = "";
            litter[] = {{"Land_Can_V1_F"},{"Land_Can_Dented_F"},{"Land_Can_Dented_F"}};
            callbackStart = "A3A_fnc_drinkMed";
            callbackSuccess = "ace_medical_treatment_fnc_medication";
            treatmentTime = 10;
        };
        class ACE_Can_Franta : ACE_Can_Spirit {            
            displayName = "Drink can of Franta";
            items[] = {"ACE_Can_Franta"};
            litter[] = {{"Land_Can_V2_F"},{"Land_Can_V2_F"},{"Land_Can_V2_F"}};
        };
        class ACE_Can_RedGull : ACE_Can_Spirit {
            displayName = "Drink can of RedGull";
            items[] = {"ACE_Can_RedGull"};
            litter[] = {{"Land_Can_V3_F"},{"Land_Can_V3_F"},{"Land_Can_V3_F"}};
        };
};