# Shared Trader Interaction
# Routes trader interactions to boss-specific menu functions

# Xy'Gel Trader
execute as @a[scores={trader_cooldown=0}] at @s if entity @e[type=villager,tag=xygel_trader,distance=..3] run function yutbosses:villagers/bosses/xygel/show_menu

# Add more bosses here:
# execute as @a at @s if entity @e[type=villager,tag=myboss_trader,distance=..3] run function yutbosses:villagers/myboss/show_menu
