# Angry Birds — Gameplay Systems Spec

Angry Birds, iOS (Maemo), December 11, 2009. Developed by Rovio Entertainment. Physics-based puzzle game. This spec covers the original Angry Birds (sometimes called "Angry Birds Classic") across all platforms and content updates through its final version.

---

## 1. Core Gameplay Systems

### 1.1 Primary Gameplay Loop

The player launches birds from a slingshot at structures sheltering green pigs. The goal is to eliminate all pigs on the playing field using a limited supply of birds. Each level is a self-contained physics puzzle with a predetermined set of birds (fixed types and order) and a pre-built structure of blocks and pigs.

1. **Aim** — Pull back the slingshot to set launch angle and power. Pull distance controls velocity; pull direction (inverted) controls angle.
2. **Launch** — Release to fire the bird along a parabolic arc.
3. **Activate** — Tap the screen mid-flight to trigger the bird's special ability (if it has one).
4. **Observe** — Watch physics resolve: collisions, chain reactions, structural collapse.
5. **Repeat** — The next bird in the queue hops into the slingshot. Continue until all pigs are eliminated or all birds are spent.

### 1.2 Win / Lose Conditions

- **Win**: All pigs on the level are destroyed. Pigs crushed by debris, hit directly by birds, caught in explosions, or pushed off-screen all count as eliminated.
- **Lose**: All available birds are exhausted with one or more pigs still alive. The player must retry the level from scratch.

### 1.3 Physics System

The game uses Box2D, a 2D rigid-body physics engine. All objects (birds, blocks, pigs, debris) are simulated as rigid bodies composed of convex polygons and circles, governed by gravity, friction, and restitution.

- **Projectile motion**: Birds follow parabolic arcs. Horizontal velocity is constant after launch; vertical velocity is affected by gravity. No air resistance.
- **Collision and damage**: When objects collide, Box2D calculates the contact impulse. If the impulse exceeds a block's material-dependent strength threshold, the block breaks (§3.1). Otherwise it takes partial damage.
- **Structural joints**: Blocks within structures are connected by joints. When stress exceeds joint thresholds, connections break, causing structural failure and collapse.
- **Chain reactions**: Falling debris, rolling objects, and explosions propagate damage, creating cascading destruction.
- **Bird corpses**: After impact, birds enter a "corpse" state — visually damaged (dazed eyes, ruffled feathers) but still active as physics objects. They can push blocks and pigs while tumbling. After several seconds of being still, corpses disintegrate. Birds that fly off-screen disintegrate immediately.

### 1.4 Scoring System

Points are awarded from three categories:

| Category | Details |
|----------|---------|
| Pig destruction | ~5,000–6,000 per pig depending on type (§6.1) |
| Block destruction | Varies by material and size (see below) |
| Unused bird bonus | 10,000 per bird remaining when the level is won |

**Block point values** scale with material and size:

| Material | Small (1×1) | Large (1×10) |
|----------|-------------|--------------|
| Glass | ~500 | ~1,200 |
| Wood | ~700 | ~1,500 |
| Stone | ~800 | ~1,900 |

Each successive hit to a damaged (but unbroken) block deducts ~10 points from that block's remaining value. Destroying a block in a single hit yields maximum points.

### 1.5 Star Rating

Each level has score thresholds for 1, 2, and 3 stars:

| Stars | Criteria |
|-------|----------|
| ★ | Complete the level (all pigs eliminated) |
| ★★ | Complete with a good score |
| ★★★ | Complete with a high score (level-specific threshold) |

Three-star thresholds are unique per level and are not displayed to the player. Achieving 3 stars generally requires both maximizing destruction and conserving birds (each unused bird = 10,000 bonus points).

### 1.6 Power-Ups

Power-ups were added in a later update and are optional consumable items. They are purchased or earned and can be activated once per level attempt.

