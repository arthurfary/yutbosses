# Shared Show Trader Menu
# Displays the crafting interface

playsound minecraft:block.enchantment_table.use player @s ~ ~ ~ 1 1.2

tellraw @s {"text":""}
tellraw @s {"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_green","bold":true}
tellraw @s {"text":"   🧪 Artesão de Slime Primordial 🧪","color":"green","bold":true}
tellraw @s {"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_green","bold":true}

execute store result score @s slime_nucleos run clear @s minecraft:slime_ball{slimeboss:1b} 0

tellraw @s [{"text":"  💚 Núcleos Disponíveis: ","color":"gray"},{"score":{"name":"@s","objective":"slime_nucleos"},"color":"green","bold":true}]
tellraw @s {"text":""}

# Chest Plate (8 nucleos)
execute if score @s slime_nucleos matches 8.. run tellraw @s {"text":"  Peitoral de Slime Primordial","color":"green","bold":true}
execute if score @s slime_nucleos matches ..7 run tellraw @s {"text":"  Peitoral de Slime Primordial","color":"dark_gray"}
execute if score @s slime_nucleos matches 8.. run tellraw @s {"text":"  8 Núcleos de Slime Primordial","color":"gray"}
execute if score @s slime_nucleos matches ..7 run tellraw @s {"text":"  8 Núcleos de Slime Primordial","color":"dark_gray"}
execute if score @s slime_nucleos matches 8.. run tellraw @s {"text":"  [CRAFTAR]","color":"yellow","bold":true,"clickEvent":{"action":"run_command","value":"/trigger craft_armor set 1"},"hoverEvent":{"action":"show_text","value":{"text":"Clique para craftar!","color":"gold"}}}
execute if score @s slime_nucleos matches ..7 run tellraw @s {"text":"  [BLOQUEADO]","color":"dark_red","bold":true}
tellraw @s {"text":"  ──────────────────────────","color":"dark_gray"}

# Leggings (7 nucleos)
execute if score @s slime_nucleos matches 7.. run tellraw @s {"text":"  Calças de Slime Primordial","color":"green","bold":true}
execute if score @s slime_nucleos matches ..6 run tellraw @s {"text":"  Calças de Slime Primordial","color":"dark_gray"}
execute if score @s slime_nucleos matches 7.. run tellraw @s {"text":"  7 Núcleos de Slime Primordial","color":"gray"}
execute if score @s slime_nucleos matches ..6 run tellraw @s {"text":"  7 Núcleos de Slime Primordial","color":"dark_gray"}
execute if score @s slime_nucleos matches 7.. run tellraw @s {"text":"  [CRAFTAR]","color":"yellow","bold":true,"clickEvent":{"action":"run_command","value":"/trigger craft_armor set 2"},"hoverEvent":{"action":"show_text","value":{"text":"Clique para craftar!","color":"gold"}}}
execute if score @s slime_nucleos matches ..6 run tellraw @s {"text":"  [BLOQUEADO]","color":"dark_red","bold":true}
tellraw @s {"text":"  ──────────────────────────","color":"dark_gray"}

# Boots (4 nucleos)
execute if score @s slime_nucleos matches 4.. run tellraw @s {"text":"  Botas de Slime Primordial","color":"green","bold":true}
execute if score @s slime_nucleos matches ..3 run tellraw @s {"text":"  Botas de Slime Primordial","color":"dark_gray"}
execute if score @s slime_nucleos matches 4.. run tellraw @s {"text":"  4 Núcleos de Slime Primordial","color":"gray"}
execute if score @s slime_nucleos matches ..3 run tellraw @s {"text":"  4 Núcleos de Slime Primordial","color":"dark_gray"}
execute if score @s slime_nucleos matches 4.. run tellraw @s {"text":"  [CRAFTAR]","color":"yellow","bold":true,"clickEvent":{"action":"run_command","value":"/trigger craft_armor set 3"},"hoverEvent":{"action":"show_text","value":{"text":"Clique para craftar!","color":"gold"}}}
execute if score @s slime_nucleos matches ..3 run tellraw @s {"text":"  [BLOQUEADO]","color":"dark_red","bold":true}
tellraw @s {"text":"  ──────────────────────────","color":"dark_gray"}

# Sword (4 nucleos)
execute if score @s slime_nucleos matches 4.. run tellraw @s {"text":"  Xy'thar, A Lâmina Viscosa","color":"green","bold":true}
execute if score @s slime_nucleos matches ..3 run tellraw @s {"text":"  Xy'thar, A Lâmina Viscosa","color":"dark_gray"}
execute if score @s slime_nucleos matches 4.. run tellraw @s {"text":"  4 Núcleos de Slime Primordial","color":"gray"}
execute if score @s slime_nucleos matches ..3 run tellraw @s {"text":"  4 Núcleos de Slime Primordial","color":"dark_gray"}
execute if score @s slime_nucleos matches 4.. run tellraw @s {"text":"  [CRAFTAR]","color":"yellow","bold":true,"clickEvent":{"action":"run_command","value":"/trigger craft_armor set 4"},"hoverEvent":{"action":"show_text","value":{"text":"Clique para craftar!","color":"gold"}}}
execute if score @s slime_nucleos matches ..3 run tellraw @s {"text":"  [BLOQUEADO]","color":"dark_red","bold":true}

tellraw @s {"text":""}
tellraw @s {"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_green","bold":true}
tellraw @s {"text":""}
