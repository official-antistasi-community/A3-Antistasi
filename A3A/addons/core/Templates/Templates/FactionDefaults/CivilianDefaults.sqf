//////////////////////////
//       Loadout        //
//////////////////////////

// All of bellow are optional overrides.
["firstAidKits", ["FirstAidKit"]] call _fnc_saveToTemplate;  // However, item is tested for for help and reviving.
["mediKits", ["Medikit"]] call _fnc_saveToTemplate;  // However, item is tested for for help and reviving.

["faces", ["GreekHead_A3_02", "GreekHead_A3_03", "GreekHead_A3_04", "GreekHead_A3_05", "GreekHead_A3_06",
"GreekHead_A3_07", "GreekHead_A3_08", "GreekHead_A3_09", "Ioannou", "Barklem", "AfricanHead_02",
"AsianHead_A3_02", "AsianHead_A3_03", "WhiteHead_05"]] call _fnc_saveToTemplate;

// prevents civilians from shouting out commands
["voices", ["NoVoice"]] call _fnc_saveToTemplate;

"CivMen" call _fnc_saveNames;
