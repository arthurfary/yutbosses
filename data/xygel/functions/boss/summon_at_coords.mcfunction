
# Função auxiliar para spawnar com coordenadas do storage

# Spawna o boss
execute store result score #x bossSpawn run data get storage xygel:boss spawn_x
execute store result score #y bossSpawn run data get storage xygel:boss spawn_y
execute store result score #z bossSpawn run data get storage xygel:boss spawn_z

execute in minecraft:overworld positioned as @s run summon slime ~ ~ ~ {DeathLootTable:"xygel:entities/xygel_boss",Health:1000f,Size:6,CustomName:'{"text":"Xy\'Gel, O Primeiro Slime","color":"green","bold":true}',Tags:["xygel_boss"],ArmorItems:[{},{},{},{}],ArmorDropChances:[0.0F,0.0F,0.0F,0.0F],Attributes:[{Name:generic.max_health,Base:1000},{Name:generic.follow_range,Base:40},{Name:generic.movement_speed,Base:0.4},{Name:generic.attack_damage,Base:8}]}
