# Comando principal para iniciar a boss fight
# Use: /function xygel:boss/summon

# Verifica se já existe um boss ativo
execute if score #bossActive bossLives matches 1 run tellraw @a[distance=..50] {"text":"⚠️ Xy'Gel já está ativo!","color":"red","bold":true}
execute if score #bossActive bossLives matches 1 run return 0

# Aviso global
tellraw @a[distance=..100] {"text":""}
tellraw @a[distance=..100] {"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_green","bold":true}
tellraw @a[distance=..100] {"text":"   ⚔️  XY'GEL DESPERTOU!  ⚔️","color":"green","bold":true}
tellraw @a[distance=..100] {"text":"  O Primeiro Slime emerge das profundezas!","color":"gray","italic":true}
tellraw @a[distance=..100] {"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_green","bold":true}
tellraw @a[distance=..100] {"text":""}

# Spawna o boss PRIMEIRO (para garantir que ele existe)
function xygel:boss/summon_boss

# Som dramático e efeitos NA POSIÇÃO DO BOSS
execute at @e[type=slime,tag=xygel_boss,limit=1] run playsound minecraft:entity.ender_dragon.growl master @a ~ ~ ~ 1 0.5
execute at @e[type=slime,tag=xygel_boss,limit=1] run playsound minecraft:entity.wither.spawn master @a ~ ~ ~ 0.5 0.8
execute at @e[type=slime,tag=xygel_boss,limit=1] run particle minecraft:explosion_emitter ~ ~1 ~ 0 0 0 0 1 force
execute at @e[type=slime,tag=xygel_boss,limit=1] run particle minecraft:totem_of_undying ~ ~1 ~ 3 3 3 0.5 200 force

# Ativa sistemas
scoreboard players set #bossActive bossLives 1
scoreboard players set #slimeTimer slimeTimer 0
scoreboard players set #cleanupTimer cleanupTimer 0

# Ativa boss bar para jogadores próximos
bossbar set minecraft:slime players @a[distance=..50]
