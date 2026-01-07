# Spawna 3 minions nas coordenadas do boss OU na localização atual do boss

# Spawna os 3 adds na posição do boss
execute at @e[type=slime,tag=xygel_boss,limit=1] run tellraw @a {"text":"[DEBUG] Tentando spawnar add 1...","color":"yellow"}
execute at @e[type=slime,tag=xygel_boss,limit=1] run summon slime ~ ~ ~ {Health:5f,Size:1,Tags:["xygel_minion"],Attributes:[{Name:generic.follow_range,Base:35},{Name:generic.attack_damage,Base:1}]}

execute at @e[type=slime,tag=xygel_boss,limit=1] run tellraw @a {"text":"[DEBUG] Tentando spawnar add 2...","color":"yellow"}
execute at @e[type=slime,tag=xygel_boss,limit=1] run summon slime ~ ~ ~ {Health:5f,Size:1,Tags:["xygel_minion"],Attributes:[{Name:generic.follow_range,Base:35},{Name:generic.attack_damage,Base:1}]}

execute at @e[type=slime,tag=xygel_boss,limit=1] run tellraw @a {"text":"[DEBUG] Tentando spawnar add 3...","color":"yellow"}
execute at @e[type=slime,tag=xygel_boss,limit=1] run summon slime ~ ~ ~ {Health:5f,Size:1,Tags:["xygel_minion"],Attributes:[{Name:generic.follow_range,Base:35},{Name:generic.attack_damage,Base:1}]}

# Efeito visual
execute at @e[type=slime,tag=xygel_boss,limit=1] run particle minecraft:slime ~ ~1 ~ 0.5 0.5 0.5 0.1 30 force @a[distance=..50]
execute at @e[type=slime,tag=xygel_boss,limit=1] run playsound minecraft:block.slime_block.place master @a[distance=..50] ~ ~ ~ 1 0.8

# Aviso para jogadores
#tellraw @a[distance=..100] {"text":"⚠️ Slimes menores aparecem!","color":"yellow","bold":true}

#tellraw @a[distance=..100] {"text":"[DEBUG] summon_adds.mcfunction CONCLUÍDO!","color":"aqua","bold":true}
