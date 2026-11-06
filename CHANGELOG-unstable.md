# Unstable changelog

Every push to `unstable` adds one entry at the top of this file, newest first. The release workflow
publishes the top entry as the body of the push's GitHub release and the Steam workflow
publishes it as the Workshop change note, so write it for players. Format and rules: [CLAUDE.md](CLAUDE.md).

## 2026-11-06 - Site upgrades: resources and seaports up to level 7

### Added
- **Resources** and **sea ports** can now be upgraded to **level 7**. Levels 3, 5 and 7 place a building at the site and give a bonus; a site keeps the bonuses of its lower levels. Factories stay at level 2 for now.
- **Resource level 3, Local workers:** up to 3 HR per tick, shared over all resources of the map.
- **Resource level 5, Fortified compound:** +50% garrison limit, and rebuilding the destroyed site from the HQ menu is free.
- **Resource level 7, Company town:** the nearest rebel town within 2 km gets +1 support every tick and loses half as much support from civilian deaths.
- **Sea port level 3, Smugglers:** every second tick, 5 enemy magazines per port go into the arsenal. They count towards unlocks.
- **Sea port level 5, Foreign volunteers:** +0.5 HR per tick. HR from site upgrades is capped at 5 per tick.
- Sea port level 7 can be bought, but its **Landing point** bonus (cheaper AI recruits) comes in a later update.
- The Site upgrades tab lists the level 3, 5 and 7 bonuses of the selected site and marks the active ones.

### Fixed
- Support changes in towns of a new campaign no longer log an 'undefined variable' script error.

Saves are not affected.

## 2026-11-06 - Site upgrades and member town kits

### Added
- **Site upgrades** for resources, factories and sea ports. Open the Buy Vehicle dialog at HQ, go to the new **Site upgrades** tab and click a rebel-held site on the map. Each level comes as a kit crate: haul it to the site and install it within 250 m of its centre.
- Every level adds **10%** to that site's income and **20%** to its garrison limit. The extra money appears on the upgrade line of the income report, and the level shows on the site's map marker and in its site info.
- When the enemy takes an upgraded site, it **loses one level**. Its levels give nothing while the enemy holds it or while it is destroyed, and work again once you retake it. A kit bought for the old level can only be returned at HQ for a refund.
- One kit per site can be on its way at a time.
- Levels 1 and 2 are on sale now. Levels 3 to 7, with their bonuses, come in later updates.

### Changed
- **Members** can now buy town upgrade kits and site kits and return them at HQ for a refund, not only the commander. With membership off, every player can. Dismantling a built town upgrade is still commander-only.
- The Buy Vehicle tab buttons are narrower to make room for the sixth tab.

### Save
- **The save is affected.** Site levels and site kits are saved with the campaign. Older saves load with every site at level 0. A save made with this version loses its site levels and site kits if loaded in an older version. Town kits load as before and keep the price paid.

## 2026-11-05 - Town upgrades merged into three

### Changed
- Towns now have three upgrades instead of six:
  - **Clinic** (clinic + radio relay, €6000 base): +0.1 support every income tick, civilian deaths hurt support half as much, and it counts as a rebel radio tower (support gains x2).
  - **Militia post** (militia post + safehouse, €3500 base): garrison limit **x3** (was x1.5), free and 2x faster fast travel that ends at the post, and the 'lie low' action.
  - **City office** (market + recruitment office, €5500 base): money and HR income from the town x1.5.
- Town upgrades can be built up to **400 m** from the town centre (was 100 m).
- **Existing saves** are converted on load. A radio relay becomes a clinic, a safehouse becomes a militia post and a recruitment office becomes a city office, each where the old building stood. **Markets are removed** without a refund. A town that already has the merged upgrade keeps its own building.
- Kits not yet built are switched to the merged upgrade and keep the price paid, so returning one at HQ refunds it in full. Market kits become city office kits.

## 2026-10-22 - More junkyard wildcards

### Changed
- Each junkyard delivery now includes **3 wildcard vehicles** (vehicles from outside the factions in play) instead of 1, so it offers 12 vehicles in total. Stock already on offer stays until the next hourly delivery. Server admins can change the number with `A3A_junkyardWildcardCount`.

## 2026-10-22 - Upstream merge: police station support fix

### Fixed
- Merged the latest official Antistasi changes. Rebel support gains in a town are now boosted by 50% only when its police station has been **destroyed**. Towns that never had a police station no longer get the boost. Saves are not affected.

## 2026-10-21 - Server startup fix

### Fixed
- Fixed a server startup error introduced with the squad composer update. Server variables were not set, so enemy garrisons did not spawn, aggression and enemy resources did not update and player statistics were not recorded. The server log was flooded with `Undefined variable` errors (`distanceSPWN2`, `prestigeIsChanging`, `A3A_playerStats`). Saves are not affected.

## 2026-10-21 - 1 km mission area

### Changed
- The **Mission Area** radius choices on the Commander tab of the Battle Menu (`Y`) are now **1, 2, 4, 6, 8 and 10 km**. This adds a 1 km option and replaces the 3 to 11 km choices of the previous build.
- A mission area saved with the previous build's 3, 5, 7, 9 or 11 km loads 1 km smaller.

## 2026-10-21 - Bigger mission area presets

### Changed
- The **Mission Area** radius choices on the Commander tab of the Battle Menu (`Y`) are now **3, 5, 7, 9 and 11 km** (were 2, 4, 6, 8 and 10 km). A mission area saved before this update grows by 1 km when the save loads.

## 2026-10-21 - Fewer helicopter QRFs, steadier enemy vehicle mix

