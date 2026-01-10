# YutBosses Datapack - Documentation

## Overview

This datapack has been reorganized for maximum maintainability and scalability. It features complete separation of concerns:
- **Items**: All item definitions in one place
- **Villagers**: All NPC logic centralized
- **Bosses**: Pure boss mechanics
- **Shared**: Reusable systems for all bosses

## Folder Structure

```
yutbosses/
├── data/
│   ├── minecraft/
│   │   └── tags/functions/
│   │       ├── load.json      (Points to yutbosses:load)
│   │       └── tick.json      (Points to yutbosses:tick)
│   │
│   └── yutbosses/
│       ├── functions/
│       │   ├── load.mcfunction      (Global initialization)
│       │   ├── tick.mcfunction      (Global tick handler)
│       │   │
│       │   ├── items/                (CENTRALIZED ITEM DEFINITIONS)
│       │   │   └── xygel/
│       │   │       ├── give_nucleos.mcfunction     (Crafting currency)
│       │   │       ├── give_chest.mcfunction       (Armor piece)
│       │   │       ├── give_legs.mcfunction        (Armor piece)
│       │   │       ├── give_boots.mcfunction       (Armor piece)
│       │   │       └── give_sword.mcfunction       (Weapon)
│       │   │
│       │   ├── villagers/            (CENTRALIZED NPC LOGIC)
│       │   │   └── xygel/
│       │   │       ├── spawn_trader.mcfunction     (Spawns trader NPC)
│       │   │       └── config.mcfunction           (Villager settings)
│       │   │
│       │   ├── shared/               (Reusable utilities for all bosses)
│       │   │   ├── apply_set_bonus.mcfunction
│       │   │   ├── apply_weapon_effect.mcfunction
│       │   │   ├── check_set_bonus.mcfunction
│       │   │   ├── display_trader_menu.mcfunction
│       │   │   ├── process_craft.mcfunction
│       │   │   ├── remove_set_bonus.mcfunction
│       │   │   ├── show_trader_menu.mcfunction
│       │   │   ├── trader_cooldown.mcfunction
│       │   │   └── trader_interaction.mcfunction
│       │   │
│       │   └── bosses/               (PURE BOSS MECHANICS)
│       │       └── xygel/
│       │           ├── config.mcfunction
│       │           ├── summon.mcfunction
│       │           ├── summon_boss.mcfunction
│       │           ├── tick.mcfunction
│       │           ├── boss_timer.mcfunction
│       │           ├── spawn_adds.mcfunction
│       │           ├── check_defeat.mcfunction
│       │           ├── on_defeat.mcfunction
│       │           ├── cleanup.mcfunction
│       │           ├── timeout.mcfunction
│       │           ├── debug_status.mcfunction
│       │           ├── force_reset.mcfunction
│       │           ├── set_spawn.mcfunction
│       │           └── craft/            (Crafting logic - calls item functions)
│       │               ├── try_craft_chest.mcfunction
│       │               ├── try_craft_legs.mcfunction
│       │               ├── try_craft_boot.mcfunction
│       │               └── try_craft_sword.mcfunction
│       │
│       └── loot_tables/
│           └── bosses/
│               └── xygel/
│                   └── xygel_boss.json
```

## Key Improvements

### 1. **Centralized Item Definitions**
All item NBT data is defined in `functions/items/[boss]/` and **edited in only one place**:
- `give_chest.mcfunction` - Contains chest plate definition
- `give_legs.mcfunction` - Contains leggings definition
- `give_boots.mcfunction` - Contains boots definition
- `give_sword.mcfunction` - Contains sword definition
- `give_nucleos.mcfunction` - Contains crafting currency definition

**To modify an item**, edit its corresponding file. All crafting functions simply call these to give items.

### 2. **Boss-Specific Villager Logic**
Each boss trader is completely independent using unique tags:

`functions/villagers/xygel/`:
- `spawn_trader.mcfunction` - Spawns trader with tag `xygel_trader`
- `show_menu.mcfunction` - Displays xygel-specific menu
- `config.mcfunction` - Xygel villager settings

When adding a new boss (e.g., `myboss`):
- Create `functions/villagers/myboss/` with similar files
- Use tag `myboss_trader` (NOT `slime_trader`)
- Register in `trader_interaction.mcfunction` to detect your tag
- Create your own `show_menu.mcfunction` with your items

