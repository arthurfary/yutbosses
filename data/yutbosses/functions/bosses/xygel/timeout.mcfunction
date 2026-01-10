# Xy'Gel Boss - Timeout
# Triggers when boss survives too long

tellraw @a[distance=..100] {"text":""}
tellraw @a[distance=..100] {"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"red","bold":true}
tellraw @a[distance=..100] {"text":"   ⏰  TEMPO ESGOTADO!  ⏰","color":"dark_red","bold":true}
tellraw @a[distance=..100] {"text":"  Xy'Gel retorna às sombras...","color":"gray","italic":true}
tellraw @a[distance=..100] {"text":"  Nenhuma recompensa foi concedida.","color":"dark_gray","italic":true}
tellraw @a[distance=..100] {"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"red","bold":true}
tellraw @a[distance=..100] {"text":""}

# Failure sound
playsound minecraft:entity.wither.death master @a[distance=..100] ~ ~ ~ 0.5 0.5

# Remove boss and minions
tp @e[type=slime,tag=xygel_boss] ~ -300 ~
kill @e[type=slime,tag=xygel_boss]
tp @e[type=slime,tag=xygel_minion] ~ -300 ~
kill @e[type=slime,tag=xygel_minion]

# Reset system
scoreboard players set #xygel_active xygel_active 0
scoreboard players set #xygel_timer xygel_timer 0
bossbar set minecraft:xygel_hp players
