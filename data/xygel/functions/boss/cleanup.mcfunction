
# Sistema de limpeza (remove adds 30 segundos após derrota)

# Incrementa timer de cleanup APENAS se timer está entre 0 e 599
execute if score #cleanupTimer cleanupTimer matches 0..599 run scoreboard players add #cleanupTimer cleanupTimer 1

# Remove slimes que se dividiram DURANTE o cleanup
execute if score #cleanupTimer cleanupTimer matches 1..599 run tp @e[type=slime,tag=!xygel_boss,tag=!xygel_minion] ~ -300 ~

# Após 30 segundos (600 ticks), remove todos os minions
execute if score #cleanupTimer cleanupTimer matches 600 run tp @e[type=slime,tag=xygel_minion] ~ -300 ~
execute if score #cleanupTimer cleanupTimer matches 600 run kill @e[type=slime,tag=xygel_minion]
execute if score #cleanupTimer cleanupTimer matches 600 run tp @e[type=slime,tag=!xygel_boss,tag=!xygel_minion] ~ -300 ~
execute if score #cleanupTimer cleanupTimer matches 600 run tellraw @a[distance=..100] {"text":"🧹 Limpeza concluída!","color":"gray"}
execute if score #cleanupTimer cleanupTimer matches 600 run scoreboard players set #cleanupTimer cleanupTimer -999

