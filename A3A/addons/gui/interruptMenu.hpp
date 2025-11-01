class RscButtonMenu;
class A3A_OptionsBase : RscButtonMenu
{
	idc = A3A_IDC_INTERRUPT_OPTIONSBUTTON;
	action = "['requestOpen'] spawn (uiNamespace getVariable 'A3A_GUI_fnc_optionsDialog')";
	text = "Antistasi - Options";
	colorBackground[] = A3A_COLOR_TITLEBAR_BACKGROUND;
	onLoad = "[_this#0, 'options'] call (uiNamespace getVariable 'A3A_GUI_fnc_showInterruptButtons');";
	x = "1 * 			(			(			(safezoneW / safezoneH) min 1.2) / 40) + (safezoneX)";
	y = "1 * 			(			(			((safezoneW / safezoneH)) / 40)) + (safeZoneY)";
	h = "1 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
	w = "15 * 			(			(			(safezoneW / safezoneH) min 1.2) / 40)";
	/*
	class TextPos 
	{
		bottom = 0;
		left = 0.01;
		right = 0;
		top = 0;
	};
    */
};
class A3A_RemarksBase : A3A_OptionsBase 
{
	idc = A3A_IDC_INTERRUPT_REMARKBUTTON;
	action = "['requestOpen'] spawn (uiNamespace getVariable 'A3A_GUI_fnc_remarksDialog')";
	text = "Antistasi - Send Remark";
	onLoad = "[_this#0, 'remarks'] call (uiNamespace getVariable 'A3A_GUI_fnc_showInterruptButtons');";
	y = "3 * 			(			(			((safezoneW / safezoneH)) / 40)) + (safeZoneY)";
    /*
	class TextPos 
	{
		bottom = 0;
		left = 0.01;
		right = 0;
		top = 0;
	};
    */
};

class RscDisplayInterrupt : RscStandardDisplay 
{
	class controls
	{
		class A3A_Options: A3A_OptionsBase {};
		class A3A_Remarks: A3A_RemarksBase {};
	};
};
class RscDisplayMPInterrupt : RscStandardDisplay 
{
	class controls
	{
		class A3A_Options: A3A_OptionsBase {};
		class A3A_Remarks: A3A_RemarksBase {};
	};
};