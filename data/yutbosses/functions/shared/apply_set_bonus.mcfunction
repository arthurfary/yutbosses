# Shared Apply Set Bonus
# Grants knockback resistance when player equips full armor set

attribute @s minecraft:generic.knockback_resistance modifier add 1-0-0-0-5 "Slime Boss Set Bonus" 1.0 add

execute unless score @s slime_set_active matches 1 run playsound minecraft:block.beacon.power_select player @s ~ ~ ~ 0.5 1.5
execute unless score @s slime_set_active matches 1 run title @s times 10 70 20
execute unless score @s slime_set_active matches 1 run title @s actionbar {"text":"✨ Bônus de Set: Imune a Knockback! ✨","color":"green","bold":true}

scoreboard players set @s slime_set_active 1
