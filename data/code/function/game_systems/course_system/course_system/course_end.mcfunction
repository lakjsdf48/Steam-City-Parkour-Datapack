#clear "inCourse" tag
tag @s remove inCourse

#Save time for this course by saving this courseId and the time, then using a seperate function to save it
execute store result storage course_times tempStorage.CourseId int 1 run scoreboard players get @s courseId
execute store result storage course_times tempStorage.PlayerId int 1 run scoreboard players get @s playerId
function code:game_systems/course_system/save with storage course_times tempStorage

#clear current time
scoreboard players set @s objectiveTime.Ticks 0

#reset checkpoint
function code:game_systems/course_system/checkpoint/reset_checkpoint