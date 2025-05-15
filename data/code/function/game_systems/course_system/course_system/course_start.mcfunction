execute unless entity @n[tag=courseIdentifier,distance=..1.5] run tellraw @a[tag=is_dev] {"text": "A course is missing an identifier! (or somebody placed a pointless gold block)","color":"red","bold": true}
execute unless entity @n[tag=courseIdentifier,distance=..1.5] run return fail

#execute if entity @s[tag=inCourse] run return fail
#tag @s add inCourse
function code:game_systems/course_system/checkpoint/set_checkpoint