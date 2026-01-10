# Shared Process Craft
# Routes crafting requests to appropriate handlers

execute as @a[scores={craft_armor=1}] run function yutbosses:bosses/xygel/craft/try_craft_chest
execute as @a[scores={craft_armor=2}] run function yutbosses:bosses/xygel/craft/try_craft_legs
execute as @a[scores={craft_armor=3}] run function yutbosses:bosses/xygel/craft/try_craft_boot
execute as @a[scores={craft_armor=4}] run function yutbosses:bosses/xygel/craft/try_craft_sword

scoreboard players set @a[scores={craft_armor=1..}] craft_armor 0
scoreboard players enable @a craft_armor
