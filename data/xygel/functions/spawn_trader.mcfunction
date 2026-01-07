# Spawna o Artesão de Slime
# Use: /function toque_xygel:spawn_trader

# Verifica se já existe um trader
execute if entity @e[type=villager,tag=slime_trader] run tellraw @s {"text":"⚠️ O Artesão de Slime já existe!","color":"red"}
execute if entity @e[type=villager,tag=slime_trader] run return 0

# Spawna o trader na posição do jogador
summon villager ~ ~ ~ {CustomName:'{"text":"Artesão de Slime","color":"green","bold":true}',CustomNameVisible:1b,NoAI:1b,Invulnerable:1b,PersistenceRequired:1b,Tags:["slime_trader"],VillagerData:{profession:"minecraft:armorer",level:5,type:"minecraft:swamp"},Offers:{Recipes:[]},Attributes:[{Name:"generic.max_health",Base:1024}]}

# Efeitos visuais
particle minecraft:happy_villager ~ ~1 ~ 0.5 1 0.5 0.1 30 force
playsound minecraft:entity.villager.yes master @a ~ ~ ~ 1 1

# Confirmação
tellraw @s {"text":"✅ Artesão de Slime spawnado com sucesso!","color":"green","bold":true}
