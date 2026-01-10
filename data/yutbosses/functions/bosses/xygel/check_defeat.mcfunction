# Xy'Gel Boss - Check Defeat
# Checks if the boss is defeated and runs on_defeat at the marker location

# When boss no longer exists, run on_defeat at the marker location (if present)
execute if score #xygel_active xygel_active matches 1 unless entity @e[type=slime,tag=xygel_boss] at @e[type=armor_stand,tag=xygel_death_marker,limit=1] run function yutbosses:bosses/xygel/on_defeat
