// In map template description.ext use:
// #include "MissionDescription\master.hpp"
// Whether order should be maintained is unknown.

#include "..\script_component.hpp"

author = $STR_antistasi_credits_generic_author_text;
Keys[] = {};
missionGroup = "AntistasiCommunity";

#ifndef CUSTOM_A3A_CLASS
	class A3A {
		//used mainly to detect that the mission is a A3A mission, can also contain other data in the future
		version[] = {VERSION_AR};
	};
#endif

#include "debug.hpp"
#include "gameSettings.hpp"
#include "params.hpp"
#include "CfgRemoteExec.hpp"
