#Scoreboards
scoreboard objectives add wallclimbCooldown dummy
scoreboard objectives add vaultCoodlown dummy
scoreboard objectives add bounceCooldown dummy
scoreboard objectives add bounceCount dummy
scoreboard objectives add yHeight dummy
scoreboard objectives add elytraTimer dummy
scoreboard objectives add deathCounter dummy
scoreboard objectives add touchedCheckpoint dummy
scoreboard objectives add checkpointCooldown dummy
scoreboard objectives add jumpCounter minecraft.custom:jump {"text": "Jumps"}
scoreboard objectives add resetCheckpoint trigger
scoreboard objectives add value dummy
scoreboard objectives add yMotion dummy
scoreboard objectives add vulnerable dummy
scoreboard objectives add slideTime dummy

scoreboard objectives add courseId dummy
scoreboard objectives add objectiveTime.Ticks dummy
scoreboard objectives add displayTime.Ticks dummy
scoreboard objectives add displayTime.Seconds dummy
scoreboard objectives add displayTime.Minutes dummy

#triggers
scoreboard objectives add swapGamemode trigger
scoreboard objectives add currentGamemode dummy

#player setup
execute as @a run attribute @s safe_fall_distance base set 4.5
execute as @a run attribute @s jump_strength base set .5

##Gamerules
gamerule doMobSpawning false
gamerule mobGriefing false
gamerule doImmediateRespawn true
gamerule fallDamage false

#world spawn
setworldspawn -20 61 1

#load message
tellraw @a { "color": "gold", "text": "The Code is Load"}
tellraw @a {"text": "Join our discord server!","color": "green","clickEvent": {"action": "open_url","value": "https://discord.gg/8dRKtQZ46Z"},"hoverEvent": {"action": "show_text","contents": {"text": "Click here to join!"}}}