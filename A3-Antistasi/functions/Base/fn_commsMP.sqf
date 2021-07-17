if (!hasInterface) exitWith {};
if (isNil "initVar") exitWith {};
if ((side player != teamPlayer) and (side player != civilian)) exitWith {};
private ["_unit","_typeX","_textX","_display","_setText"];

params [["_unit", objNull], ["_typeX", ""], ["_textX", ""], ["_titleX", ""]];

if (_typeX == "sideChat") then
	{
	_unit sideChat format ["%1", _textX];
	};
if (_typeX == "hint") then {[_titleX, format ["%1",_textX]] call A3A_fnc_customHint;};
if (_typeX == "hintCS") then {hintC format ["%1",_textX]};
if (_typeX == "hintS") then {[_titleX, format ["%1",_textX], true] call A3A_fnc_customHint;};
if (_typeX == "intelError") then {[_titleX, format [localize "STR_antistasi_intel_download_error",_textX]] call A3A_fnc_customHint;};
if (_typeX == "globalChat") then
	{
	_unit globalChat format ["%1", _textX];
	};

if (_typeX == "income") then
	{
	waitUntil {sleep 0.2; !incomeRep};
	incomeRep = true;
	//playSound3D ["a3\sounds_f\sfx\beep_target.wss", player];
	playSound "3DEN_notificationDefault";
	//[_textX,0.8,0.5,5,0,0,2] spawn bis_fnc_dynamicText;
	[_textX, [safeZoneX + (0.8 * safeZoneW), (0.2 * safeZoneW)], 0.5, 5, 0, 0, 2] spawn bis_fnc_dynamicText;
	incomeRep = false;
	[] spawn A3A_fnc_statistics;
	};

if (_typeX == "countdown") then
	{
	_textX = format [localize "STR_antistasi_customHint_time_remaining",_textX];
	["Countdown", format ["%1",_textX]] call A3A_fnc_customHint;
	};

if (_typeX == "taxRep") then
	{
	incomeRep = true;
	playSound "3DEN_notificationDefault";
	//playSound3D ["a3\sounds_f\sfx\beep_target.wss", player];
	//[_textX,0.8,0.5,5,0,0,2] spawn bis_fnc_dynamicText;
	[_textX, [safeZoneX + (0.8 * safeZoneW), (0.2 * safeZoneW)], 0.5, 5, 0, 0, 2] spawn bis_fnc_dynamicText;
	sleep 10;
	incomeRep = false;
	[] spawn A3A_fnc_statistics;
	};
if (_typeX == "tier") then
	{
	waitUntil {sleep 0.2; !incomeRep};
	incomeRep = true;
	//playSound3D ["a3\sounds_f\sfx\beep_target.wss", player];
	playSound "3DEN_notificationDefault";
	//[_textX,0.8,0.5,5,0,0,2] spawn bis_fnc_dynamicText;
	_textX = format [localize "STR_antistasi_customHint_skill_upgrade_warLevel",tierWar];
	[_textX, [safeZoneX + (0.8 * safeZoneW), (0.2 * safeZoneW)], 0.5, 5, 0, 0, 2] spawn bis_fnc_dynamicText;
	incomeRep = false;
	[] spawn A3A_fnc_statistics;
	};
