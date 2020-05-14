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
if (_typeX == "intelError") then {[_titleX, format ["Download error:<br/>%1",_textX]] call A3A_fnc_customHint;};
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
	_textX = format ["Time Remaining: %1 secs",_textX];
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
	_textX = format ["War Level Changed<br/><br/>Current Level: %1",tierWar];
	[_textX, [safeZoneX + (0.8 * safeZoneW), (0.2 * safeZoneW)], 0.5, 5, 0, 0, 2] spawn bis_fnc_dynamicText;
	incomeRep = false;
	[] spawn A3A_fnc_statistics;
	};
if (_typeX == "localChat") then {
	_units = [_unit];
	// TODO: For efficiency, go through `allPlayers` instead of entities
	_nearUnits = _unit nearEntities ["Man", 10]; // TODO: Balance radius
	if(count _nearUnits == 0) exitWith {
		diag_log "nobody in the vicinity to hear the localChat";
	};
	_units append _nearUnits; // TODO: Filter out the non-player units?
	_channelIndex = radioChannelCreate [[1.0,1.0,1.0,1.0], "", "%UNIT_NAME", _units];
	_unit customChat [_channelIndex, _textX];
	_channelIndex radioChannelRemove _units; // Don't need it anymore
};