# Bloons TD 6 -- Gameplay Systems Spec

Bloons TD 6, developed by Ninja Kiwi. Mobile (iOS/Android) and PC (Steam), released June 2018. This spec covers the base game through approximately v41+ (2024).

---

## 1. Core Gameplay Systems

### Primary Loop

Bloons TD 6 is a tower defense game. The player places monkey towers along a fixed path on a 2D map. Bloons (balloons) travel along the path in waves called rounds. Towers automatically attack bloons within their range. If a bloon reaches the end of the path, the player loses lives equal to that bloon's RBE (Red Bloon Equivalent -- the total number of Red Bloon layers it contains, including all children). The game ends when lives reach zero. The player wins by surviving all rounds for the chosen difficulty.

**Each round:**
1. Place or upgrade towers using available cash (can also be done mid-round)
2. Start the round -- bloons spawn in scripted waves
3. Towers auto-attack bloons within range based on targeting priority
4. Earn cash from popping bloons ($1 per layer popped, base) and an end-of-round bonus ($100 + round number)
5. Repeat until all rounds are cleared or lives reach 0

### Progression Systems

- **Tower Upgrades:** Each tower has 3 upgrade paths with 5 tiers each. Cross-pathing allows one path to Tier 5, one to Tier 2, the third must remain at Tier 0 (see S4).
- **Paragons:** Ultimate tower forms that combine all three Tier 5 paths (see S4).
- **Hero Leveling:** Heroes auto-level from 1 to 20 during a game via per-round XP (see S3).
- **Monkey Knowledge:** Permanent meta-progression skill trees providing incremental buffs (see S8).
- **Player Level / XP:** The player earns XP to level up, unlocking towers, heroes, and Monkey Knowledge points.

### Resource Management

| Resource | Role | Details |
|---|---|---|
| Cash | In-game currency for towers and upgrades | Earned from pops and round completion; resets each game |
| Lives | Health pool | Bloons escaping the track drain lives by their RBE |
| Monkey Money | Meta-currency | Earned from completing maps; spent on heroes, powers, cosmetics |
| Trophies | Cosmetic currency | Earned from events; spent in the Trophy Store |

---

## 2. Controls & Input

### Mobile (iOS / Android)
- **Tap** empty space: open tower placement menu
- **Tap** tower: select tower, view range, access upgrades
- **Drag** tower from menu: place on map
- **Tap** Play button: start next round (or double-tap for fast-forward)
- **Pinch/spread**: zoom in/out on map
- **Drag** map: pan camera
- **Tap** ability icon: activate hero/tower ability
- **Tap** targeting button: cycle First/Last/Close/Strong

### PC (Steam)
- **Left-click** empty space: open tower placement menu
- **Left-click** tower: select, view range, access upgrades
- **Hotkeys** for tower placement: each tower category and tower has a keyboard shortcut
- **Space**: start round / toggle fast-forward
- **Right-click**: deselect / cancel placement
- **Scroll wheel**: zoom
- **Middle-click drag**: pan camera
- **Esc**: pause menu

### Shared Controls
- **Fast Forward**: 1x or 3x game speed toggle
- **Targeting priority**: cycle between First, Last, Close, Strong (plus tower-specific modes)
- **Sell button**: sell selected tower for 70% of total investment (base)
- **Upgrade panel**: shows 3 upgrade paths; tap/click to purchase

---

## 3. Heroes

Heroes are unique monkey characters with auto-leveling abilities. Each player selects one hero before starting a game. Only one hero can be placed per player per game.

### Leveling
- Heroes level from 1 to 20 automatically via per-round XP (not from pops)
- Round 1 grants 40 XP; increases by 20/round until Round 20, then by 40/round until Round 50, then by 90/round from Round 51+
- XP ratio determines leveling speed: 1.0x (fast) to 1.71x (slow)
- First activated ability unlocks at Level 3; second at Level 10
- Some heroes have 3 abilities (second at Level 7, third at Level 10)

### Hero Roster

