
# Executado quando o tempo limite é atingido (boss desaparece)

# Anúncio de timeout
tellraw @a[distance=..100] {"text":""}
tellraw @a[distance=..100] {"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"red","bold":true}
tellraw @a[distance=..100] {"text":"   ⏰  TEMPO ESGOTADO!  ⏰","color":"dark_red","bold":true}
tellraw @a[distance=..100] {"text":"  Xy'Gel retorna às sombras...","color":"gray","italic":true}
tellraw @a[distance=..100] {"text":"  Nenhuma recompensa foi concedida.","color":"dark_gray","italic":true}
tellraw @a[distance=..100] {"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"red","bold":true}
tellraw @a[distance=..100] {"text":""}

# Som de falha
playsound minecraft:entity.wither.death master @a[distance=..100] ~ ~ ~ 0.5 0.5

# Remove boss sem dar loot
tp @e[type=slime,tag=xygel_boss] ~ -300 ~
kill @e[type=slime,tag=xygel_boss]

# Remove todos os minions
tp @e[type=slime,tag=xygel_minion] ~ -300 ~
kill @e[type=slime,tag=xygel_minion]

# Reseta sistema
scoreboard players set #bossActive bossLives 0
scoreboard players set #slimeTimer slimeTimer 0
bossbar set minecraft:slime players

