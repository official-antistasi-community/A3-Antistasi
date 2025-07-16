class DOUBLES(ADDON,Nodes)
{
    class TRIPLES(ADDON,Nodes,Base)
    {
        class Nodes {};
        canLoadWeapon = 1; //if the vehicle can load weapons
        weaponBlackList[] = {}; //blacklist-array Weaponstypes (1 - mortar, 2 - MG, 3 - AT, 4 - AA)
        canLoadLowWeapons = 1; //if the vehicle can load weapons with a low profile (e.g. M2 Low Mount)
        isBoat = 0; //if the vehicle is a boat
    };

    #include "Nodes\3CBBAF.hpp"
    #include "Nodes\3CBFactions.hpp"
    #include "Nodes\CUP.hpp"
    #include "Nodes\D3S.hpp"
    #include "Nodes\GM.hpp"
    #include "Nodes\IFA.hpp"
    #include "Nodes\RDS.hpp"
    #include "Nodes\RF.hpp"
    #include "Nodes\RHS.hpp"
    #include "Nodes\RNT.hpp"
    #include "Nodes\SPE.hpp"
    #include "Nodes\UNS.hpp"
    #include "Nodes\Vanilla.hpp"
    #include "Nodes\VN.hpp"
    #include "Nodes\WS.hpp"
    #include "Nodes\SFP.hpp"
     #include "Nodes\CWR.hpp"
};

class DOUBLES(ADDON,Cargo)
{
    class TRIPLES(ADDON,Cargo,Base)
    {
        offset[] = {0,0,0}; //the offset from the node(s) to load the cargo on too
        rotation[] = {0,1,0}; //the rotation from the vehicle model front
        size = 1; //the amount of nodes it occupies
        recoil = 0; //the recoil a weapon impacts on the vehicle when fired (per projectile)
        isWeapon = 0; //if the cargo is a weapon (needed for proper handling of mounted weapon)
        blackList[] = {}; //specific vehicles or models to blacklist from loading this weapon/cargo
        isLow = 0; // if the weapon has low silhouette (e.g. M2 Low Mount)
        disallowOnBoat = 0; // if the weapon is allowed in boats (0 - default behaviour, 1 - disallowed)
        weaponType = 0; // defines type of weapon if it is an weapon (0 - undefined, 1 - mortar, 2 - MG, 3 - AT, 4 - AA)
    };

    #include "Cargo\3CBFactions.hpp"
    #include "Cargo\ACE.hpp"
    #include "Cargo\BWA3.hpp"
    #include "Cargo\CUP.hpp"
    #include "Cargo\GM.hpp"
    #include "Cargo\IFA.hpp"
    #include "Cargo\RHS.hpp"
    #include "Cargo\SPE.hpp"
    #include "Cargo\UNS.hpp"
    #include "Cargo\Vanilla.hpp"
    #include "Cargo\VN.hpp"
    #include "Cargo\WS.hpp"
};

class DOUBLES(ADDON,Packable) {
    class TRIPLES(ADDON,Packable,Base)
    {
        packObject = "CargoNet_01_box_F";
    };

    #include "Packable\Vanilla.hpp"
};
