//Vanilla - CfgVehicles.hpp

class CfgVehicles 
{
    #include "sfp_air.hpp"

    // Nose-fall tweaks to make planes turn at a semi-decent rate when flown by AI
	class Plane_Base_F;
	class CUP_A10_Base : Plane_Base_F
	{
		draconicTorqueXCoef = 2;
	};
	class CUP_L39_base : Plane_base_F
	{
		draconicTorqueXCoef = 2;
	};

    // The faster planes benefit slightly from more torque, so we use the array form
	class Plane;
	class CUP_AV8B_Base : Plane
	{
		draconicTorqueXCoef[] = {2,3,4,5,6,7,8,9,10,10.1,10.2};
	};
	class CUP_Su25_base : Plane
	{
		draconicTorqueXCoef[] = {2,3,4,5,6,7,8,9,10,10.1,10.2};
		//speeds in m/s: {0, 37.5, 75, 112.5, 150, 187.5, 225, 262.5, 300, 337.5, 375m/s}
	};
	class CUP_F35B_base : Plane
	{
		draconicTorqueXCoef[] = {2,3.5,5,6.5,8,9,10,11,12,12.1,12.2};
		//speeds in m/s: {0, 58.3, 117, 175, 233, 292, 350, 408, 467, 525, 583m/s}
	};
	class CUP_SU34_BASE : Plane
	{
		draconicTorqueXCoef[] = {2,3.5,5,6.5,8,9,10,11,12,12.1,12.2};
	};
};