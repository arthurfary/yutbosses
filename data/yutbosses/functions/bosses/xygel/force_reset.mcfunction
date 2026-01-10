# Xy'Gel Boss - Force Reset
# Manually resets the boss system (use if stuck in a buggy state)

# Remove all boss entities
tp @e[type=slime,tag=xygel_boss] ~ -300 ~
kill @e[type=slime,tag=xygel_boss]
tp @e[type=slime,tag=xygel_minion] ~ -300 ~
kill @e[type=slime,tag=xygel_minion]
kill @e[type=armor_stand,tag=xygel_spawn_marker]
kill @e[type=armor_stand,tag=xygel_death_marker]

# Reset scoreboards
scoreboard players set #xygel_active xygel_active 0
scoreboard players set #xygel_timer xygel_timer 0
scoreboard players set #xygel_cleanup_timer xygel_cleanup_timer -999

# Hide bossbar
bossbar set minecraft:xygel_hp players

# Feedback
tellraw @s {"text":"✅ Sistema de Boss Xy'Gel resetado com sucesso!","color":"green","bold":true}
playsound minecraft:block.note_block.pling player @s ~ ~ ~ 1 2
