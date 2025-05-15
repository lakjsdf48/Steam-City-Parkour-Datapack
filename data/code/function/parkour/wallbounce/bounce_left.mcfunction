summon creeper ^.1 ^-.1 ^ {Fuse:0,ExplosionRadius:2}
effect give @s slow_falling 1 0 true

#scoreboard players add @s jumpCounter 1
scoreboard players add @s bounceCount 1
scoreboard players set @s bounceCooldown 3
execute if score @s bounceCount matches 2.. run scoreboard players set @s bounceCooldown 5
execute if score @s bounceCount matches 2.. run scoreboard players set @s bounceCount 0