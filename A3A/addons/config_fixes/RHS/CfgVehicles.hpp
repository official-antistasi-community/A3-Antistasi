//RHS - CfgVehicles.hpp

class CfgVehicles 
{
	#include "chdkz_rhs.hpp"
	#include "tla_rhs.hpp"
	#include "hidf_rhs.hpp"

	class RHS_M252_Base;
	class RHS_M252_D: RHS_M252_Base {
		class Turrets;
	};
	class a3a_RHS_M252_base: RHS_M252_D {
		scope = 0; 
		class Turrets : Turrets { 
			class MainTurret; 
		}; 
	};
	class a3a_RHS_M252: a3a_RHS_M252_base {
		scope = 2;
		class Turrets : Turrets {
			class MainTurret : MainTurret {
				magazines[] = {"rhs_12Rnd_m821_HE","rhs_12Rnd_m821_HE","8Rnd_82mm_Mo_Smoke_white","8Rnd_82mm_Mo_Flare_white"};
			};
		};
	};
};