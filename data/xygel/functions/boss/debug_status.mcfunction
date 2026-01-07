
# Mostra status do sistema de boss para debug

tellraw @s {"text":""}
tellraw @s {"text":"━━━━━━━ DEBUG STATUS ━━━━━━━","color":"gold","bold":true}
tellraw @s [{"text":"Boss Ativo: ","color":"gray"},{"score":{"name":"#bossActive","objective":"bossLives"},"color":"white"}]
tellraw @s [{"text":"Timer: ","color":"gray"},{"score":{"name":"#slimeTimer","objective":"slimeTimer"},"color":"white"}]
tellraw @s [{"text":"Cleanup Timer: ","color":"gray"},{"score":{"name":"#cleanupTimer","objective":"cleanupTimer"},"color":"white"}]
tellraw @s [{"text":"Spawn X: ","color":"gray"},{"score":{"name":"#boss_x","objective":"bossSpawn"},"color":"white"}]
tellraw @s [{"text":"Spawn Y: ","color":"gray"},{"score":{"name":"#boss_y","objective":"bossSpawn"},"color":"white"}]
tellraw @s [{"text":"Spawn Z: ","color":"gray"},{"score":{"name":"#boss_z","objective":"bossSpawn"},"color":"white"}]
tellraw @s [{"text":"Boss Entities: ","color":"gray"},{"selector":"@e[type=slime,tag=xygel_boss]"}]
tellraw @s [{"text":"Minion Count: ","color":"gray"},{"score":{"name":"@e[type=slime,tag=xygel_minion]","objective":""},"color":"white"}]
tellraw @s {"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"gold","bold":true}
tellraw @s {"text":""}

