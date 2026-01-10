# Xy'Gel Villagers - Spawn Trader
# Spawns the "Artesão de Slime" villager at current location
# Use: /function yutbosses:villagers/xygel/spawn_trader

summon villager ~ ~ ~ {CustomName:'{"text":"Artesão de Slime","color":"green","bold":true}',CustomNameVisible:1b,NoAI:1b,Invulnerable:1b,PersistenceRequired:1b,Tags:["xygel_trader"],VillagerData:{profession:"minecraft:armorer",level:5,type:"minecraft:swamp"},Attributes:[{Name:"generic.max_health",Base:1024}]}

tellraw @s {"text":"✅ Artesão de Slime spawned!","color":"green","bold":true}
playsound minecraft:entity.villager.yes player @s ~ ~ ~ 1 1