| Power-Up | Effect |
|----------|--------|
| Super Seeds | Enlarges the next bird, greatly increasing its mass and damage |
| King Sling | Upgrades the slingshot, launching birds farther and faster |
| Sling Scope | Attaches a targeting scope showing a trajectory guide line |
| Birdquake | Shakes the entire level, destabilizing structures and popping weakened pigs |

---

## 2. Controls & Input

### 2.1 Touchscreen (iOS / Android)

| Action | Input |
|--------|-------|
| Aim slingshot | Touch bird, drag backward to set angle and power |
| Launch bird | Release touch |
| Activate ability | Tap screen while bird is in flight |
| Pan camera | Swipe/drag on empty area |
| Zoom in/out | Pinch gesture |
| Pause | Tap pause button (top-left) |

The slingshot is pulled in the opposite direction of the intended launch — dragging down-left launches the bird up-right. The elastic band stretches visually to indicate power. There is a maximum pull distance that caps launch velocity.

### 2.2 PC / Mac (Mouse + Keyboard)

| Action | Input |
|--------|-------|
| Aim slingshot | Click and drag bird backward |
| Launch bird | Release mouse button |
| Activate ability | Click (or Space) while bird is in flight |
| Pan camera | Click and drag on empty area / Arrow keys |
| Zoom in/out | Scroll wheel / Trackpad pinch |
| Pause | Esc or P |

### 2.3 Console / PSP

| Action | Input |
|--------|-------|
| Aim slingshot | Analog stick |
| Launch bird | Confirm button (X / A) |
| Activate ability | Confirm button while bird is in flight |
| Zoom in | Right trigger |
| Zoom out | Left trigger |
| Pan camera | Analog stick (when not aiming) |

---

## 3. World Structure

### 3.1 Materials

All structures are built from three material types, each available in multiple block shapes (§3.2).

| Material | Appearance | Relative Strength | Weak To | Strong Against |
|----------|-----------|-------------------|---------|----------------|
| Glass | Translucent, blue-tinted | Weakest | The Blues, any direct hit | — |
| Wood | Brown, visible grain | Medium | Chuck (speed boost) | The Blues |
| Stone | Gray, solid | Strongest | Bomb (explosion) | Chuck, The Blues |

Broken blocks shatter into debris fragments that become active physics objects and can damage other blocks and pigs.

### 3.2 Block Shapes

Blocks come in 8 base rectangular/square shapes. Five of the rectangular shapes can be placed in either horizontal or vertical orientation, yielding 13 rectangular variants total. Each exists in all three materials. Triangles and circles also exist but are less common.

| Internal Name | Approximate Size | Description |
|---------------|-----------------|-------------|
| SquareTiny | 0.22 × 0.22 | Tiny square peg |
| SquareSmall | 0.84 × 0.84 | Small solid square |
| SquareHole | 0.84 × 0.84 | Square with a hollow center |
| RectTiny | 0.43 × 0.22 | Tiny rectangular peg |
| RectSmall | 0.85 × 0.22 | Short thin plank |
| RectMedium | 1.68 × 0.22 | Medium thin plank |
| RectBig | 2.06 × 0.22 | Long thin plank |
| RectFat | 0.85 × 0.43 | Short fat plank |
| Triangle | ~0.82 base | Right-angle triangle, used as ramps/roofs |
| Circle | ~0.82 diameter | Ball shape, rolls on impact |

Dimensions are in game units (from Science Birds research clone). RectSmall, RectMedium, RectBig, RectFat, and RectTiny can each be rotated 90° to serve as vertical pillars instead of horizontal beams.

### 3.3 Special Objects

| Object | Behavior |
|--------|----------|
| TNT Crate | Wooden crate that explodes when struck with sufficient force. Has an inner blast radius (destroys blocks) and an outer blast radius (pushes objects). Extremely effective for chain reactions. |
| Slingshot | Fixed on the left side of each level. Cannot be destroyed. |
| Ground | Indestructible floor. Objects that fall off-screen to the sides or below are removed. |
| Terrain | Some levels feature stone terrain formations (hills, cliffs, caverns) that are indestructible and act as environmental obstacles. |

