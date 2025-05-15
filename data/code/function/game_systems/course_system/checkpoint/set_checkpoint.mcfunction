execute unless score @s touchedCheckpoint matches 1.. run playsound block.note_block.pling master @s ~ ~ ~ 1 1
scoreboard players set @s touchedCheckpoint 2
scoreboard players set @s checkpointCooldown 200

spawnpoint @s ~ ~ ~
title @s actionbar {"text": "Checkpoint","color": "gold"}