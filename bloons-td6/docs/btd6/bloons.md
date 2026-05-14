# Bloons TD 6 -- Bloon Data

Companion data file for [SPEC.md](../../SPEC.md) -- see **S5. Bloons** for system overview.

---

## Standard Bloons

All standard bloons have 1 HP per layer (except Ceramic). Each layer popped reveals the children inside.

| Bloon | RBE | Speed | HP | Children | Immunities | First Round |
|---|---|---|---|---|---|---|
| Red | 1 | 1.0x | 1 | -- | -- | 1 |
| Blue | 2 | 1.4x | 1 | 1 Red | -- | 3 |
| Green | 3 | 1.8x | 1 | 1 Blue | -- | 6 |
| Yellow | 4 | 3.2x | 1 | 1 Green | -- | 11 |
| Pink | 5 | 3.5x | 1 | 1 Yellow | -- | 15 |
| Purple | 11 | 3.0x | 1 | 2 Pink | Energy, Fire, Plasma | 25 |
| Black | 11 | 1.8x | 1 | 2 Pink | Explosion | 20 |
| White | 11 | 2.0x | 1 | 2 Pink | Cold/Freezing | 22 |
| Zebra | 23 | 1.8x | 1 | 1 Black + 1 White | Explosion + Cold | 26 |
| Lead | 23 | 1.0x | 1 | 2 Black | Sharp, Cold, Energy | 28 |
| Rainbow | 47 | 2.2x | 1 | 2 Zebra | -- | 35 |
| Ceramic | 104 | 2.5x | 10 | 2 Rainbow | -- | 38 |

### Super Ceramic (Round 81+)

From Round 81 onward, all Ceramics become Super Ceramics:
- **HP:** 60 (Fortified: 120)
- **Children:** 1 Rainbow (spawning 1 child at each subsequent layer instead of 2)
- **RBE:** ~60
- **Speed:** 2.5x (same as normal Ceramic)

---

## MOAB-Class Bloons

| Bloon | HP | RBE | Speed | Children | Fortified HP | First Round |
|---|---|---|---|---|---|---|
| MOAB | 200 | 616 | 1.0x | 4 Ceramic | 400 | 40 |
| BFB | 700 | 3,164 | 0.25x | 4 MOAB | 1,400 | 60 |
| ZOMG | 4,000 | 16,656 | 0.18x | 4 BFB | 8,000 | 80 |
| DDT | 400 | 816 | 2.75x | 4 Camo Regrow Ceramic | 800 | 90 |
| BAD | 20,000 | 55,760 | 0.18x | 2 ZOMG + 3 DDT | 40,000 | 100 |

### MOAB-Class Properties
- All MOAB-class: Immune to most glue, most freezing, tornado effects
- DDT: Has Lead property (immune to Sharp), Black property (immune to Explosion), innate Camo
- BAD: Immune to ALL slowing, stunning, knockback, and instant-kill effects

### Freeplay Health Scaling

| Round Range | HP Multiplier per Round | Example |
|---|---|---|
| 1-80 | 1.0x (base) | -- |
| 81-100 | +2% per round (compound) | R100: ~1.4x base |
| 101+ | +5% per round (compound) | R124: ~2.6x base |

Speed also increases by +2% per round from Round 81 onward.

---

## Bloon Properties

### Camo (Camouflage)
- **Eligible:** All standard bloons; DDT has innate Camo
- **Effect:** Towers without Camo detection cannot target the bloon
- **Visual:** Green camouflage pattern
- **Counters:** Radar Scanner (Village 0-2-0), Ninja innate, Etienne Level 8+ (global), many tower-specific upgrades
- **First appears:** Round 24 (Round 5 in ABR)

### Regrow (Regrowth)
- **Eligible:** All standard bloons (Red through Ceramic); NOT MOAB-class
- **Effect:** Regenerates one layer every 3.0 seconds, up to original form
- **Visual:** Heart-shaped marking
- **Example:** Regrow Rainbow popped to Red regrows: Red -> Blue -> Green -> Yellow -> Pink -> Black/White -> Zebra -> Rainbow
- **Note:** Regrown layers do NOT count toward pop count (prevents farming)
- **Counters:** Grow Blocker (Village 0-1-0), Ezili's Heartstopper
- **First appears:** Round 17 (Round 3 in ABR)