| Hero | Cost (Med) | XP Ratio | Unlock | Role |
|---|---|---|---|---|
| Quincy | $540 | 1.0x | Free | Archer -- accurate arrows; Storm of Arrows ability |
| Gwendolin | $725 | 1.0x | Free (Lv14) | Pyromaniac -- fire DPS; Cocktail of Fire, Firestorm |
| Striker Jones | $700 | 1.0x | Free (Lv21) | Artillery Commander -- buffs Bomb/Mortar; stun, cooldown reset |
| Obyn Greenfoot | $650 | 1.0x | Free (Lv28) | Nature Guardian -- buffs Druids/Magic; Brambles, Wall of Trees |
| Captain Churchill | $2,000 | 1.71x | 2,500 MM | Tank -- raw DPS; Armor Piercing Shells, MOAB Barrage |
| Benjamin | $1,200 | 1.5x | 3,000 MM | Hacker -- income generation; Biohack, Syphon Funding (no attack) |
| Ezili | $600 | 1.425x | 3,000 MM | Voodoo -- anti-Regrow, late-game anti-MOAB; MOAB Hex |
| Pat Fusty | $800 | 1.425x | 3,000 MM | Giant Melee -- amphibious (land or water); Rallying Roar (+damage buff), Big Squeeze |
| Adora | $1,000 | 1.71x | 5,000 MM | Sun Priestess -- DPS; Blood Sacrifice (tower -> hero XP), Ball of Light |
| Admiral Brickell | $900 | 1.425x | 5,000 MM | Naval Commander -- water-only; buffs water towers; Mega Mine |
| Etienne | $850 | 1.0x | 5,000 MM | Drone Operator -- Level 8 grants global camo detection; UCAV ability |
| Sauda | $600 | 1.425x | 5,000 MM | Swordmaster -- melee DPS; Leaping Sword, Sword Charge |
| Psi | $1,000 | 1.5x | 5,000 MM | Psychic -- infinite range; stun/instakill scaling with level |
| Geraldo | $750 | 1.0x | 7,000 MM | Shopkeeper -- sells 16 deployable items instead of abilities |
| Corvus | $1,025 | 1.425x | 7,000 MM | Spirit Walker -- Mana harvesting; Soul Spirit, Dark Ritual |
| Rosalia | $875 | 1.425x | 5,000 MM | Tinkerer -- jetpack with laser/grenades/missiles |
| Silas | $850 | 1.5x | 5,000 MM | Ice Shaper -- ice attacks; buffs Ice Monkey towers |

### Key Hero Abilities

**Quincy:** Rapid Shot (Lv3, triples attack speed 8s) | Storm of Arrows (Lv10, area damage + MOAB bonus)

**Gwendolin:** Cocktail of Fire (Lv3, fire wall, 40 pierce) | Firestorm (Lv10, screen-wide fire + "Heat It Up" buff to all towers)

**Striker Jones:** Concussive Shell (Lv3, stun strongest bloon) | Artillery Command (Lv10, reset Bomb/Mortar cooldowns; Lv20 doubles their damage). Passive: explosives gain Black-popping at Lv5+.

**Obyn Greenfoot:** Brambles (Lv3, spike bush 50 pierce) | Wall of Trees (Lv10, absorb/destroy bloons including MOABs). Passive: buffs nearby Druids.

**Benjamin:** Biohack (Lv3, +1 damage to 4 nearest towers, 6s) | Syphon Funding (Lv10, downgrade incoming bloons). Passive: generates $80-$5,000/round; Bank Hack +5-12% bank income.

**Ezili:** Heartstopper (Lv3, disable Regrow 10-20s) | Sacrificial Totem (Lv7, costs lives, buffs nearby towers) | MOAB Hex (Lv10, % HP damage over time; Lv20 can solo a BAD).

**Etienne:** Drone Swarm (Lv3, 4 temp drones) | UCAV (Lv10, powerful combat drone). Passive: **Level 8 grants global camo detection to ALL towers** (a defining ability).

**Geraldo:** Shop (Lv1) selling 16 items: Shooty Turret ($250), Stack of Old Nails ($50), Creepy Idol ($120), Jar of Pickles ($150, +1 dmg buff), Rare Quincy Action Figure ($750, decoy), See Invisibility Potion ($200), Tube of Amaz-o-Glue ($150), Sharpening Stone ($200, +1 pierce), Worn Hero's Cape ($1,750), Blade Trap ($650), Gerry's Fire Hot Sauce ($650), Fertilizer ($300), Pet Rabbit ($1,750), Rejuv Potion ($2,000), Genie Bottle ($2,500), Paragon Power Totem ($26,000). Items upgrade as Geraldo levels.

---

## 4. Towers

BTD6 has 24 towers across 4 categories (19 at launch; Mortar Monkey added v6.0, Engineer Monkey v12.0, Dartling Gunner v22.0, Beast Handler v36.0, Mermonkey v44.0). See [docs/btd6/towers.md](docs/btd6/towers.md) for complete base stats, upgrade paths, and costs.

### Categories

| Category | Towers | Count |
|---|---|---|
| Primary | Dart Monkey, Boomerang Monkey, Bomb Shooter, Tack Shooter, Ice Monkey, Glue Gunner | 6 |
| Military | Sniper Monkey, Monkey Sub, Monkey Buccaneer, Monkey Ace, Heli Pilot, Mortar Monkey, Dartling Gunner | 7 |
| Magic | Wizard Monkey, Super Monkey, Ninja Monkey, Alchemist, Druid, Mermonkey | 6 |
| Support | Banana Farm, Spike Factory, Monkey Village, Engineer Monkey, Beast Handler | 5 |

### Upgrade System (3-Path, 5-Tier)

Each tower has 3 upgrade paths with 5 tiers each. Cross-pathing rules:
- **One path** may be upgraded to **Tier 5** (maximum)
- **One other path** may be upgraded to **Tier 2** (maximum)
- The **third path** must remain at **Tier 0**

Valid configurations: 5-2-0, 5-0-2, 2-5-0, 0-5-2, 2-0-5, 0-2-5 (and all lower combinations).

