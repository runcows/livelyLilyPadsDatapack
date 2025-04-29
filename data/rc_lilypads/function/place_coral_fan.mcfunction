# placing new coral fan
execute unless entity @e[type=minecraft:block_display,tag=lilyPadLight,distance=..0.2] unless score sound lily_pad_range matches 1 store success score sound lily_pad_range run summon minecraft:block_display ~ ~ ~ {Tags:["lilyPadLight","lilyPadLight1"],transformation:{translation:[0.25f,0.02f,0.25f],left_rotation:[0f,0f,0f,1f],scale:[0.5f,0.6f,0.5f],right_rotation:[0f,0f,0f,1f]}}
execute if score sound lily_pad_range matches 1 run summon minecraft:block_display ~ ~ ~ {Tags:["lilyPadLight","lilyPadLight2"],transformation:{translation:[0.375f,0.06f,0.375f],left_rotation:[0f,0f,0f,1f],scale:[0.25f,0.6f,0.25f],right_rotation:[0f,0f,0f,1f]}}
execute if entity @e[type=minecraft:block_display,tag=lilyPadLight1,distance=..0.2,nbt={block_state:{Name:"minecraft:air"}}] run data modify entity @e[tag=lilyPadLight1,sort=nearest,limit=1,distance=..0.2] block_state.Name set from storage rc_lilypads:item selected
execute if entity @e[type=minecraft:block_display,tag=lilyPadLight2,distance=..0.2,nbt={block_state:{Name:"minecraft:air"}}] run data modify entity @e[tag=lilyPadLight2,sort=nearest,limit=1,distance=..0.2] block_state.Name set from storage rc_lilypads:item selected

# play sound
execute if score sound lily_pad_range matches 1 unless score coral_fan lily_pad_range matches 2 run playsound minecraft:block.wet_grass.place block @a[distance=..10] ~.5 ~.1 ~.5
execute if score sound lily_pad_range matches 1 if score coral_fan lily_pad_range matches 2 run playsound minecraft:block.stone.place block @a[distance=..10] ~.5 ~.1 ~.5

# reset sound score
scoreboard players reset sound lily_pad_range