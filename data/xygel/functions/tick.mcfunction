
# Apply slowness effect when hitting with the sword (ambas versões)
execute as @a[nbt={SelectedItem:{tag:{xygel_touch:1b}}},scores={dmg=1..}] at @s run function xygel:apply_slowness
execute as @a[nbt={SelectedItem:{tag:{xygel_touch:2b}}},scores={dmg=1..}] at @s run function xygel:apply_slowness


# Sistema de Boss Fight
execute if score #bossActive bossLives matches 1 run function xygel:boss/boss_timer
execute if score #bossActive bossLives matches 1 run function xygel:boss/spawn_adds
function xygel:boss/check_defeat
execute if score #cleanupTimer cleanupTimer matches 0..599 run function xygel:boss/cleanup

# Reset damage score
scoreboard players set @a[scores={dmg=1..}] dmg 0

# Verifica se o jogador está usando o set completo de armadura
function xygel:check_set_bonus

# Sistema de trader - detecta interação
function xygel:trader_interaction

# Processa crafts via trigger
function xygel:process_craft

# Cooldown do trader
function xygel:trader_cooldown

