setblock ~ ~-1 ~ gold_block
summon marker ~ ~ ~ {Tags:["courseIdentifier"]}
execute at @s run function code:game_systems/course_system/course_system/course_id
tp @s ~ ~-400 ~

summon text_display ~ ~.75 ~ {alignment:"center",billboard:"center",Tags:["title"],text:'"Course Name"',transformation:{translation:[0,1,0],left_rotation:[0,0,0,1],right_rotation:[0,0,0,1],scale:[1,1,1]}}
summon text_display ~ ~ ~ {alignment:"center",billboard:"center",Tags:["author"],text:'"Author"',transformation:{translation:[0,1,0],left_rotation:[0,0,0,1],right_rotation:[0,0,0,1],scale:[1,1,1]}}