advancement revoke @s only rc_lilypads:place_lily_pad

scoreboard players set @s lily_pad_range 120
execute positioned ~ ~1 ~ anchored eyes run function rc_lilypads:place_raycast