### 3.4 Episodes

The game shipped with a single episode and expanded over numerous content updates. Each episode contains multiple "themes" (chapters) of 15–21 levels each. Levels are numbered as `Theme-Level` within their episode (e.g., "Poached Eggs 1-16" is episode 1, theme 1, level 16; "2-1" is theme 2, level 1).

| # | Episode | Levels | Notes |
|---|---------|--------|-------|
| 1 | Poached Eggs | 63 | 3 themes × 21 levels. Launch episode. Introduces Red, The Blues, Chuck, Bomb, Matilda. |
| 2 | Mighty Hoax | 42 | 2 themes × 21 levels. Introduces Corporal Pig, Foreman Pig, King Pig at level 2-21. |
| 3 | Danger Above | 45 | 3 themes × 15 levels. |
| 4 | The Big Setup | 45 | 3 themes × 15 levels. Released in three monthly updates (Jul–Sep 2010). Introduces Terence; may also introduce Hal. |
| 5 | Ham 'Em High | 45 | 3 themes × 15 levels. Introduces Hal (some sources place Hal's debut in The Big Setup instead). |
| 6 | Mine and Dine | 45 | 3 themes × 15 levels. Underground/cave setting. |
| 7 | Birdday Party | 30 | 15 initial + 15 added later. Introduces Bubbles (Orange Bird). |
| 8 | Surf and Turf | 45 | 3 themes × 15 levels. Ported from Angry Birds Friends. |
| 9 | Bad Piggies | 45 | 3 themes × 15 levels. Tie-in with Bad Piggies game release. |
| 10 | Red's Mighty Feathers | 30 | 2 themes × 15 levels. |
| 11 | Short Fuse | 45 | 3 themes × 15 levels. |
| 12 | Flock Favorites | 45 | 3 themes × 15 levels. |
| 13 | Jurassic Pork | ~45 | Prehistoric-themed. |
| — | Tutorial | 9 | Optional introductory levels teaching controls and bird abilities. |

**Total**: ~680+ levels across all episodes, plus Golden Egg bonus levels (§9.1).

### 3.5 Level Progression

- Levels within an episode are unlocked sequentially: completing level N unlocks level N+1.
- Episodes are unlocked by progressing through the previous episode.
- Levels can be replayed at any time after completion.
- Star counts and high scores are tracked per level.

---

## 4. Playable Characters (Birds)

Birds are the player's projectiles. Each bird has a unique size, mass, and special ability activated by tapping the screen mid-flight. Birds are provided in a fixed order per level — the player cannot choose or rearrange them.

### 4.1 Bird Roster

| Color | Name | Ability | Activation | Material Strength | Introduced |
|-------|------|---------|------------|-------------------|------------|
| Red | Red | None — standard projectile | — | Average across all materials | Poached Eggs 1-1 |
| Blue | The Blues (Jay, Jake, Jim) | Splits into 3 smaller birds that fan out slightly | Tap mid-flight | Strong vs. glass; weak vs. wood and stone | Poached Eggs (~1-10) |
| Yellow | Chuck | Speed boost — accelerates sharply in current trajectory direction | Tap mid-flight | Strong vs. wood; weak vs. stone | Poached Eggs 1-16 |
| Black | Bomb | Explodes — creates a blast radius destroying nearby blocks | Tap mid-flight (air detonation) or auto-detonates on impact | Strong vs. stone; devastating in enclosed spaces | Poached Eggs, Chapter 2 |
| White | Matilda | Egg bomb — drops an explosive egg downward; body recoils upward | Tap mid-flight | Egg strong vs. all materials; body deals moderate damage on recoil | Poached Eggs, Chapter 3 |
| Green | Hal | Boomerang — reverses direction and curves back toward the slingshot side | Tap mid-flight | Moderate across all materials; effective for hitting behind structures | Ham 'Em High |
| Dark Red | Terence | None — massive body acts as a wrecking ball | — | Extremely strong vs. all materials due to sheer mass | The Big Setup |
| Orange | Bubbles | Inflates — expands to several times his size, pushing all nearby objects outward | Tap mid-flight or auto-inflates shortly after impact | Strong vs. wood and glass; inflation force pushes stone | Birdday Party |

