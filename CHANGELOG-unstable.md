# Unstable changelog

Every push to `unstable` adds one entry at the top of this file, newest first. The release workflow
publishes the top entry as the body of the push's GitHub release and the Steam workflow
publishes it as the Workshop change note, so write it for players. Format and rules: [CLAUDE.md](CLAUDE.md).

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
