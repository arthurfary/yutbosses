# Verifica se o jogador está perto do trader
execute at @s unless entity @e[type=villager,tag=slime_trader,distance=..10] run tellraw @s {"text":"❌ Você precisa estar perto do Artesão de Slime!","color":"red"}
execute at @s unless entity @e[type=villager,tag=slime_trader,distance=..10] run return 0

# Verifica se tem núcleos suficientes
execute store result score @s slime_nucleos run clear @s minecraft:slime_ball{slimeboss:1b} 0
execute if score @s slime_nucleos matches ..3 run tellraw @s {"text":"❌ Núcleos insuficientes! Necessário: 4","color":"red"}
execute if score @s slime_nucleos matches ..3 run playsound minecraft:entity.villager.no player @s ~ ~ ~ 1 1
execute if score @s slime_nucleos matches ..3 run return 0

# Remove 4 núcleos
clear @s minecraft:slime_ball{slimeboss:1b} 4

# Dá as Botas
give @s minecraft:leather_boots{display:{Name:'{"text":"Botas de Slime Primordial","color":"green","bold":true}',color:8439583, Lore:['{"text":"Indestrutível","italic":false,"color":"gray"}']},slimeboss:1b,Unbreakable:1b,HideFlags:4,Enchantments:[{id:"minecraft:protection",lvl:8s}]}

# Efeitos
particle minecraft:totem_of_undying ~ ~1 ~ 0.5 0.5 0.5 0.1 50 force @a[distance=..32]
particle minecraft:happy_villager ~ ~1 ~ 0.3 0.5 0.3 0.1 30 force @a[distance=..32]
playsound minecraft:entity.villager.yes player @a ~ ~ ~ 1 1
playsound minecraft:block.enchantment_table.use player @a ~ ~ ~ 1 1.2
execute as @e[type=villager,tag=slime_trader,distance=..10,limit=1] at @s run particle minecraft:happy_villager ~ ~2 ~ 0.3 0.3 0.3 0 10 force @a[distance=..32]

# Mensagem de sucesso
tellraw @s {"text":"✨ Botas de Slime Primordial craftadas!","color":"green","bold":true}
