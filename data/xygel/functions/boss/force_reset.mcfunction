
# Reset manual do sistema (use em caso de bugs)

# Remove todas as entidades do boss
tp @e[type=slime,tag=xygel_boss] ~ -300 ~
kill @e[type=slime,tag=xygel_boss]
tp @e[type=slime,tag=xygel_minion] ~ -300 ~
kill @e[type=slime,tag=xygel_minion]
kill @e[type=armor_stand,tag=boss_spawn_marker]
kill @e[type=armor_stand,tag=adds_spawn_marker]

# Reseta scoreboards
scoreboard players set #bossActive bossLives 0
scoreboard players set #slimeTimer slimeTimer 0
scoreboard players set #cleanupTimer cleanupTimer -999

# Remove boss bar
bossbar set minecraft:slime players

# Confirmação
tellraw @s {"text":"✅ Sistema de Boss resetado com sucesso!","color":"green","bold":true}
tellraw @s [{"text":"Debug: bossActive=","color":"gray"},{"score":{"name":"#bossActive","objective":"bossLives"},"color":"white"}]
tellraw @s [{"text":"Debug: cleanupTimer=","color":"gray"},{"score":{"name":"#cleanupTimer","objective":"cleanupTimer"},"color":"white"}]
playsound minecraft:block.note_block.pling player @s ~ ~ ~ 1 2