**Tier 5 restriction:** Only one Tier 5 of each upgrade path may exist per player per game (e.g., only one Crossbow Master on the map). The Monkey Knowledge "Master Double Cross" allows a second Tier 5 for Dart Monkey specifically.

### Tier 5 Upgrades (Summary)

| Tower | Path 1 | Path 2 | Path 3 |
|---|---|---|---|
| Dart Monkey | Ultra-Juggernaut | Plasma Monkey Fan Club | Crossbow Master |
| Boomerang | Glaive Lord | Perma Charge | MOAB Domination |
| Bomb Shooter | Bloon Crush | MOAB Eliminator | Bomb Blitz |
| Tack Shooter | Inferno Ring | Super Maelstrom | The Tack Zone |
| Ice Monkey | Super Brittle | Absolute Zero | Icicle Impale |
| Glue Gunner | The Bloon Solver | Glue Storm | Super Glue |
| Sniper Monkey | Cripple MOAB | Elite Sniper | Elite Defender |
| Monkey Sub | Energizer | Pre-Emptive Strike | Sub Commander |
| Monkey Buccaneer | Carrier Flagship | Pirate Lord | Trade Empire |
| Monkey Ace | Sky Shredder | Tsar Bomba | Flying Fortress |
| Heli Pilot | Apache Prime | Special Poperations | Comanche Commander |
| Mortar Monkey | The Biggest One | Pop and Awe | Blooncineration |
| Dartling Gunner | Ray of Doom | M.A.D. | Bloon Exclusion Zone |
| Wizard Monkey | Archmage | Wizard Lord Phoenix | Prince of Darkness |
| Super Monkey | True Sun God | The Anti-Bloon | Legend of the Night |
| Ninja Monkey | Grandmaster Ninja | Grand Saboteur | Master Bomber |
| Alchemist | Permanent Brew | Total Transformation | Bloon Master Alchemist |
| Druid | Spirit of the Forest | Superstorm | Avatar of Wrath |
| Mermonkey | *data pending* | *data pending* | *data pending* |
| Banana Farm | Banana Central | Monkey-Nomics | Monkey Wall Street |
| Spike Factory | Super Mines | Carpet of Spikes | Perma-Spike |
| Monkey Village | Primary Expertise | Homeland Defense | Monkeyopolis |
| Engineer Monkey | Sentry Champion | Ultraboost | XXXL Trap |
| Beast Handler | *data pending* | *data pending* | *data pending* |

### Paragon System

Paragons are the ultimate tower upgrade, combining all 3 Tier 5 paths into one hyper-powerful tower. Introduced in v27.0.

**Requirements:**
1. All three Tier 5 upgrades of the same tower type must be on the map
2. Upgrade one into the Paragon -- all towers of that type are consumed
3. Only the Paragon remains

**Degree System (1-100):** Paragon power is determined by a Degree calculated from 4 factors:

| Factor | Calculation | Max Power |
|---|---|---|
| Pops | 180 pops = 1 power | 90,000 |
| Money Spent | $25 spent = 1 power | 10,000 |
| Upgrade Tiers | 1 non-T5 tier = 100 power | 10,000 |
| Extra T5 Towers | Each extra T5 = 10,000 power | 90,000 |
| **Total** | | **200,000** |

- Solo max degree: 76 (79 for Dart Monkey with Master Double Cross MK)
- 4-player co-op max degree: 100
- Geraldo's Paragon Power Totems can bridge the gap (~40-45 totems to push from Degree ~91 to 100)

**Available Paragons:**

| Tower | Paragon Name | Version |
|---|---|---|
| Dart Monkey | Apex Plasma Master | v27.0 |
| Boomerang Monkey | Glaive Dominus | v27.0 |
| Ninja Monkey | Ascended Shadow | v28.0 |
| Monkey Buccaneer | Navarch of the Seas | v29.0 |
| Engineer Monkey | Master Builder | v32.0 |
| Monkey Ace | Goliath Doomship | v33.0 |
| Wizard Monkey | Magus Perfectus | v36.0 |
| Monkey Sub | Nautic Siege Core | v41.0 |

**Paragon restrictions:** Cannot receive buffs from other towers; cannot be moved by Chinook; will not be sacrificed by Sun Temples; prices cannot be reduced.

### Key Tower Synergies

**Alchemist Berserker Brew (Path 1 T3):** One of the most important mechanics in the game. The Alchemist throws a buff potion at a nearby tower, granting +1 damage, +1 pierce, +10% range, and +15% attack speed for a limited number of attacks. The buff has limited charges and must be re-applied, creating a critical interaction where fast-attacking towers (like Super Monkey) consume the buff too quickly. The Path 1 T4 upgrade (Stronger Stimulant) increases the buff to +3 damage, +3 pierce, and longer duration. Path 1 T5 (Permanent Brew) makes the buff permanent on all towers it touches.

**Shinobi Tactics (Ninja Path 2 T3):** Each Shinobi-buffed Ninja within range of another Ninja grants +8% attack speed and +1 pierce, stacking up to 20 times. A Grandmaster Ninja surrounded by 20 Shinobi Tactics Ninjas is one of the strongest DPS setups in the game.

