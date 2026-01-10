# Xy'Gel Boss - Cleanup
# Removes minions and split slimes after boss defeat

# Increment cleanup timer (0-599)
execute if score #xygel_cleanup_timer xygel_cleanup_timer matches 0..599 run scoreboard players add #xygel_cleanup_timer xygel_cleanup_timer 1

# Remove split slimes during cleanup window
execute if score #xygel_cleanup_timer xygel_cleanup_timer matches 1..599 run tp @e[type=slime,tag=!xygel_boss,tag=!xygel_minion] ~ -300 ~

# Final cleanup after 30 seconds (600 ticks)
execute if score #xygel_cleanup_timer xygel_cleanup_timer matches 600 run tp @e[type=slime,tag=xygel_minion] ~ -300 ~
execute if score #xygel_cleanup_timer xygel_cleanup_timer matches 600 run kill @e[type=slime,tag=xygel_minion]
execute if score #xygel_cleanup_timer xygel_cleanup_timer matches 600 run tp @e[type=slime,tag=!xygel_boss,tag=!xygel_minion] ~ -300 ~
execute if score #xygel_cleanup_timer xygel_cleanup_timer matches 600 run kill @e[type=armor_stand,tag=xygel_death_marker]
execute if score #xygel_cleanup_timer xygel_cleanup_timer matches 600 run tellraw @a[distance=..100] {"text":"🧹 Limpeza concluída!","color":"gray"}
execute if score #xygel_cleanup_timer xygel_cleanup_timer matches 600 run scoreboard players set #xygel_cleanup_timer xygel_cleanup_timer -999