### Fortified (Armored)
- **Eligible:** Lead, Ceramic, all MOAB-class
- **Effect on Lead:** Quadruples HP (1 -> 4)
- **Effect on Ceramic:** Doubles HP (10 -> 20; Super Ceramic: 60 -> 120)
- **Effect on MOAB-class:** Doubles HP
- **Visual:** Metal bands/bolts
- **Note:** Fortified property is NOT restored when a Regrow bloon regrows
- **First appears:** Round 45 (Fortified Lead)

### Property Stacking
Properties stack freely on eligible bloons. Most extreme standard example: **Fortified Camo Regrow Ceramic** (20 HP, regrows layers, requires camo detection; first appears ~Round 67).

---

## Damage Types

BTD6 has multiple damage types. The core immunities revolve around 5 special bloon categories.

| Damage Type | Can't Pop Lead | Can't Pop Frozen | Can't Pop Black | Can't Pop White | Can't Pop Purple | Common Towers |
|---|---|---|---|---|---|---|
| Normal | X | X | -- | -- | -- | Various |
| Sharp | X | X | -- | -- | -- | Dart, Boomerang, Tack, Ninja, Sniper |
| Shatter | X | -- | -- | -- | -- | Upgraded Sharp (pops Frozen) |
| Explosion | -- | -- | X | -- | -- | Bomb Shooter, missiles |
| Cold | X | -- | -- | X | -- | Ice Monkey |
| Glacier | X | -- | -- | X | -- | Upgraded Cold (pops Frozen) |
| Energy | X | -- | -- | -- | X | Super Monkey (base) |
| Plasma | -- | -- | -- | -- | X | Super Monkey (upgraded), Sun Avatar |
| Fire | -- | -- | -- | -- | X | Wizard, Mortar, Gwendolin |
| Acid | -- | -- | -- | -- | -- | Glue Gunner. Pops ALL types. |

**X = Cannot pop that bloon type. -- = Can pop it.**

### Key Interactions
- **Lead** requires non-Sharp damage: Explosions, Fire, Plasma, Acid, or tower-specific upgrades (e.g., Red Hot Rangs, Metal Freeze)
- **DDT** combines Lead + Black + Camo: requires a damage type that pops both Lead and Black, plus Camo detection. Effective types: Plasma, Fire, Acid, or Normal damage with upgrades
- **Purple** blocks energy-based attacks: Energy, Plasma, Fire. Must use Sharp, Explosion, Cold, or Acid
- **Monkey Intelligence Bureau** (Village 0-3-0) grants all towers in range the ability to pop any bloon type regardless of damage immunities

---

## Boss Bloons

Bosses appear at Rounds 40, 60, 80, 100, and 120 (5 tiers). Normal and Elite difficulties.

### Bloonarius the Inflator

| Tier | Normal HP | Elite HP |
|---|---|---|
| 1 | 20,000 | 50,000 |
| 2 | 75,000 | 300,000 |
| 3 | 350,000 | 2,000,000 |
| 4 | 750,000 | 8,000,000 |
| 5 | 3,000,000 | 40,000,000 |

- **Skull ability:** Spawns waves of bloons at each HP threshold (Ceramics at low tiers, MOABs/ZOMGs/BADs at high tiers)
- **Speed:** Very slow

### Lych (Gravelord Lych)

| Tier | Normal HP | Elite HP |
|---|---|---|
| 1 | 14,000 | 30,000 |
| 2 | 52,500 | 180,000 |
| 3 | 220,000 | 1,100,000 |
| 4 | 525,000 | 4,800,000 |
| 5 | 2,100,000 | 24,000,000 |

- **Buff Steal:** Shockwave removes buff-based tower effects (Alchemist, Overclock), stuns affected towers, heals self
- **Lych-Soul:** At each skull, becomes invincible and spawns a Lych-Soul mini-boss that must be destroyed. Lych-Soul drains lives every 4 seconds
- **Revive:** Revives all MOAB-class bloons popped in the last 20 seconds (except BADs)

### Vortex: Deadly Master of Air

| Tier | Normal HP | Elite HP |
|---|---|---|
| 1 | 20,000 | 41,800 |
| 2 | 62,800 | 251,000 |
| 3 | 294,000 | 1,675,000 |
| 4 | 628,000 | 6,700,000 |
| 5 | 2,512,500 | 33,500,000 |

- **Speed Boost:** Fastest boss. All bloons behind Vortex move at 2.5x speed
- **Storm Pulse:** Destroys all projectiles, spikes, and collectibles within 60-unit radius every ~5-7 seconds
- **Skull ability:** Stuns all nearby towers, creates projectile-deflecting shield for ~6 seconds, knocks self backward on track

