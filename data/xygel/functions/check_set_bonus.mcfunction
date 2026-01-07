# Detecta jogadores com o set completo de Slime Boss
execute as @a[nbt={Inventory:[{Slot:100b,tag:{slimeboss:1b}},{Slot:101b,tag:{slimeboss:1b}},{Slot:102b,tag:{slimeboss:1b}},{Slot:103b,tag:{slimeboss:1b}}]}] run function xygel:apply_set_bonus

# Remove o atributo de jogadores que não têm o set completo
execute as @a unless entity @s[nbt={Inventory:[{Slot:100b,tag:{slimeboss:1b}},{Slot:101b,tag:{slimeboss:1b}},{Slot:102b,tag:{slimeboss:1b}},{Slot:103b,tag:{slimeboss:1b}}]}] run function xygel:remove_set_bonus
