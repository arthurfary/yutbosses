# Sistema de timer do boss (roda a cada tick quando boss está ativo)

# Incrementa timer apenas se boss estiver ativo
execute if score #bossActive bossLives matches 1 run scoreboard players add #slimeTimer slimeTimer 1

# Remove slimes pequenos (Size:0) que aparecem da divisão dos minions
# Apenas dentro de 50 blocos do boss para não afetar outros slimes no mapa
execute if score #bossActive bossLives matches 1 as @e[type=slime,tag=xygel_boss,limit=1] at @s run tp @e[type=slime,tag=!xygel_boss,tag=!xygel_minion,nbt={Size:0},distance=..50] ~ -300 ~
# execute if score #bossActive bossLives matches 1 as @e[type=slime,tag=xygel_boss,limit=1] at @s run kill @e[type=slime,tag=!xygel_boss,tag=!xygel_minion,nbt={Size:0},distance=..50]

# Timeout após 30 minutos (36000 ticks)
execute if score #slimeTimer slimeTimer matches 12000.. run function xygel:boss/timeout

# Atualiza boss bar
execute if score #bossActive bossLives matches 1 as @e[type=slime,tag=xygel_boss,limit=1] store result bossbar minecraft:slime value run data get entity @s Health
