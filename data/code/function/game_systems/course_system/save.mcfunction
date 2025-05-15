#this function saves the player's time to complete a course as an integer of time elapsed, measured in ticks.
#This function uses a macro and should not be messed with.
$execute store result storage course_times $(PlayerId).$(CourseId) int 1 run scoreboard players get @s objectiveTime.Ticks