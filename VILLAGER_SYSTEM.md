# Villager System - How It Works Now

## Previous Issue
The shared trader functions were hardcoded to `xygel` and the generic `slime_trader` tag, making it impossible to add different traders for different bosses.

## Solution: Boss-Specific Traders with Shared Framework

### The Router Pattern

Instead of hardcoding in shared functions, we now use a **routing system**:

#### `trader_interaction.mcfunction` (Shared)
```mcfunction
# Detects ANY boss trader and routes to its menu

# Xy'Gel Trader
execute as @a at @s if entity @e[type=villager,tag=xygel_trader,distance=..3] run function yutbosses:villagers/xygel/show_menu

# MyBoss Trader
execute as @a at @s if entity @e[type=villager,tag=myboss_trader,distance=..3] run function yutbosses:villagers/myboss/show_menu

# Add more here...
```

#### `process_craft.mcfunction` (Shared)
```mcfunction
# Routes craft triggers to boss-specific handlers

# Xygel crafting
execute as @a[scores={craft_armor=1}] run function yutbosses:bosses/xygel/craft/try_craft_chest

# MyBoss crafting  
execute as @a[scores={craft_armor=1}] run function yutbosses:bosses/myboss/craft/try_craft_item1
```

### Complete Independence

Each boss now has:

**Xygel Boss:**
- Tag: `xygel_trader`
- Menu: `functions/villagers/xygel/show_menu.mcfunction`
- Items: `functions/items/xygel/give_*.mcfunction`
- Crafts: `functions/bosses/xygel/craft/try_craft_*.mcfunction`

**MyBoss Boss:**
- Tag: `myboss_trader`
- Menu: `functions/villagers/myboss/show_menu.mcfunction`
- Items: `functions/items/myboss/give_*.mcfunction`
- Crafts: `functions/bosses/myboss/craft/try_craft_*.mcfunction`

### How to Add a New Boss Villager

1. **Create boss-specific files** in `functions/villagers/[bossname]/`
2. **Add boss-specific items** in `functions/items/[bossname]/`
3. **Create craft handlers** in `functions/bosses/[bossname]/craft/`
4. **Update shared routers**:
   - Add detection line to `trader_interaction.mcfunction`
   - Add craft routes to `process_craft.mcfunction`
5. **Use unique tags**: `[bossname]_trader` (not shared tags)

### Key Differences from Before

| Aspect | Before | Now |
|--------|--------|-----|
| Trader Tag | `slime_trader` (shared) | `[boss]_trader` (unique) |
| Menu | `show_trader_menu.mcfunction` (xygel only) | `show_menu.mcfunction` per boss |
| Items | Hardcoded in craft functions | Centralized in `items/[boss]/` |
| Expansion | Impossible without major refactoring | Just add router lines + new files |

See `ADDING_NEW_VILLAGER.md` for complete step-by-step guide!
