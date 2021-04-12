// In map template description.ext use:
// #include "MissionDescription\CfgSoundsContents.hpp"
class fire
{
	name="fire";
	sound[]={"Music\fire.ogg",db+12,1.0}; // NB, this will resolve from root
	titles[]={};
};

class StrikeThunder
{
    name = "StrikeThunder";
    sound[] = {"@A3\sounds_f_enviroment\ambient\thunders\thunder_01.wss", db+10, 1};
    titles[] = {};
};

class StrikeImpact
{
    name = "StrikeImpact";
    sound[] = {"\Sounds\StrikeImpact.ogg", db+45, 1};
    titles[] = {};
};

class StrikeSound
{
    name = "StrikeSound";
    sound[] = {"\Sounds\StrikeSound.ogg", db+10, 1};
    titles[] = {};
};

class EarthquakeHeavy
{
    name = "EarthquakeHeavy";
    sound[] = {"@A3\Sounds_F\environment\ambient\quakes\earthquake4.wss", db + 45, 1};
    titles[] = {};
};

class EarthquakeMore
{
    name = "EarthquakeMore";
    sound[] = {"@A3\Sounds_F\environment\ambient\quakes\earthquake3.wss", db + 45, 1};
    titles[] = {};
};

class EarthquakeLess
{
    name = "EarthquakeLess";
    sound[] = {"@A3\Sounds_F\environment\ambient\quakes\earthquake2.wss", db + 45, 1};
    titles[] = {};
};

class EarthquakeLight
{
    name = "EarthquakeLight";
    sound[] = {"@A3\Sounds_F\environment\ambient\quakes\earthquake1.wss", db + 45, 1};
    titles[] = {};
};
