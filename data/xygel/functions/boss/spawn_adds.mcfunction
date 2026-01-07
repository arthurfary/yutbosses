
# Sistema de spawn de adds (minions)
# Spawna 3 slimes pequenos a cada 20 segundos (400 ticks)
#

# Spawna os adds DIRETAMENTE (sem chamar outra função)
execute if score #slimeTimer slimeTimer matches 400.. at @e[type=slime,tag=xygel_boss,limit=1] run summon slime ~ ~ ~ {Name:generic.movement_speed,Base:1.4}{Health:20f,Size:1,Tags:["xygel_minion"],Attributes:[{Name:generic.follow_range,Base:35},{Name:generic.attack_damage,Base:3}]}
execute if score #slimeTimer slimeTimer matches 400.. at @e[type=slime,tag=xygel_boss,limit=1] run summon slime ~ ~ ~ {Name:generic.movement_speed,Base:1.4}{Health:20f,Size:1,Tags:["xygel_minion"],Attributes:[{Name:generic.follow_range,Base:35},{Name:generic.attack_damage,Base:3}]}
execute if score #slimeTimer slimeTimer matches 400.. at @e[type=slime,tag=xygel_boss,limit=1] run summon slime ~ ~ ~ {Name:generic.movement_speed,Base:1.4}{Health:20f,Size:1,Tags:["xygel_minion"],Attributes:[{Name:generic.follow_range,Base:35},{Name:generic.attack_damage,Base:3}]}

execute if score #slimeTimer slimeTimer matches 200 at @e[type=slime,tag=xygel_boss,limit=1] run summon slime ~ ~ ~ {Name:generic.movement_speed,Base:1.4}{Health:20f,Size:1,Tags:["xygel_minion"],Attributes:[{Name:generic.follow_range,Base:35},{Name:generic.attack_damage,Base:3}]}
execute if score #slimeTimer slimeTimer matches 200 at @e[type=slime,tag=xygel_boss,limit=1] run summon slime ~ ~ ~ {Name:generic.movement_speed,Base:1.4}{Health:20f,Size:1,Tags:["xygel_minion"],Attributes:[{Name:generic.follow_range,Base:35},{Name:generic.attack_damage,Base:3}]}
execute if score #slimeTimer slimeTimer matches 200 at @e[type=slime,tag=xygel_boss,limit=1] run summon slime ~ ~ ~ {Name:generic.movement_speed,Base:1.4}{Health:20f,Size:1,Tags:["xygel_minion"],Attributes:[{Name:generic.follow_range,Base:35},{Name:generic.attack_damage,Base:3}]}


# Efeitos visuais
#execute if score #slimeTimer slimeTimer matches 400.. at @e[type=slime,tag=xygel_boss,limit=1] run particle minecraft:slime ~ ~1 ~ 0.5 0.5 0.5 0.1 30 force @a[distance=..50]
#execute if score #slimeTimer slimeTimer matches 400.. at @e[type=slime,tag=xygel_boss,limit=1] run playsound minecraft:block.slime_block.place master @a[distance=..50] ~ ~ ~ 1 0.8

# Reseta o timer
execute if score #slimeTimer slimeTimer matches 400.. run scoreboard players set #slimeTimer slimeTimer 0

