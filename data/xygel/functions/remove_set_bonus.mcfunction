# Remove o modificador de knockback resistance
attribute @s minecraft:generic.knockback_resistance modifier remove 1-0-0-0-5

# Avisa quando o bônus for removido
execute if score @s slime_set_active matches 1 run title @s actionbar {"text":"❌ Bônus de Set Desativado","color":"red"}
execute if score @s slime_set_active matches 1 run playsound minecraft:block.beacon.deactivate player @s ~ ~ ~ 0.3 1

# Reseta o marcador
scoreboard players set @s slime_set_active 0
