class CfgVehicles {
    #include "houses.hpp"
  
    class vn_static_mortar_m2_base;
    class vn_b_army_static_mortar_m2 : vn_static_mortar_m2_base {
        class Turrets;
    };
	class a3a_vn_b_static_mortar_m2_base: vn_b_army_static_mortar_m2 {
		scope = 0; 
		class Turrets : Turrets { 
			class MainTurret; 
		}; 
	};
	class a3a_vn_b_static_mortar_m2: a3a_vn_b_static_mortar_m2_base {
		scope = 2;
		class Turrets : Turrets {
			class MainTurret : MainTurret {
				magazines[] = {"vn_mortar_m2_mag_he_x8","vn_mortar_m2_mag_he_x8","vn_mortar_m2_mag_he_x8","vn_mortar_m2_mag_wp_x8","vn_mortar_m2_mag_lume_x8"};
			};
		};
	};
    class vn_static_mortar_m29_base;
    class vn_b_army_static_mortar_m29 : vn_static_mortar_m29_base {
        class Turrets;
    };
	class a3a_vn_b_static_mortar_m29_base: vn_b_army_static_mortar_m29 {
		scope = 0; 
		class Turrets : Turrets { 
			class MainTurret; 
		}; 
	};
	class a3a_vn_b_static_mortar_m29: a3a_vn_b_static_mortar_m29_base {
		scope = 2;
		class Turrets : Turrets {
			class MainTurret : MainTurret {
				magazines[] = {"vn_mortar_m29_mag_he_x8","vn_mortar_m29_mag_he_x8","vn_mortar_m29_mag_he_x8","vn_mortar_m29_mag_wp_x8","vn_mortar_m29_mag_chem_x8","vn_mortar_m29_mag_lume_x8"};
			};
		};
	};
};