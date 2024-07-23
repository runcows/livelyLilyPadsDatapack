# from lower to upper
execute as @e[type=minecraft:block_display,tag=lilyPadLight,distance=..0.2] unless data entity @s {Tags:["lilyPadUp"]} run data modify entity @s transformation.translation[1] set value 0.0625f
execute as @e[type=minecraft:block_display,tag=lilyPadLight2,distance=..0.2] unless data entity @s {Tags:["lilyPadUp"]} run data modify entity @s transformation.translation[1] set value 0.1025f
execute as @e[type=minecraft:block_display,tag=lilyPadLight3,distance=..0.2] unless data entity @s {Tags:["lilyPadUp"]} run data modify entity @s transformation.translation[1] set value 0.7625f
execute as @e[type=minecraft:block_display,tag=lilyPadLight,distance=..0.2] unless data entity @s {Tags:["lilyPadUp"]} run data merge entity @s {start_interpolation:-1,interpolation_duration:5}
execute as @e[type=minecraft:block_display,tag=lilyPadLight,distance=..0.2] unless data entity @s {Tags:["lilyPadUp"]} unless data entity @s {Tags:["lilyPadLight2"]} run playsound minecraft:block.note_block.flute block @a[distance=..10] ~.5 ~.1 ~.5 0.3 0.7
execute as @e[type=minecraft:block_display,tag=lilyPadLight,distance=..0.2] unless data entity @s {Tags:["lilyPadUp"]} run tag @s add lilyPadUpper

execute as @e[type=minecraft:block_display,tag=lilyPadLight,distance=..0.2] if data entity @s {Tags:["lilyPadUp"]} run data modify entity @s transformation.translation[1] set value 0.02f
execute as @e[type=minecraft:block_display,tag=lilyPadLight2,distance=..0.2] if data entity @s {Tags:["lilyPadUp"]} run data modify entity @s transformation.translation[1] set value 0.06f
execute as @e[type=minecraft:block_display,tag=lilyPadLight3,distance=..0.2] if data entity @s {Tags:["lilyPadUp"]} run data modify entity @s transformation.translation[1] set value 0.74f
execute as @e[type=minecraft:block_display,tag=lilyPadLight,distance=..0.2] if data entity @s {Tags:["lilyPadUp"]} run data merge entity @s {start_interpolation:-1,interpolation_duration:5}
execute as @e[type=minecraft:block_display,tag=lilyPadLight,distance=..0.2] if data entity @s {Tags:["lilyPadUp"]} unless data entity @s {Tags:["lilyPadLight2"]} run playsound minecraft:block.note_block.flute block @a[distance=..10] ~.5 ~.1 ~.5 0.3 0.5
execute as @e[type=minecraft:block_display,tag=lilyPadLight,distance=..0.2] if data entity @s {Tags:["lilyPadUp"]} run tag @s remove lilyPadUp

execute as @e[type=minecraft:block_display,tag=lilyPadUpper,distance=..0.2] run tag @s add lilyPadUp
execute as @e[type=minecraft:block_display,tag=lilyPadUpper,distance=..0.2] run tag @s remove lilyPadUpper