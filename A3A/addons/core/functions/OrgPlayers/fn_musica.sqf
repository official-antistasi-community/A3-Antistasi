if (count _this > 0) then {musicON = ((_this#0) isEqualTo 1)};

if (!musicON) exitWith {1 fadeMusic 0.5; playMusic ""};
/*
_normalDay = ["LeadTrack01_F", "LeadTrack01a_F", "LeadTrack01b_F", "LeadTrack02_F", "AmbientTrack03_F", "BackgroundTrack01_F", "BackgroundTrack01a_F", "Track02_SolarPower"];
_normalNight = ["Track08_Night_ambient", "Track09_Night_percussions","Track11_StageB_stealth"];
_combat = ["LeadTrack03_F", "LeadTrack04_F", "LeadTrack04a_F", "LeadTrack05_F", "BackgroundTrack03_F", "Track01_Proteus", "Track07_ActionDark","Track10_StageB_action"];
_stealth = ["LeadTrack06_F", "AmbientTrack01_F", "AmbientTrack01a_F", "AmbientTrack01b_F", "AmbientTrack04a_F", "AmbientTrack04_F", "Track04_Underwater1","Track05_Underwater2"];
*/
if (isNil "EHMusic") then
	{
	playMusic selectRandom ["LeadTrack01_F", "LeadTrack01a_F", "LeadTrack01b_F", "LeadTrack02_F", "AmbientTrack03_F", "BackgroundTrack01_F", "BackgroundTrack01a_F", "Track02_SolarPower"];
	EHMusic = addMusicEventHandler ["MusicStop",
		{
		if (musicOn) then
			{
			private _song = "";
			private _behaviour = behaviour player;
			if (_behaviour == "COMBAT") then
				{
				_song = selectRandom (["LeadTrack03_F", "LeadTrack04_F", "LeadTrack04a_F", "LeadTrack05_F", "BackgroundTrack03_F", "Track01_Proteus", "Track07_ActionDark","Track10_StageB_action"] - [_this select 0]);
				}
			else
				{
				if (_behaviour == "STEALTH") then
					{
					_song = selectRandom (["LeadTrack06_F", "AmbientTrack01_F", "AmbientTrack01a_F", "AmbientTrack01b_F", "AmbientTrack04a_F", "AmbientTrack04_F", "Track04_Underwater1","Track05_Underwater2"] - [_this select 0]);
					}
				else
					{
					if ((daytime > 18) or (daytime < 6)) then
						{
						_song = selectRandom (["Track08_Night_ambient", "Track09_Night_percussions","Track11_StageB_stealth"] - [_this select 0]);
						}
					else
						{
						_song = selectRandom (["LeadTrack01_F", "LeadTrack01a_F", "LeadTrack01b_F", "LeadTrack02_F", "AmbientTrack03_F", "BackgroundTrack01_F", "BackgroundTrack01a_F", "Track02_SolarPower"] - [_this select 0]);
						};
					};
				};
			1 fadeMusic 0.5;
			playmusic _song;
			};
		}];
	}
else
	{
	private _song = "";
	private _behaviour = behaviour player;
	if (_behaviour == "COMBAT") then
		{
		_song = selectRandom ["LeadTrack03_F", "LeadTrack04_F", "LeadTrack04a_F", "LeadTrack05_F", "BackgroundTrack03_F", "Track01_Proteus", "Track07_ActionDark","Track10_StageB_action"];
		}
	else
		{
		if (_behaviour == "STEALTH") then
			{
			_song = selectRandom ["LeadTrack06_F", "AmbientTrack01_F", "AmbientTrack01a_F", "AmbientTrack01b_F", "AmbientTrack04a_F", "AmbientTrack04_F", "Track04_Underwater1","Track05_Underwater2"];
			}
		else
			{
			if ((daytime > 18) or (daytime < 6)) then
				{
				_song = selectRandom ["Track08_Night_ambient", "Track09_Night_percussions","Track11_StageB_stealth"];
				}
			else
				{
				_song = selectRandom ["LeadTrack01_F", "LeadTrack01a_F", "LeadTrack01b_F", "LeadTrack02_F", "AmbientTrack03_F", "BackgroundTrack01_F", "BackgroundTrack01a_F", "Track02_SolarPower"];
				};
			};
		};
	1 fadeMusic 0.5;
	playmusic _song;
	};
/*
while {musicON} do

	{
	sleep 3;
	_newstance = behaviour player;
	//hint format ["El playerX está en esta stance: %1", _newstance]; sleep 3;
	if ((_newstance != _stance) or (exchangeMUS)) then
		{
		removeAllMusicEventHandlers "MusicStop";
		_stance = _newstance;
		if (_newstance == "COMBAT") then
			{
			_song = selectRandom _combat;
			};
		if (_newstance == "STEALTH") then
			{
			_song = selectRandom _stealth;
			};
		if ((_newstance == "AWARE") or (_newstance == "SAFE")) then
			{
			if ((daytime > 18) or (daytime < 6)) then
				{
				_song = selectRandom _normalNight;
				};
			if ((daytime > 5) or (daytime < 19)) then
				{
				_song = selectRandom _normalDay;
				};
			};
		exchangeMUS = true;
		5 fadeMusic 0;
		};

	if (exchangeMUS) then
		{
		_EH = addMusicEventHandler ["MusicStop", {exchangeMUS = true}];
		exchangeMUS = false;
		sleep 5;
		1 fadeMusic 0.5;
		playmusic _song;
		};
	};
1 fadeMusic 0.5;
playMusic "";