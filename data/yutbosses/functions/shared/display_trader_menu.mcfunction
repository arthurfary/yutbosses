# Shared Display Trader Menu
# Generic cooldown handler - routes to boss-specific menu

execute unless score @s trader_cooldown matches 1.. run function yutbosses:villagers/xygel/show_menu
scoreboard players set @s trader_cooldown 100
