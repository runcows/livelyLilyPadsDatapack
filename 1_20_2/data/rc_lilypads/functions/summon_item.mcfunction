# store item tags to check
data modify storage rc_lilypads:item tag_comp set from storage rc_lilypads:item item[0].Tags
# remove display entity entry if it's lilyPadLight2
execute if data storage rc_lilypads:item {tag_comp:["lilyPadLight2"]} store success score item_removed lily_pad_range run data remove storage rc_lilypads:item item[0]

# summon dummy item
execute unless score item_removed lily_pad_range matches 1 run summon minecraft:item ~ -65 ~ {Item:{id:"minecraft:structure_block",Count:1b},Tags:["lilyPadItem"]}

# set item data
execute unless score item_removed lily_pad_range matches 1 run data modify entity @e[tag=lilyPadItem,limit=1,sort=nearest] Item.id set from storage rc_lilypads:item item[0].block_state.Name
    # if it has candle count, set item count
execute unless score item_removed lily_pad_range matches 1 if data storage rc_lilypads:item item[0].block_state.Properties.candles run data modify storage rc_lilypads:item candle_count set from storage rc_lilypads:item item[0].block_state.Properties.candles
execute unless score item_removed lily_pad_range matches 1 if data storage rc_lilypads:item {candle_count:"2"} run data modify entity @e[tag=lilyPadItem,limit=1,sort=nearest] Item.Count set value 2b
execute unless score item_removed lily_pad_range matches 1 if data storage rc_lilypads:item {candle_count:"3"} run data modify entity @e[tag=lilyPadItem,limit=1,sort=nearest] Item.Count set value 3b
execute unless score item_removed lily_pad_range matches 1 if data storage rc_lilypads:item {candle_count:"4"} run data modify entity @e[tag=lilyPadItem,limit=1,sort=nearest] Item.Count set value 4b
    # figure out what breaking sound to use, ugh its a lot of commands
execute unless score item_removed lily_pad_range matches 1 as @e[type=minecraft:item,predicate=rc_lilypads:item_candle,tag=lilyPadItem,limit=1,sort=nearest] run scoreboard players set sound lily_pad_range 1
execute unless score item_removed lily_pad_range matches 1 as @e[type=minecraft:item,predicate=rc_lilypads:item_wooden,tag=lilyPadItem,limit=1,sort=nearest] run scoreboard players set sound lily_pad_range 2
execute unless score item_removed lily_pad_range matches 1 as @e[type=minecraft:item,predicate=rc_lilypads:item_lantern,tag=lilyPadItem,limit=1,sort=nearest] run scoreboard players set sound lily_pad_range 3
execute unless score item_removed lily_pad_range matches 1 as @e[type=minecraft:item,predicate=rc_lilypads:item_wet_grass,tag=lilyPadItem,limit=1,sort=nearest] run scoreboard players set sound lily_pad_range 4
execute unless score item_removed lily_pad_range matches 1 as @e[type=minecraft:item,predicate=rc_lilypads:item_stone,tag=lilyPadItem,limit=1,sort=nearest] run scoreboard players set sound lily_pad_range 5
execute unless score item_removed lily_pad_range matches 1 as @e[type=minecraft:item,predicate=rc_lilypads:item_spore,tag=lilyPadItem,limit=1,sort=nearest] run scoreboard players set sound lily_pad_range 6
    # set position and fine tune teleport
execute unless score item_removed lily_pad_range matches 1 run data modify entity @e[tag=lilyPadItem,limit=1,sort=nearest] Pos set from storage rc_lilypads:item item[0].Pos
execute unless score item_removed lily_pad_range matches 1 as @e[tag=lilyPadItem] at @s run tp @s ~.5 ~ ~.5
execute unless score item_removed lily_pad_range matches 1 as @e[tag=lilyPadItem] at @s run data merge entity @s {Motion:[0d,0.2d,0d]}
    # play corresponding sound
execute unless score item_removed lily_pad_range matches 1 if score sound lily_pad_range matches 1 as @e[tag=lilyPadItem,limit=1,sort=nearest] at @s run playsound minecraft:block.candle.break block @a[distance=..10] ~ ~.1 ~
execute unless score item_removed lily_pad_range matches 1 if score sound lily_pad_range matches 2 as @e[tag=lilyPadItem,limit=1,sort=nearest] at @s run playsound minecraft:block.wood.break block @a[distance=..10] ~ ~.1 ~
execute unless score item_removed lily_pad_range matches 1 if score sound lily_pad_range matches 3 as @e[tag=lilyPadItem,limit=1,sort=nearest] at @s run playsound minecraft:block.lantern.break block @a[distance=..10] ~ ~.1 ~
execute unless score item_removed lily_pad_range matches 1 if score sound lily_pad_range matches 4 as @e[tag=lilyPadItem,limit=1,sort=nearest] at @s run playsound minecraft:block.wet_grass.break block @a[distance=..10] ~ ~.1 ~
execute unless score item_removed lily_pad_range matches 1 if score sound lily_pad_range matches 5 as @e[tag=lilyPadItem,limit=1,sort=nearest] at @s run playsound minecraft:block.stone.break block @a[distance=..10] ~ ~.1 ~
execute unless score item_removed lily_pad_range matches 1 if score sound lily_pad_range matches 6 as @e[tag=lilyPadItem,limit=1,sort=nearest] at @s run playsound minecraft:block.spore_blossom.break block @a[distance=..10] ~ ~.1 ~
    # remove tag
execute unless score item_removed lily_pad_range matches 1 as @e[tag=lilyPadItem] run tag @s remove lilyPadItem

# reset scoreboards
scoreboard players reset item_removed lily_pad_range
scoreboard players reset sound lily_pad_range
# remove item if not done earlier
execute unless score item_removed lily_pad_range matches 1 run data remove storage rc_lilypads:item item[0]
# reset some storage used here
data remove storage rc_lilypads:item tag_comp
data remove storage rc_lilypads:item candle_count
# if there is another item entry to be processed run the function again
execute if data storage rc_lilypads:item item[0] run function rc_lilypads:summon_item