### Targeting

Standard towers offer 4 targeting priorities:

| Priority | Behavior |
|---|---|
| First | Bloon farthest along the track |
| Last | Bloon nearest to track entrance |
| Close | Bloon nearest to the tower |
| Strong | Bloon with highest RBE in range |

Exceptions: Mortar (fixed position), Dartling (cursor aim), Ace (flight pattern), Heli (follow/pursuit), Spike Factory (Close/Far/Smart), Farm/Village (non-combat).

### Sun Temple Sacrifice System

The Super Monkey's Path 1 T4 (Sun Temple) and T5 (True Sun God) have unique sacrifice mechanics:

**Sun Temple (T4):** When purchased, all towers within its range are consumed. Sacrificed towers are tallied across 4 categories (Primary, Military, Magic, Support). The cheapest category is discarded -- only the top 3 count. Maximum sacrifice threshold per category: **$50,000** (spending more gives no additional benefit). A "maxed" Sun Temple has 3 categories each exceeding $50,000 in sacrificed tower value.

**True Sun God (T5):** Another round of sacrifices occurs on upgrade. All 4 categories can count this time. Requires $50,000+ per category for maximum power.

**Vengeful True Sun God (VTSG):** A secret variant requiring: (1) the "There Can Be Only One" Monkey Knowledge, (2) a maximal True Sun God (full sacrifices at both T4 and T5), (3) The Anti-Bloon (Path 2 T5) and Legend of the Night (Path 3 T5) both on the map but outside sacrifice range. When conditions are met, the TSG absorbs both other T5 Super Monkeys and transforms into a massively empowered dark form. Only one VTSG can exist per game.

### Placement

| Placement | Towers |
|---|---|
| Land only | All except Sub, Buccaneer, and Mermonkey (21 towers) |
| Water only | Monkey Sub, Monkey Buccaneer |
| Land or Water | Mermonkey, Pat Fusty (hero) |

**Land-on-water:** Pontoon power, Carrier Flagship deck, Arctic Wind (Ice 0-3-0+) freezes water into land.
**Water-on-land:** Portable Lake power.

---

## 5. Bloons

Bloons are the enemies in BTD6. They travel the track and the player must pop them before they escape. See [docs/btd6/bloons.md](docs/btd6/bloons.md) for complete stat tables, boss bloon HP values, damage type matrix, and round milestones.

### Standard Bloons

Standard bloons have 1 HP per layer (except Ceramic at 10 HP). Popping a layer reveals children inside. The hierarchy from weakest to strongest:

**Red (1 RBE)** -> Blue (2) -> Green (3) -> Yellow (4) -> Pink (5) -> then branching:
- **Purple** (11 RBE): 2 Pink children. Immune to Energy/Fire/Plasma.
- **Black** (11 RBE): 2 Pink children. Immune to Explosion.
- **White** (11 RBE): 2 Pink children. Immune to Cold/Freezing.
- **Zebra** (23 RBE): 1 Black + 1 White. Immune to Explosion + Cold.
- **Lead** (23 RBE): 2 Black children. Immune to Sharp, Cold, Energy. Speed 1.0x (very slow).
- **Rainbow** (47 RBE): 2 Zebra children.
- **Ceramic** (104 RBE): 10 HP shell, 2 Rainbow children. First multi-hit bloon.

### MOAB-Class Bloons

Five blimp-type bloons with massive HP pools, each containing smaller bloons or blimps:

- **MOAB** (200 HP, 616 RBE): 4 Ceramics. First appears Round 40.
- **BFB** (700 HP, 3,164 RBE): 4 MOABs. First appears Round 60.
- **ZOMG** (4,000 HP, 16,656 RBE): 4 BFBs. First appears Round 80.
- **DDT** (400 HP, 816 RBE, speed 2.75x): 4 Camo Regrow Ceramics. Has Lead + Black + Camo properties -- the hardest bloon to counter. First appears Round 90.
- **BAD** (20,000 HP, 55,760 RBE): 2 ZOMGs + 3 DDTs. Immune to ALL slowing, stunning, knockback, and instakill effects. First appears Round 100.

All MOAB-class are immune to most glue and freezing effects. Fortified variants have double HP.

### Bloon Properties

Three modifier properties can be applied to bloons, and they stack freely:

- **Camo:** Invisible to towers without Camo detection. Applies to all standard bloons; DDT has innate Camo. Counters: Radar Scanner (Village 0-2-0), Ninja (innate), Etienne Lv8 (global).
- **Regrow:** Regenerates 1 layer every 3 seconds back to original form. Standard bloons only (not MOAB-class). Counters: Grow Blocker (Village 0-1-0), Ezili's Heartstopper.
- **Fortified:** Doubles HP (quadruples for Lead). Applies to Lead, Ceramic, and all MOAB-class.

The hardest standard combination is **Fortified Camo Regrow Ceramic** (20 HP, regrows, requires camo detection).

### Damage Types