### Changed
- When you attack an enemy position, its QRFs now come by land much more often and by helicopter less often.
  - A base can send a land QRF while your units are 550 m away (was 700 m), no matter how small its garrison is, and it can send the next one 5 seconds later (was 1 minute).
  - Repeated calls for help during one fight join the QRF already on its way to that area (within 600 m) instead of each sending a new one.
  - Air QRFs are picked less often.
- The mix of enemy ground vehicles in attacks and QRFs now changes steadily with war tier. Cars and trucks get rarer as the war goes on, while MRAPs, APCs and tanks get more common.
  - At war tier 10 expect roughly **10% cars, 25% MRAPs, 19% trucks, 25% APCs/IFVs, 5% AA and 15% tanks** (was no cars, 23% MRAPs, 3% trucks, 50% APCs/IFVs and 19% tanks).
  - In the early and middle war, militia cars and trucks stay around longer, and MRAPs and APCs show up more slowly.

## 2026-10-21 - More ammo for rebel statics and AA vehicles

### Changed
- Rebel statics, AA vehicles and other armed vehicles you buy or recruit with a squad now spawn with up to **twice as much ammo** as before. Many of them now start fully loaded. Enemy vehicles are unchanged.

## 2026-10-21 - Squad composer and custom squads

### Added
- **Recruit Squad** has two new squads, **Custom 1** and **Custom 2**. Their tooltip lists who is in them, and in the high command bar they show up under their own abbreviation (for example `ABC-12`).
- New **Squad Composer** button on the Commander tab of the Battle Menu (`Y`), for the commander and sub-commanders. Choose the soldiers of each custom squad from the units that can be garrisoned: every squad has exactly one squad leader plus up to 49 more soldiers (50 in total). The composer shows the squad's size and total cost, and which vehicle **Include vehicle** would add.
- Each custom squad gets a high command abbreviation of 1 to 5 letters or digits.
- Custom squads too big for their transport are recruited on foot, even with **Include vehicle** ticked.

### Changed
- The squad buttons in Recruit Squad sit closer together to make room for the custom squads.
- **Saves**: custom squads are saved with the campaign. Older saves start with both custom squads holding only the squad leader.

## 2026-10-21 - Town upgrade kit labels, stronger market and recruitment office

### Added
- Looking at a town upgrade kit crate from up to 15 m shows the kit's name and, below it, the town it is meant for (for example **Clinic** / **TO Kavala**).

### Changed
- The **market** town upgrade now gives **+50%** money income from its town (was +10%), and the **recruitment office** **+50%** HR (was +10%). Upgrades already built in existing saves get the new bonus.

## 2026-10-21 - Junkyard vehicle repair, scrap or retrieve wrecks

### Added
- New **Vehicle repair** tab in the junkyard (garage crate at HQ). Wrecks that are retrieved get repaired there in **4 to 20 hours** of server uptime (cheap cars are quick, armor and aircraft take longest). Once repaired they can be bought for **20-60%** of their junkyard price, fully repaired and without junk status. Unsold vehicles leave **12 hours** after they are ready. Skipping or speeding up in-game time does not shorten these timers.
- The tab lists ready vehicles first, then the repair queue, with countdowns. Commanders and sub-commanders can pay with faction funds. Admins get a **Finish repairs** button for testing.
- Wrecks now have two actions in the action menu instead of the hold action: **Scrap wreck** pays the scrap money as before and removes the wreck for good, **Retrieve wreck for repair** pays half of that and sends the vehicle to the repair shop. A progress bar at the bottom of the screen shows the work, and the action menu offers a way to stop.
- **AI Management** tab: new **Scrap wreck** and **Retrieve wreck** buttons send the selected AI to the nearest free wreck within 300 m. You get the money.

### Changed
- Anyone can scrap or retrieve wrecks, no toolkit needed. Engineers take **5-15 seconds**, everyone else **30-60 seconds**.
- Worked wrecks disappear right away instead of waiting for the garbage cleaner.
- **Saves**: the repair shop is saved with the junkyard. Older saves start with an empty shop.

## 2026-10-21 - Fewer enemy attacks

### Changed
- Enemy factions attack **1.5x less often**: their attack resources refill more slowly, so the wait before the first attack and between attacks is 1.5x longer. Attack size is unchanged, and the server's attack rate setting still works on top of this. Existing saves keep working.

## 2026-10-21 - Commander sets the mission area

### Added
- New **Mission Area** button on the Commander tab (scroll down the buttons). The commander clicks a point on the map, picks a radius of **2, 4, 6, 8 or 10 km**, sees the circle and presses **Accept**.
- Missions on the mission board now come from inside that circle instead of from around the HQ. Missions outside it leave the board and new ones are posted inside it right away. Missions already under way are not affected.
- While an area is set, town missions (taxi, repair, hostage and the others) only appear in towns inside it.
- Everyone sees the area as a circle on the map and gets a message when it changes. **Reset to HQ** goes back to the old behaviour: missions around the HQ, up to the mission distance set in the lobby.
- **Saves**: the area is saved with the campaign and stays when the HQ moves. Older saves start without one, so nothing changes until the commander sets it.

## 2026-10-21 - Smaller respawn penalty for poor players

### Changed
- Dying still costs **15%** of your personal money, but a player with less than **100 €** now loses only **1 €** per death.

## 2026-10-14 - Enemy sites despawn later

### Changed
- Enemy outposts, bases, roadblocks and other enemy sites now stay in place for **1 minute** after the last rebel leaves the area, instead of despawning within seconds. If you die near a site and come back in time, the surviving defenders are still where you left them.
- If the commander's **rally flag** is within 500 m of the site, it stays for **5 minutes**, so a squad that died there can teleport back to the flag from HQ and return.

## 2026-10-14 - Garage holds 999 vehicles

