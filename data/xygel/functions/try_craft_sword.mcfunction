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

# Dá a Espada
give @s minecraft:iron_sword{display:{Name:'{"text":"Xy\'thar, A Lâmina Viscosa","color":"green","bold":true}',Lore:['{"text":"Toque de Xy\'Gel","italic":false,"color":"gray"}','{"text":""}','{"text":"\\"…Mas ainda não terminamos, Syx\'a. Há coisas que ainda se movem.\\"","color":"gold","italic":true}','{"text":"— Xy\'Gel, O Primeiro Slime, nas Profundezas Estagnadas","color":"gold","italic":true}']},Damage:0,xygel_touch:2b,Enchantments:[{id:"minecraft:sharpness",lvl:8s},{id:"minecraft:unbreaking",lvl:5s}]}

# Efeitos
particle minecraft:totem_of_undying ~ ~1 ~ 0.5 0.5 0.5 0.1 50 force @a[distance=..32]
particle minecraft:happy_villager ~ ~1 ~ 0.3 0.5 0.3 0.1 30 force @a[distance=..32]
playsound minecraft:entity.villager.yes player @a ~ ~ ~ 1 1
playsound minecraft:block.enchantment_table.use player @a ~ ~ ~ 1 1.2
execute as @e[type=villager,tag=slime_trader,distance=..10,limit=1] at @s run particle minecraft:happy_villager ~ ~2 ~ 0.3 0.3 0.3 0 10 force @a[distance=..32]

# Mensagem de sucesso
tellraw @s {"text":"✨ Xy'thar, A Lâmina Viscosa craftada!","color":"green","bold":true}