Each tower inflicts a specific damage type, and certain bloon types are immune to certain damage types. The key immunity rules:

- **Lead** is immune to Sharp and Normal (the most common types). Requires Explosion, Fire, Plasma, Acid, or upgrade-granted Lead-popping.
- **Black** is immune to Explosion. **White** is immune to Cold. **Zebra** inherits both.
- **Purple** is immune to Energy, Plasma, and Fire (energy-based attacks).
- **Frozen** bloons (created by Ice Monkey) can't be popped by Sharp or Normal.
- **DDT** combines Lead + Black + Camo -- requires a type that pops both Lead and Black, plus Camo detection. Effective: Plasma, Fire, Acid, or Normal with MIB.
- **Acid** (Glue Gunner, Alchemist) pops all bloon types with no immunities.
- **Monkey Intelligence Bureau** (Village 0-3-0) overrides all damage type immunities for towers in range.

See [docs/btd6/bloons.md](docs/btd6/bloons.md) for the full damage type matrix.

### Super Ceramics (Round 81+)

From Round 81 onward, all Ceramics become Super Ceramics: 60 HP (Fortified: 120), but spawn only 1 child per layer instead of 2.

### Boss Bloons

Boss bloons appear in Boss Bloon Events at Rounds 40, 60, 80, 100, and 120 (5 tiers). Available in Normal and Elite difficulties. Each has skull thresholds that trigger special abilities. Elite T5 HP ranges from 24,000,000 to 40,000,000.

| Boss | Signature Mechanic |
|---|---|
| Bloonarius | Spawns massive bloon waves at each skull |
| Lych | Steals tower buffs to heal; spawns Lych-Soul mini-boss at each skull |
| Vortex | Fastest boss; speeds up nearby bloons; periodically destroys projectiles |
| Dreadbloon | Ceramic armor shell; flat damage reduction; rotates tower category immunity |
| Phayze | Innate Camo; disables camo detection; portals shift bloon spawn point |
| Blastapopoulos | Purple immunity; purges DoT; Heat mechanic stuns towers |

---

## 6. World Structure

### Map System

Maps are divided into 4 difficulty categories:

| Category | Approx. Count | Unlock Requirement | Characteristics |
|---|---|---|---|
| Beginner | ~23-25 | Default | Long paths, single track, ample tower space |
| Intermediate | ~23-24 | 5 unique map wins | Moderate difficulty, some water, obstacles |
| Advanced | ~17-22 | 12 unique map wins | Short paths, multi-path, LOS blockers |
| Expert | ~13-14 | 20 unique map wins | Very short paths, multiple entry/exit points, minimal space |

Total: approximately **77 maps** (count grows with updates).

### Track Types
- **Single-path:** One entrance, one exit, one route. Most Beginner maps.
- **Multi-path:** Bloons can enter from multiple entrances or split along different paths. Common in Advanced/Expert.
- **Water maps:** Feature water areas for Monkey Sub and Buccaneer placement.

### Map Features
- **Removable objects:** Obstacles removed for a cash cost, opening tower placement space or removing LOS blockers.
- **Line of Sight (LOS) blockers:** Physical objects blocking tower vision, preventing shots through. Critical on Advanced/Expert maps.
- **Gizmos:** Interactive map elements altering gameplay (e.g., path-extension toggles, spirit summons).

---

## 7. Game Modes & Difficulty

### Difficulty Tiers

| Setting | Easy | Medium | Hard | Impoppable | CHIMPS |
|---|---|---|---|---|---|
| Starting Cash | $650 | $650 | $650 | $650 | $650 |
| Starting Lives | 200 | 150 | 100 | 1 | 1 |
| Tower Cost Modifier | 85% | 100% | 108% | 120% | 108% |
| Round Range | 1-40 | 1-60 | 3-80 | 6-100 | 6-100 |
| Sell-back Rate | 70% | 70% | 70% | 70% | N/A (disabled) |

### Sub-Modes

**Easy:**
| Mode | Rules |
|---|---|
| Standard | Base rules. Rounds 1-40. |
| Primary Only | Only Primary category towers + Heroes allowed. |
| Deflation | Start with $20,000. No income of any kind. Rounds 31-60. |

**Medium:**
| Mode | Rules |
|---|---|
| Standard | Base rules. Rounds 1-60. |
| Military Only | Only Military category towers + Heroes allowed. |
| Reverse | Bloons enter from the opposite end of the track. |
| Apopalypse | Bloons spawn continuously with no breaks between rounds. No end-of-round bonus. |

**Hard:**
| Mode | Rules |
|---|---|
| Standard | Rounds 3-80. |
| Magic Only | Only Magic category towers + Heroes. |
| Alternate Bloons Rounds (ABR) | Modified compositions -- Camo at Round 5, Leads at Round 10. |
| Double HP MOABs | All MOAB-class bloons have 2x health. |
| Half Cash | All income halved. Starting cash halved ($325). |
| Impoppable | 1 life. No extra lives. Tower costs +20%. Rounds 6-100. |
| C.H.I.M.P.S. | The ultimate challenge -- see below. |