### 3. **Pure Boss Logic**
`functions/bosses/[boss]/` focuses entirely on boss mechanics:
- No item definitions
- No villager spawning
- Clean separation from other systems

### 4. **Shared Utilities**
`functions/shared/` contains reusable systems:
- Weapon effects
- Set bonuses
- Trader interactions
- Used by all bosses without duplication

### 5. **Namespace Consolidation**
- Main namespace: `yutbosses:`
- No conflicts when adding new bosses
- Boss-specific variables use prefixes: `xygel_`, `myboss_`, etc.

## Adding a New Boss

### 1. Create Directory Structure
```bash
data/yutbosses/functions/bosses/myboss/
data/yutbosses/functions/bosses/myboss/craft/
data/yutbosses/functions/items/myboss/
data/yutbosses/functions/villagers/myboss/
data/yutbosses/loot_tables/bosses/myboss/
```

### 2. Create Item Definitions
In `functions/items/myboss/`, create:
- `give_item1.mcfunction`
- `give_item2.mcfunction`
- etc.

Each file contains **only the item definition**:
```mcfunction
give @s minecraft:sword{display:{Name:...},Enchantments:[...]}
```

### 3. Create Villager Logic
In `functions/villagers/myboss/`, create:
- `spawn_trader.mcfunction` - Villager spawning with full customization
- `config.mcfunction` - Settings

### 4. Create Boss Functions
In `functions/bosses/myboss/`, create boss-specific mechanics. Crafting functions call item functions.

### 5. Update Scoreboards
Add to `load.mcfunction`:
```mcfunction
scoreboard objectives add myboss_active dummy "MyBoss Active"
scoreboard objectives add myboss_timer dummy "MyBoss Timer"
scoreboard objectives add myboss_cleanup_timer dummy "MyBoss Cleanup"
scoreboard objectives add myboss_config dummy "MyBoss Config"
```

### 6. Update Main Tick
Add to `tick.mcfunction`:
```mcfunction
execute if score #myboss_active myboss_active matches 1 run function yutbosses:bosses/myboss/tick
execute if score #myboss_cleanup_timer myboss_cleanup_timer matches 0..599 run function yutbosses:bosses/myboss/cleanup
```

## Command Reference

### Xy'Gel Boss Commands

**Summon the boss:**
```
/function yutbosses:bosses/xygel/summon
```

**Set spawn location:**
```
/function yutbosses:bosses/xygel/set_spawn
```

**Force reset:**
```
/function yutbosses:bosses/xygel/force_reset
```

**Debug status:**
```
/function yutbosses:bosses/xygel/debug_status
```

### Villager Commands

**Spawn the trader:**
```
/function yutbosses:villagers/xygel/spawn_trader
```

### Item Commands

**Give Xy'thar sword:**
```
/function yutbosses:items/xygel/give_sword
```

**Give armor pieces:**
```
/function yutbosses:items/xygel/give_chest
/function yutbosses:items/xygel/give_legs
/function yutbosses:items/xygel/give_boots
```

**Give crafting currency:**
```
/function yutbosses:items/xygel/give_nucleos
```

## Editing Items

**To change an item definition**, edit **only one file**:

1. **Chest Plate**: Edit `functions/items/xygel/give_chest.mcfunction`
2. **Leggings**: Edit `functions/items/xygel/give_legs.mcfunction`
3. **Boots**: Edit `functions/items/xygel/give_boots.mcfunction`
4. **Sword**: Edit `functions/items/xygel/give_sword.mcfunction`
5. **Nucleos**: Edit `functions/items/xygel/give_nucleos.mcfunction`

All crafting functions automatically use the updated definitions since they call these centralized functions.

## Variable Naming Conventions

- **Active status**: `#[bossname]_active`
- **Timers**: `#[bossname]_timer`, `#[bossname]_cleanup_timer`
- **Config**: `#[bossname]_spawn_x`, `#[bossname]_spawn_y`, `#[bossname]_spawn_z`
- **Entity tags**: `[bossname]_boss`, `[bossname]_minion`
- **Bossbar**: `minecraft:[bossname]_hp`

## Structure Benefits

✅ **Single Point of Maintenance**: Items defined once, used everywhere
✅ **Clear Separation**: Items, villagers, bosses, and shared logic are isolated
✅ **Easy to Scale**: Adding new bosses is straightforward
✅ **Reusable Systems**: Shared utilities work for all bosses
✅ **Reduced Duplication**: No scattered item definitions
