# Sistema de crafting customizado usando Smithing Table
# Detecta quando o jogador clica com o botão direito segurando núcleos

# Craftar Peitoral (8 núcleos)
execute as @a[nbt={SelectedItem:{id:"minecraft:slime_ball",tag:{slimeboss:1b},Count:8b}}] at @s if block ~ ~-1 ~ minecraft:smithing_table run function xygel:craft_chestplate

# Craftar Calças (7 núcleos)
execute as @a[nbt={SelectedItem:{id:"minecraft:slime_ball",tag:{slimeboss:1b},Count:7b}}] at @s if block ~ ~-1 ~ minecraft:smithing_table run function xygel:craft_leggings

# Craftar Botas (4 núcleos)
execute as @a[nbt={SelectedItem:{id:"minecraft:slime_ball",tag:{slimeboss:1b},Count:4b}}] at @s if block ~ ~-1 ~ minecraft:smithing_table run function xygel:craft_boots