### C.H.I.M.P.S.

**C**ontinues disabled, **H**earts Lost (1 life, no extra), **I**ncome disabled (no farms/bonus income), **M**onkey Knowledge disabled, **P**owers disabled, **S**elling disabled. Rounds 6-100.

### Freeplay

After completing the final round of any mode, the player enters Freeplay with infinitely escalating difficulty:
- **Super Ceramics** from Round 81 (see S5)
- **MOAB HP scaling:** +2%/round (R81-100), then +5%/round (R101+), compounding
- **Speed scaling:** +2%/round from R81
- **Cash-per-pop tax:** Progressively reduced income (see S9)
- **After Round 140:** Bloon compositions become randomized

### Sandbox

Each difficulty tier has a Sandbox mode for unrestricted practice with no win/lose conditions.

---

## 8. Meta-Progression

### Monkey Knowledge

A permanent skill tree system providing incremental buffs across all games. Disabled in CHIMPS mode.

**Earning points:** ~1 point per player level-up (starting at Level 30), plus achievement rewards. 134 total points needed; 138 earnable.

**Six trees:**

| Tree | Key Upgrades |
|---|---|
| Primary | **Bonus Monkey!** (first Dart Monkey is free); **More Cash** (+$200 starting cash); Primary tower cost discounts |
| Military | **Military Conscription** (first Military tower -33% cost); **Big Bloon Sabotage** (all MOAB-class -10% HP) |
| Magic | **Mana Shield** (absorbs 25 lives of leakage); **Empowered Heroes** (heroes start at Level 3) |
| Support | **Better Sell Deals** (sell-back 70% -> 75%); **Bigger Banks** (+$2,500 bank capacity) |
| Heroes | Hero cost reductions; Hero XP bonuses |
| Powers | Power enhancements and cost reductions |

### Player Level / XP

Players earn XP from completing games, which levels up their account. Leveling unlocks:
- New tower types (locked behind specific levels early on)
- Monkey Knowledge points (from Level 30+)
- Additional game features

### Medals and Map Borders

Each map has 14 game modes awarding medals (Easy: bronze, Medium: silver, Hard: gold, plus Impoppable and CHIMPS).

| Border | Requirement |
|---|---|
| Gold Border | All medals including Red CHIMPS medal (beaten with exits/retries) |
| Black Border | All medals including Black CHIMPS medal (beaten without exiting or retrying) |

Black Border is the most prestigious achievement in the game.

### Collection Events

Seasonal limited-time events tied to real-world holidays (Halloween, Easter, Anniversary, etc.). Players earn Insta-Monkeys and exclusive cosmetics by completing maps during the event period. Rewards are distributed through a collectible card system.

### Trophy Store

Cosmetic shop using Trophies (earned from Odysseys, Races, Boss Events, Contested Territory, and select achievements). Items include:
- **Hero pets:** Cosmetic companions
- **Bloon/MOAB skins:** Alternate bloon appearances
- **Pop effects:** Custom pop visuals and sounds
- **Music tracks:** Alternate in-game music
- **Projectile skins:** Alternate tower projectile visuals
- **Monkey Names:** Rename towers and track per-tower statistics

All items are purely cosmetic with no gameplay impact. Cannot be purchased with real money.

### Achievements

Gameplay milestones rewarding Monkey Money (50-1,000), Insta-Monkeys, Knowledge Points, or Trophies.

---

## 9. Economy

### Income Sources

**1. Pop Income**
- Base: $1 per bloon layer popped
- Reduced by cash-per-pop tax in later rounds:

| Round Range | Cash per Pop |
|---|---|
| 1-50 | 100% ($1.00) |
| 51-60 | 50% ($0.50) |
| 61-85 | 20% ($0.20) |
| 86-100 | 10% ($0.10) |
| 101-120 | 8% ($0.08) |
| 121-140 | 5% ($0.05) |
| 141+ | 2% ($0.02) |

**2. End-of-Round Bonus**
- Formula: **$100 + R** (R = round number completed)
- Disabled in CHIMPS and Apopalypse modes

**3. Banana Farms** (primary income generation tower)

| Upgrade | Income per Round |
|---|---|
| Base Farm (0-0-0) | $80 (4 bunches x $20) |
| Increased Production (1-0-0) | $120 (6 bunches) |
| Greater Production (2-0-0) | $160 (8 bunches) |
| Banana Plantation (3-0-0) | $320 (16 bunches) |
| Banana Research Facility (4-0-0) | ~$1,500 (5 crates x $300) |
| Marketplace (x-x-3) | $320/round (auto-collected) |
| Monkey Bank (x-3-x) | Stores $225/round with **15% compound interest** until capacity |
| IMF Loan (x-4-x) | Bank + ability to take $10,000 loan |

**4. Other Income**
- **Merchantman/Favored Trades/Trade Empire** (Buccaneer Path 3): end-of-round income. Optimized setup can reach ~$40,800/round.
- **Supply Drop** (Sniper 0-4-0 ability): cash crate
- **Benjamin** (Hero): passive income generation + Bank Hack + Bloon Trojan
- **Jungle's Bounty** (Druid 4-0-0 ability): cash + lives

