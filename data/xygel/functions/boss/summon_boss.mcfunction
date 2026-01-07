
# Spawna o boss Xy'Gel nas coordenadas configuradas

# Usa as coordenadas salvas diretamente no comando execute
execute store result score #x bossSpawn run scoreboard players get #boss_x bossSpawn
execute store result score #y bossSpawn run scoreboard players get #boss_y bossSpawn  
execute store result score #z bossSpawn run scoreboard players get #boss_z bossSpawn

# Teleporta uma armor stand invisível para as coordenadas e spawna o boss lá
summon armor_stand ~ ~ ~ {Invisible:1b,Marker:1b,Tags:["boss_spawn_marker"],NoGravity:1b}
execute as @e[type=armor_stand,tag=boss_spawn_marker,limit=1] store result entity @s Pos[0] double 1 run scoreboard players get #boss_x bossSpawn
execute as @e[type=armor_stand,tag=boss_spawn_marker,limit=1] store result entity @s Pos[1] double 1 run scoreboard players get #boss_y bossSpawn
execute as @e[type=armor_stand,tag=boss_spawn_marker,limit=1] store result entity @s Pos[2] double 1 run scoreboard players get #boss_z bossSpawn
execute at @e[type=armor_stand,tag=boss_spawn_marker,limit=1] run summon slime ~ ~ ~ {DeathLootTable:"xygel:entities/xygel_boss",Health:1000f,Size:6,CustomName:'{"text":"Xy\'Gel, O Primeiro Slime","color":"green","bold":true}',Tags:["xygel_boss"],ArmorItems:[{},{},{},{}],ArmorDropChances:[0.0F,0.0F,0.0F,0.0F],Attributes:[{Name:generic.max_health,Base:1000},{Name:generic.follow_range,Base:40},{Name:generic.movement_speed,Base:0.8},{Name:generic.attack_damage,Base:8}]}
kill @e[type=armor_stand,tag=boss_spawn_marker]

