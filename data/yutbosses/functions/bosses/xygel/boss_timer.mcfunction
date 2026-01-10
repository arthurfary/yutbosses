# Xy'Gel Boss - Boss Timer
# Handles timing and attack patterns

# Increment timer when boss is active
execute if score #xygel_active xygel_active matches 1 run scoreboard players add #xygel_timer xygel_timer 1

# Remove size:0 slimes (split minions) within 50 blocks
execute if score #xygel_active xygel_active matches 1 as @e[type=slime,tag=xygel_boss,limit=1] at @s run tp @e[type=slime,tag=!xygel_boss,tag=!xygel_minion,nbt={Size:0},distance=..50] ~ -300 ~

# Timeout after 20 minutes (24000 ticks)
execute if score #xygel_timer xygel_timer matches 24000.. run function yutbosses:bosses/xygel/timeout

# Update bossbar
execute if score #xygel_active xygel_active matches 1 as @e[type=slime,tag=xygel_boss,limit=1] store result bossbar minecraft:xygel_hp value run data get entity @s Health

# Manage death marker
execute if score #xygel_active xygel_active matches 1 as @e[type=slime,tag=xygel_boss,limit=1] at @s unless entity @e[type=armor_stand,tag=xygel_death_marker] run summon armor_stand ~ ~ ~ {Invisible:1b,Marker:1b,Tags:["xygel_death_marker"],NoGravity:1b}
execute if score #xygel_active xygel_active matches 1 as @e[type=slime,tag=xygel_boss,limit=1] at @s if entity @e[type=armor_stand,tag=xygel_death_marker] run tp @e[type=armor_stand,tag=xygel_death_marker,limit=1] ~ ~ ~