### Sell-back

| Modifier | Rate |
|---|---|
| Base | 70% of total investment |
| Better Sell Deals (MK) | 75% |
| Favored Trades (Buccaneer x-x-4 in range) | +4% per tower, up to 3 stacks (+12%) |
| Hard cap | 95% |

Selling is disabled in CHIMPS mode.

### Monkey Money (Meta-Currency)

**Earning (first-time map completion):**

| Map Tier | Easy | Medium | Hard | Impoppable |
|---|---|---|---|---|
| Beginner | $75 | $125 | $200 | $300 |
| Intermediate | $150 | $250 | $400 | $600 |
| Advanced | $225 | $375 | $600 | $900 |
| Expert | $300 | $500 | $800 | $1,200 |

Replaying an already-medaled mode yields 20% of original reward. Mo' Monkey Money MK adds +10%.

**Spending:** Heroes (2,500-7,000 MM), hero skins (~2,500 MM), powers, continues, race retries.

---

## 10. Powers & Insta-Monkeys

### Powers

Consumable single-use items providing in-game benefits. Banned in CHIMPS mode.

| Power | Cost (MM) | Effect |
|---|---|---|
| Super Monkey Storm | 100 | 4,000 damage to every bloon on screen |
| Monkey Boost | 100 | 2x attack speed for all towers, 15s |
| Thrive | 70 | +25% pop cash this round and next |
| Time Stop | 50 | Slow all bloons to 10% speed, 10s |
| Cash Drop | 200 | $2,500 in-game cash |
| Banana Farmer | 50 | Auto-collects bananas/crates in 60-unit range |
| Pontoon | 50 | Platform for land towers on water |
| Portable Lake | 50 | Water area for water towers on land |
| Road Spikes | 50 | Track spikes, 20 pops |
| Glue Trap | 50 | Glues up to 300 bloons, -50% speed, 30s |
| MOAB Mine | 50 | 5,000 damage to up to 10 MOAB-class |
| Camo Trap | 50 | Removes camo from up to 500 bloons |
| Tech Bot | 50 | Auto-activates linked tower's ability on cooldown |
| Energizing Totem | 80 | +33.3% attack speed nearby, 5 rounds |
| Cave Monkey | 150 | Melee tower that clubs and stuns bloons |

### Insta-Monkeys

Free one-time-use pre-upgraded towers. Placed for free during a game.

**Earning:** Beating Round 100 (and every 100 rounds), Daily Challenges, achievements, Collection Events.

**Tier restrictions by map difficulty:**

| Map Difficulty | Insta Tiers |
|---|---|
| Beginner | 0-2 |
| Intermediate | 1-3 |
| Advanced | 2-4 |
| Expert | 3-4 |

Collecting all variants of a tower type adds a gold border (Tier 0-4) or black border (all 64 variants including Tier 5).

---

## 11. Multiplayer

### Co-Op Mode

2-4 players cooperating on a single map. Unlocked at Player Level 20.

**Cash:** Each player has a separate cash pool. Starting cash reduced by $100 (2 players) or $50 per additional player (3+). Players can send cash to each other. Pop income goes to the tower owner.

**Lives:** Shared pool among all players.

**Heroes:** Each player selects independently. Multiple players can choose the same hero. Hero XP is split evenly among all placed heroes.

**Tower restrictions:** Each player gets independent Tier 5 allocation. Players cannot modify other players' towers. Exception: Sun Temple and Paragon sacrifices can consume other players' towers.

**Monkey Knowledge:** If any player has a MK upgrade, it applies to all players. Does not stack.

**Territory:** Players are limited to assigned map quadrants. Some maps have shared "All Players" zones.

### Competitive & Event Modes

| Mode | Description |
|---|---|
| Race Events | Beat rounds as fast as possible. Weekly, leaderboard-ranked. 1st place: 1,000 MM + 100 Trophies. |
| Boss Bloon Events | Bosses at R40/60/80/100/120. Normal and Elite. Ranked by completion time. |
| Odyssey | Multi-game journey through 3-5 maps with carry-over lives. Easy/Medium/Hard. |
| Contested Territory | Team-based competitive mode. Capture tiles via challenges. Casual or Competitive brackets. |
| Boss Rush | Rapid-fire boss encounters. Alternates fortnightly with Contested Territory. |
| Races (Mini) | Groups of up to 100 players in smaller leaderboards with additional rewards. |

### Content Browser / Challenge Editor

Players create and share custom challenges with configurable parameters:
- Map, game mode, starting cash/lives/rounds
- Tower restrictions (per-tower quantities 1-99, infinite, or disallowed)
- Upgrade path caps (0-5 per path)
- Bloon health/speed multipliers
- Individual CHIMPS rule toggles (Continues, Hearts, MK, Powers, Selling)
- Shared via unique challenge codes
- Must be completable without Powers before publishing

---

## 12. UI & HUD

### In-Game HUD

