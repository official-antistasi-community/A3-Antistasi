/*
Author: Barbolani
Maintainer: DoomMetal, MeltedPixel, Bob-Murphy, Wurzel0701
    Sets the units traits (camouflage, medic, engineer) for the selected role of the player
    THIS FILE DEPENDS ON ONLY THE DEFAULT COMMANDER HAVING A ROLE DESCRIPTION!

Arguments:
    <NULL>

Return Value:
    <NULL>

Scope: Local
Environment: Any
Public: No
Dependencies:
    <NULL>

Example:
    [] execVM "OrgPlayers\unitTraits.sqf";
*/

private _type = typeOf player;
private _text = "";
if(roleDescription player == "Default Commander") then
{
    //Same values as teamleader
    player setUnitTrait ["camouflageCoef",0.8];
    player setUnitTrait ["audibleCoef",0.8];
    player setUnitTrait ["loadCoef",1.4];
    player setUnitTrait ["medic", true];
	player setUnitTrait ["engineer", true];
    _text = localize "STR_antistasi_traits_commander";
}
else
{
    switch (_type) do
    {
    	//case "I_C_Soldier_Para_7_F": {player setUnitTrait ["UAVHacker",true]}; //opted as we use units which automatically have the trait - 8th January 2020, Bob Murphy
    	//case "I_C_Soldier_Para_8_F": {player setUnitTrait ["engineer",true]; player setUnitTrait ["explosiveSpecialist",true]}; //opted as we use units which automatically have the trait - 8th January 2020, Bob Murphy
    	//case "I_C_Soldier_Para_3_F": {player setUnitTrait ["medic",true]}; //opted as we use units which automatically have the trait - 8th January 2020, Bob Murphy
    	case typePetros: {player setUnitTrait ["UAVHacker",true]};
    	//cases for greenfor missions
    	case "I_G_medic_F":  {_text = localize "STR_antistasi_traits_medic"}; //reintroduced - 8th January 2020, Bob Murphy
    	case "I_G_Soldier_TL_F": {player setUnitTrait ["camouflageCoef",0.8]; player setUnitTrait ["audibleCoef",0.8]; player setUnitTrait ["loadCoef",1.4]; _text = localize "STR_antistasi_traits_teamleader"}; //reintroduced - 8th January 2020, Bob Murphy
    	case "I_G_Soldier_F":  {player setUnitTrait ["audibleCoef",0.8]; player setUnitTrait ["loadCoef",1.2]; player setUnitTrait ["UAVHacker",true]; _text = localize "STR_antistasi_traits_rifleman"}; //reintroduced - 8th January 2020, Bob Murphy
    	case "I_G_Soldier_GL_F": {player setUnitTrait ["camouflageCoef",1.2]; player setUnitTrait ["loadCoef",0.8]; _text = localize "STR_antistasi_traits_grenadier"}; //reintroduced - 8th January 2020, Bob Murphy
    	case "I_G_Soldier_AR_F": {player setUnitTrait ["audibleCoef",1.2]; player setUnitTrait ["loadCoef",0.8]; _text = localize "STR_antistasi_traits_autorifleman"}; //reintroduced - 8th January 2020, Bob Murphy
    	case "I_G_engineer_F":  {_text = localize "STR_antistasi_traits_engineer"}; //reintroduced - 8th January 2020, Bob Murphy
    	//cases for blufor missions - added - 8th January 2020, Bob Murphy
    	case "B_G_medic_F":  {_text = localize "STR_antistasi_traits_medic"}; //added - 8th January 2020, Bob Murphy
    	case "B_G_Soldier_TL_F": {player setUnitTrait ["camouflageCoef",0.8]; player setUnitTrait ["audibleCoef",0.8]; player setUnitTrait ["loadCoef",1.4]; _text = localize "STR_antistasi_traits_teamleader"}; //added - 8th January 2020, Bob Murphy
    	case "B_G_Soldier_F":  {player setUnitTrait ["audibleCoef",0.8]; player setUnitTrait ["loadCoef",1.2]; player setUnitTrait ["UAVHacker",true]; _text = localize "STR_antistasi_traits_rifleman"}; //added - 8th January 2020, Bob Murphy
    	case "B_G_Soldier_GL_F": {player setUnitTrait ["camouflageCoef",1.2]; player setUnitTrait ["loadCoef",0.8]; _text = localize "STR_antistasi_traits_grenadier"}; //added - 8th January 2020, Bob Murphy
    	case "B_G_Soldier_AR_F": {player setUnitTrait ["audibleCoef",1.2]; player setUnitTrait ["loadCoef",0.8]; _text = localize "STR_antistasi_traits_autorifleman"}; //added - 8th January 2020, Bob Murphy
    	case "B_G_engineer_F":  {_text = localize "STR_antistasi_traits_engineer"}; //added - 8th January 2020, Bob Murphy
    	//cases for pvp green - added - 9th January 2020, Bob Murphy
    	case "I_medic_F":  {_text = localize "STR_antistasi_traits_medic"}; //added - 9th January 2020, Bob Murphy
    	case "I_Soldier_TL_F": {player setUnitTrait ["camouflageCoef",0.8]; player setUnitTrait ["audibleCoef",0.8]; player setUnitTrait ["loadCoef",1.4]; _text = localize "STR_antistasi_traits_teamleader"}; //added - 9th January 2020, Bob Murphy
    	case "I_Soldier_M_F": {player setUnitTrait ["camouflageCoef",0.8]; player setUnitTrait ["loadCoef",1.4]; _text = localize "STR_antistasi_traits_marksman"}; //added - 9th January 2020, Bob Murphy
    	case "I_Soldier_AR_F": {player setUnitTrait ["audibleCoef",1.2]; player setUnitTrait ["loadCoef",0.8]; _text = localize "STR_antistasi_traits_autorifleman"}; //added - 9th January 2020, Bob Murphy
    	case "I_Soldier_LAT_F":  {player setUnitTrait ["audibleCoef",1.2]; player setUnitTrait ["loadCoef",0.8]; _text = localize "STR_antistasi_traits_antitank"}; //added - 9th January 2020, Bob Murphy
    	//cases for pvp blue - added - 9th January 2020, Bob Murphy
    	case "B_recon_medic_F":  {_text = localize "STR_antistasi_traits_medic"}; //added - 9th January 2020, Bob Murphy
    	case "B_recon_TL_F": {player setUnitTrait ["camouflageCoef",0.8]; player setUnitTrait ["audibleCoef",0.8]; player setUnitTrait ["loadCoef",1.4]; _text = localize "STR_antistasi_traits_teamleader"}; //added - 9th January 2020, Bob Murphy
    	case "B_recon_M_F": {player setUnitTrait ["camouflageCoef",0.8]; player setUnitTrait ["loadCoef",1.4]; _text = localize "STR_antistasi_traits_marksman"}; //added - 9th January 2020, Bob Murphy
    	case "B_Patrol_Soldier_MG_F": {player setUnitTrait ["audibleCoef",1.2]; player setUnitTrait ["loadCoef",0.8]; _text = localize "STR_antistasi_traits_autorifleman"}; //added - 9th January 2020, Bob Murphy
    	case "B_recon_LAT_F":  {player setUnitTrait ["audibleCoef",1.2]; player setUnitTrait ["loadCoef",0.8]; _text = localize "STR_antistasi_traits_antitank"}; //added - 9th January 2020, Bob Murphy
    	//cases for pvp red - added - 9th January 2020, Bob Murphy
    	case "O_T_Recon_Medic_F":  {_text = localize "STR_antistasi_traits_medic"}; //added - 9th January 2020, Bob Murphy
    	case "O_T_Recon_TL_F": {player setUnitTrait ["camouflageCoef",0.8]; player setUnitTrait ["audibleCoef",0.8]; player setUnitTrait ["loadCoef",1.4]; _text = localize "STR_antistasi_traits_teamleader"}; //added - 9th January 2020, Bob Murphy
    	case "O_T_Recon_M_F": {player setUnitTrait ["camouflageCoef",0.8]; player setUnitTrait ["loadCoef",1.4]; _text = localize "STR_antistasi_traits_marksman"}; //added - 9th January 2020, Bob Murphy
    	case "O_Soldier_AR_F": {player setUnitTrait ["audibleCoef",1.2]; player setUnitTrait ["loadCoef",0.8]; _text = localize "STR_antistasi_traits_autorifleman"}; //added - 9th January 2020, Bob Murphy
    	case "O_T_Recon_LAT_F":  {player setUnitTrait ["audibleCoef",1.2]; player setUnitTrait ["loadCoef",0.8]; _text = localize "STR_antistasi_traits_antitank"}; //added - 9th January 2020, Bob Murphy
    };
};

if (isMultiPlayer) then
{
	sleep 5;
	[localize "STR_antistasi_traits_head", format [localize "STR_antistasi_traits_select",_text]] call A3A_fnc_customHint;
};
