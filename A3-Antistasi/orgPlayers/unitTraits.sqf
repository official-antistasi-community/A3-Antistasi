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
#include "..\Includes\common.inc"
FIX_LINE_NUMBERS()
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
    _text = "Commander role.<br/><br/>The commander is a lightweight unit with increased camouflage, medical and engineering capabilities";
}
else
{
    switch (_type) do
    {
    	//case "I_C_Soldier_Para_7_F": {player setUnitTrait ["UAVHacker",true]}; //opted as we use units which automatically have the trait - 8th January 2020, Bob Murphy
    	//case "I_C_Soldier_Para_8_F": {player setUnitTrait ["engineer",true]; player setUnitTrait ["explosiveSpecialist",true]}; //opted as we use units which automatically have the trait - 8th January 2020, Bob Murphy
    	//case "I_C_Soldier_Para_3_F": {player setUnitTrait ["medic",true]}; //opted as we use units which automatically have the trait - 8th January 2020, Bob Murphy
    	//cases for greenfor missions
    	case "I_G_medic_F":  {_text = "Medic role.<br/><br/>Medics do not have any bonus or penalties, but have the ability to use certain medical items for full health restoration"}; //reintroduced - 8th January 2020, Bob Murphy
    	case "I_G_Soldier_TL_F": {player setUnitTrait ["camouflageCoef",0.8]; player setUnitTrait ["audibleCoef",0.8]; player setUnitTrait ["loadCoef",1.4]; _text = "Teamleader role.<br/><br/>Teamleader are more lightweight units with increased camouflage capabilities"}; //reintroduced - 8th January 2020, Bob Murphy
    	case "I_G_Soldier_F":  {player setUnitTrait ["audibleCoef",0.8]; player setUnitTrait ["loadCoef",1.2]; player setUnitTrait ["UAVHacker",true]; _text = "Rifleman role.<br/><br/>Riflemen are more suitable to silent sneak and can hack drones but have less carrying capacity"}; //reintroduced - 8th January 2020, Bob Murphy
    	case "I_G_Soldier_GL_F": {player setUnitTrait ["camouflageCoef",1.2]; player setUnitTrait ["loadCoef",0.8]; _text = "Grenadier role.<br/><br/>Grenadiers have a slight bonus on carry capacity, but are easy to spot"}; //reintroduced - 8th January 2020, Bob Murphy
    	case "I_G_Soldier_AR_F": {player setUnitTrait ["audibleCoef",1.2]; player setUnitTrait ["loadCoef",0.8]; _text = "Autorifleman role.<br/><br/>Autoriflemen have a slight bonus on carry capacity, but make too much noise when they move"}; //reintroduced - 8th January 2020, Bob Murphy
    	case "I_G_engineer_F":  {_text = "Engineer role.<br/><br/>Engineers do not have any bonus or penalties, but have the ability to use Repair Kits for vehicle repair"}; //reintroduced - 8th January 2020, Bob Murphy
    	//cases for blufor missions - added - 8th January 2020, Bob Murphy
    	case "B_G_medic_F":  {_text = "Medic role.<br/><br/>Medics do not have any bonus or penalties, but have the ability to use certain medical items for full health restoration"}; //added - 8th January 2020, Bob Murphy
    	case "B_G_Soldier_TL_F": {player setUnitTrait ["camouflageCoef",0.8]; player setUnitTrait ["audibleCoef",0.8]; player setUnitTrait ["loadCoef",1.4]; _text = "Teamleader role.<br/><br/>Teamleader are more lightweight units with increased camouflage capabilities"}; //added - 8th January 2020, Bob Murphy
    	case "B_G_Soldier_F":  {player setUnitTrait ["audibleCoef",0.8]; player setUnitTrait ["loadCoef",1.2]; player setUnitTrait ["UAVHacker",true]; _text = "Rifleman role.<br/><br/>Riflemen are more suitable to silent sneak and can hack drones but have less carrying capacity"}; //added - 8th January 2020, Bob Murphy
    	case "B_G_Soldier_GL_F": {player setUnitTrait ["camouflageCoef",1.2]; player setUnitTrait ["loadCoef",0.8]; _text = "Grenadier role.<br/><br/>Grenadiers have a slight bonus on carry capacity, but are easy to spot"}; //added - 8th January 2020, Bob Murphy
    	case "B_G_Soldier_AR_F": {player setUnitTrait ["audibleCoef",1.2]; player setUnitTrait ["loadCoef",0.8]; _text = "Autorifleman role.<br/><br/>Autoriflemen have a slight bonus on carry capacity, but make too much noise when they move"}; //added - 8th January 2020, Bob Murphy
    	case "B_G_engineer_F":  {_text = "Engineer role.<br/><br/>Engineers do not have any bonus or penalties, but have the ability to use Repair Kits for vehicle repair"}; //added - 8th January 2020, Bob Murphy
    	//cases for pvp green - added - 9th January 2020, Bob Murphy
    	case "I_medic_F":  {_text = "Medic role.<br/><br/>Medics do not have any bonus or penalties, but have the ability to use certain medical items for full health restoration"}; //added - 9th January 2020, Bob Murphy
    	case "I_Soldier_TL_F": {player setUnitTrait ["camouflageCoef",0.8]; player setUnitTrait ["audibleCoef",0.8]; player setUnitTrait ["loadCoef",1.4]; _text = "Teamleader role.<br/><br/>Teamleader are more lightweight units with increased camouflage capabilities"}; //added - 9th January 2020, Bob Murphy
    	case "I_Soldier_M_F": {player setUnitTrait ["camouflageCoef",0.8]; player setUnitTrait ["loadCoef",1.4]; _text = "Marksman role.<br/><br/>Marksmen are more suitable to silent sneak but have less carrying capacity"}; //added - 9th January 2020, Bob Murphy
    	case "I_Soldier_AR_F": {player setUnitTrait ["audibleCoef",1.2]; player setUnitTrait ["loadCoef",0.8]; _text = "Autorifleman role.<br/><br/>Autoriflemen have a slight bonus on carry capacity, but make too much noise when they move"}; //added - 9th January 2020, Bob Murphy
    	case "I_Soldier_LAT_F":  {player setUnitTrait ["audibleCoef",1.2]; player setUnitTrait ["loadCoef",0.8]; _text = "Antitank role.<br/><br/>Antitanks have a slight bonus on carry capacity, but make too much noise when they move"}; //added - 9th January 2020, Bob Murphy
    	//cases for pvp blue - added - 9th January 2020, Bob Murphy
    	case "B_recon_medic_F":  {_text = "Medic role.<br/><br/>Medics do not have any bonus or penalties, but have the ability to use certain medical items for full health restoration"}; //added - 9th January 2020, Bob Murphy
    	case "B_recon_TL_F": {player setUnitTrait ["camouflageCoef",0.8]; player setUnitTrait ["audibleCoef",0.8]; player setUnitTrait ["loadCoef",1.4]; _text = "Teamleader role.<br/><br/>Teamleader are more lightweight units with increased camouflage capabilities"}; //added - 9th January 2020, Bob Murphy
    	case "B_recon_M_F": {player setUnitTrait ["camouflageCoef",0.8]; player setUnitTrait ["loadCoef",1.4]; _text = "Marksman role.<br/><br/>Marksmen are more suitable to silent sneak but have less carrying capacity"}; //added - 9th January 2020, Bob Murphy
    	case "B_Patrol_Soldier_MG_F": {player setUnitTrait ["audibleCoef",1.2]; player setUnitTrait ["loadCoef",0.8]; _text = "Autorifleman role.<br/><br/>Autoriflemen have a slight bonus on carry capacity, but make too much noise when they move"}; //added - 9th January 2020, Bob Murphy
    	case "B_recon_LAT_F":  {player setUnitTrait ["audibleCoef",1.2]; player setUnitTrait ["loadCoef",0.8]; _text = "Antitank role.<br/><br/>Antitanks have a slight bonus on carry capacity, but make too much noise when they move"}; //added - 9th January 2020, Bob Murphy
    	//cases for pvp red - added - 9th January 2020, Bob Murphy
    	case "O_T_Recon_Medic_F":  {_text = "Medic role.<br/><br/>Medics do not have any bonus or penalties, but have the ability to use certain medical items for full health restoration"}; //added - 9th January 2020, Bob Murphy
    	case "O_T_Recon_TL_F": {player setUnitTrait ["camouflageCoef",0.8]; player setUnitTrait ["audibleCoef",0.8]; player setUnitTrait ["loadCoef",1.4]; _text = "Teamleader role.<br/><br/>Teamleader are more lightweight units with increased camouflage capabilities"}; //added - 9th January 2020, Bob Murphy
    	case "O_T_Recon_M_F": {player setUnitTrait ["camouflageCoef",0.8]; player setUnitTrait ["loadCoef",1.4]; _text = "Marksman role.<br/><br/>Marksmen are more suitable to silent sneak but have less carrying capacity"}; //added - 9th January 2020, Bob Murphy
    	case "O_Soldier_AR_F": {player setUnitTrait ["audibleCoef",1.2]; player setUnitTrait ["loadCoef",0.8]; _text = "Autorifleman role.<br/><br/>Autoriflemen have a slight bonus on carry capacity, but make too much noise when they move"}; //added - 9th January 2020, Bob Murphy
    	case "O_T_Recon_LAT_F":  {player setUnitTrait ["audibleCoef",1.2]; player setUnitTrait ["loadCoef",0.8]; _text = "Antitank role.<br/><br/>Antitanks have a slight bonus on carry capacity, but make too much noise when they move"}; //added - 9th January 2020, Bob Murphy
    };
};

if (isMultiPlayer) then
{
	sleep 5;
	["Unit Traits", format ["You have selected %1",_text]] call A3A_fnc_customHint;
};