### Dreadbloon: The Armored Behemoth

| Tier | Normal HP | Elite HP |
|---|---|---|
| 1 | 22,500 | 45,000 |
| 2 | 75,000 | 270,000 |
| 3 | 360,000 | 1,950,000 |
| 4 | 780,000 | 7,875,000 |
| 5 | 3,000,000 | 37,500,000 |

- **Ceramic Armor Shell:** Absorbs damage; fully regrows at each skull
- **Lead Property:** Main body has Lead immunity
- **Flat Damage Reduction:** Reduces all incoming damage by flat amount per hit (makes multi-hit attacks less effective)
- **Tower Category Immunity:** At each skull, becomes immune to one tower category (Primary/Military/Magic/Support), rotating

### Phayze: Reality Warper

| Tier | Normal HP | Elite HP |
|---|---|---|
| 1 | 19,000 | 47,500 |
| 2 | 70,000 | 275,000 |
| 3 | 320,000 | 1,925,000 |
| 4 | 700,000 | 7,750,000 |
| 5 | 2,900,000 | 38,750,000 |

- **Reality Shield:** 25% of max HP. Moves faster while shield is active
- **Innate Camo:** Always has Camo property
- **Radar Jam:** Disables all Camo detection for 12 seconds; cooldown starts at 32 seconds, reduces by 0.5% per hit (minimum 3.84 seconds)
- **Portal:** At each skull, dashes forward 8% of track; spawns portal at previous position for natural bloon spawning
- **Attack Slowdown Aura:** After first skull, stacking aura reduces all tower attack speed

### Blastapopoulos: Demon of the Core

| Tier | Normal HP (est.) | Elite HP (est.) |
|---|---|---|
| 1 | ~20,000 | ~50,000 |
| 2 | ~75,000 | ~300,000 |
| 3 | ~350,000 | ~2,000,000 |
| 4 | ~750,000 | ~8,000,000 |
| 5 | ~3,000,000 | ~40,000,000 |

- **Purple Property:** Immune to Energy, Plasma, Fire damage
- **DoT Removal:** Purges damage-over-time effects every 2 seconds
- **Heat Mechanic:** Gains Heat when hit by projectiles (Energy/Plasma/Fire add more; Cold reduces). At max Heat, stuns all towers
- **Range Reduction:** All towers have 15% reduced range while Blastapopoulos is on track
- **Ability Cooldown Increase:** Increases cooldown of all activated abilities (scales with tier)

---

## Key Round Milestones

| Round | Event |
|---|---|
| 17 | First Regrow bloons (Regrow Yellow) |
| 24 | First Camo bloons (Camo Green) |
| 25 | First Purple bloons |
| 28 | First Lead bloons |
| 33 | Major Camo wave |
| 38 | First Ceramic bloons |
| 40 | **First MOAB** (Easy boss round) |
| 45 | First Fortified Lead |
| 49 | Large bloon rush |
| 60 | **First BFB** (Medium boss round) |
| 63 | Massive Ceramic rush (~122 Ceramics) |
| 76 | Regrow Ceramic rush |
| 80 | **First ZOMG** (Hard boss round) |
| 81 | Super Ceramics begin |
| 90 | **First DDTs** |
| 95 | Massive DDT rush (30 DDTs + 50 Fortified MOABs) |
| 98 | 30 Fortified BFBs + 8 ZOMGs |
| 100 | **First BAD** (Impoppable/CHIMPS boss round) |
| 140+ | Bloon compositions become randomized (freeplay) |

---

## Speed Reference

| Bloon | Relative Speed | Approx. Units/sec |
|---|---|---|
| Red | 1.0x | ~25 |
| Blue | 1.4x | ~35 |
| Green | 1.8x | ~45 |
| Yellow | 3.2x | ~80 |
| Pink | 3.5x | ~87.5 |
| Purple | 3.0x | ~75 |
| Black | 1.8x | ~45 |
| White | 2.0x | ~50 |
| Zebra | 1.8x | ~45 |
| Lead | 1.0x | ~25 |
| Rainbow | 2.2x | ~55 |
| Ceramic | 2.5x | ~62.5 |
| MOAB | 1.0x | ~25 |
| BFB | 0.25x | ~6.25 |
| ZOMG | 0.18x | ~4.5 |
| DDT | 2.75x | ~68.75 |
| BAD | 0.18x | ~4.5 |