### 4.2 Mighty Eagle

An optional in-app purchase. Originally limited to one use per hour on uncompleted levels; later updated to unlimited use on already-completed levels.

**Mechanic**: Activating the Mighty Eagle replaces all remaining birds with a single sardine can. The player launches the can from the slingshot. When the can lands, the Mighty Eagle swoops from the top-left of the screen, grabs the can, and slams into the ground before flying off to the top-right. Everything in his path is destroyed. The impact also shakes the entire level, breaking structural joints and popping weakened pigs.

**Total Destruction meter**: After the Eagle's pass, a destruction percentage (0–100%) is displayed. Achieving 100% awards a feather icon next to the level on the select screen. The 100% target is predetermined per level and does not always require destroying every single block. Strategic use of the regular birds before launching the sardine can helps maximize the percentage.

**Restriction**: The Mighty Eagle destroys Golden Eggs on contact, so Golden Eggs cannot be collected on a Mighty Eagle attempt.

---

## 5. Story & Difficulty

### 5.1 Premise

The pigs (Bad Piggies) have stolen the birds' eggs. The birds are angry and use a slingshot to assault the pigs' fortifications and recover their eggs. The story is conveyed through brief comic-style cutscenes between episodes — there is no in-level dialogue or narrative.

### 5.2 Difficulty Curve

Difficulty increases across episodes through:
- More pigs per level and tougher pig types (§6.1).
- Stronger materials — glass appears first, then wood, then stone.
- More complex structures requiring bird-specific strategies (e.g., using Chuck on wood supports, Bomb on stone walls).
- Fewer birds provided relative to the challenge.
- Environmental complexity: elevation changes, multiple separate structures, terrain obstacles, slingshots on raised platforms, and targets requiring high-arc lob shots.

---

## 6. Enemies (Pigs)

Pigs are the targets. They are stationary and do not attack or move on their own. They are placed within or atop structures and must be eliminated by direct bird impact, falling debris, explosions, or being knocked off-screen.

### 6.1 Pig Types

| Pig | Size | Durability | Points | Notes |
|-----|------|-----------|--------|-------|
| Small Pig (Minion) | Small | Very low — pops from a single direct hit or light debris | ~5,000 | Most common enemy. |
| Medium Pig (Minion) | Medium | Low — survives light debris, pops from moderate impacts | ~5,100 | Appears from early episodes onward. |
| Large Pig (Minion) | Large | Moderate — survives moderate impacts, requires heavier hits | ~5,200 | Takes more damage to pop. |
| Corporal Pig (Helmet Pig) | Medium | High — wears a stone/metal helmet that absorbs one extra hit | ~5,150 | Helmet must be knocked off before the pig can be popped. First appears at Mighty Hoax 2-21. |
| Foreman Pig (Mustache Pig) | Medium-Large | High — second toughest pig, withstands significant damage | ~5,300 | Recognizable by orange mustache. Right-hand pig to the King. First appears at Mighty Hoax 2-21. |
| King Pig | Large | Highest — survives small falls and light stone impacts | ~6,000 | Wears a crown. Toughest pig in the game. Often placed in the most protected position. First appears at Mighty Hoax 2-21. |

### 6.2 Pig Behavior

- Pigs are completely passive — they do not move, attack, or react until hit.
- When damaged (but not yet destroyed), pigs show visible bruising and a dazed expression.
- Pigs wobble slightly when the structure they sit on is disturbed.
- A pig is "popped" (destroyed) when it takes damage exceeding its health threshold. This displays a puff of smoke and a score popup.
- Pigs sitting on unstable surfaces may roll or slide into hazards when structures shift.

---

## 7. UI & HUD

### 7.1 In-Level HUD

