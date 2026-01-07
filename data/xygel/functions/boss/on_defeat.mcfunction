
# Executado quando o boss é derrotado

# Anúncio de vitória
tellraw @a[distance=..100] {"text":""}
tellraw @a[distance=..100] {"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"gold","bold":true}
tellraw @a[distance=..100] {"text":"   🏆  XY'GEL FOI DERROTADO!  🏆","color":"yellow","bold":true}
tellraw @a[distance=..100] {"text":"  O Primeiro Slime retorna às profundezas...","color":"gray","italic":true}
tellraw @a[distance=..100] {"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"gold","bold":true}
tellraw @a[distance=..100] {"text":""}

# Sons de vitória
playsound minecraft:ui.toast.challenge_complete master @a[distance=..100] ~ ~ ~ 1 1
playsound minecraft:entity.player.levelup master @a[distance=..100] ~ ~ ~ 1 0.8

# Efeitos visuais
execute at @e[type=slime,tag=xygel_boss,limit=1,sort=nearest] run particle minecraft:totem_of_undying ~ ~1 ~ 2 2 2 0.3 100 force @a[distance=..100]
execute at @e[type=slime,tag=xygel_boss,limit=1,sort=nearest] run particle minecraft:explosion_emitter ~ ~1 ~ 0 0 0 0 3 force @a[distance=..100]

# Inicia cleanup
scoreboard players set #cleanupTimer cleanupTimer 0
scoreboard players set #bossActive bossLives 0

# Remove boss bar
bossbar set minecraft:slime players

