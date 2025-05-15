item replace entity @s armor.chest with elytra[damage=428]
scoreboard players set @s elytraTimer 80
execute unless entity @s[tag=hasElytra] run playsound block.note_block.pling master @s ~ ~ ~ 1 0.5
execute unless entity @s[tag=hasElytra] run tellraw @s {"text": "Elytra Equipped!","color": "green"}
execute unless entity @s[tag=hasElytra] run tag @s add hasElytra