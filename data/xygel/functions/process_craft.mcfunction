# Processa o craft quando o jogador clica no menu

# Craft Peitoral (valor 1)
execute as @a[scores={craft_armor=1}] run function xygel:try_craft_chest

# Craft Calças (valor 2)
execute as @a[scores={craft_armor=2}] run function xygel:try_craft_legs

# Craft Botas (valor 3)
execute as @a[scores={craft_armor=3}] run function xygel:try_craft_boot

# Craft Espada (valor 4)
execute as @a[scores={craft_armor=4}] run function xygel:try_craft_sword

# Reset trigger
scoreboard players set @a[scores={craft_armor=1..}] craft_armor 0
scoreboard players enable @a craft_armor
