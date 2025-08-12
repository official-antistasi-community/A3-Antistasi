#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
_title = if (worldName == "Tanoa") then {
	"Warlords of the Pacific"
} else {
	if (A3A_hasIFA) then {
		"Armia Krajowa"
	} else {
		"Antistasi"
	};
}; //TODO: Clean this shit up

_credits = [ [_title, [QUOTE(VERSION)]], [ "Authors:", ["Barbolani","Official Antistasi Community"] ] ];
_layer = "credits1" call bis_fnc_rscLayer;
_delay = 5;
_duration = 5;
{
	_title = _x param [0,""];
	_names = _x select 1;
	_text = format ["<t size=1.5 font='PuristaBold'>%1</t>",toUpper (_title)] + "<br />";
	{
		//Second line break controls size of gap between authors. &#160; is a non-breaking space character, which prevents the size being ignored.
		_text = _text + _x + "<br /><t size='0.2'>&#160;</t><br />";
	} foreach _names;
	_text = format ["<t size='1' shadow='2'>%1</t>",_text];
	_index = _foreachindex % 2;
	[_layer,_text,_index,_duration] spawn {
		disableserialization;
		_layer = _this select 0;
		_text = _this select 1;
		_index = _this select 2;
		_duration = _this select 3;
		_fadeTime = 0.5;
		_time = time + _duration - _fadeTime;
		_layer cutrsc ["RscDynamicText","plain"];
		_display = uinamespace getvariable ["BIS_dynamicText",displaynull];
		_ctrlText = _display displayctrl 9999;
		_ctrlText ctrlsetstructuredtext parsetext _text;
		_offsetX = 0.1;
		_offsetY = 0.3;
		//_width = (abs safeZoneX) max (0.5);
		//_height = ctrltextheight _ctrlText;
		//_pos = [safezoneX + _offsetX, safezoneY + _offsetY,_width,_height];

		_width = safeZoneW;
		_height = ctrltextheight _ctrlText;
		_pos = [safezoneX, safeZoneY + _offsetY,_width,_height];

		//_pos = [safezoneX + safezoneW - _width - _offsetX,safezoneY + safezoneH - _height,_width,_height]
		_ctrlText ctrlsetposition _pos;
		_ctrlText ctrlsetfade 1;
		_ctrlText ctrlcommit 0;
		_ctrlText ctrlsetfade 0;
		_ctrlText ctrlcommit _fadeTime;
		waituntil {time > _time};
		_ctrlText ctrlsetfade 1;
		_ctrlText ctrlcommit _fadeTime;
	};
	_time = time + _delay;
	waituntil {time > _time};
} foreach _credits;
