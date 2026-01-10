# Xy'Gel Boss - Spawn Adds (Minions)
# Spawns 3 minion slimes periodically

# Spawn minions every 20 seconds (400 ticks)
execute if score #xygel_timer xygel_timer matches 400.. at @e[type=slime,tag=xygel_boss,limit=1] run summon slime ~ ~ ~ {Health:20f,Size:1,Tags:["xygel_minion"],Attributes:[{Name:generic.follow_range,Base:35},{Name:generic.attack_damage,Base:3},{Name:generic.movement_speed,Base:0.8}]}
execute if score #xygel_timer xygel_timer matches 400.. at @e[type=slime,tag=xygel_boss,limit=1] run summon slime ~ ~ ~ {Health:20f,Size:1,Tags:["xygel_minion"],Attributes:[{Name:generic.follow_range,Base:35},{Name:generic.attack_damage,Base:3},{Name:generic.movement_speed,Base:0.8}]}
execute if score #xygel_timer xygel_timer matches 400.. at @e[type=slime,tag=xygel_boss,limit=1] run summon slime ~ ~ ~ {Health:20f,Size:1,Tags:["xygel_minion"],Attributes:[{Name:generic.follow_range,Base:35},{Name:generic.attack_damage,Base:3},{Name:generic.movement_speed,Base:0.8}]}

# Spawn 2 additional minions at 10 seconds
execute if score #xygel_timer xygel_timer matches 200 at @e[type=slime,tag=xygel_boss,limit=1] run summon slime ~ ~ ~ {Health:20f,Size:1,Tags:["xygel_minion"],Attributes:[{Name:generic.follow_range,Base:35},{Name:generic.attack_damage,Base:3},{Name:generic.movement_speed,Base:0.8}]}
execute if score #xygel_timer xygel_timer matches 200 at @e[type=slime,tag=xygel_boss,limit=1] run summon slime ~ ~ ~ {Health:20f,Size:1,Tags:["xygel_minion"],Attributes:[{Name:generic.follow_range,Base:35},{Name:generic.attack_damage,Base:3},{Name:generic.movement_speed,Base:0.8}]}
execute if score #xygel_timer xygel_timer matches 200 at @e[type=slime,tag=xygel_boss,limit=1] run summon slime ~ ~ ~ {Health:20f,Size:1,Tags:["xygel_minion"],Attributes:[{Name:generic.follow_range,Base:35},{Name:generic.attack_damage,Base:3},{Name:generic.movement_speed,Base:0.8}]}

# Reset timer
execute if score #xygel_timer xygel_timer matches 400.. run scoreboard players set #xygel_timer xygel_timer 0
