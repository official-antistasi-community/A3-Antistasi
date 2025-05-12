respawn = "BASE";
respawnDelay = 15;

// Player corpses preserved for 15min minimum
corpseRemovalMinTime = 900;

aiKills = 0;
disabledAI = 1;
Saving = 0;

class Header
{
	gameType = ANTI;
	minplayers = 1;
	maxplayers = 41;
};

class CfgTaskEnhancements
{
  enable       = 1;
  3d           = 1;
  3dDrawDist   = 3500;
  share        = 1;
  propagate    = 1;
};

//If we have CBA for TFAR, then load the mission's settings.
cba_settings_hasSettingsFile = 1;
