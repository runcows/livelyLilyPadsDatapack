# store block display type (selected item was just stored by caller)
data modify storage rc_lilypads:item selected set from entity @s SelectedItem.id
data modify storage rc_lilypads:item block_display set from entity @e[tag=lilyPadLight,sort=nearest,limit=1,distance=..0.2] block_state.Name

# we need to check if block display is the same type of candle as player holding
data modify storage rc_lilypads:item to_compare set from storage rc_lilypads:item selected
execute store success score different lily_pad_range run data modify storage rc_lilypads:item to_compare set from storage rc_lilypads:item block_display

# then if the item type is the same, remove 1 item unless candles is already maxed
execute if score different lily_pad_range matches 0 unless entity @s[gamemode=creative] unless entity @e[tag=lilyPadLight,sort=nearest,limit=1,distance=..0.2,nbt={block_state:{Properties:{candles:"4"}}}] run item modify entity @s weapon.mainhand rc_lilypads:count_decr
# if different candle and there's already a candle there, set score
execute if score different lily_pad_range matches 1 unless entity @s[gamemode=creative] if entity @e[tag=lilyPadLight,sort=nearest,limit=1,distance=..0.2] run scoreboard players set differentExist lily_pad_range 1

# if same type, then candles needs to increase until 4
execute if score different lily_pad_range matches 0 as @e[tag=lilyPadLight,sort=nearest,limit=1,distance=..0.2,nbt={block_state:{Properties:{candles:"3"}}}] unless score sound lily_pad_range matches 1 store success score sound lily_pad_range run data merge entity @s {block_state:{Properties:{candles:"4"}}}
execute if score different lily_pad_range matches 0 as @e[tag=lilyPadLight,sort=nearest,limit=1,distance=..0.2,nbt={block_state:{Properties:{candles:"2"}}}] unless score sound lily_pad_range matches 1 store success score sound lily_pad_range run data merge entity @s {block_state:{Properties:{candles:"3"}}}
execute if score different lily_pad_range matches 0 as @e[tag=lilyPadLight,sort=nearest,limit=1,distance=..0.2,nbt={block_state:{Properties:{candles:"1"}}}] unless score sound lily_pad_range matches 1 store success score sound lily_pad_range run data merge entity @s {block_state:{Properties:{candles:"2"}}}

# placing new candles
execute unless entity @e[type=minecraft:block_display,tag=lilyPadLight,distance=..0.2] unless score sound lily_pad_range matches 1 store success score sound lily_pad_range run summon minecraft:block_display ~ ~ ~ {Tags:["lilyPadLight"],transformation:{translation:[0.1f,0.02f,0.1f],left_rotation:[0f,0f,0f,1f],scale:[0.8f,0.8f,0.8f],right_rotation:[0f,0f,0f,1f]}}
execute if entity @e[type=minecraft:block_display,tag=lilyPadLight,distance=..0.2,nbt={block_state:{Name:"minecraft:air"}}] run data modify entity @e[tag=lilyPadLight,sort=nearest,limit=1,distance=..0.2] block_state.Name set from storage rc_lilypads:item selected

# if the compare failed, there was no pre-existing candle, and there now is a candle that just got placed, remove 1 item
execute if score different lily_pad_range matches 1 unless score differentExist lily_pad_range matches 1 unless entity @s[gamemode=creative] if entity @e[tag=lilyPadLight,sort=nearest,limit=1,distance=..0.2,nbt={block_state:{Properties:{candles:"1"}}}] run item modify entity @s weapon.mainhand rc_lilypads:count_decr

# run light block check
execute as @e[type=minecraft:block_display,tag=lilyPadLight,distance=..0.2,limit=1] run function rc_lilypads:candle_light_block

# play sound
execute if score sound lily_pad_range matches 1 run playsound minecraft:block.candle.place block @a[distance=..10] ~.5 ~.1 ~.5

# reset sound score
scoreboard players reset sound lily_pad_range
scoreboard players reset different lily_pad_range
scoreboard players reset differentExist lily_pad_range

# reset storage
data merge storage rc_lilypads:item {block_display:""}