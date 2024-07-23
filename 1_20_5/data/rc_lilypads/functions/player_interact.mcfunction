# store selected item
data modify storage rc_lilypads:item selected set from entity @s SelectedItem.id

# if empty hand, and block display, try to shift position
execute if data storage rc_lilypads:item {selected:""} if entity @e[type=minecraft:block_display,tag=lilyPadLight,distance=..0.2] run function rc_lilypads:alternate

# if coral fan, keep track
    # we do this to know, then item gets removed and predicate can't be used, but if run function first, then it won't decrement
execute if entity @s[predicate=rc_lilypads:is_coral_fan] run scoreboard players set coral_fan lily_pad_range 1
# this one is just for placing sound
execute if entity @s[predicate=rc_lilypads:is_dead_coral_fan] run scoreboard players set coral_fan lily_pad_range 2

# Remove one item when place new display
    # this doesn't remove candles, due to some edge case bug
    # it was removing extra, i think on rapid clicking, but im not sure. It was tested with line 24 in place_candle commented out. No idea why. I wish this one worked because its cleaner.
    # currently place_candle has its own decrement stuff
execute if entity @s[predicate=rc_lilypads:is_placeable] unless entity @s[gamemode=creative] unless entity @e[type=minecraft:block_display,tag=lilyPadLight,distance=..0.2] run item modify entity @s weapon.mainhand rc_lilypads:count_decr

# run coral fan func based on score
execute if score coral_fan lily_pad_range matches 1.. run function rc_lilypads:place_coral_fan

# if try candle, run candle function
execute if entity @s[predicate=rc_lilypads:is_candle] run function rc_lilypads:place_candle
# if holding igniter, light candle
execute if entity @s[predicate=rc_lilypads:can_light] run function rc_lilypads:light_candle

# When lilypad found with no existing block display, summon new one and light
    # lantern
execute if data storage rc_lilypads:item {selected:"minecraft:lantern"} unless entity @e[type=minecraft:block_display,tag=lilyPadLight,distance=..0.2] run setblock ~ ~1 ~ minecraft:light[level=14] keep
execute if data storage rc_lilypads:item {selected:"minecraft:lantern"} unless entity @e[type=minecraft:block_display,tag=lilyPadLight,distance=..0.2] unless score soundLantern lily_pad_range matches 1 store success score soundLantern lily_pad_range run summon minecraft:block_display ~ ~ ~ {Tags:["lilyPadLight"],block_state:{Name:"minecraft:lantern"},transformation:{translation:[0.1f,0.02f,0.1f],left_rotation:[0f,0f,0f,1f],scale:[0.8f,0.8f,0.8f],right_rotation:[0f,0f,0f,1f]}}
    # soul lantern
execute if data storage rc_lilypads:item {selected:"minecraft:soul_lantern"} unless entity @e[type=minecraft:block_display,tag=lilyPadLight,distance=..0.2] run setblock ~ ~1 ~ minecraft:light[level=9] keep
execute if data storage rc_lilypads:item {selected:"minecraft:soul_lantern"} unless entity @e[type=minecraft:block_display,tag=lilyPadLight,distance=..0.2] unless score soundLantern lily_pad_range matches 1 store success score soundLantern lily_pad_range run summon minecraft:block_display ~ ~ ~ {Tags:["lilyPadLight"],block_state:{Name:"minecraft:soul_lantern"},transformation:{translation:[0.1f,0.02f,0.1f],left_rotation:[0f,0f,0f,1f],scale:[0.8f,0.8f,0.8f],right_rotation:[0f,0f,0f,1f]}}
    # torch
execute if data storage rc_lilypads:item {selected:"minecraft:torch"} unless entity @e[type=minecraft:block_display,tag=lilyPadLight,distance=..0.2] run setblock ~ ~1 ~ minecraft:light[level=14] keep
execute if data storage rc_lilypads:item {selected:"minecraft:torch"} unless entity @e[type=minecraft:block_display,tag=lilyPadLight,distance=..0.2] unless score soundWood lily_pad_range matches 1 store success score soundWood lily_pad_range run summon minecraft:block_display ~ ~ ~ {Tags:["lilyPadLight"],block_state:{Name:"minecraft:torch"},transformation:{translation:[0.1f,0.02f,0.1f],left_rotation:[0f,0f,0f,1f],scale:[0.8f,0.8f,0.8f],right_rotation:[0f,0f,0f,1f]}}
    # soul torch
execute if data storage rc_lilypads:item {selected:"minecraft:soul_torch"} unless entity @e[type=minecraft:block_display,tag=lilyPadLight,distance=..0.2] run setblock ~ ~1 ~ minecraft:light[level=9] keep
execute if data storage rc_lilypads:item {selected:"minecraft:soul_torch"} unless entity @e[type=minecraft:block_display,tag=lilyPadLight,distance=..0.2] unless score soundWood lily_pad_range matches 1 store success score soundWood lily_pad_range run summon minecraft:block_display ~ ~ ~ {Tags:["lilyPadLight"],block_state:{Name:"minecraft:soul_torch"},transformation:{translation:[0.1f,0.02f,0.1f],left_rotation:[0f,0f,0f,1f],scale:[0.8f,0.8f,0.8f],right_rotation:[0f,0f,0f,1f]}}
    # redstone torch
execute if data storage rc_lilypads:item {selected:"minecraft:redstone_torch"} unless entity @e[type=minecraft:block_display,tag=lilyPadLight,distance=..0.2] run setblock ~ ~1 ~ minecraft:light[level=6] keep
execute if data storage rc_lilypads:item {selected:"minecraft:redstone_torch"} unless entity @e[type=minecraft:block_display,tag=lilyPadLight,distance=..0.2] unless score soundWood lily_pad_range matches 1 store success score soundWood lily_pad_range run summon minecraft:block_display ~ ~ ~ {Tags:["lilyPadLight"],block_state:{Name:"minecraft:redstone_torch"},transformation:{translation:[0.1f,0.02f,0.1f],left_rotation:[0f,0f,0f,1f],scale:[0.8f,0.8f,0.8f],right_rotation:[0f,0f,0f,1f]}}

    # spore blossom
execute if data storage rc_lilypads:item {selected:"minecraft:spore_blossom"} unless entity @e[type=minecraft:block_display,tag=lilyPadLight,distance=..0.2] unless score soundSpore lily_pad_range matches 1 store success score soundSpore lily_pad_range run summon minecraft:block_display ~ ~ ~ {Tags:["lilyPadLight","lilyPadLight3"],block_state:{Name:"minecraft:spore_blossom"},transformation:{translation:[0.25f,0.74f,0.75f],left_rotation:[0.707f,0f,0f,0.707f],scale:[0.5f,0.5f,0.7f],right_rotation:[0.707f,0f,0f,0.707f]}}

# play sound
execute if score soundLantern lily_pad_range matches 1 run playsound minecraft:block.lantern.place block @a[distance=..10] ~.5 ~.1 ~.5
execute if score soundWood lily_pad_range matches 1 run playsound minecraft:block.wood.place block @a[distance=..10] ~.5 ~.1 ~.5
execute if score soundSpore lily_pad_range matches 1 run playsound minecraft:block.spore_blossom.place block @a[distance=..10] ~.5 ~.1 ~.5

# reset sound score
scoreboard players reset soundLantern lily_pad_range
scoreboard players reset soundWood lily_pad_range
scoreboard players reset soundSpore lily_pad_range
# reset coral fan placing score
scoreboard players reset coral_fan lily_pad_range
# reset selected
data merge storage rc_lilypads:item {selected:""}

