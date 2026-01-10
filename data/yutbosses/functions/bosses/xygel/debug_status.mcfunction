# Xy'Gel Boss - Debug Status
# Shows current system status for debugging

tellraw @s {"text":""}
tellraw @s {"text":"━━━━━━━ DEBUG STATUS ━━━━━━━","color":"gold","bold":true}
tellraw @s [{"text":"Boss Ativo: ","color":"gray"},{"score":{"name":"#xygel_active","objective":"xygel_active"},"color":"white"}]
tellraw @s [{"text":"Timer: ","color":"gray"},{"score":{"name":"#xygel_timer","objective":"xygel_timer"},"color":"white"}]
tellraw @s [{"text":"Cleanup Timer: ","color":"gray"},{"score":{"name":"#xygel_cleanup_timer","objective":"xygel_cleanup_timer"},"color":"white"}]
tellraw @s [{"text":"Spawn X: ","color":"gray"},{"score":{"name":"#xygel_spawn_x","objective":"xygel_config"},"color":"white"}]
tellraw @s [{"text":"Spawn Y: ","color":"gray"},{"score":{"name":"#xygel_spawn_y","objective":"xygel_config"},"color":"white"}]
tellraw @s [{"text":"Spawn Z: ","color":"gray"},{"score":{"name":"#xygel_spawn_z","objective":"xygel_config"},"color":"white"}]
tellraw @s [{"text":"Boss Entities: ","color":"gray"},{"selector":"@e[type=slime,tag=xygel_boss]"}]
tellraw @s {"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"gold","bold":true}
tellraw @s {"text":""}