| Element | Position | Description |
|---------|----------|-------------|
| Pause button | Top-left | Opens the pause menu. |
| Score counter | Top-center | Displays running point total for the current attempt. |
| Bird queue | Bottom-left (near slingshot) | Shows remaining birds in launch order. The next bird sits in the slingshot; subsequent birds are lined up on the ground behind it. |
| Mighty Eagle button | Top-left (if purchased) | Activates Mighty Eagle mode, replacing all birds with the sardine can. |
| Power-up slots | Top area (if power-ups available) | Shows available power-ups for activation. |

### 7.2 Trajectory Feedback

- **While aiming**: No trajectory line is displayed by default. The slingshot's elastic band angle is the only visual guide.
- **Previous shot trail**: After a bird is launched, a dotted trail of white dots persists along its flight path. This trail remains visible while aiming the next bird, allowing the player to adjust angle and power relative to the previous shot.
- **Sling Scope power-up**: Adds a red trajectory prediction line extending from the slingshot while aiming.

### 7.3 In-Level Feedback

- **Score popups**: When a pig is popped or a block is destroyed, a score value floats upward from the object's position.
- **Damage indicators**: Blocks that take damage without breaking show visible cracks. Damaged pigs show bruises (§6.2).

### 7.4 Level Complete Screen

Displayed after all pigs are eliminated:

- Stars awarded (1–3, with animated star-filling effect).
- Remaining unused birds pop in sequence, each adding a 10,000-point bonus with a visual popup.
- Final score total.
- High score indicator (if new personal best).
- Buttons: Retry, Next Level, Level Select.

### 7.5 Level Failed Screen

Displayed when all birds are used and pigs remain:

- "Level Failed" message.
- Buttons: Retry, Level Select.

### 7.6 Level Select / Episode Map

- Each episode has a themed map screen with level icons arranged in a grid or path.
- Completed levels display their star rating (1–3 stars).
- Locked levels appear grayed out.
- Golden Egg levels appear in a separate section once unlocked.

### 7.7 Pause Menu

- Resume
- Retry level
- Level select
- Sound toggle

---

## 8. Engine & Presentation Systems

### 8.1 Camera

- The camera defaults to a wide view showing the slingshot on the left and the structure on the right.
- The player can pan the camera freely left/right to scout the level.
- Pinch-to-zoom (touch) or scroll wheel (PC) allows zooming in and out.
- The camera briefly follows launched birds, then settles to show the impact zone.
- On level start, many levels play a brief camera pan from the structure back to the slingshot, showing the player the layout.

### 8.2 Save System

- Progress is saved locally in Lua-based settings files (`settings.lua`).
- Tracks per-level: completion status, star rating, high score, Mighty Eagle destruction percentage.
- iOS: Game Center integration for achievements and leaderboards (added post-launch).
- Cross-device sync was available through Rovio Account in later versions.

### 8.3 Audio System

- Each bird has a unique launch sound and ability-activation sound.
- Destruction sounds vary by material (glass shattering, wood cracking, stone crumbling).
- Pigs make oinking/squealing sounds when hit or when the level idles.
- Background music varies by episode theme.
- Victory jingle plays on level completion; failure sound on level loss.

### 8.4 Platform Releases

| Platform | Release Date |
|----------|-------------|
| iOS, Maemo | December 11, 2009 |
| Palm webOS | August 2010 |
| Android, Symbian | October 2010 |
| PSN, Windows, Mac | January 2011 |
| Web browser (Chrome) | May 2011 |
| Windows Phone | June 2011 |
| PlayStation 3, PSP | 2011 |
| Kindle Fire | 2011 |
| BlackBerry | August 2012 |
| Rovio Classics: Angry Birds (remake) | March 31, 2022 (delisted Feb 23, 2023) |

---

## 9. Minigames & Side Systems

### 9.1 Golden Eggs

Golden Eggs are hidden collectibles scattered throughout the game. Each one unlocks a special bonus level.