- **Top-left:** Current round number, round progress indicator
- **Top-right:** Cash display, lives counter, fast-forward button, pause/menu button
- **Bottom-right:** Hero ability buttons (when hero is placed), tower ability buttons
- **Bottom center:** Tower category tabs (Primary, Military, Magic, Support, Heroes, Powers) for placement
- **Tower selection panel:** Shows when a tower is selected -- displays targeting priority, sell button, 3 upgrade paths with costs and lock indicators

### In-Game Indicators
- **Range circle:** Shown when placing or selecting a tower
- **MOAB health bars:** Color-coded by bloon type; boss bloons display segmented bars with skull markers at threshold points
- **Track path:** Clearly visible bloon path on each map

### Menu Screens
- **Main menu:** Play, Heroes, Powers, Knowledge, Collection, Trophy Store, Settings
- **Map select:** Grid of maps sorted by difficulty category with medal indicators
- **Mode select:** Sub-mode grid with unlock status
- **Upgrade panel:** In-game 3-path upgrade display with cost, description, and crosspath restrictions

---

## 13. Engine & Presentation Systems

### Save System
- Auto-save after each round completion
- Mid-round progress is NOT saved -- exiting mid-round loses that round's progress
- One active save per map/mode combination
- CHIMPS tracking: exiting the game and re-entering marks the run as "Red CHIMPS" (not Black Border eligible)

### Camera & Game Speed
- Fixed top-down 2D view with zoom and pan (see S2 for input details)
- No camera rotation
- Two speed settings: 1x normal and 3x fast-forward

### Audio System
- Background music changes per map theme
- Speed-up affects music tempo
- Distinct sound effects for: bloon pops (per type), tower placement, upgrade purchase, MOAB-class warnings, ability activation, life loss
- MOAB-class bloons produce a warning sound on spawn
- Trophy Store offers alternate music tracks and pop sound effects

---

## 14. Open Questions / Unverified

- **Exact footprint radii** for all towers are internal game data; the values in the companion doc are approximate categories, not verified pixel-precise measurements.
- **Blastapopoulos HP values** could not be confirmed from community sources; the listed values are estimates based on comparable boss scaling patterns.
- **Freeplay HP scaling formula** past Round 200 may involve additional breakpoints or caps that are not fully documented.
- **Co-op mode latency handling** and exact territory division rules per map are not fully documented.
- **Some hero ability numbers** (exact damage, cooldown, duration at each level) vary by source and game version.
- **Beast Handler and Mermonkey** upgrade paths and Tier 5 names are not yet documented. Both are post-launch additions (v36.0 and v44.0 respectively).
- **Upgrade costs** in the companion tower doc may be slightly off for some towers; costs have been rebalanced across patches. Values reflect approximate Medium difficulty costs.

---

## 15. References

### Primary Sources
- [Bloons Wiki (Fandom)](https://bloons.fandom.com/wiki/Bloons_Wiki) -- primary community wiki
- [Bloons Wiki - Towers](https://bloons.fandom.com/wiki/Towers)
- [Bloons Wiki - Heroes (BTD6)](https://bloons.fandom.com/wiki/Heroes_(BTD6))
- [Bloons Wiki - Rounds (BTD6)](https://bloons.fandom.com/wiki/Rounds_(BTD6))
- [Bloons Wiki - MOAB-Class Bloon](https://bloons.fandom.com/wiki/MOAB-Class_Bloon)
- [Bloons Wiki - Damage Types](https://bloons.fandom.com/wiki/Damage_Types)
- [Bloons Wiki - Monkey Knowledge (BTD6)](https://bloons.fandom.com/wiki/Monkey_Knowledge_(BTD6))
- [Bloons Wiki - Difficulty](https://bloons.fandom.com/wiki/Difficulty)
- [Bloons Wiki - C.H.I.M.P.S.](https://bloons.fandom.com/wiki/C.H.I.M.P.S.)
- [Bloons Wiki - Powers (BTD6)](https://bloons.fandom.com/wiki/Powers_(BTD6))
- [Bloons Wiki - Co-Op Mode (BTD6)](https://bloons.fandom.com/wiki/Co-Op_Mode_(BTD6))
- [Bloons Wiki - Paragons](https://bloons.fandom.com/wiki/Paragons)
- [Bloons Wiki - Boss Bloon](https://bloons.fandom.com/wiki/Boss_Bloon)

### Community Tools
- [BTD6 Rounds Calculator](https://topper64.co.uk/nk/btd6/rounds/)
- [BTD6 Income Calculator](https://topper64.co.uk/nk/btd6/income/)

### Strategy Guides
- [Basically Average - BTD6 Guides](https://basicallyaverage.com/)
- Various Steam Community guides for Monkey Knowledge, tower stats, and boss strategies

### Companion Data Files
- [Tower Data](docs/btd6/towers.md) -- complete base stats, all upgrade paths and costs, Paragon details, placement rules
- [Bloon Data](docs/btd6/bloons.md) -- full bloon stat tables, boss bloon HP/mechanics, damage type matrix, round milestones, speed reference
