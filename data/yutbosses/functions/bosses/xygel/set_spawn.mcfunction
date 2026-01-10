# Xy'Gel Boss - Set Spawn
# Sets the boss spawn location to the executor's current position
# Use: /function yutbosses:bosses/xygel/set_spawn

execute store result score #xygel_spawn_x xygel_config run data get entity @s Pos[0]
execute store result score #xygel_spawn_y xygel_config run data get entity @s Pos[1]
execute store result score #xygel_spawn_z xygel_config run data get entity @s Pos[2]

# Feedback
tellraw @s {"text":""}
tellraw @s [{"text":"✅ Spawn Point configurado em: ","color":"green","bold":true}]
tellraw @s [{"text":"   X: ","color":"gray"},{"score":{"name":"#xygel_spawn_x","objective":"xygel_config"},"color":"white"}]
tellraw @s [{"text":"   Y: ","color":"gray"},{"score":{"name":"#xygel_spawn_y","objective":"xygel_config"},"color":"white"}]
tellraw @s [{"text":"   Z: ","color":"gray"},{"score":{"name":"#xygel_spawn_z","objective":"xygel_config"},"color":"white"}]
tellraw @s {"text":""}

particle minecraft:end_rod ~ ~1 ~ 0.3 0.5 0.3 0.05 50 force @s
playsound minecraft:block.beacon.activate player @s ~ ~ ~ 1 1.5