### Changed
- The garage now holds up to **999 vehicles** by default, instead of 20 plus 4 per War Level. The **Base Capacity** garage setting now goes up to 999. Servers that saved their own garage capacity settings keep them; set **Base Capacity** to 999 and **Capacity Increase** to 0 to match the new default.

## 2026-10-14 - Loot crates gather other loot crates

### Changed
- **Load loot to crate** now also empties every other loot crate in its radius into the crate you use, and the emptied crates disappear. This covers bought crates, surrender crates, police station crates and delivered crates.
- Crates that are being carried, loaded on a vehicle, still under a delivery parachute, or open in a player's inventory are left alone.
- Unlocked items follow the existing **loot unlocked items** setting: when it is off, they land on the ground next to the crate like other leftover loot.

## 2026-10-09 - More ammo for rearming vehicles

### Changed
- Vehicle ammo sources hold far more **rearm points**:
  - **Vehicle ammo crate**: **10,000** points, up from 3,000. It still costs 3,000 €.
  - **Ammo container**: **50,000** points, up from 12,000. It still costs 12,000 €.
  - Captured enemy **ammo trucks**: **100,000** points, up from 5,000.
  - **Any other vehicle that can rearm**: **50,000** points, up from 5,000.
- Storing an ammo crate or container in the garage now refunds the share of its price that matches the points left: a full crate gives back 3,000 €, a half-used one 1,500 €. Before, it paid 1 € per point left.
- **Existing saves**: crates, containers and trucks already in your save, on the map or in the garage, keep the points they have now. The new amounts apply to crates you buy and trucks you capture from now on. An old crate also refunds less when stored, since its points now count against 10,000.

## 2026-10-09 - No squad limit for the commander

### Changed
- The **commander** can now run any number of high command squads. **Sub-commanders** can run up to **10**, members and guests alike (guests were limited to 6).
- **Sub-commanders recruit soldiers into their own group with the faction funds**, like the commander, instead of their own money. The commander is told what they spent.
- Soldiers recruited with the faction funds are refunded to the faction funds when dismissed or when the game is saved, not to the player who recruited them. This applies to the commander's recruits too. Soldiers recruited before this update still refund the old way.

## 2026-10-08 - Bigger rebel income

### Changed
- **Towns** now pay up to **2000 €** per 10-minute income tick at full support, up from 1000 €. Each town's share still depends on its population and support, and towns you don't hold still pay half.
- **Resources** now pay **2500 €** per tick with all of them held, up from 1500 €.
- **Seaports** now boost income: each rebel seaport adds **+0.1** to the factory multiplier, so with all factories and 7 seaports on Altis your income is multiplied by 3.1 instead of 2.4.
- **Airports** now add **0.1 air support points** per tick each, down from 0.25, so air support comes in more slowly.
- Existing saves use the new values as soon as the server runs this build.

## 2026-10-08 - Enemy resources on save

### Fixed
- **Saving during an enemy attack** now gives the enemy back the cost of its surviving vehicles, as intended. Before, the count stopped at the first non-enemy vehicle, so almost none were counted and the enemy lost those resources after a reload.
- Helicopters and air support flying home from a won attack count with their **150%** refund, and Invader punishment vehicles with their full cost. Garrison vehicles are not counted, since they are saved with their garrison.
- Existing saves load as before; the difference shows in saves made from now on.

## 2026-10-08 - Retaken sites keep the attackers

### Changed
- When an enemy attack or counter-attack **retakes one of your sites**, its forces stay there instead of going home:
  - **Ground vehicles** drive into the site, park and join the garrison with their crews. Next time you come, they are there again with full health, ammo and fuel and a **full crew**.
  - **Infantry** gets out of the trucks and walks to the site to join the garrison. The garrison can end up **bigger than its normal size**; it won't be refilled past normal once those troops die.
  - **Helicopters** and air support fly home as before, and give the enemy **150% of their cost** back if they make it home.
- When an **Invader punishment** destroys a town, the attacking vehicles that get home give the Invaders their full cost back.
- Existing saves keep working. Lost attacks and fights between the two enemy factions are unchanged.

## 2026-10-04 - Mortar team on a quad

