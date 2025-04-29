# Repeat every tick? maybe 5...
# could maybe do more often, but dont want to for small_flame. This is good enough
schedule function rc_lilypads:tick 5t

# store block display to be removed data
execute as @e[tag=lilyPadLight] at @s unless block ~ ~ ~ minecraft:lily_pad run data modify storage rc_lilypads:item item append from entity @s
# process data and summon items
execute if data storage rc_lilypads:item item[0] run function rc_lilypads:summon_item

# CANDLE FLAMES AAAHHHHHHHHHHHH
    # lower setting
        # 1 candle flames
execute as @e[tag=lilyPadLight,nbt={block_state:{Properties:{candles:"1",lit:"true"}}}] unless entity @s[tag=lilyPadUp] at @s align xyz run particle minecraft:small_flame ~.5 ~.44 ~.5
        # 2 candles flames
execute as @e[tag=lilyPadLight,nbt={block_state:{Properties:{candles:"2",lit:"true"}}}] unless entity @s[tag=lilyPadUp] at @s align xyz run particle minecraft:small_flame ~.6 ~.44 ~.45
execute as @e[tag=lilyPadLight,nbt={block_state:{Properties:{candles:"2",lit:"true"}}}] unless entity @s[tag=lilyPadUp] at @s align xyz run particle minecraft:small_flame ~.4 ~.39 ~.5
        # 3 candles flames
execute as @e[tag=lilyPadLight,nbt={block_state:{Properties:{candles:"3",lit:"true"}}}] unless entity @s[tag=lilyPadUp] at @s align xyz run particle minecraft:small_flame ~.55 ~.44 ~.45
execute as @e[tag=lilyPadLight,nbt={block_state:{Properties:{candles:"3",lit:"true"}}}] unless entity @s[tag=lilyPadUp] at @s align xyz run particle minecraft:small_flame ~.4 ~.39 ~.5
execute as @e[tag=lilyPadLight,nbt={block_state:{Properties:{candles:"3",lit:"true"}}}] unless entity @s[tag=lilyPadUp] at @s align xyz run particle minecraft:small_flame ~.5 ~.29 ~.6
        # 4 candles flames
execute as @e[tag=lilyPadLight,nbt={block_state:{Properties:{candles:"4",lit:"true"}}}] unless entity @s[tag=lilyPadUp] at @s align xyz run particle minecraft:small_flame ~.55 ~.44 ~.4
execute as @e[tag=lilyPadLight,nbt={block_state:{Properties:{candles:"4",lit:"true"}}}] unless entity @s[tag=lilyPadUp] at @s align xyz run particle minecraft:small_flame ~.4 ~.39 ~.4
execute as @e[tag=lilyPadLight,nbt={block_state:{Properties:{candles:"4",lit:"true"}}}] unless entity @s[tag=lilyPadUp] at @s align xyz run particle minecraft:small_flame ~.6 ~.39 ~.55
execute as @e[tag=lilyPadLight,nbt={block_state:{Properties:{candles:"4",lit:"true"}}}] unless entity @s[tag=lilyPadUp] at @s align xyz run particle minecraft:small_flame ~.45 ~.29 ~.55
    # upper setting
        # 1 candle flames
execute as @e[tag=lilyPadUp,nbt={block_state:{Properties:{candles:"1",lit:"true"}}}] at @s align xyz run particle minecraft:small_flame ~.5 ~.4825 ~.5
        # 2 candles flames
execute as @e[tag=lilyPadUp,nbt={block_state:{Properties:{candles:"2",lit:"true"}}}] at @s align xyz run particle minecraft:small_flame ~.6 ~.4825 ~.45
execute as @e[tag=lilyPadUp,nbt={block_state:{Properties:{candles:"2",lit:"true"}}}] at @s align xyz run particle minecraft:small_flame ~.4 ~.4325 ~.5
        # 3 candles flames
execute as @e[tag=lilyPadUp,nbt={block_state:{Properties:{candles:"3",lit:"true"}}}] at @s align xyz run particle minecraft:small_flame ~.55 ~.4825 ~.45
execute as @e[tag=lilyPadUp,nbt={block_state:{Properties:{candles:"3",lit:"true"}}}] at @s align xyz run particle minecraft:small_flame ~.4 ~.4325 ~.5
execute as @e[tag=lilyPadUp,nbt={block_state:{Properties:{candles:"3",lit:"true"}}}] at @s align xyz run particle minecraft:small_flame ~.5 ~.3325 ~.6
        # 4 candles flames
execute as @e[tag=lilyPadUp,nbt={block_state:{Properties:{candles:"4",lit:"true"}}}] at @s align xyz run particle minecraft:small_flame ~.55 ~.4825 ~.4
execute as @e[tag=lilyPadUp,nbt={block_state:{Properties:{candles:"4",lit:"true"}}}] at @s align xyz run particle minecraft:small_flame ~.4 ~.4325 ~.4
execute as @e[tag=lilyPadUp,nbt={block_state:{Properties:{candles:"4",lit:"true"}}}] at @s align xyz run particle minecraft:small_flame ~.6 ~.4325 ~.55
execute as @e[tag=lilyPadUp,nbt={block_state:{Properties:{candles:"4",lit:"true"}}}] at @s align xyz run particle minecraft:small_flame ~.45 ~.3325 ~.55

#remove light block
execute as @e[tag=lilyPadLight] at @s unless block ~ ~ ~ minecraft:lily_pad run fill ~ ~1 ~ ~ ~1 ~ minecraft:air replace minecraft:light 
#remove block display
execute as @e[tag=lilyPadLight] at @s unless block ~ ~ ~ minecraft:lily_pad run kill @s
#remove interaction
execute as @e[tag=lilyPadInt] at @s unless block ~ ~ ~ minecraft:lily_pad run kill @s
