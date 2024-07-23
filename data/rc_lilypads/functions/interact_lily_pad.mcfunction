# Raycast for the lilypad
execute as @a[advancements={rc_lilypads:right_click_on_lilypad=true}] run scoreboard players set @s lily_pad_range 60
execute as @a[advancements={rc_lilypads:right_click_on_lilypad=true}] at @s positioned ~ ~1 ~ anchored eyes run function rc_lilypads:raycast
# hand it off to another function as the player at the marker
execute as @a[advancements={rc_lilypads:right_click_on_lilypad=true}] at @s at @e[type=marker,tag=lilyPad,limit=1,sort=nearest] align xyz run function rc_lilypads:player_interact
# kill marker
execute as @a[advancements={rc_lilypads:right_click_on_lilypad=true}] at @s as @e[type=minecraft:marker,sort=nearest,tag=lilyPad] at @s align xyz run kill @s
# reset advancement
execute as @a[advancements={rc_lilypads:right_click_on_lilypad=true}] run advancement revoke @s only rc_lilypads:right_click_on_lilypad