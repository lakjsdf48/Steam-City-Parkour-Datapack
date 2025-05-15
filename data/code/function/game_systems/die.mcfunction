execute store result storage teleport:macro positions.x double 1 run data get entity @s SpawnX
execute store result storage teleport:macro positions.y double 1 run data get entity @s SpawnY
execute store result storage teleport:macro positions.z double 1 run data get entity @s SpawnZ
execute as @s at @s run function code:game_systems/macro_teleport with storage teleport:macro positions

tellraw @a [{"selector": "@s","color": "red"},{"text": " died.","color": "white"}]
playsound block.note_block.didgeridoo master @s ~ ~ ~ 1 1
scoreboard players add @s deathCounter 1