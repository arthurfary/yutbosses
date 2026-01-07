# Debug message
# tellraw @s {"text":"[DEBUG] Applying slowness effect","color":"gold"}

# Apply slowness to recently hit entities (including players, but not the attacker)
effect give @e[distance=0.1..6,nbt={HurtTime:10s}] minecraft:slowness 2 2 true

# Visual feedback: particles at hit location
execute at @e[distance=0.1..6,nbt={HurtTime:10s}] run particle minecraft:dust 0.2 0.5 0.2 1 ~ ~1 ~ 0.3 0.5 0.3 0.02 20 force

# Audio feedback: sound effect
execute at @e[distance=0.1..6,nbt={HurtTime:10s}] run playsound minecraft:block.amethyst_block.chime player @a ~ ~ ~ 1 0.8

# Additional debug to show affected entities
# execute as @e[distance=0.1..6,nbt={HurtTime:10s}] run tellraw @a[distance=..10] {"text":"[DEBUG] Entity affected!","color":"green"}
