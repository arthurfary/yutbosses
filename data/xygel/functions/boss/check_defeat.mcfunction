
# Verifica se o boss foi derrotado

# Se boss estava ativo mas não existe mais
execute if score #bossActive bossLives matches 1 unless entity @e[type=slime,tag=xygel_boss] run function xygel:boss/on_defeat

