
# Define o spawn point do boss na posição atual do jogador
# Use: /function xygel:boss/set_spawn

# Salva coordenadas do executor
execute store result score #boss_x bossSpawn run data get entity @s Pos[0]
execute store result score #boss_y bossSpawn run data get entity @s Pos[1]
execute store result score #boss_z bossSpawn run data get entity @s Pos[2]

# Confirmação
tellraw @s {"text":""}
tellraw @s [{"text":"✅ Spawn Point configurado em: ","color":"green","bold":true}]
tellraw @s [{"text":"   X: ","color":"gray"},{"score":{"name":"#boss_x","objective":"bossSpawn"},"color":"white"}]
tellraw @s [{"text":"   Y: ","color":"gray"},{"score":{"name":"#boss_y","objective":"bossSpawn"},"color":"white"}]
tellraw @s [{"text":"   Z: ","color":"gray"},{"score":{"name":"#boss_z","objective":"bossSpawn"},"color":"white"}]
tellraw @s {"text":""}

# Efeito visual
particle minecraft:end_rod ~ ~1 ~ 0.3 0.5 0.3 0.05 50 force @s
playsound minecraft:block.beacon.activate player @s ~ ~ ~ 1 1.5

