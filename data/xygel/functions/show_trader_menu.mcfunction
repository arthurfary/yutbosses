# Cooldown para não spammar o chat
execute unless score @s trader_cooldown matches 1.. run function xygel:display_trader_menu
scoreboard players set @s trader_cooldown 100