### Changed
- **Enemy Mortar Fire**: the briefing now gives a **5 minute window** instead of 5-30 minutes. The window opens somewhere 10 to 55 minutes ahead, and the escort squad sets out at a hidden moment inside it.
- The mortar team is now **two crewmen on a quad** (the faction's light vehicle). They leave the base **2 minutes after** the escort squad and get off near the firing spot, or where the quad gets stuck or loses its driver. Factions without a two-seat light vehicle send the team on foot.
- The map circle around the firing spot is now **150 m** instead of 250 m.

## 2026-10-03 - Big camps are hard camps

### Changed
- **Destroy enemy camp**: normal camps are back to the original small camp: three tents and a few things around the fire. The big camp with five tents, the radio table and the supply corner under a camo net is now what you find at **hard** camps, next to their machine gun nest.

## 2026-10-03 - Bigger enemy camps, hard camps

### Changed
- **Destroy enemy camp**: camps look lived-in now. Five tents instead of three, a table with a radio and a map, camping chairs, a supply corner under a camo net (the loot crate is there now), firewood, food and litter. Camps need a slightly bigger flat clearing, so they may turn up in slightly different places.
- Normal enemy camps are always guarded by a militia squad. The regular army squads moved to the hard version.

### Added
- **Hard enemy camps** on the mission board, marked as hard like other hard missions. They pay **200 € per war level** to each player instead of 100.
  - A regular army squad at the fire, and a fire team with a **guard dog** patrolling further out instead of two sentries. The dog sniffs out undercover rebels, so you can't just walk in.
  - A manned **machine gun nest** behind sandbags at the edge of the camp. The gun stays behind as loot.
  - Once the camp is alerted, their **squad leader radios for help**. Take him down within 45 seconds or enemy support may come for you. A hint tells you when the call starts, and whether it got through.

## 2026-10-02 - Bigger mortar circle

### Changed
- **Enemy Mortar Fire**: the map circle around where the mortar team will set up now has a 250 m radius instead of 100 m, so finding them takes more searching.

## 2026-10-01 - No limit per mission type

### Changed
- The mission board no longer limits you to one active mission per type. Take as many logistics, rescue or other missions as you like, up to **10 board missions running at once**. Petros tells you when the limit is reached; finish a mission to take the next one. City tasks, world events and enemy attacks do not count toward the 10.
- A mission is not posted again at a place where the same mission is still running, so one antenna or outpost can't pay out twice.
- **Traitor** assassinations and **Gun Shop** meetings still run one at a time.

## 2026-10-01 - Enemy Mortar Fire event

### Added
- **World events**: a new kind of mission that is not on the mission board. Every 30 minutes, with at least one player online, there is a 20% chance that one starts, and it is on the map straight away.
- First event, **Enemy Mortar Fire**: an enemy outpost or airbase gets a mortar team ready to shell a rebel town, site or the HQ from 1-2 km away. The map shows a 100 m circle where they will probably set up and the target. The briefing says they move out some time in the next 5-30 minutes; there is no warning when they do.
  - A truck brings an infantry squad that patrols 200 m around the firing spot, and the mortar team walks there from the base. Once set up it fires **20 rounds**, 4 a minute.
  - Every civilian killed by the barrage costs a lot of town support, our garrison takes losses and houses can come down. This also happens when nobody is near the target.
  - Kill the mortar team or destroy the mortar to win: faction money and reward points, plus town support if it never fired a round. After the full barrage the mission fails and the enemy walks back to base.
  - Only one mortar attack at a time. Not saved: a running event is gone after a load.

## 2026-10-01 - Lost Ammo Supplies: arrows only

### Changed
- **Lost Ammo Supplies**: the witnesses no longer draw long bearing lines across the map. Each one is marked only with an arrow pointing where they saw the crate fall, with the bearing in its label. Extend the arrows yourself to find where they cross.

## 2026-10-01 - Buying Intel mission

### Added
- New **Buying Intel** mission on the mission board (LOG). An enemy officer in one of their towns will sell intel for a **1000 € bribe**, paid by players from their own money.
- A locked civilian truck waits at HQ. Use **Load bribe money** on it to put in part of the bribe (a small window like the Donate tab). The truck unlocks once all 1000 € are in.
- Drive the truck to the officer, park it within **20 m** of him and use **Hand over the bribe** next to him while **undercover**. He drives back to his outpost and you get a **large intel report**. No money or score reward, but the truck is yours to keep.
- If his people spot a rebel who is not undercover in the town, he drives off. If you come at him openly or shoot him, he fights. Either way the mission fails. He waits 90 minutes.
- Bribe money still in the truck when the mission fails goes back to the faction funds once you drive the truck back to HQ.
- A mission in progress is not saved.

## 2026-10-01 - Deliver Vehicle

### Added
- **Deliver Vehicle** button on the Player tab of the Battle Menu (Y), below Loot Crate. Pick a garaged car, armoured vehicle or support truck, the rebel site it starts from (HQ, an outpost or an airport, nearest first) and a destination on the map (your own position unless you click elsewhere).
- An AI driver costs **1 HR** and no money. He drives the vehicle there by road, and enemy sites along the way wake up, so **the delivery can be ambushed**. The vehicle shows on the rebel map while it is on the road.
- Once it arrives, the vehicle is yours and stays in the world; it does not go back to the garage. If it gets stuck or the driver is killed, it is left where it stopped and you get its map grid.
- The driver then walks to the nearest rebel site and returns to the HR pool (+1 HR) if he makes it. If he is killed on the way, the HR is lost.
- One delivery on the road per player at a time. Junkyard wrecks, vehicles under 20% fuel and vehicles locked by other players cannot be delivered. A delivery in progress is not saved.

## 2026-10-01 - Rebel mortars less accurate

### Changed
- **Rebel mortar fire missions** (Battle Menu, Y) are much less accurate. Every round lands somewhere within a dispersion radius of its aim point: **100 m** with no training, shrinking to **25 m** at training level 20. The first trainings improve it the most (level 5: about 72 m, level 10: about 46 m, level 15: about 30 m).
- The danger area drawn on the map for a fire mission now shows this radius instead of a fixed 30 m.

## 2026-10-01 - Mission board is saved

### Changed
- The mission board is now saved with the campaign. After a server restart or loading the save, the missions that were waiting on the board are back with the same locations, rewards and difficulty. Missions that no longer fit (town taken, target destroyed, HQ moved away) drop off, and categories left with fewer than 2 missions are topped up as before.
- Missions that were already running when the game was saved are not restored; they are gone after a load, as before. The 15-minute board refresh timer starts over after a load.
- Older saves have no saved board and start with a fresh one.

### Fixed
- The bank robbery mission never appeared on the mission board.

## 2026-10-01 - Abandoned Collaborator Hideout mission

### Added
- New logistics mission on the mission board: **Abandoned Collaborator Hideout**. A collaborator fled his house in a hurry and left his papers and a crate of loot behind. The map only shows a search circle that has the house somewhere inside it, and the house is never at its centre, so search the houses in the area. The place is not guarded.
- Taking the papers gives medium intel on the enemy he worked for. The crate is filled like an enemy loot crate and is yours to empty or haul away.
- Reward: **200 € to each player** who came near the house. No faction money and no town support. The mission fails if time runs out or the house is destroyed before the papers are taken.

## 2026-10-01 - Lost Ammo Supplies: witnesses farther out

### Changed
- **Lost Ammo Supplies**: the witnesses now stand 250 m to 2 km from the crate instead of 250 m to 1 km, most of them around the middle of that range. The bearing lines on the map are longer to match. Far witnesses make the search area larger, so cross the lines of the nearer ones first.

## 2026-10-01 - Battle Menu button overlap fixes

### Fixed
- **Commander tab (Y):** the Clean all / Clean HQ buttons no longer sit on top of **Air Support** and **Garbage Clean**. They only appear after clicking Garbage Clean, as intended.
- **Player tab (Y):** when there is nothing to interact with, the leftover vehicle picture and action buttons no longer cover the "no actions" text.

## 2026-09-30 - Factions debug tab for admins

### Added
- New **Factions** tab in the Battle Command menu (Y), shown to admins only. It lists the Occupants and Invaders side by side and refreshes every 2 seconds:
  - defence and attack resources with their income per 10 minutes, and an estimate of when the next major attack comes
  - aggression and its level, recent losses and how much each faction knows about the rebel HQ location
  - sites held, garrison troops and vehicles, town police, active supports and support spending
  - war-wide balance values: active players, war tier, player scale, multipliers, and whether a major attack is running
- Other players see no change apart from slightly narrower tab buttons. Saves are not affected.

## 2026-09-30 - Lost ammo supplies mission

### Added
- New Logistics mission on the mission board, **Lost Ammo Supplies**: the enemy lost a large ammo crate somewhere in the countryside. Its position is not marked. Instead, 2-4 locals who saw it fall are marked on the map with the bearing they saw it on, each off by up to 5 degrees: cross the lines to find the crate.
  - 20-40 minutes after the start the enemy sends a recovery team from their nearest outpost: an escort with troops and a cargo truck. If no rebels are near the crate, the truck loads it and drives it back to the outpost. Ambush the truck to take the crate back.
  - Load the crate onto a truck and bring it to HQ or one of your outposts or airbases: **300 €** for the faction, **30 points** for the group, and the loot inside the crate.
  - Fails if the crate reaches the enemy outpost, or after 2 hours with nobody near it. Not kept across a server restart.

## 2026-09-30 - Enemy camp mission

### Added
- New Destroy mission on the mission board, **Destroy enemy camp**: an enemy squad has pitched camp out in the woods, far from roads and towns. The map only shows a 250 m search area, so you have to find the camp yourself.
  - The soldiers sit around the campfire, smoking and checking their rifles, while two sentries walk the perimeter. They get up and fight once they spot you, hear shots or someone walks into the camp. Undercover players can walk up to them.
  - When no defender is left near the fire, use **Burn the camp** at the campfire. The camp's supply crate is full of loot and can be taken along.
  - Everyone who came within 300 m of the camp is paid **100 € x war level**.
  - 60 minute limit, extended by up to 20 minutes while you are still at the camp. Not kept across a server restart.

## 2026-09-30 - Minefield clearing town mission

### Added
- New town mission, **Clear the minefield**: the enemy has mined a small field (5-10 m, 5-10 mines) on the edge of an enemy-held town. It appears by itself when you are near the town, like the other town missions. The field is marked on the map and the locals have marked the mines, so no mine detector is needed.
  - Remove every mine: engineers can disarm them, explosives set them off.
  - Everyone who came to the field (within 100 m) is paid **200 € x war level**, and the town gains **10 support**.
  - 45 minute limit. If it runs out the remaining mines are removed and nothing is lost. Not kept across a server restart.

## 2026-09-30 - Supplies for the Elderly: 2 hour limit

### Changed
- **Supplies for the Elderly** now expires after **2 hours**, so an ignored delivery no longer blocks other Support missions. The deadline is shown in the task. Expiring costs nothing: the crate is removed and the town's support is unchanged.

## 2026-09-30 - Mission board and collaborator ambush

### Changed
- Missions are no longer handed out at random or on request. They are posted on a **mission board** (Petros' mission action, or the **Mission Board** button on the Commander tab). Every **15 minutes** 3 new missions arrive and 1-2 random ones are taken down. The board holds up to **10 missions per category** and never lists the same mission twice at one location.
- The board is a table: **Mission | Type | Location | Reward**. The reward is known before you take the mission (faction funds, pay for the players who take part, HR), and hard missions are marked. The new **Supplies for the Elderly** mission is posted on the board like the others. Filter by category, pick a mission and press **Take mission**. Members and the commander can take missions, one active mission per category as before.
- The board starts with 2 missions per category and is topped up again when the HQ moves. Missions whose location was captured or whose target is gone drop off the board. The board is not saved: a restarted server posts a fresh one.

### Added
- New assassination mission, **Collaborator Car Ambush**: a police car waits in an enemy town with the collaborator next to the driver (sometimes two more policemen, always on hard) and leaves for an outpost 5-15 minutes later, or at once if they spot you. Kill the collaborator before he gets there. If he arrives, the enemy learns more about your HQ.

## 2026-09-30 - Supplies for the elderly

### Added
- New Support mission **Supplies for the Elderly**: an elder living alone in a house outside a town needs food. A supply crate appears at HQ; bring it to the marked house and unload it there.
  - No time limit, and the mission spawns or alerts no enemies. Regular patrols still roam, so watch the road.
  - No money or HR: the town gains **10 support** on delivery and loses 5 if the elder dies.
  - While it is open it takes the Support mission slot, like City Supplies. It is not kept across a server restart.

## 2026-09-29 - Enemy AI accuracy tweaks

### Changed
- Enemy gunners on static weapons are less accurate (**60%** of their aiming accuracy) and slower to swing onto targets (**50%** aiming speed) while they man the gun. Static machine guns and AT/AA launchers are affected, mortars are not.
- Invader soldiers each roll a random **5-20% skill bonus** when they spawn, so invaders are a little sharper than occupiers.

## 2026-09-22 - Convoy start delay 10 to 30 minutes

### Changed
- Convoy missions now leave **10 to 30 minutes** after they appear (the previous build had 5 to 25). The 60 minutes the convoy has to reach its destination is unchanged.

## 2026-09-22 - Longer convoy start delay

### Changed
- Convoy missions now leave **5 to 25 minutes** after they appear (was 5 to 10), so there is more time to reach and ambush the route. The 60 minutes the convoy has to reach its destination is unchanged.

## 2026-09-19 - Sub-commanders

### Added
- The commander can designate **sub-commanders**: new **Sub-commanders** button on the Commander tab of the Battle Command menu (Y). The dialog lists every player on the server with a **Designate** / **Remove** button per player; any number of players can hold the role and only the commander can change it.
- A sub-commander can:
  - recruit high command squads with the faction's money and HR, from the Commander tab or at the HQ flag. The squads are on the sub-commander's own high command bar, the commander cannot command them. The squad cap is per player, the same as the commander's (6 as guest, 10 as member).
  - pay for junkyard vehicles from the faction funds, with the same **faction funds** checkbox the commander has.
  - pay for utility items from the faction funds like the commander does. That includes the builder boxes, so fortifications are built on the faction's budget. Commander-only items stay commander-only.
- Sub-commanders get a cut-down Commander tab: their squads on the map and in the HC squads list, **Recruit squad**, and the squad actions (dismiss, mount, add vehicle, garrison, fast travel, remote control, mortar fire missions). The artillery key works for them too, and their top bar shows the faction funds.
- When a sub-commander leaves the server or loses the role, their squads pass to the commander. They are not handed back later. On a persistent save their squads are refunded the same way the commander's are.
- The role is saved with the campaign by player: it survives reconnects, restarts and a change of commander. Sub-commanders who are offline stay in the dialog so they can be removed. A sub-commander who becomes commander leaves the list.
- Everyone is told when a sub-commander is designated or removed and the Chronicle records it. The commander gets a notice whenever a sub-commander spends faction resources (who, what, how much). The Players tab shows the role behind the name of the commander and the sub-commanders.

## 2026-09-18 - Loot crate delivery top bar fix

### Fixed
- Ordering a loot crate delivery, and the refund when the pickup or plane returns, now update the money and HR in the top bar right away. The amounts were charged correctly before, the bar only caught up later.

## 2026-09-18 - Garrisons tab for everyone

### Changed
- The **Garrisons** tab of the Battle Command menu (Y) is now open to every player, not only the commander: everyone can see the rebel sites with their troops, vehicles, statics, ammo and status, sort the list and show a site on the map. The **Manage** button and the resupply controls (ammo truck list and **Resupply** button) are still shown to the commander only.

## 2026-09-18 - Loot crate delivery

### Added
- New **Loot Crate** button on the Player tab of the Battle Command menu (Y), below AI Management (scroll the button column). Anyone can order a loot crate to where they stand; the crate goes to that spot even if you move on. The commander pays from the faction funds, everyone else from their own money. The 1 HR for the crew always comes from the faction.
- An order dialog lists the price of both options and greys out the ones you cannot afford or that are unavailable:
  - **Pickup**: 1 HR + 50 € x war level + the price of the civilian car. It leaves HQ, follows the roads, unloads the crate at the road closest to you and drives back. The car price and the HR are refunded when it reaches HQ again.
  - **Plane**: 1 HR + 50 € x war level + 1000 €. It appears in the air above the closest rebel-held airport, drops the crate on a parachute over your position and despawns above HQ, refunding the 1000 € and the HR. Needs a rebel airport.
- Pickup and plane are civilian, so enemies ignore them. If one is destroyed, loses its driver or gets hopelessly stuck, the deposit and the HR are gone.
- The drop point is marked on the map for everyone: yellow while the delivery is on its way, green at the crate for 60 seconds after the drop, red for 60 seconds when the delivery was lost. The pickup or plane has its own marker, refreshed every 10 seconds.
- The delivered crate is a regular loot crate: loot to crate, carrying, loading into vehicles and garaging all work. The button is disabled when the **Loot to crate radius** setting is off.

## 2026-09-12 - Junkyard pricing calibration

### Changed
- Junkyard weapon multipliers halved: machine guns and grenade launchers now 1.25x, autocannons and rocket pods 1.5x, guided missiles, bombs, tank guns and artillery 2x, plus a smaller bonus per additional weapon. An attack helicopter or a tank now costs about half of what the previous build asked. The armor premium is unchanged.

### Fixed
- Junkyard weapon tiers checked against the real vanilla ammunition values: .50 cal machine guns count as machine guns again instead of autocannons, unguided rocket pods count as rocket pods instead of artillery, and artillery rockets such as the MLRS count as artillery instead of machine guns. Stock already on offer keeps its prices until the next delivery.

## 2026-09-12 - Rally flag price follows the war level

### Changed
- Teleporting to the rally flag while enemies are at it now costs 10-20 € times the war level, depending on the distance (30-60 € at war level 3), instead of a flat 50-150 €. Without enemies at the flag it still costs 5-15 €.

## 2026-09-12 - Junkyard armament and armor pricing

### Changed
- Junkyard prices now depend on what a vehicle carries. The strongest weapon sets the multiplier: machine guns and grenade launchers 1.5x, autocannons and rocket pods 2.5x, guided missiles, bombs, tank guns and artillery 4x, plus a little more for every additional weapon. Armor adds up to 3x on top, so a main battle tank costs far more than an armed pickup. The stock already on offer keeps its old prices until the next delivery. Scrap payouts for stripped wrecks follow the same prices, so armed and armored wrecks pay more scrap.

## 2026-09-12 - Rally flag rework

### Changed
- **Deploy Rally Flag** moved from the commander's scroll-wheel menu to the Commander tab of the Battle Command menu; the button rows there scroll now. The commander can plant the flag as often as they like, a new flag replaces the old one. Taking the flag away without replacing it still happens at the flag itself or at the HQ flag.
- Teleporting to the rally flag from the HQ flag now opens a confirmation dialog with the distance, the travel time, the price, whether enemies are at the flag and how many of your squad's AI come along. The Teleport button is greyed out when you cannot afford the trip.
- Enemies at the flag no longer block the teleport. With enemies within 50 m of the flag the trip costs 50-150 € depending on the distance, takes the regular fast travel time and drops your squad scattered 50-100 m around the flag. Without enemies there it costs 5-15 €, takes a third of the time and lands you right at the flag.
- The rally flag is for people on foot only: you have to be on foot to use it, and only your squad's AI on foot within 50 m of you come along. Vehicles stay behind.

## 2026-09-08 - Larger loot to crate radius options

### Added
- The **Loot to crate radius** setting now also offers 50 m and 100 m, next to the existing 10, 15 and 20 m options.

## 2026-09-05 - Garrison resupply trucks and static ammo readouts

### Added
- **Resupply** button on the Garrisons tab: pick one of your garaged ammo trucks and send it to the selected site. An AI driver takes the truck out of the garage, drives it there by road (it shows as a friendly vehicle marker and enemy sites along the way spawn around it, so it can be intercepted), spends the truck's ammo points on the static weapons first and then on the crewed vehicles, and drives back into the garage with whatever points are left. Costs the ammo points spent plus 1 HR for the driver (refunded when the truck never got there). A site that is despawned when the truck arrives gets its stored ammo topped up and comes back rearmed on its next spawn. The chronicle records each delivery or lost truck. A run in progress is not saved, so a server restart loses the truck like an air taxi flight.
- **Ammo %** column on the Garrisons tab: average ammunition left in the site's static weapons, sortable, shown in orange below 50%, `-` for sites without statics. Sites with a truck on the way show the status **Resupplying**.
- The garrison management tab (HQ > Garrisons) now lists every static weapon of the site with its ammo left and who mans it: AI, a player or nobody.

### Changed
- The garrison management tab's Build watchpost, Rebuild assets and Dismiss buttons moved into one row under the new statics table.

## 2026-09-05 - Defector escort mission

### Added
- New rescue mission, **Escort defecting officer**: an enemy officer wants out and waits in a civilian car on a country road near one of their outposts. Bring a vehicle, pick them up (drive off in their car or tell them to follow you) and get them alive to HQ or one of your airbases. Once they are with you their own side calls in support and sends a road patrol after the escort. Delivery pays 2000-6000 money, a large intel find and a temporary drop in that side's aggression. If the officer dies the mission fails. When you hold a seaport, half the time the officer instead asks to be taken there for a boat pickup. Request it through Rescue missions like the prisoner and refugee missions.

## 2026-09-05 - Scrap pays less

### Changed
- Stripping a wreck for scrap now pays 0.5-1.5% of its junkyard price instead of 1-3%, still at least 50 per wreck. With the higher junkyard prices from the previous build, scrap money ends up roughly where it was before.

## 2026-09-05 - Euro symbol is back

### Changed
- The currency symbol is € again instead of PLN, everywhere money is shown (HQ, shops, garage, recruitment, junkyard, town upgrades, mission rewards).

## 2026-09-05 - Junkyard prices raised

### Changed
- Junkyard prices went up: civilian cars, trucks, boats, helicopters and planes cost 3x as much as before, every other vehicle 2x. Scrap payouts for stripped wrecks stay at 1-3% of the junkyard price, so they rise with it.

## 2026-09-05 - Player accuracy

### Added
- Accuracy in a player's Details: the share of shots that hit a living enemy soldier or an enemy vehicle, overall in the Combat section (with the total shots fired) and per weapon or vehicle in the table at the bottom. Hits are counted from now on, so weapons used before this build show accuracy from their next shots.

## 2026-09-05 - Players tab fixes

### Fixed
- The Movement table in a player's Details showed key names such as `movement_foot` instead of the category names.

### Changed
- Time as commander is no longer listed twice in Details: it stays in the Roles table as the commander row and leaves the Activity section.

## 2026-09-05 - Chronicle shows real dates

### Changed
- Chronicle entries are stamped with the server's clock instead of campaign uptime. For the last seven days the time column says how long ago it happened, older entries show the date as dd.mm, and hovering over the time shows the full date and time. Entries written before this update keep showing campaign uptime.

## 2026-09-05 - Player statistics in depth

### Added
- The Details view of the Players tab now scrolls and shows much more: time and distance travelled on foot, in ground vehicles, aircraft and boats, swimming and on static weapons; time in each role and as commander; time undercover; longest session; money spent, donated and earned from scrap; captures and defences the player took part in; intel found; recruits and vehicles lost; vehicles bought, wrecks scrapped, fast travels, rally flag teleports and air taxi rides.
- A weapons and vehicles table at the bottom of Details: for every weapon carried or vehicle used, the time with it, the soldiers, vehicles and aircraft killed with it, and the shots fired.
- Everything is collected from now on and stored in the campaign save with the other player statistics; older records start these at zero.

## 2026-09-05 - Chronicle records more and keeps more

### Added
- The Chronicle now also records mission outcomes with the players who were there, commander changes, the start of the campaign, radio towers destroyed and rebuilt, enemy aggression level changes, the moment most of the population sides with the rebels or turns away again, changes to the reward split, and every weapon, item or backpack unlocked in the arsenal. Two new filters, Missions and Arsenal, go with them.

### Changed
- The Chronicle keeps 3000 entries instead of 300 and shows them 50 per page, newest first, with Newer and Older buttons. Existing saves keep their entries.

## 2026-09-05 - One GitHub release per build

### Changed
- Every push to `unstable` now publishes its own GitHub release, tagged `unstable-<version>` (for example `unstable-3.11.1.a243ee3`) with the asset `A3A-unstable-<version>.zip`, instead of rewriting the single rolling `unstable-latest` prerelease. Each build is a full release marked as the latest one, so the repository's `releases/latest` link always points at the newest build, and older builds stay downloadable from the Releases page. Builds queue behind each other instead of cancelling, so every pushed commit gets a release. The Steam Workshop upload is unchanged.

## 2026-09-05 - Air taxi to any spot

### Changed
- The air taxi flies you to any point you click on the map, not only to towns, outposts and other location markers. Water and off-map clicks are refused; the pilot picks a landing zone near the spot and hover-drops you if there is none.

## 2026-09-05 - Town upgrades

### Added
- Town upgrades: the commander buys an upgrade kit for a rebel-held town in the Buy Vehicle dialog (new tab, price grows with the town's population). Rebels carry or truck the crate to that town and build it within 100 m of the centre. Clinic (+0.1 support per tick, civilian deaths hurt support half as much), market (+10% money), recruitment office (+10% HR), radio relay (counts as a rebel radio tower), militia post (garrison limit x1.5) and safehouse (free, faster fast travel and a 'lie low' action that clears undercover heat). One of each per town, shown as map markers and in the Towns tab. Upgrades are lost when the town falls, is destroyed, or is left unguarded during an invader punishment raid. Kits in transit and installed upgrades are stored in the campaign save.

### Fixed
- The police station multiplier on town support changes never applied because of an undefined variable. Towns without a police station now gain support 1.5x faster, as intended.

## 2026-09-05 - Helicopter air taxi

### Added
- Air Taxi in the Battle Command menu (Y), Player tab: charter a garaged transport or civilian helicopter. An AI pilot flies in from the nearest friendly airbase or the HQ, lands next to you, waits up to 60 s for you and your squad to board, flies you to any location marker you pick on the map and brings the helicopter back to the garage. No landing zone at the destination means a 3 m hover drop. The fare is 200 PLN plus 100 PLN per km from your own money, plus 1 HR for the pilot, refunded when he makes it home. A taxi that never picks you up refunds everything; a taxi shot down on the way loses the fare, the HR and the helicopter. Any marker can be the destination, enemy-held ones included, but garrisons along the route wake up as you fly over them.

### Changed
- The Player tab's button column now scrolls, so more buttons fit.

## 2026-09-05 - Players tab

### Added
- Players tab in the Battle Command menu (Y), open to every player: everyone who ever joined the campaign, online or offline, with kills, deaths, K/D and time online. Sort by clicking a column, narrow the list with the name filter, and press Details for one player's full record: vehicle, aircraft, civilian, friendly and player kills, longest kill, times downed, revives, sessions, first and last seen, current session, plus rank, score, money, money earned and missions completed. Admins also see the Steam UID.
- The statistics are tracked on the server and stored in the campaign save. They survive a player declining to load their personal save and are written on every autosave, so a crash loses at most one autosave interval. Kills count enemy soldiers only, everything else is in Details. Revives are counted for the Antistasi revive system, not for ACE medical.

### Changed
- The Battle Command tab strip now holds seven tabs.

## 2026-09-05 - Campaign chronicle

### Added
- Chronicle tab in the Battle Command menu (Y), readable by every player: a timeline of the campaign. It records sites and towns captured, lost or changing hands between the enemies, incoming attacks and whether they were repelled, punishments, HQ attacks and defences, HQ moves, Petros' death, promotions, war level changes and the end of the campaign. Entries name the rebel players who were there, show how long ago it happened, can be filtered by category, and a double-click jumps to the place on the map. The last 300 events are kept and stored in the campaign save.

### Changed
- The Battle Command tab buttons are narrower so that six tabs fit in the strip.

## 2026-09-05 - Player statistics and release notes

### Added
- Players tab in the main menu: everyone who ever joined the campaign, online or not, with kills, deaths, K/D and time online, sortable by column. A Details button opens the full record of one player: vehicle, air, civilian, friendly and player kills, longest kill, times downed, revives, money earned, sessions, first and last seen, plus rank, score, money and missions.
- Player statistics are tracked on the server, credited the same way the rest of Antistasi credits kills (including revive finishes and roadkills), and stored in the campaign save. They are flushed on every autosave, so a server crash loses at most one autosave interval.

### Internal
- Every push to `unstable` now carries its own release notes: the top entry of `CHANGELOG-unstable.md` is published in the `unstable-latest` GitHub prerelease and as the Steam Workshop change note. See `CLAUDE.md`.

## 2026-09-05 - Fork baseline

Everything this fork added on top of Antistasi 3.11.1 before this changelog existed.

### Added
- Junkyard at the HQ garage crate: buy heavily damaged civilian and military vehicles, restocked hourly. Wrecks get no free repairs for 10 hours and are marked as junk in the garage.
- Wreck stripping: engineers with a toolkit can strip any destroyed vehicle for scrap worth 1-3% of its junkyard price (at least 50 PLN). Wrecks inside a spawned enemy base have to wait until it is captured or cleared.
- Commander-deployable rally flag with a free, faster teleport from the HQ flag. One flag at a time, removable only at the flag or at the HQ flag.
- Battle Command menu: new Towns tab with town statistics and a new Garrisons tab.
- The commander can set how mission rewards are split.
- Automatic builds: every push to `unstable` publishes the `unstable-latest` GitHub prerelease and updates the Steam Workshop item.

### Changed
- Currency symbol changed from € to PLN.
- Loot crates no longer have a capacity limit when looting to crate.
