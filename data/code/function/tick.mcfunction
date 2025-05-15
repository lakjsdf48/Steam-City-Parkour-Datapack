##Setting stuff
execute as @a store result score @s yHeight run data get entity @s Pos[1] 1
execute as @a[scores={yHeight=..40}] run function code:game_systems/die

scoreboard players set @a[tag=is_dev,gamemode=creative] currentGamemode 0
scoreboard players set @a[tag=is_dev,gamemode=adventure] currentGamemode 1
scoreboard players enable @a[tag=is_dev] swapGamemode
execute as @a if score @s swapGamemode matches 1.. run function code:game_systems/gamemode_swap/swap

execute as @a[tag=!is_dev] run attribute @s block_interaction_range base set 0
execute as @a[tag=!is_dev] run attribute @s entity_interaction_range base set 0

execute as @a[tag=is_dev] run attribute @s block_interaction_range base set 4.5
execute as @a[tag=is_dev] run attribute @s entity_interaction_range base set 4.5

effect give @a saturation infinite 255 true
effect give @a resistance infinite 255 true

###Game Code

##Course System
#Player Ids
execute as @a unless score @s playerId matches -2147483648..2147483647 run function code:game_systems/course_system/course_system/assign_player_id

#Course Timer
scoreboard players add @a[tag=inCourse] objectiveTime.Ticks 1

#Checkpoints
execute as @a at @s if block ~ ~-1 ~ #code:checkpoints/full/start run function code:game_systems/course_system/course_system/course_start
execute as @a at @s if block ~ ~-1 ~ #code:checkpoints/full/end run function code:game_systems/course_system/course_system/course_end

#Mini-Checkpoints
execute as @a at @s if block ~ ~-1 ~ #code:checkpoints/mini/checkpoint run function code:game_systems/course_system/checkpoint/set_checkpoint
scoreboard players remove @a[scores={touchedCheckpoint=1..,checkpointCooldown=..0}] touchedCheckpoint 1
scoreboard players remove @a[scores={checkpointCooldown=1..}] checkpointCooldown 1

scoreboard players enable @a resetCheckpoint
execute as @a at @s if block ~ ~-1 ~ #code:checkpoints/mini/checkpoint_reset run function code:game_systems/course_system/checkpoint/reset_checkpoint
execute as @a[scores={resetCheckpoint=1..}] run function code:game_systems/course_system/checkpoint/reset_checkpoint

#Course Builder
execute as @e[tag=courseStarter] at @s align xyz positioned ~.5 ~ ~.5 run function code:game_systems/course_system/course_system/create_course_start
#scoreboard players reset @a courseId
execute as @e[tag=courseIdentifier] at @s unless block ~ ~-.25 ~ #code:checkpoints/full/start run function dev:course_stuff/clear_identifier

##Custom Block Effects
#Kill Blocks
execute as @a at @s if block ~ ~ ~ #code:kill_blocks/player run function code:game_systems/die
execute as @a at @s if block ~ ~-.25 ~ #code:kill_blocks/player run function code:game_systems/die

#Jump Block
execute as @a at @s if block ~ ~-1 ~ #code:block_effects/jump_block run effect give @s jump_boost 1 4 false

#Glide Block
execute as @a at @s if block ~ ~-1 ~ #code:block_effects/glide_block run function code:block_effects/glide_block/give_elytra
scoreboard players remove @a[scores={elytraTimer=1..}] elytraTimer 1
clear @a[scores={elytraTimer=..0}] elytra
clear @a elytra[damage=431]
tag @a[scores={elytraTimer=..0}] remove hasElytra

##PARKOUR
#wallclimb
execute as @a unless score @s wallclimbCooldown matches 1.. at @s if block ~ ~-.5 ~ air anchored eyes unless block ^ ^-1 ^.5 #code:forbidden/climb unless block ^ ^ ^.5 #code:forbidden/climb if block ^ ^.5 ^.5 air if predicate code:is_sneaking at @s run function code:parkour/wallgrab/climb
scoreboard players remove @a[scores={wallclimbCooldown=1..}] wallclimbCooldown 1

execute as @a[tag=wallclimbing] at @s anchored eyes if block ^ ^-1 ^.4 air run function code:parkour/wallgrab/climb_cancel

#Slide
execute as @a if predicate code:is_sneaking if predicate code:is_sprinting unless score @s slideTime matches 1.. run function code:parkour/slide/slide
execute as @a if predicate code:is_sprinting unless predicate code:is_sneaking if score @s slideTime matches 1.. run function code:parkour/slide/cancel_slide
execute as @a unless predicate code:is_sprinting if predicate code:is_sneaking if score @s slideTime matches 1.. run function code:parkour/slide/cancel_slide
execute as @a unless predicate code:is_sprinting unless predicate code:is_sneaking if score @s slideTime matches 1.. run function code:parkour/slide/cancel_slide
execute as @a[scores={slideTime=0}] run function code:parkour/slide/cancel_slide
effect give @a[scores={slideTime=1..}] speed 1 4 true
scoreboard players remove @a[scores={slideTime=1..}] slideTime 1

#Roll
#scoreboard players set -12 value -12
#execute as @a store result score @s yMotion run data get entity @s Motion[1] 10
#scoreboard players set @a vulnerable 0
#execute as @a if score @s yMotion <= -12 value run scoreboard players set @s vulnerable 1
#execute as @a[scores={vulnerable=1..}] at @s unless block ~ ~-1 ~ #code:fall_damage_blocks/air run function code:game_systems/die

#Vault
execute as @a unless score @s vaultCoodlown matches 1.. at @s if block ~ ~ ~ air if block ~ ~1 ~ air anchored eyes rotated ~ 0 unless block ^ ^ ^1 #code:forbidden/vault unless block ^ ^-1 ^1 #code:forbidden/vault if block ^ ^0.5 ^1 air if predicate code:is_sprinting run function code:parkour/vault/vault
scoreboard players remove @a[scores={vaultCoodlown=1..}] vaultCoodlown 1

#Wallbounce
#left
execute as @a unless score @s bounceCooldown matches 1.. at @s if block ~ ~ ~ air if block ~ ~-.5 ~ air if block ~ ~1 ~ air anchored eyes rotated ~ 0 if block ^ ^ ^1 air if block ^ ^-1 ^1 air unless block ^1 ^-1 ^ #code:forbidden/bounce if predicate code:is_sneaking run function code:parkour/wallbounce/bounce_left
scoreboard players remove @a[scores={bounceCooldown=1..}] bounceCooldown 1

#right
execute as @a unless score @s bounceCooldown matches 1.. at @s if block ~ ~ ~ air if block ~ ~-.5 ~ air if block ~ ~1 ~ air anchored eyes rotated ~ 0 if block ^ ^ ^1 air if block ^ ^-1 ^1 air unless block ^-1 ^-1 ^ #code:forbidden/bounce if predicate code:is_sneaking run function code:parkour/wallbounce/bounce_right
scoreboard players remove @a[scores={bounceCooldown=1..}] bounceCooldown 1