# if lilypad found summon interaction
execute if block ~ ~ ~ minecraft:lily_pad align xyz run return run summon minecraft:interaction ~.5 ~.1 ~.5 {Tags:["lilyPadInt"],height:0.1,width:0.75}

# remove range
scoreboard players remove @s lily_pad_range 1

# repeat if not lily pad
execute if score @s lily_pad_range matches 1.. positioned ^ ^ ^0.05 run function rc_lilypads:place_raycast