# Xy'Gel Boss - Summon Boss Entity
# Spawns the actual slime entity at configured coordinates

# Load spawn coordinates
execute store result score #x xygel_config run scoreboard players get #xygel_spawn_x xygel_config
execute store result score #y xygel_config run scoreboard players get #xygel_spawn_y xygel_config
execute store result score #z xygel_config run scoreboard players get #xygel_spawn_z xygel_config

# Summon marker armor stand at spawn location
summon armor_stand ~ ~ ~ {Invisible:1b,Marker:1b,Tags:["xygel_spawn_marker"],NoGravity:1b}
execute as @e[type=armor_stand,tag=xygel_spawn_marker,limit=1] store result entity @s Pos[0] double 1 run scoreboard players get #xygel_spawn_x xygel_config
execute as @e[type=armor_stand,tag=xygel_spawn_marker,limit=1] store result entity @s Pos[1] double 1 run scoreboard players get #xygel_spawn_y xygel_config
execute as @e[type=armor_stand,tag=xygel_spawn_marker,limit=1] store result entity @s Pos[2] double 1 run scoreboard players get #xygel_spawn_z xygel_config

# Summon boss at marker location
execute at @e[type=armor_stand,tag=xygel_spawn_marker,limit=1] run summon slime ~ ~ ~ {DeathLootTable:"yutbosses:bosses/xygel/xygel_boss",Health:1000f,Size:6,CustomName:'{"text":"Xy\'Gel, O Primeiro Slime","color":"green","bold":true}',Tags:["xygel_boss"],ArmorItems:[{},{},{},{}],ArmorDropChances:[0.0F,0.0F,0.0F,0.0F],Attributes:[{Name:generic.max_health,Base:1000},{Name:generic.follow_range,Base:40},{Name:generic.movement_speed,Base:0.8},{Name:generic.attack_damage,Base:8}]}

# Cleanup marker
kill @e[type=armor_stand,tag=xygel_spawn_marker]
