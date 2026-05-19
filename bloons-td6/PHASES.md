# Bloons TD 6 -- Phased Implementation Plan

Based on [SPEC.md](SPEC.md). Tower defense genre — vertical slice target: one map, full tower placement and upgrade loop, bloon waves with variety, economy, win/lose flow.

---

## Phase 1 — Core Tower Defense Loop

The minimum playable loop: place a tower on a map, start a round, watch it pop bloons, earn cash, repeat.

- Single Beginner map (single-path, land only, no water, no obstacles)
- Tower placement system: tap/click to select tower, place on valid land, footprint collision check
- One tower type: Dart Monkey ($200, 1 damage, 2 pierce, 0.95s attack speed, 32 range, Sharp damage)
- Tower auto-attacks bloons within range using "First" targeting (target farthest along track)
- Basic bloon hierarchy: Red (1 RBE, 1.0x speed), Blue (2 RBE, 1.4x), Green (3 RBE, 1.8x)
- Bloon layering: popping Blue reveals 1 Red, popping Green reveals 1 Blue
- Bloons follow the track path; if they reach the exit, player loses lives equal to RBE
- Cash system: $650 starting cash, +$1 per bloon layer popped, +$100+R end-of-round bonus
- Lives system: 200 starting lives, game over at 0
- Round system: scripted waves per round, player starts each round manually, 10 rounds for initial testing
- Win condition: survive all rounds; lose condition: lives reach 0
- Victory and defeat screens

### Assets

**2D Art / Sprites**
- Beginner map background (single-path, grass theme)
- Track path overlay
- Dart Monkey sprite (idle, attacking)
- Dart projectile sprite
- Red Bloon sprite
- Blue Bloon sprite
- Green Bloon sprite
- Bloon pop effect (burst)

**Animations**
- Dart Monkey attack animation
- Bloon pop animation
- Bloon movement along path

**Audio**
- Bloon pop SFX (standard pop)
- Dart throw SFX
- Round start chime
- Round complete chime
- Game over SFX
- Victory SFX
- Background music (one track)

**UI**
- HUD: cash display (top-right), lives counter (top-right), round number (top-left)
- Play button (start round)
- Tower selection panel (bottom, single Dart Monkey option)
- Tower placement preview (range circle)
- Victory screen
- Defeat screen

---

## Phase 2 — Upgrade System & Tower Variety

Introduce the 3-path upgrade system, damage types with bloon immunities, and enough tower variety to create meaningful player choices.

- 3-path, 5-tier upgrade system: one path to T5, one to T2, third stays at T0
- Upgrade panel: shows 3 paths with costs, locks, and descriptions when tower is selected
- Cross-pathing restriction enforcement (lock third path at T0 once two paths have upgrades)
- Implement upgrades for Dart Monkey through T3 on all paths (Sharp Shots, Quick Shots, Long Range Darts, etc.)
- 5 additional towers:
  - Boomerang Monkey ($325, returns along arc, 4 pierce)
  - Bomb Shooter ($650, Explosion type, 40 pierce AoE, cannot pop Black)
  - Tack Shooter ($280, fires 8 tacks radially)
  - Ice Monkey ($500, Cold type, freezes bloons in range, cannot pop White)
  - Glue Gunner ($270, Acid type, slows bloons 50%)
