# Verifica a vida do boss e gerencia mecânicas baseadas em vida

# Atualiza a vida atual do boss
execute as @e[type=slime,tag=xygel_boss,limit=1] store result score #bossHealth bossLives run data get entity @s Health

# Atualiza boss bar
execute as @e[type=slime,tag=xygel_boss,limit=1] store result bossbar minecraft:slime value run scoreboard players get #bossHealth bossLives

# ════════════════════════════════════════
# FASES DO BOSS (baseadas em vida)
# ════════════════════════════════════════

# Fase 3: 75% vida (750 HP) - Boss entra em modo agressivo
# execute if score #bossHealth bossLives matches 750 run function xygel:boss/phase_75

# Fase 2: 50% vida (500 HP) - Boss fica mais rápido
# execute if score #bossHealth bossLives matches 500 run function xygel:boss/phase_50

# Fase 1: 25% vida (250 HP) - Boss entra em fúria
# execute if score #bossHealth bossLives matches 250 run function xygel:boss/phase_25

# ════════════════════════════════════════
# DETECÇÃO DE DERROTA
# ════════════════════════════════════════

# Se vida <= 0, boss foi derrotado
execute if score #bossHealth bossLives matches ..0 run function xygel:boss/on_defeat