**How to find them:**
- **Hidden in levels**: Destroy a specific object or reach a hidden area within a regular level.
- **Hidden in menus**: Tap obscure spots on the episode select screen or other menu screens.
- **Episode mastery**: Earn 3 stars on every level in an episode to unlock a Golden Egg.

**Golden Egg levels** are standalone puzzle levels, often with unusual mechanics or humorous themes (e.g., a level made entirely of golden blocks, a level with an enormous single pig, or a Space Invaders-style minigame). There are 35+ Golden Eggs in total across all episodes. Golden Eggs cannot be collected on a Mighty Eagle attempt (§4.2).

### 9.2 Leaderboards & Achievements

- Per-episode score leaderboards (Game Center on iOS; platform-specific elsewhere).
- Achievements for milestones: completing episodes, earning star thresholds, collecting Golden Eggs, achieving Total Destruction on levels.

---

## 10. Open Questions / Unverified

- **Block break thresholds**: The precise impulse value required to break each block type per material is not publicly documented. Relative strengths (glass < wood < stone) are confirmed but exact numbers would require datamining.
- **Star score thresholds**: Per-level three-star minimums are cataloged by community testing (AngryBirdsNest Almanac) but the formula Rovio used to set them is unknown.
- **Bird physics parameters**: Exact mass, launch velocity range, and gravity constant are not officially published. Science Birds and other fan recreations use Box2D with estimated values.
- **Pig HP values**: Pig durability thresholds per type have not been precisely datamined for the original game. Relative ordering is confirmed (Small < Medium < Large < Corporal/Foreman < King) but numeric HP is unknown.
- **Block point values by shape**: Per-shape point values are documented for Angry Birds Friends but may differ slightly in the original game.
- **Bubbles' inflation**: Exact inflation radius and outward force magnitude are unverified.
- **Hal's boomerang arc**: Whether Hal's return path follows a fixed curve or is influenced by velocity at activation is unclear.
- **Hal's introduction level**: Sources conflict on whether Hal first appears in The Big Setup or Ham 'Em High. One wiki source says The Big Setup is "dedicated to Terence and Hal," while others list Hal as a Ham 'Em High introduction.

---

## 11. References

### Wikis & Databases
- [Angry Birds Wiki (Fandom)](https://angrybirds.fandom.com/wiki/Angry_Birds_(game)) — Primary community wiki
- [Angry Birds Wiki: Strengths and Weaknesses](https://angrybirds.fandom.com/wiki/Strengths_and_Weaknesses) — Material effectiveness per bird
- [Angry Birds Wiki: Blocks](https://angrybirds.fandom.com/wiki/Blocks) — Block types and materials
- [StrategyWiki: Angry Birds](https://strategywiki.org/wiki/Angry_Birds) — Strategy and mechanics reference
- [Wikipedia: Angry Birds (video game)](https://en.wikipedia.org/wiki/Angry_Birds_(video_game)) — General overview and release history

### Community Guides
- [AngryBirdsNest Almanac](https://www.angrybirdsnest.com/almanac/) — Level-by-level score data and 3-star thresholds
- [AngryBirdsNest: Mighty Eagle Explained](https://www.angrybirdsnest.com/angry-birds-mighty-eagle-explained/) — Mighty Eagle mechanics
- [AngryBirdsNest: Scoring Forum Thread](https://www.angrybirdsnest.com/forums/topic/breakdown-of-maximum-points-for-all-objects-abf/) — Community-gathered point values
- [POY8 Mastery Guide](https://www.poy8.com/blog/action-games/Angry-Birds-Mastery-Guide-Physics-Based-Strategy-and-High-Score-Tips/) — Strategy and physics tips

### Technical
- [Box2D Physics Engine](https://box2d.org/) — The 2D physics engine used by the game
- [Science Birds (GitHub)](https://github.com/lucasnfe/science-birds) — Open-source Angry Birds clone used for AI research, useful reference for block types and physics parameters
- [CS50 Game Development: Angry Birds Lecture](https://cs50.harvard.edu/games/notes/6/) — Academic analysis of game mechanics
