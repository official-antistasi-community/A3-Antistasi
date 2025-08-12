class Single_Mode: Mode_SemiAuto
{
	showEmpty = 1;
    reloadTime = 0;
    dispersion = 0.008;
    aiRateOfFire = 4;
	autoFire = 1;
    aiRateOfFireDistance = 800;
    aiRateOfFireDispersion = 0;
    minRange = 200;
    minRangeProbab = 0.4;
    midRange = 600;
    midRangeProbab = 0.9;
    maxRange = 1200;
    maxRangeProbab = 0.05;
	sounds[] = {};
};
class FullAuto_Mode: Single_Mode 
{
	aiRateOfFire = 10;
	aiRateOfFireDistance = 800;
	autoFire = 1;
	displayName = "Full";
	showToPlayer = 0;
	textureType = "fullAuto";
};
class LauncherCore;
class RocketPods: LauncherCore {};
class Mk82BombLauncher: RocketPods 
{
	canLock = 0;
	autoFire = 1;
	ballisticsComputer = 0;
	magazineReloadSwitchPhase = 0;
	magazineReloadTime = 0;
	aiRateOfFire = 0.5;
	aiRateOfFireDistance = 300;
	minRange = 50;
	modes[] = {"Single","FullAuto"};
	class Single: Single_Mode {};
	class FullAuto: FullAuto_Mode {};
};
class CUP_Vblauncher_Mk82_veh: RocketPods
{
	canLock = 0;
	autoFire = 1;
	ballisticsComputer = 0;
	magazineReloadSwitchPhase = 0;
	magazineReloadTime = 0;
	aiRateOfFire = 0.5;
	aiRateOfFireDistance = 300;
	minRange = 50;
	modes[] = {"Single","FullAuto"};
	class Single: Single_Mode {};
	class FullAuto: FullAuto_Mode {};
};
