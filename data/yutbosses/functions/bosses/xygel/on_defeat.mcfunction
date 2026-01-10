# Xy'Gel Boss - On Defeat
# Triggers when the boss is defeated
# Called from check_defeat at the boss death location

tellraw @a {"text":""}

# Victory announcement (broadcast to all players)
 
tellraw @a {"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"gold","bold":true}
tellraw @a {"text":"   🏆  XY'GEL FOI DERROTADO!  🏆","color":"yellow","bold":true}
tellraw @a {"text":"  O Primeiro Slime retorna às profundezas...","color":"gray","italic":true}
tellraw @a {"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"gold","bold":true}
tellraw @a {"text":""}

# Victory sounds at death location
playsound minecraft:ui.toast.challenge_complete master @a ~ ~ ~ 10 1
playsound minecraft:entity.player.levelup master @a ~ ~ ~ 10 0.8

# Victory particles at death location
particle minecraft:totem_of_undying ~ ~1 ~ 2 2 2 0.3 100 force @a
particle minecraft:explosion_emitter ~ ~1 ~ 0 0 0 0 3 force @a

# Initialize cleanup
scoreboard players set #xygel_cleanup_timer xygel_cleanup_timer 0
scoreboard players set #xygel_active xygel_active 0

# Hide bossbar
bossbar set minecraft:xygel_hp players

# Cleanup marker
kill @e[type=armor_stand,tag=xygel_death_marker]
