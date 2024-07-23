execute as @a[advancements={rc_lilypads:left_click_on_lilypad=true}] run scoreboard players set @s lily_pad_range 60
execute as @a[advancements={rc_lilypads:left_click_on_lilypad=true}] at @s positioned ~ ~1 ~ anchored eyes run function rc_lilypads:raycast

execute as @a[advancements={rc_lilypads:left_click_on_lilypad=true}] at @s as @e[type=minecraft:marker,sort=nearest,tag=lilyPad] at @s run setblock ~ ~ ~ air
execute as @a[advancements={rc_lilypads:left_click_on_lilypad=true}] at @s if entity @s[gamemode=survival] as @e[type=minecraft:marker,sort=nearest,tag=lilyPad] at @s align xyz run summon minecraft:item ~.5 ~ ~.5 {Motion:[0d,0.2d,0d],Item:{id:"minecraft:lily_pad"}}

execute as @a[advancements={rc_lilypads:left_click_on_lilypad=true}] at @s as @e[type=minecraft:marker,sort=nearest,tag=lilyPad] at @s run playsound minecraft:block.big_dripleaf.break block @a[distance=..10] ~.5 ~.1 ~.5

execute as @a[advancements={rc_lilypads:left_click_on_lilypad=true}] at @s as @e[type=minecraft:marker,sort=nearest,tag=lilyPad] at @s align xyz run kill @s
execute as @a[advancements={rc_lilypads:left_click_on_lilypad=true}] run advancement revoke @s only rc_lilypads:left_click_on_lilypad