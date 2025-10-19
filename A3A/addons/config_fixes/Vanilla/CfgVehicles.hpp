//Vanilla - CfgVehicles.hpp

class CfgVehicles 
{
    // Just so that we can identify them reliably with typeOf
    class Land_Can_V2_F;
    class a3a_tow_helper : Land_Can_V2_F {};

    class Land_HelipadSquare_F;
    class a3a_helipad : Land_HelipadSquare_F {};

#include "air.hpp"
#include "armor.hpp"
#include "ifv.hpp"
#include "sea.hpp"
#include "soft.hpp"
#include "houses.hpp"
};