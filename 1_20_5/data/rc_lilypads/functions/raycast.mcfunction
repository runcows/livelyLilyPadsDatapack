# if lilypad found summon marker
execute if block ~ ~ ~ minecraft:lily_pad align xyz run summon minecraft:marker ~ ~ ~ {Tags:["lilyPad"]}

# remove range
scoreboard players remove @s lily_pad_range 1

# repeat until lilypad found
execute if score @s lily_pad_range matches 1.. unless block ~ ~ ~ lily_pad positioned ^ ^ ^0.1 run function rc_lilypads:raycast