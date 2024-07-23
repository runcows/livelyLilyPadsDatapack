execute as @a[advancements={rc_lilypads:place_lily_pad=true}] run scoreboard players set @s lily_pad_range 120
execute as @a[advancements={rc_lilypads:place_lily_pad=true}] at @s positioned ~ ~1 ~ anchored eyes run function rc_lilypads:place_raycast
execute as @a[advancements={rc_lilypads:place_lily_pad=true}] run advancement revoke @s only rc_lilypads:place_lily_pad
