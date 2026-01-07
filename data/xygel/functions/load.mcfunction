# Inicializa scoreboards
scoreboard objectives add dmg minecraft.custom:minecraft.damage_dealt
scoreboard objectives add slime_set_active dummy
scoreboard objectives add slime_pieces dummy
scoreboard objectives add slime_nucleos dummy
scoreboard objectives add trader_cooldown dummy
scoreboard objectives add craft_armor trigger


# Scoreboards do sistema de boss
scoreboard objectives add bossLives dummy
scoreboard objectives add slimeTimer dummy
scoreboard objectives add cleanupTimer dummy
scoreboard objectives add bossSpawn dummy

# Carrega configuração de spawn
function xygel:boss/config

# Mensagem de confirmação
tellraw @a [{"text":"[Boss System] ","color":"green","bold":true},{"text":"Sistema de Boss Fight carregado!","color":"gray"}]

# Inicializa variáveis de controle
scoreboard players set #bossActive bossActive 0
scoreboard players set #bossTimer bossTimer 0
scoreboard players set #cleanupTimer cleanupTimer -999

# Enable triggers
scoreboard players enable @a craft_armor

# Confirmação
tellraw @a [{"text":"Xy'Gel ","color":"green","bold":true},{"text":"Datapack carregado com sucesso!","color":"gray"}]
