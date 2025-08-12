/*
Author: Targetingsnake, Bob, Laze
Description:
    Spawns a couple of AI Units to check template

Arguments: None

Return Value: None

Scope: Local
Environment: Any
Public: Yes
Dependencies:

Example: [] call A3A_fnc_spawnSelectedTemplateAI;

License: MIT License
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

Info("Start spawning units");

//All Loadouts with 15 meters in between with NatoInit 
 private _returnpos = getpos (player); 
 private _westGrp = createGroup west; 
 private _eastGrp = createGroup east; 
 
//All Loadouts with 15 meters in between
    _returnpos = getpos (player);
    //SF
        [_westGrp, "loadouts_occ_SF_SquadLeader", getpos (player)] call A3A_fnc_createUnit; 
        [_westGrp, "loadouts_occ_SF_Rifleman", getpos (player)] call A3A_fnc_createUnit; 
        [_westGrp, "loadouts_occ_SF_Medic", getpos (player)] call A3A_fnc_createUnit; 
        [_westGrp, "loadouts_occ_SF_Engineer", getpos (player)] call A3A_fnc_createUnit; 
        [_westGrp, "loadouts_occ_SF_ExplosivesExpert", getpos (player)] call A3A_fnc_createUnit; 
        [_westGrp, "loadouts_occ_SF_Grenadier", getpos (player)] call A3A_fnc_createUnit; 
        [_westGrp, "loadouts_occ_SF_LAT", getpos (player)] call A3A_fnc_createUnit; 
        [_westGrp, "loadouts_occ_SF_AT", getpos (player)] call A3A_fnc_createUnit; 
        [_westGrp, "loadouts_occ_SF_AA", getpos (player)] call A3A_fnc_createUnit; 
        [_westGrp, "loadouts_occ_SF_MachineGunner", getpos (player)] call A3A_fnc_createUnit; 
        [_westGrp, "loadouts_occ_SF_Marksman", getpos (player)] call A3A_fnc_createUnit; 
        [_westGrp, "loadouts_occ_SF_Sniper", getpos (player)] call A3A_fnc_createUnit;
        player setPos (getPos player vectorAdd [15,0,0]);
    //Military
        [_westGrp, "loadouts_occ_military_SquadLeader", getpos (player)] call A3A_fnc_createUnit; 
        [_westGrp, "loadouts_occ_military_Rifleman", getpos (player)] call A3A_fnc_createUnit; 
        [_westGrp, "loadouts_occ_military_Medic", getpos (player)] call A3A_fnc_createUnit; 
        [_westGrp, "loadouts_occ_military_Engineer", getpos (player)] call A3A_fnc_createUnit; 
        [_westGrp, "loadouts_occ_military_ExplosivesExpert", getpos (player)] call A3A_fnc_createUnit; 
        [_westGrp, "loadouts_occ_military_Grenadier", getpos (player)] call A3A_fnc_createUnit; 
        [_westGrp, "loadouts_occ_military_LAT", getpos (player)] call A3A_fnc_createUnit; 
        [_westGrp, "loadouts_occ_military_AT", getpos (player)] call A3A_fnc_createUnit; 
        [_westGrp, "loadouts_occ_military_AA", getpos (player)] call A3A_fnc_createUnit; 
        [_westGrp, "loadouts_occ_military_MachineGunner", getpos (player)] call A3A_fnc_createUnit; 
        [_westGrp, "loadouts_occ_military_Marksman", getpos (player)] call A3A_fnc_createUnit; 
        [_westGrp, "loadouts_occ_military_Sniper", getpos (player)] call A3A_fnc_createUnit;
        player setPos (getPos player vectorAdd [15,0,0]);
    //Militia
        [_westGrp, "loadouts_occ_militia_SquadLeader", getpos (player)] call A3A_fnc_createUnit; 
        [_westGrp, "loadouts_occ_militia_Rifleman", getpos (player)] call A3A_fnc_createUnit; 
        [_westGrp, "loadouts_occ_militia_Medic", getpos (player)] call A3A_fnc_createUnit; 
        [_westGrp, "loadouts_occ_militia_Engineer", getpos (player)] call A3A_fnc_createUnit; 
        [_westGrp, "loadouts_occ_militia_ExplosivesExpert", getpos (player)] call A3A_fnc_createUnit; 
        [_westGrp, "loadouts_occ_militia_Grenadier", getpos (player)] call A3A_fnc_createUnit; 
        [_westGrp, "loadouts_occ_militia_LAT", getpos (player)] call A3A_fnc_createUnit; 
        [_westGrp, "loadouts_occ_militia_AT", getpos (player)] call A3A_fnc_createUnit; 
        [_westGrp, "loadouts_occ_militia_AA", getpos (player)] call A3A_fnc_createUnit; 
        [_westGrp, "loadouts_occ_militia_MachineGunner", getpos (player)] call A3A_fnc_createUnit; 
        [_westGrp, "loadouts_occ_militia_Marksman", getpos (player)] call A3A_fnc_createUnit; 
        [_westGrp, "loadouts_occ_militia_Sniper", getpos (player)] call A3A_fnc_createUnit;
        player setPos (getPos player vectorAdd [15,0,0]);
    //Other Loadouts
        [_westGrp, "loadouts_occ_police_SquadLeader", getpos (player)] call A3A_fnc_createUnit; 
        [_westGrp, "loadouts_occ_police_Standard", getpos (player)] call A3A_fnc_createUnit; 
        [_westGrp, "loadouts_occ_other_Official", getpos (player)] call A3A_fnc_createUnit; 
        [_westGrp, "loadouts_occ_other_Traitor", getpos (player)] call A3A_fnc_createUnit; 
        [_westGrp, "loadouts_occ_other_Crew", getpos (player)] call A3A_fnc_createUnit; 
        [_westGrp, "loadouts_occ_other_Pilot", getpos (player)] call A3A_fnc_createUnit;
        player setpos _returnpos;
        player setPos (getPos player vectorAdd [0,10,0]);
		//Safety west
        _westGrp setCombatMode "BLUE";
        _westGrp setBehaviourStrong "CARELESS";
        {
        _x disableAI "TARGET"; 
        _x disableAI "AUTOTARGET";
        _x stop true;
        _x setCaptive true;
        } forEach units _westGrp;
		{[_x] call A3A_fnc_NATOinit} forEach units _westGrp;
    //All INV Loadouts
    //SF 
        [_eastGrp, "loadouts_inv_SF_SquadLeader", getpos (player)] call A3A_fnc_createUnit;  
        [_eastGrp, "loadouts_inv_SF_Rifleman", getpos (player)] call A3A_fnc_createUnit;  
        [_eastGrp, "loadouts_inv_SF_Medic", getpos (player)] call A3A_fnc_createUnit;  
        [_eastGrp, "loadouts_inv_SF_Engineer", getpos (player)] call A3A_fnc_createUnit;  
        [_eastGrp, "loadouts_inv_SF_ExplosivesExpert", getpos (player)] call A3A_fnc_createUnit;  
        [_eastGrp, "loadouts_inv_SF_Grenadier", getpos (player)] call A3A_fnc_createUnit;  
        [_eastGrp, "loadouts_inv_SF_LAT", getpos (player)] call A3A_fnc_createUnit;  
        [_eastGrp, "loadouts_inv_SF_AT", getpos (player)] call A3A_fnc_createUnit;  
        [_eastGrp, "loadouts_inv_SF_AA", getpos (player)] call A3A_fnc_createUnit;  
        [_eastGrp, "loadouts_inv_SF_MachineGunner", getpos (player)] call A3A_fnc_createUnit;  
        [_eastGrp, "loadouts_inv_SF_Marksman", getpos (player)] call A3A_fnc_createUnit;  
        [_eastGrp, "loadouts_inv_SF_Sniper", getpos (player)] call A3A_fnc_createUnit; 
        player setPos (getPos player vectorAdd [15,0,0]); 
    //Military 
        [_eastGrp, "loadouts_inv_military_SquadLeader", getpos (player)] call A3A_fnc_createUnit;  
        [_eastGrp, "loadouts_inv_military_Rifleman", getpos (player)] call A3A_fnc_createUnit;  
        [_eastGrp, "loadouts_inv_military_Medic", getpos (player)] call A3A_fnc_createUnit;  
        [_eastGrp, "loadouts_inv_military_Engineer", getpos (player)] call A3A_fnc_createUnit;  
        [_eastGrp, "loadouts_inv_military_ExplosivesExpert", getpos (player)] call A3A_fnc_createUnit;  
        [_eastGrp, "loadouts_inv_military_Grenadier", getpos (player)] call A3A_fnc_createUnit;  
        [_eastGrp, "loadouts_inv_military_LAT", getpos (player)] call A3A_fnc_createUnit;  
        [_eastGrp, "loadouts_inv_military_AT", getpos (player)] call A3A_fnc_createUnit;  
        [_eastGrp, "loadouts_inv_military_AA", getpos (player)] call A3A_fnc_createUnit;  
        [_eastGrp, "loadouts_inv_military_MachineGunner", getpos (player)] call A3A_fnc_createUnit;  
        [_eastGrp, "loadouts_inv_military_Marksman", getpos (player)] call A3A_fnc_createUnit;  
        [_eastGrp, "loadouts_inv_military_Sniper", getpos (player)] call A3A_fnc_createUnit; 
        player setPos (getPos player vectorAdd [15,0,0]); 
    //Militia 
        [_eastGrp, "loadouts_inv_militia_SquadLeader", getpos (player)] call A3A_fnc_createUnit;  
        [_eastGrp, "loadouts_inv_militia_Rifleman", getpos (player)] call A3A_fnc_createUnit;  
        [_eastGrp, "loadouts_inv_militia_Medic", getpos (player)] call A3A_fnc_createUnit;  
        [_eastGrp, "loadouts_inv_militia_Engineer", getpos (player)] call A3A_fnc_createUnit;  
        [_eastGrp, "loadouts_inv_militia_ExplosivesExpert", getpos (player)] call A3A_fnc_createUnit;  
        [_eastGrp, "loadouts_inv_militia_Grenadier", getpos (player)] call A3A_fnc_createUnit;  
        [_eastGrp, "loadouts_inv_militia_LAT", getpos (player)] call A3A_fnc_createUnit;  
        [_eastGrp, "loadouts_inv_militia_AT", getpos (player)] call A3A_fnc_createUnit;  
        [_eastGrp, "loadouts_inv_militia_AA", getpos (player)] call A3A_fnc_createUnit;  
        [_eastGrp, "loadouts_inv_militia_MachineGunner", getpos (player)] call A3A_fnc_createUnit;  
        [_eastGrp, "loadouts_inv_militia_Marksman", getpos (player)] call A3A_fnc_createUnit;  
        [_eastGrp, "loadouts_inv_militia_Sniper", getpos (player)] call A3A_fnc_createUnit; 
        player setPos (getPos player vectorAdd [15,0,0]); 
    //Other Loadouts 
        [_eastGrp, "loadouts_inv_police_SquadLeader", getpos (player)] call A3A_fnc_createUnit;  
        [_eastGrp, "loadouts_inv_police_Standard", getpos (player)] call A3A_fnc_createUnit;  
        [_eastGrp, "loadouts_inv_other_Official", getpos (player)] call A3A_fnc_createUnit;  
        [_eastGrp, "loadouts_inv_other_Traitor", getpos (player)] call A3A_fnc_createUnit;  
        [_eastGrp, "loadouts_inv_other_Crew", getpos (player)] call A3A_fnc_createUnit;  
        [_eastGrp, "loadouts_inv_other_Pilot", getpos (player)] call A3A_fnc_createUnit; 


    //Safety east
 _eastGrp setCombatMode "BLUE"; 
 _eastGrp setBehaviourStrong "CARELESS"; 
 { 
	_x disableAI "TARGET";  
	_x disableAI "AUTOTARGET"; 
	_x stop true; 
	_x setCaptive true; 
	} forEach units _eastGrp; 
	{[_x] call A3A_fnc_NATOinit} forEach units _eastGrp;
	player setpos _returnpos; 

Info("End spawning units");