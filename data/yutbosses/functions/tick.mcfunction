# YutBosses Datapack - Main Tick Function
# This function is called every tick

# ============================================
# Global Systems
# ============================================

# Weapon special effect: Apply slowness when hitting with xygel_touch weapons
execute as @a[nbt={SelectedItem:{tag:{xygel_touch:1b}}},scores={dmg=1..}] at @s run function yutbosses:shared/apply_weapon_effect
execute as @a[nbt={SelectedItem:{tag:{xygel_touch:2b}}},scores={dmg=1..}] at @s run function yutbosses:shared/apply_weapon_effect

# Item set bonus system
function yutbosses:shared/check_set_bonus

# Trader interaction system
function yutbosses:shared/trader_interaction

# Crafting system
function yutbosses:shared/process_craft

# Trader cooldown
function yutbosses:shared/trader_cooldown

# Reset damage scores
scoreboard players set @a[scores={dmg=1..}] dmg 0

# ============================================
# Xy'Gel Boss System
# ============================================

execute if score #xygel_active xygel_active matches 1 run function yutbosses:bosses/xygel/tick
execute if score #xygel_cleanup_timer xygel_cleanup_timer matches 0..599 run function yutbosses:bosses/xygel/cleanup
