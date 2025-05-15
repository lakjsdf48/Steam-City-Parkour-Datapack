scoreboard players set @s resetCheckpoint 0
scoreboard players set @s touchedCheckpoint 2
scoreboard players set @s courseId 0
tag @s remove inCourse
spawnpoint @s 0 61 -1
title @s actionbar {"text": "Checkpoint Reset","color": "red"}
function code:game_systems/die
execute at @s run playsound block.note_block.didgeridoo master @s ~ ~ ~ 1 1