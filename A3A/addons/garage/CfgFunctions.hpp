class CfgFunctions
{
    class HR_GRG
    {
    //private functions
        class Core
        {
            file = QPATHTOFOLDER(Core);
            class addUser {};
            class broadcast {};
            class confirm {};
            class confirmPlacement {};
            class declairSources {};
            class execForGarageUsers {};
            class genVehUID {};
            class getCatIndex {};
            class getLockCount {};
            class onLoad {};
            class onUnload {};
            class reciveBroadcast {};
            class releaseAllVehicles {};
            class reloadCategory {};
            class reloadPreview {};
            class removeFromPool {};
            class removeUser {};
            class requestSelectionChange {};
            class requestVehicle {};
            class selectionChange {};
            class sellVehGRG {};
            class sellVehGRGLocal {};
            class switchCategory {};
            class toggleConfirmBttn {};
            class toggleLock {};
            class updateCamPos {};
            class updateVehicleCount {};
            class validateGarage {};
        };
        class Extras
        {
            file = QPATHTOFOLDER(Extras);
            class findMount {};
            class isAmmoSource {};
            class isFuelSource {};
            class isRepairSource {};
            class reloadExtras {};
            class reloadMounts {};
            class requestMount {};
            class switchExtrasMenu {};
            class switchTexture {};
            class toggleAnim {};
        };
        class Pylons
        {
            file = QPATHTOFOLDER(Pylons);
            class getPylonTurret {};
            class pylonsChanged {};
            class pylonsPresetChanged {};
            class pylonsTurretToggle {};
            class pylonToggleMirror {};
            class reloadPylons {};
            class updatePylons {};
        };
        class StatePreservation
        {
            file = QPATHTOFOLDER(StatePreservation);
            class getAmmoData {};
            class getDamage {};
            class getFuel {};
            class getState {};
            class prepPylons {};
            class setAmmoData {};
            class setDamage {};
            class setFuel {};
            class setState {};
        };

        class Refuel
        {
            file = QPATHTOFOLDER(Refuel);
            class broadcastStateUpdate {};
            class getTotalFuelCargo {};
            class prefix {};
            class reciveStateUpdate {};
            class refuelVehicleFromSources {};
        };

        class Public
        {
            file = QPATHTOFOLDER(Public);
            class addVehiclesByClass {};
            class addVehicle {};
            class getSaveData {};
            class initGarage {};
            class initServer {
                postInit = 1;
            };
            class loadSaveData {};
        };
    };
};
