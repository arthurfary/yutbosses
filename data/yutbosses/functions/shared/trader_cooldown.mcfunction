# Shared Trader Cooldown
# Decrements trader cooldown score each tick

scoreboard players remove @a[scores={trader_cooldown=1..}] trader_cooldown 1
