# Xy'Gel Boss - Summon (Main Entry Point)
# Use: /function yutbosses:bosses/xygel/summon

# Check if boss is already active
execute if score #xygel_active xygel_active matches 1 run tellraw @a[distance=..50] {"text":"⚠️ Xy'Gel já está ativo!","color":"red","bold":true}
execute if score #xygel_active xygel_active matches 1 run return 0

# Global announcement
tellraw @a[distance=..100] {"text":""}
tellraw @a[distance=..100] {"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_green","bold":true}
tellraw @a[distance=..100] {"text":"   ⚔️  XY'GEL DESPERTOU!  ⚔️","color":"green","bold":true}
tellraw @a[distance=..100] {"text":"  O Primeiro Slime emerge das profundezas!","color":"gray","italic":true}
tellraw @a[distance=..100] {"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_green","bold":true}
tellraw @a[distance=..100] {"text":""}

# Spawn the boss
function yutbosses:bosses/xygel/summon_boss

# Sound and visual effects at boss location
execute at @e[type=slime,tag=xygel_boss,limit=1] run playsound minecraft:entity.ender_dragon.growl master @a ~ ~ ~ 1 0.5
execute at @e[type=slime,tag=xygel_boss,limit=1] run playsound minecraft:entity.wither.spawn master @a ~ ~ ~ 0.5 0.8
execute at @e[type=slime,tag=xygel_boss,limit=1] run particle minecraft:explosion_emitter ~ ~1 ~ 0 0 0 0 1 force
execute at @e[type=slime,tag=xygel_boss,limit=1] run particle minecraft:totem_of_undying ~ ~1 ~ 3 3 3 0.5 200 force

# Activate systems
scoreboard players set #xygel_active xygel_active 1
scoreboard players set #xygel_timer xygel_timer 0
scoreboard players set #xygel_cleanup_timer xygel_cleanup_timer 0

# Create bossbar if it doesn't exist, and show it
bossbar add minecraft:xygel_hp "Xy'Gel, O Primeiro Slime"
bossbar set minecraft:xygel_hp max 1000
bossbar set minecraft:xygel_hp color green
bossbar set minecraft:xygel_hp style notched_10
bossbar set minecraft:xygel_hp players @a[distance=..50]