- Upgrades through T3 for all new towers
- Damage type system: Sharp (can't pop Lead/Frozen), Explosion (can't pop Black), Cold (can't pop White), Acid (pops all)
- Additional bloons: Yellow (4 RBE, 3.2x), Pink (5 RBE, 3.5x), Black (11 RBE, immune to Explosion), White (11 RBE, immune to Cold), Lead (23 RBE, immune to Sharp/Cold), Purple (11 RBE, immune to Energy/Fire/Plasma)
- Zebra bloon (23 RBE, 1 Black + 1 White child, immune to Explosion + Cold)
- Targeting priority cycling: First, Last, Close, Strong
- Sell mechanic: 70% refund of total tower investment
- Tower range circle shown on selection
- Round set expanded to 1–40 (Easy Standard round range)

### Assets

**2D Art / Sprites**
- Boomerang Monkey sprite + boomerang projectile
- Bomb Shooter sprite + bomb projectile + explosion effect
- Tack Shooter sprite + tack projectile
- Ice Monkey sprite + freeze effect (radius visual)
- Glue Gunner sprite + glue glob projectile + glued-bloon overlay
- Yellow, Pink, Black, White, Lead, Purple, Zebra Bloon sprites
- Upgrade icons for all T1–T3 upgrades across 6 towers (54 icons)
- Frozen bloon overlay (ice crystal effect)
- Glued bloon overlay (green drip)

**Animations**
- Attack animations for all 5 new towers
- Bomb explosion animation
- Ice freeze pulse animation
- Boomerang arc + return flight

**Audio**
- Bomb explosion SFX
- Ice freeze SFX
- Glue splat SFX
- Boomerang throw + catch SFX
- Tack spray SFX
- Tower sell SFX
- Tower upgrade SFX
- Lead bloon "clank" (when hit by ineffective type)
- Targeting priority toggle click

**UI**
- Upgrade panel (3-path display with cost, lock indicators, crosspath restrictions)
- Sell button on tower selection panel
- Targeting priority button (cycles First/Last/Close/Strong)
- Tower category tabs at bottom (Primary category only for now)

---

## Phase 3 — MOAB-Class Bloons & Advanced Defenses

Introduce MOAB-class bloons as a major threat escalation, bloon modifier properties, Military and Magic tower categories, and water placement.

- Rainbow bloon (47 RBE, 2 Zebra children)
- Ceramic bloon (104 RBE, 10 HP shell, 2 Rainbow children — first multi-hit bloon)
- MOAB (200 HP, 616 RBE, 4 Ceramic children, 1.0x speed)
- BFB (700 HP, 3,164 RBE, 4 MOAB children, 0.25x speed)
- MOAB-class bloons: immune to most glue and freezing; display health bars above them
- Bloon properties:
  - Camo: green camo pattern, invisible to towers without camo detection (first appears Round 24)
  - Regrow: heart marking, regenerates 1 layer every 3 seconds (first appears Round 17)
  - Fortified: metal bands, doubles HP for Ceramic/MOAB-class, quadruples for Lead (first appears Round 45)
  - Properties stack (e.g., Fortified Camo Regrow Ceramic)
- Military towers:
  - Sniper Monkey ($350, infinite range, single target, 2 damage)
  - Monkey Sub ($325, water placement only, 2 pierce)
  - Monkey Buccaneer ($500, water placement only, dual cannons)
- Magic towers:
  - Wizard Monkey ($550, Energy type magic bolts)
  - Ninja Monkey ($500, innate Camo detection)
- Energy damage type (can't pop Lead or Purple)
- Water placement: Sub and Buccaneer on water tiles only
- Upgrades through T3 for all new towers (including Ninja's Counter-Espionage for decamo, Sub's Advanced Intel for global range)
- Difficulty tiers: Easy (200 lives, 85% tower cost), Medium (150 lives, 100%), Hard (100 lives, 108%)
- Round range expanded to 1–80 (Hard Standard)
- Fast-forward toggle (1x / 3x game speed)
- Camera zoom and pan controls

### Assets

**2D Art / Sprites**
- Rainbow Bloon, Ceramic Bloon sprites
- MOAB blimp sprite, BFB blimp sprite
- Camo bloon overlay (green pattern), Regrow bloon overlay (heart), Fortified bloon overlay (metal bands)
- Sniper Monkey sprite + bullet trail
- Monkey Sub sprite (surfaced)
- Monkey Buccaneer sprite + cannonball projectile
- Wizard Monkey sprite + magic bolt projectile
- Ninja Monkey sprite + shuriken projectile
- Water tile art for maps

**Animations**
- MOAB entrance animation + destruction (splits into children)
- BFB entrance + destruction
- Ceramic cracking animation (shell damage states)
- Regrow bloon layer regeneration visual
- Sniper rifle shot animation
- Wizard magic cast animation
- Ninja throw animation

**Audio**
- MOAB spawn warning sound
- MOAB layer pop SFX (heavy thud, distinct from standard pop)
- BFB spawn warning sound (deeper)
- Ceramic crack SFX
- Sniper rifle shot SFX
- Shuriken throw SFX
- Magic bolt SFX
- Cannon fire SFX (Buccaneer/Sub)
- Fast-forward toggle click
- Regrow bloon regeneration SFX (subtle)

**UI**
- MOAB health bar (color-coded: blue for MOAB, red for BFB)
- Military and Magic category tabs (tower placement panel)
- Difficulty selection screen (Easy / Medium / Hard)
- Fast-forward button (top-right)
- Camo detection range indicator (for Ninja and upgraded towers)

---

## Phase 4 — Heroes & Economy

Introduce the hero system, Support tower category with income generation, and the Alchemist's tower-buffing mechanic. Expand to multiple maps with a map selection screen.

- Hero system: one hero per game, placed on map, auto-levels 1–20 via per-round XP
- Hero XP formula: Round 1 = 40 XP, +20/round to R20, +40/round to R50, +90/round from R51+
- Two activated abilities per hero (first at Lv3, second at Lv10)
- 4 starter heroes:
  - Quincy ($540, archer, Rapid Shot / Storm of Arrows)
  - Gwendolin ($725, fire DPS, Cocktail of Fire / Firestorm + Heat It Up buff)
  - Striker Jones ($700, buffs Bomb/Mortar, Concussive Shell / Artillery Command)
  - Obyn Greenfoot ($650, buffs Druids, Brambles / Wall of Trees)
- Support tower category:
  - Banana Farm ($1,250, income generation: 4 bunches x $20/round base, upgrades through T3)
  - Monkey Village ($1,200, buff aura, no attack: Grow Blocker, Radar Scanner for camo detection, upgrades through T3)
  - Spike Factory ($1,000, places spike piles on track, Close/Far/Smart targeting)
- Alchemist ($550, Acid type splash):
  - Path 1 through T3: Larger Potions → Acidic Mixture Dip → Berserker Brew
  - Berserker Brew: buff potion grants nearby tower +1 damage, +1 pierce, +10% range, +15% attack speed (limited charges, re-applied)
- Fire damage type (can't pop Purple, can pop Lead) — for Gwendolin and Wizard upgrades
- Banana collection mechanic: bananas spawn on map, must be tapped/clicked to collect (or auto-collected by EZ Collect / Banana Farmer)
- Map selection screen with 4 Beginner maps
- Hero selection screen (pre-game)
- Pause menu with resume, restart, quit options

### Assets

**2D Art / Sprites**
- Quincy sprite (idle, attacking, abilities)
- Gwendolin sprite (idle, attacking, abilities) + fire wall effect
- Striker Jones sprite (idle, attacking, abilities) + concussive shell effect
- Obyn Greenfoot sprite (idle, attacking, abilities) + brambles + wall of trees
- Banana Farm sprite + banana bunch collectible
- Monkey Village sprite + range aura visual
- Spike Factory sprite + spike pile on track
- Alchemist sprite + potion projectile + brew buff potion
- Berserker Brew buff visual (glow on buffed tower)
- 3 additional Beginner map backgrounds

**Animations**
- Hero ability activation animations (8 abilities across 4 heroes)
- Hero level-up flash
- Banana bunch spawn + collection animation
- Alchemist potion throw + buff application
- Spike pile placement animation

**Audio**
- Hero placement voice lines (4 heroes x placement)
- Hero ability activation SFX (8 abilities)
- Hero level-up chime
- Banana collection SFX
- Spike pile placement SFX
- Village buff activation SFX
- Alchemist brew throw SFX
- Pause menu open/close SFX
- Map selection music (menu theme)

**UI**
- Hero selection screen (pre-game, shows hero portrait + abilities + cost)
- Hero ability buttons (bottom-right, with cooldown indicators)
- Hero level indicator (on hero sprite)
- Support category tab (tower placement panel)
- Map selection grid (4 maps with difficulty indicator)
- Pause menu (resume, restart, quit)
- Banana Farm income indicator

---

**Vertical slice checkpoint — Full tower defense loop playable: 4 tower categories (Primary, Military, Magic, Support) with upgrades through T3, one hero with abilities, MOAB-class bloons with Camo/Regrow/Fortified properties, economy with farms and cash management, across 4 maps with 3 difficulty tiers.**

---

## Phase 5 — Complete Tower Roster & Tier 5 Upgrades

Build out all remaining towers, complete all upgrade paths through Tier 5, and introduce end-game bloons.

- Remaining Military towers:
  - Monkey Ace ($800, flies in patterns, 8 darts per pass)
  - Heli Pilot ($1,600, follows cursor or Pursuit mode, 2 dart streams)
  - Mortar Monkey ($750, Explosion type, targets fixed map position, infinite range)
  - Dartling Gunner ($850, aims at cursor, 0.2s attack speed)
- Remaining Magic towers:
  - Super Monkey ($2,500, Energy type, 0.06s attack speed — extremely fast)
  - Druid ($425, 5 thorns per attack)
- Remaining Support tower:
  - Engineer Monkey ($400, shoots nails, deploys sentries)
- All towers: complete upgrade paths T1–T5 (see [towers.md](docs/btd6/towers.md) for full paths)
- Tier 5 restriction: only one T5 per upgrade path per player per game
- Remaining damage types: Plasma (can't pop Purple, can pop Lead), Shatter (can't pop Lead, can pop Frozen), Glacier (can't pop White/Lead, can pop Frozen)
- Sun Temple sacrifice system:
  - T4 Sun Temple consumes towers in range; tallied across Primary/Military/Magic/Support; cheapest category discarded; $50,000 threshold per category
  - T5 True Sun God: second sacrifice round, all 4 categories count
  - Vengeful True Sun God: requires "There Can Be Only One" MK (deferred to Phase 7), The Anti-Bloon + Legend of the Night on map outside sacrifice range
- Monkey Intelligence Bureau (Village 0-3-0): grants towers in range ability to pop any bloon type
- End-game bloons:
  - ZOMG (4,000 HP, 16,656 RBE, 4 BFB children, 0.18x speed)
  - DDT (400 HP, 816 RBE, Lead + Black + Camo, 2.75x speed)
  - BAD (20,000 HP, 55,760 RBE, 2 ZOMG + 3 DDT children, immune to ALL CC/instakills)
- Super Ceramics (Round 81+): 60 HP, 1 child per layer instead of 2
- Freeplay HP scaling: +2%/round R81–100, +5%/round R101+
- Freeplay speed scaling: +2%/round from R81
- Ace flight patterns: Circle, Figure Eight, Wingmonkey, Centered Path
- Heli targeting modes: Follow Touch, Lock in Place, Pursuit
- Mortar and Dartling aiming: fixed-position targeting, cursor-aim targeting

### Assets

**2D Art / Sprites**
- Monkey Ace sprite + dart volley projectiles + flight path indicator
- Heli Pilot sprite + rotors + dart streams
- Mortar Monkey sprite + mortar shell + blast radius indicator
- Dartling Gunner sprite + dart stream / laser / rocket variants
- Super Monkey sprite + laser/plasma beam visuals
- Druid sprite + thorn projectiles + lightning bolt + tornado
- Engineer Monkey sprite + nail gun + sentry turret sprites (4 types)
- ZOMG blimp sprite
- DDT blimp sprite (dark/sleek, with camo pattern)
- BAD blimp sprite
- Super Ceramic sprite (cracked, metallic shell)
- Sun Temple transformation visual (golden radiance)
- True Sun God sprite (ascended form)
- Vengeful True Sun God sprite (dark form)
- T4/T5 upgrade visuals for all towers (appearance changes at high tiers)

**Animations**
- Ace flyover animation
- Heli rotor spin + pursuit movement
- Mortar shell arc + impact
- Dartling barrel spin + firing
- Super Monkey rapid-fire beam
- Druid tornado summon
- Engineer sentry deployment
- ZOMG/DDT/BAD entrance animations + destruction sequences
- Sun Temple sacrifice animation (towers consumed in golden light)

**Audio**
- Monkey Ace flyby SFX
- Heli rotor SFX (looping)
- Mortar launch + impact SFX
- Dartling rapid-fire SFX
- Super Monkey beam SFX (continuous hum)
- Druid lightning strike SFX
- Druid tornado SFX
- Engineer nail gun SFX + sentry deployment SFX
- ZOMG spawn warning (deep rumble)
- DDT spawn warning (high-pitched screech)
- BAD spawn warning (ominous horn)
- Sun Temple sacrifice SFX (ascending choral tone)

**UI**
- ZOMG health bar (green), DDT health bar (dark), BAD health bar (purple)
- Mortar target reticle (draggable)
- Dartling aim indicator
- Ace flight pattern selector
- Heli targeting mode selector
- T5 upgrade lock indicator (when one T5 of that path already exists)

---

## Phase 6 — Game Modes & Map Expansion

Implement all sub-modes, the C.H.I.M.P.S. challenge, and expand the map library.

- Easy sub-modes: Standard (R1–40), Primary Only, Deflation ($20,000 start, no income, R31–60)
- Medium sub-modes: Standard (R1–60), Military Only, Reverse (opposite track direction), Apopalypse (continuous spawning, no round breaks, no end-of-round bonus)
- Hard sub-modes: Standard (R3–80), Magic Only, Alternate Bloons Rounds (Camo R5, Lead R10), Double HP MOABs, Half Cash (all income halved, $325 start)
- Impoppable: 1 life, no extra lives, 120% tower costs, R6–100
- C.H.I.M.P.S.: Continues disabled, Hearts Lost (1 life), Income disabled, Monkey Knowledge disabled, Powers disabled, Selling disabled. R6–100, 108% costs
- Freeplay mode: enters automatically after final round; randomized bloon compositions after R140 (RBE budget: Round x 4,000 - 217,000)
- Sandbox mode: unlimited cash and lives, all towers/bloons available, no win/lose
- Difficulty cost modifiers applied: Easy 85%, Medium 100%, Hard 108%, Impoppable 120%
- Cash-per-pop tax brackets: 100% R1–50, 50% R51–60, 20% R61–85, 10% R86–100, 8% R101–120, 5% R121–140, 2% R141+
- Category-only modes: Heroes always allowed alongside the restricted category
- Map expansion: ~20 maps total covering Beginner and Intermediate categories
- Map features: removable objects (cash cost to clear), Line of Sight blockers, interactive gizmos
- Map unlock progression: Intermediate maps unlock at 5 unique map wins

### Assets

**2D Art / Sprites**
- ~16 additional map backgrounds (completing Beginner set + Intermediate set)
- Removable obstacle sprites (trees, rocks, crates — per map)
- LOS blocker art (per map)
- Reverse track direction indicators
- Deflation mode cash icon (locked/grey income indicators)

**Audio**
- Apopalypse mode continuous bloon spawn ambience
- CHIMPS mode start fanfare (ominous)
- Sandbox mode ambient track (relaxed)

**UI**
- Mode select grid per difficulty tier (shows unlock status, medal slots)
- CHIMPS rule indicator icons (6 icons for each disabled feature)
- Deflation cash display (no income, fixed counter)
- Apopalypse round counter (auto-advancing)
- Sandbox controls panel (spawn bloons, toggle cash, set round)
- Freeplay "Continue?" prompt after final round
- Map unlock notification

---

## Phase 7 — Meta-Progression

Implement all persistent progression systems that carry between games: Monkey Knowledge, player leveling, Monkey Money, medals, powers, and Insta-Monkeys.

- Player Level / XP system: earn XP from game completions, level up account
- Tower unlocks gated behind player level (early towers unlock progressively)
- Monkey Knowledge system:
  - 6 trees: Primary, Military, Magic, Support, Heroes, Powers
  - Points earned from level-ups (starting at Level 30) + achievements
  - 134 points needed, 138 earnable
  - Key upgrades: Bonus Monkey! (free first Dart), More Cash (+$200 start), Military Conscription (-33% first Military), Mana Shield (absorbs 25 lives), Better Sell Deals (75% sell-back), Empowered Heroes (start at Lv3), Big Bloon Sabotage (MOAB-class -10% HP)
  - MK disabled in CHIMPS mode
  - "There Can Be Only One" MK: enables Vengeful True Sun God (Sun Temple sacrifice from Phase 5 now fully activatable)
- Monkey Money:
  - Earned from first-time map completions (Beginner Easy $75 through Expert Impoppable $1,200)
  - Replay yields 20% of original
  - Mo' Monkey Money MK: +10%
  - Spent on: heroes (2,500–7,000 MM), hero skins, powers, continues, race retries
- Medal system: 14 medals per map (Easy bronze, Medium silver, Hard gold, plus Impoppable and CHIMPS)
- Map borders:
  - Gold Border: all medals including Red CHIMPS (beaten with exits/retries)
  - Black Border: all medals including Black CHIMPS (beaten without exiting)
- Achievement system: gameplay milestones rewarding MM, Insta-Monkeys, Knowledge Points, Trophies
- Powers (consumable items, banned in CHIMPS):
  - Super Monkey Storm (100 MM, 4,000 dmg to all), Monkey Boost (100 MM, 2x speed 15s), Thrive (70 MM, +25% pop cash), Time Stop (50 MM, 10% speed 10s), Cash Drop (200 MM, $2,500), Banana Farmer (50 MM, auto-collect), Pontoon (50 MM, land-on-water platform), Portable Lake (50 MM, water-on-land), Road Spikes, Glue Trap, MOAB Mine, Camo Trap, Tech Bot, Energizing Totem, Cave Monkey
- Insta-Monkeys: free pre-upgraded towers, earned from beating R100 and every 100 rounds, Daily Challenges, achievements
  - Tier restrictions by map difficulty: Beginner 0–2, Intermediate 1–3, Advanced 2–4, Expert 3–4
  - Collection borders: gold (all T0–T4 of a tower), black (all 64 variants)
- Sell-back modifier stacking: base 70%, Better Sell Deals 75%, Favored Trades +4% per (up to 3 stacks), hard cap 95%

### Assets

**2D Art / Sprites**
- Monkey Knowledge tree UI (6 tree backgrounds, ~134 node icons)
- MK node connection lines and unlock state visuals
- Medal icons (bronze, silver, gold, Impoppable, Red CHIMPS, Black CHIMPS)
- Map border overlays (gold frame, black frame)
- Power icons (15 powers)
- Insta-Monkey card frames (by tier)
- Achievement badge icons
- Monkey Money currency icon
- Trophy currency icon

**Audio**
- MK point allocation SFX
- Medal earned fanfare
- Achievement unlocked SFX
- Power activation SFX (per power type — storm, boost, time stop, cash drop, etc.)
- Insta-Monkey placement SFX (magical/free summon)
- Level-up fanfare

**UI**
- Monkey Knowledge screen (6 tabs, branching tree layout, point counter)
- Player profile / level display
- Monkey Money balance display (persistent across menus)
- Powers drawer (in-game, drag to activate)
- Insta-Monkey inventory screen
- Achievement list screen
- Medal display on map select (14 slots per map)
- Map border rendering (gold/black frame on map icon)
- Collection screen (Insta-Monkey collection tracker per tower)

---

## Phase 8 — Full Hero Roster & Paragons

Complete the hero roster to all 17 heroes, implement Geraldo's unique shop, and add the Paragon tower system.

- 13 additional heroes:
  - Captain Churchill ($2,000, 1.71x XP ratio, tank DPS, Armor Piercing Shells / MOAB Barrage)
  - Benjamin ($1,200, 1.5x, income generation — no attack, Biohack / Syphon Funding, passive $80–$5,000/round + Bank Hack)
  - Ezili ($600, 1.425x, anti-MOAB, Heartstopper / Sacrificial Totem / MOAB Hex)
  - Pat Fusty ($800, 1.425x, melee, amphibious — land or water, Rallying Roar / Big Squeeze)
  - Adora ($1,000, 1.71x, DPS, Long Arm of Light / Blood Sacrifice / Ball of Light)
  - Admiral Brickell ($900, 1.425x, water-only, Naval Tactics / Blast Chain / Mega Mine)
  - Etienne ($850, 1.0x, drones, Drone Swarm / UCAV; Lv8: global camo detection to all towers)
  - Sauda ($600, 1.425x, melee DPS, Leaping Sword / Sword Charge)
  - Psi ($1,000, 1.5x, infinite range psychic, Psychic Blast / Psionic Scream)
  - Geraldo ($750, 1.0x, shopkeeper — see below)
  - Corvus ($1,025, 1.425x, spirit walker, Soul Spirit / Spirit Walk / Dark Ritual)
  - Rosalia ($875, 1.425x, jetpack tinkerer, Scatter Missile / Flight Boost / Kinetic Charge)
  - Silas ($850, 1.5x, ice shaper, Frostbite / Frozen Cascade / Frozen Burial)
- Geraldo's Shop system: 16 deployable items purchasable with in-game cash (Shooty Turret $250, Stack of Old Nails $50, Creepy Idol $120, Jar of Pickles $150, Quincy Action Figure $750, See Invisibility Potion $200, Amaz-o-Glue $150, Sharpening Stone $200, Hero's Cape $1,750, Blade Trap $650, Fire Hot Sauce $650, Fertilizer $300, Pet Rabbit $1,750, Rejuv Potion $2,000, Genie Bottle $2,500, Paragon Power Totem $26,000); items upgrade as Geraldo levels
- Hero skins: alternate appearance, attack visuals, and voice lines (2,500 MM each)
- Paragon system:
  - Requires all 3 T5 upgrades of same tower on map; upgrade one into Paragon, all towers of that type consumed
  - Degree system (1–100): calculated from pops (180 pops = 1 power, max 90K), money spent ($25 = 1 power, max 10K), upgrade tiers (1 non-T5 tier = 100 power, max 10K), extra T5s (10K power each, max 90K). Total max: 200,000 power
  - Solo max degree: 76 (79 for Dart with Master Double Cross MK)
  - Paragon restrictions: no buffs from other towers, can't be moved by Chinook, not sacrificed by Sun Temples
- 8 Paragons:
  - Apex Plasma Master (Dart, $350K)
  - Glaive Dominus (Boomerang, $350K)
  - Ascended Shadow (Ninja, $600K)
  - Navarch of the Seas (Buccaneer, $550K)
  - Master Builder (Engineer, $575K)
  - Goliath Doomship (Ace, $500K)
  - Magus Perfectus (Wizard, $500K)
  - Nautic Siege Core (Sub, $500K)

### Assets

**2D Art / Sprites**
- 13 hero sprites (idle, attacking, abilities — ~3 ability visuals each)
- Hero portrait art for selection screen (13 portraits)
- Hero skin variants (1 alternate skin per hero = 13 skin sprite sets)
- Geraldo shop item sprites (16 deployable items)
- 8 Paragon tower sprites (unique combined visual per Paragon)
- Paragon transformation effect (golden/prismatic aura)
- Paragon degree meter visual

**Animations**
- Hero ability animations (13 heroes x 2–3 abilities = ~30 animations)
- Geraldo shop item deploy animations (16 items)
- Paragon transformation sequence (tower consumption + merge)
- Paragon attack animations (8 unique attack patterns)

**Audio**
- Hero voice lines: placement, ability activation, level-up, defeat (13 heroes x ~6 lines = ~78 voice lines)
- Hero skin alternate voice lines (13 heroes)
- Geraldo shop open/close SFX + item purchase SFX
- Individual Geraldo item deploy SFX (16 items)
- Paragon transformation SFX (dramatic ascending tone)
- Paragon attack SFX (8 unique)

**UI**
- Hero selection screen expanded (17 heroes with portraits, stats, skin selector)
- Geraldo shop panel (in-game, 16 item slots with stock/cost/description)
- Paragon upgrade button (appears when 3 T5s exist)
- Paragon degree display (meter or number on selected Paragon)
- Hero skin selector on hero selection screen

---

## Phase 9 — Multiplayer & Competitive Events

Implement co-op multiplayer, boss bloon encounters, and all competitive/event game modes.

- Co-op mode (2–4 players, unlocked at Player Level 20):
  - Each player has separate cash pool (starting cash -$100 for 2p, -$50 per additional player)
  - Shared lives pool
  - Each player selects hero independently (same hero allowed)
  - Hero XP split evenly among all placed heroes
  - Independent T5 allocation per player
  - Players can't modify other players' towers (exception: Sun Temple/Paragon sacrifices)
  - Players limited to assigned map quadrants, some maps have shared zones
  - MK: if any player has it, applies to all (no stacking)
  - Cash send/request system + emote communication
- Boss Bloon Events (bosses appear at R40/60/80/100/120, 5 tiers, Normal + Elite):
  - Bloonarius (spawns bloon waves at skulls; Normal T5: 3M HP, Elite T5: 40M HP)
  - Lych (steals buffs to heal, spawns Lych-Soul mini-boss, revives popped MOABs; Elite T5: 24M HP)
  - Vortex (fastest boss, speeds nearby bloons 2.5x, destroys projectiles in 60-unit radius; Elite T5: 33.5M HP)
  - Dreadbloon (ceramic armor shell, flat damage reduction, rotates tower category immunity; Elite T5: 37.5M HP)
  - Phayze (innate Camo, disables camo detection 12s, portals shift spawn point; Elite T5: 38.75M HP)
  - Blastapopoulos (Purple immunity, purges DoT every 2s, Heat mechanic stuns towers; Elite T5: ~40M HP est.)
  - Boss health bars with skull threshold markers
- Race Events: beat rounds as fast as possible, weekly leaderboard, 1st place: 1,000 MM + 100 Trophies
- Odyssey mode: multi-game journey through 3–5 maps with carry-over lives, Easy/Medium/Hard
- Contested Territory: team-based competitive, capture tiles via challenges, Casual/Competitive brackets
- Boss Rush: rapid-fire boss encounters, alternates fortnightly with CT
- Mini-Races: groups of up to 100 players, smaller leaderboards

### Assets

**2D Art / Sprites**
- 6 Boss Bloon sprites (Bloonarius, Lych, Vortex, Dreadbloon, Phayze, Blastapopoulos)
- Lych-Soul mini-boss sprite
- Dreadbloon armor shell + rock obstacle sprites
- Phayze portal sprite + reality shield visual
- Vortex storm pulse visual
- Blastapopoulos fireball + heat meter visual
- Co-op player color indicators (P1–P4 territory overlays)
- Race event leaderboard badge icons (Diamond, Gold, Silver, Bronze)
- Odyssey island/map chain visual
- Contested Territory tile grid map

**Animations**
- Boss entrance animations (6 bosses)
- Boss skull threshold ability animations (per boss)
- Lych ethereal transformation + Lych-Soul spawn
- Vortex projectile-destroying storm pulse
- Dreadbloon armor regrow
- Phayze portal spawn + dash
- Co-op cash send animation

**Audio**
- Boss spawn warnings (6 unique boss themes/stingers)
- Boss skull threshold ability SFX (per boss)
- Boss defeat fanfares (6)
- Co-op cash send/receive SFX
- Co-op emote SFX
- Race countdown timer SFX
- Odyssey map transition SFX
- Leaderboard result fanfare

**UI**
- Co-op lobby screen (host/join, map/mode selection)
- Co-op in-game: cash send/request panel, emote wheel, player territory indicators
- Boss health bar (segmented with skull markers)
- Boss event results screen (time, tier completion)
- Race timer display (in-game, top-center)
- Race leaderboard screen
- Odyssey mode: island select, rules display, lives carry-over indicator
- Contested Territory: tile map, capture challenge screen, team leaderboard
- Event calendar / news board

---

## Phase 10 — Content Completion & Polish

Complete the full map roster, add all remaining content systems, and polish audio/UI across every feature.

- Full map roster (~77 maps):
  - Complete Beginner set (~23–25 maps)
  - Complete Intermediate set (~23–24 maps)
  - Advanced maps (~17–22 maps, unlock at 12 unique wins): short paths, multi-path, LOS blockers
  - Expert maps (~13–14 maps, unlock at 20 unique wins): very short paths, multiple entry/exits, minimal space
- Challenge Editor:
  - Configurable: map, mode, starting cash/lives/rounds, tower restrictions (per-tower 1–99/infinite/disabled), upgrade path caps (0–5), bloon health/speed multipliers, CHIMPS rule toggles
  - Must be completable without Powers before publishing
  - Shared via unique challenge codes
- Content Browser: browse, like, favorite community challenges
- Daily Challenges and Advanced Challenges (curated by Ninja Kiwi, MM + Insta rewards)
- Collection Events: seasonal limited-time events (Halloween, Easter, Anniversary), collectible card reward system, exclusive cosmetics
- Trophy Store: cosmetic shop using Trophies
  - Hero pets, Bloon/MOAB skins, pop effects, music tracks, projectile skins, Monkey Names (rename + per-tower stats)
  - Purely cosmetic, no gameplay impact
- Beast Handler tower (Support, $500, v36.0): unique upgrade system — each path summons a different beast, beasts merge into hybrid creatures
- Mermonkey tower (Magic, $500, v44.0): amphibious placement (land or water)
- Save system polish:
  - Auto-save after each round
  - Mid-round exit loses that round's progress
  - One save per map/mode combination
  - CHIMPS tracking: exiting marks run as Red CHIMPS (not Black Border eligible)
- Full audio pass:
  - Per-bloon-type pop SFX variations
  - Map-specific background music tracks
  - Speed-up affects music tempo
  - Trophy Store alternate music tracks and pop effects integrated
- UI polish:
  - Upgrade panel animations (path highlight, lock shimmer)
  - Main menu: Play, Heroes, Powers, Knowledge, Collection, Trophy Store, Settings
  - Settings screen: audio sliders, graphics options, control remapping

### Assets

**2D Art / Sprites**
- ~55 additional map backgrounds (completing Advanced + Expert sets, plus remaining Beginner/Intermediate)
- Map-specific removable objects, LOS blockers, and gizmo art
- Beast Handler sprite + 3 beast type sprites + merged beast variants
- Mermonkey sprite (land + water variants)
- Trophy Store cosmetic items: hero pet sprites (~17), bloon skin variants (~10), MOAB skin variants (~5), projectile skin variants (~10)
- Collection Event card art (seasonal themes)
- Daily Challenge banner art
- Challenge Editor UI icons (restriction toggles, parameter sliders)

**Animations**
- Beast Handler beast summon + merge animations
- Mermonkey attack animation (land + water variants)
- Trophy Store pop effect animations (~5 alternate pop effects)
- Collection Event card reveal animation

**Audio**
- ~55 additional map background music tracks (or shared tracks across thematic groups)
- Beast Handler beast roar/growl SFX
- Mermonkey attack SFX
- Trophy Store alternate pop SFX sets (~5 sets)
- Collection Event fanfare
- Challenge Editor publish confirmation SFX
- Settings menu navigation SFX

**UI**
- Challenge Editor screen (parameter controls, tower restriction grid, test/publish buttons)
- Content Browser screen (search, filter, like/favorite, challenge code entry)
- Daily Challenge notification + results screen
- Trophy Store storefront (categorized tabs, trophy balance, item preview)
- Collection Event progress screen (card grid, reward tiers)
- Beast Handler upgrade panel (unique merge UI, distinct from standard 3-path)
- Settings screen (audio/graphics/controls tabs)
- Main menu final layout (all navigation buttons)
