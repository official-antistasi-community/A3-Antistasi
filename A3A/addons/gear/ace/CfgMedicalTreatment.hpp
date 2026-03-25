
class ace_medical_treatment {
    class Medication {
		
		class Epinephrine;
		class a3a_coagulant : Epinephrine{
            painReduce = -0.5;
            hrIncreaseLow[] = {-5, -10};
            hrIncreaseNormal[] = {-5, -15};
            hrIncreaseHigh[] = {-5, -18};
            viscosityChange = 150;
            timeInSystem = 300;
            timeTillMaxEffect = 60;
		};
		class a3a_adrenaline : Epinephrine{
            painReduce = 0.8;
            hrIncreaseLow[] = {10, 40};
            hrIncreaseNormal[] = {10, 100};
            hrIncreaseHigh[] = {10, 80};
            timeInSystem = 60;
            timeTillMaxEffect = 5;
            viscosityChange = -30;
            dose = 3;
		};
        class ACE_Can_Spirit {
            painReduce = 0.035;
            dose = 1;
            maxDose = 40;
            maxDoseDeviation = 12;
            timeInSystem = 3600;
            timeTillMaxEffect = 120;
            hrIncreaseLow[] = {0, 5};
            hrIncreaseNormal[] = {0, 5};
            hrIncreaseHigh[] = {0, 5};
        };
        class ACE_Can_Franta : ACE_Can_Spirit {};
        class ACE_Can_RedGull : ACE_Can_Spirit {
            maxDose = 10;
            timeInSystem = 7200;
            hrIncreaseLow[] = {5, 15};
            hrIncreaseNormal[] = {5, 15};
            hrIncreaseHigh[] = {5, 15};
        };
        class a3a_coffeeIV{
            dose = 1;
            maxDose = 4;
            maxDoseDeviation = 2;
            timeInSystem = 3600;
            timeTillMaxEffect = 160;
            hrIncreaseLow[] = {10, 20};
            hrIncreaseNormal[] = {10, 50};
            hrIncreaseHigh[] = {10, 40};
        };
        class a3a_coffeeIV_500 : a3a_coffeeIV {
            dose = 0.5;
            timeTillMaxEffect = 80;
            timeInSystem = 1800;
            volume = 500;
            hrIncreaseLow[] = {5, 10};
            hrIncreaseNormal[] = {5, 25};
            hrIncreaseHigh[] = {5, 20};
        };
        class a3a_coffeeIV_250 : a3a_coffeeIV {
            dose = 0.25;
            timeTillMaxEffect = 40;
            timeInSystem = 900;
            volume = 250;
            hrIncreaseLow[] = {2.5, 5};
            hrIncreaseNormal[] = {2.5, 12.5};
            hrIncreaseHigh[] = {2.5, 10};
        };
    };
    class IV {
        class BloodIV;
        class a3a_coffeeIV : BloodIV {
            ratio[] = {"Saline",0.5, "a3a_coffee",0.5};
            gui_message = $STR_A3A_Medical_Treatment_receivingCoffee;
            type = "a3a_coffee";
        };
        class a3a_coffeeIV_500 : a3a_coffeeIV {
            volume = 500;
        };
        class a3a_coffeeIV_250 : a3a_coffeeIV {
            volume = 250;
        };
    };
};