# YutBosses Datapack - Main Load Function
# This function is called once when the world loads

# ============================================
# Initialize Global Scoreboards
# ============================================

# Weapon enchantment tracking
scoreboard objectives add dmg minecraft.custom:minecraft.damage_dealt

# Item set bonus system
scoreboard objectives add slime_set_active dummy
scoreboard objectives add slime_pieces dummy
scoreboard objectives add slime_nucleos dummy

# Trader system
scoreboard objectives add trader_cooldown dummy
scoreboard objectives add craft_armor trigger

# ============================================
# Boss-specific scoreboards (xygel)
# ============================================

scoreboard objectives add xygel_active dummy "Xy'Gel Active"
scoreboard objectives add xygel_timer dummy "Xy'Gel Timer"
scoreboard objectives add xygel_cleanup_timer dummy "Xy'Gel Cleanup"
scoreboard objectives add xygel_config dummy "Xy'Gel Config"

# Initialize spawn location scoreboards
scoreboard players set #xygel_spawn_x xygel_config -39
scoreboard players set #xygel_spawn_y xygel_config -59
scoreboard players set #xygel_spawn_z xygel_config -60

# Enable triggers
scoreboard players enable @a craft_armor

# ============================================
# Load Boss-Specific Systems
# ============================================

function yutbosses:bosses/xygel/config

# ============================================
# Feedback Messages
# ============================================

tellraw @a [{"text":"[Boss System] ","color":"green","bold":true},{"text":"Sistema de Boss Fight carregado!","color":"gray"}]
tellraw @a [{"text":"Xy'Gel ","color":"green","bold":true},{"text":"Datapack carregado com sucesso!","color":"gray"}]
