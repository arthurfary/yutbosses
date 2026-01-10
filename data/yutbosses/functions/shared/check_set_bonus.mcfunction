# Shared Set Bonus Check
# Detects players with the full Slime Boss armor set and applies/removes bonuses

# Apply bonus if player has full set
execute as @a[nbt={Inventory:[{Slot:100b,tag:{slimeboss:1b}},{Slot:101b,tag:{slimeboss:1b}},{Slot:102b,tag:{slimeboss:1b}},{Slot:103b,tag:{slimeboss:1b}}]}] run function yutbosses:shared/apply_set_bonus

# Remove bonus from players without full set
execute as @a unless entity @s[nbt={Inventory:[{Slot:100b,tag:{slimeboss:1b}},{Slot:101b,tag:{slimeboss:1b}},{Slot:102b,tag:{slimeboss:1b}},{Slot:103b,tag:{slimeboss:1b}}]}] run function yutbosses:shared/remove_set_bonus
