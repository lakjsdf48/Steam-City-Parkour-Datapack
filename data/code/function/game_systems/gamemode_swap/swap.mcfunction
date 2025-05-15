scoreboard players set @s swapGamemode 0
execute unless entity @s[tag=is_dev] run return fail

scoreboard players add @s currentGamemode 1
execute if score @s currentGamemode matches 2.. run scoreboard players set @s currentGamemode 0
execute if score @s currentGamemode matches 1 run gamemode adventure @s
execute if score @s currentGamemode matches 0 run gamemode creative @s