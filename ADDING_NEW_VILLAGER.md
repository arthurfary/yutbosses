# Adding a New Villager for a New Boss

This guide shows how to add a complete trader/villager system for a new boss.

## Step 1: Create Villager Directories

```bash
mkdir -p data/yutbosses/functions/villagers/[bossname]
```

## Step 2: Create Villager Files

### `spawn_trader.mcfunction`

This spawns your boss-specific trader NPC:

```mcfunction
# [BossName] Villagers - Spawn Trader
# Use: /function yutbosses:villagers/[bossname]/spawn_trader

summon villager ~ ~ ~ {
  CustomName:'{"text":"Your Trader Name","color":"green","bold":true}',
  CustomNameVisible:1b,
  NoAI:1b,
  Invulnerable:1b,
  PersistenceRequired:1b,
  Tags:["[bossname]_trader"],
  VillagerData:{profession:"minecraft:armorer",level:5,type:"minecraft:swamp"},
  Attributes:[{Name:"generic.max_health",Base:1024}]
}

tellraw @s {"text":"✅ [BossName] trader spawned!","color":"green","bold":true}
```

**Important**: Use a unique tag like `[bossname]_trader` (e.g., `myboss_trader`, not `slime_trader`)

### `config.mcfunction`

Optional file for villager configuration:

```mcfunction
# [BossName] Villagers - Configuration
# Add villager-specific settings here if needed
```

### `show_menu.mcfunction`

This displays your boss-specific crafting menu. Example structure:

```mcfunction
# [BossName] Villager - Show Menu
# Displays the trader menu for this boss

playsound minecraft:block.enchantment_table.use player @s ~ ~ ~ 1 1.2

tellraw @s {"text":""}
tellraw @s {"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_[color]","bold":true}
tellraw @s {"text":"   Your Trader Menu Title","color":"[color]","bold":true}
tellraw @s {"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_[color]","bold":true}

# Count your currency
execute store result score @s [currency_scoreboard] run clear @s minecraft:[currency_item]{[tag]:1b} 0

# Display available items/crafts
# Example: Item 1 (5 currency)
execute if score @s [currency] matches 5.. run tellraw @s {"text":"  Item Name","color":"green","bold":true}
execute if score @s [currency] matches ..4 run tellraw @s {"text":"  Item Name","color":"dark_gray"}
execute if score @s [currency] matches 5.. run tellraw @s {"text":"  [CRAFT]","color":"yellow","bold":true,"clickEvent":{"action":"run_command","value":"/trigger [trigger_name] set 1"}}
execute if score @s [currency] matches ..4 run tellraw @s {"text":"  [LOCKED]","color":"dark_red","bold":true}

tellraw @s {"text":""}
tellraw @s {"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_[color]","bold":true}
tellraw @s {"text":""}
```

## Step 3: Register Trader in Shared Interaction

Update `functions/shared/trader_interaction.mcfunction` to include your boss:

```mcfunction
# ... existing xygel code ...

# [BossName] Trader
execute as @a at @s if entity @e[type=villager,tag=[bossname]_trader,distance=..3] run function yutbosses:villagers/[bossname]/show_menu
```

## Step 4: Create Boss-Specific Item Functions

In `functions/items/[bossname]/`, create item definition files:

```mcfunction
# [BossName] Items - Give [ItemName]
give @s minecraft:[item_type]{display:{Name:'{"text":"Item Name","color":"green","bold":true}'},Enchantments:[...],UnbreakableTag:1b}
```

## Step 5: Create Boss-Specific Craft Functions

In `functions/bosses/[bossname]/craft/`, create craft validation functions:

```mcfunction
# [BossName] Craft - Try Craft [ItemName]

# Check if near trader
execute at @s unless entity @e[type=villager,tag=[bossname]_trader,distance=..10] run tellraw @s {"text":"❌ Must be near trader!","color":"red"}
execute at @s unless entity @e[type=villager,tag=[bossname]_trader,distance=..10] run return 0

# Check if enough currency
execute store result score @s [currency] run clear @s minecraft:[currency]{[tag]:1b} 0
execute if score @s [currency] matches ..[needed-1] run tellraw @s {"text":"❌ Not enough currency!","color":"red"}
execute if score @s [currency] matches ..[needed-1] run return 0

# Consume currency
clear @s minecraft:[currency]{[tag]:1b} [amount]

# Give item - CALLS ITEM FUNCTION
function yutbosses:items/[bossname]/give_[itemname]

# Effects and feedback
particle minecraft:happy_villager ~ ~1 ~ 0.3 0.3 0.3 0.1 30 force @a[distance=..32]
execute as @e[type=villager,tag=[bossname]_trader,distance=..10,limit=1] at @s run particle minecraft:happy_villager ~ ~2 ~ 0.3 0.3 0.3 0 10 force @a[distance=..32]
playsound minecraft:entity.villager.yes player @a ~ ~ ~ 1 1

tellraw @s {"text":"✨ Item crafted!","color":"green","bold":true}
```

## Step 6: Register Craft Trigger Handler

In `functions/shared/process_craft.mcfunction`, route to your boss:

```mcfunction
# ... existing xygel code ...

# [BossName] Crafting
execute as @a[scores={craft_armor=1}] run function yutbosses:bosses/[bossname]/craft/try_craft_item1
execute as @a[scores={craft_armor=2}] run function yutbosses:bosses/[bossname]/craft/try_craft_item2
```

## Step 7: Add Scoreboards (in load.mcfunction)

```mcfunction
# [BossName] systems
scoreboard objectives add [bossname]_currency dummy "[BossName] Currency"
# Add any other [bossname]-specific scoreboards
```

## Complete Example: For a "Dragon" Boss

### Directory Structure
```
functions/
├── items/dragon/
│   ├── give_scales.mcfunction
│   ├── give_armor.mcfunction
│   └── give_weapon.mcfunction
├── villagers/dragon/
│   ├── spawn_trader.mcfunction
│   ├── show_menu.mcfunction
│   └── config.mcfunction
└── bosses/dragon/
    └── craft/
        ├── try_craft_scales.mcfunction
        └── try_craft_armor.mcfunction
```

### Key Points

1. **Unique Tags**: Use `dragon_trader` instead of generic `slime_trader`
2. **Unique Scoreboard Prefixes**: Use `dragon_` prefix for all boss-specific scoreboards
3. **Boss-Specific Menu**: Each boss has its own `show_menu.mcfunction` in `villagers/[bossname]/`
4. **Router Pattern**: 
   - `trader_interaction.mcfunction` detects the tag and calls the menu
   - `process_craft.mcfunction` routes trigger values to correct craft functions
5. **Reuse Shared Logic**: Items, weapons, set bonuses use shared functions with boss-specific content

### The System Flow

```
Player near trader
    ↓
trader_interaction detects [bossname]_trader tag
    ↓
calls yutbosses:villagers/[bossname]/show_menu
    ↓
Player clicks craft option (trigger set)
    ↓
process_craft detects trigger value
    ↓
calls yutbosses:bosses/[bossname]/craft/try_craft_*
    ↓
Craft function calls item function
    ↓
yutbosses:items/[bossname]/give_item gives item
```

Now each boss has **completely independent** villager and item systems while sharing the interaction and crafting framework!
