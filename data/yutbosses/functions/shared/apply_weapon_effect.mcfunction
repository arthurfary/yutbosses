# Shared Weapon Effect - Apply slowness to enemies hit with special weapons
# Applied when entity with xygel_touch tag deals damage

# Apply slowness to recently hit entities nearby
effect give @e[distance=0.1..6,nbt={HurtTime:10s}] minecraft:slowness 2 2 true

# Visual feedback: particles at hit location
execute at @e[distance=0.1..6,nbt={HurtTime:10s}] run particle minecraft:dust 0.2 0.5 0.2 1 ~ ~1 ~ 0.3 0.5 0.3 0.02 20 force

# Audio feedback
execute at @e[distance=0.1..6,nbt={HurtTime:10s}] run playsound minecraft:block.amethyst_block.chime player @a ~ ~ ~ 1 0.8
