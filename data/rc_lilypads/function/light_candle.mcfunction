#as the player at the marker

# lit candle
execute if data storage rc_lilypads:item {selected:"minecraft:flint_and_steel"} align xyz as @e[type=minecraft:block_display,tag=lilyPadLight,distance=..0.2] store success score soundCandleLightSteel lily_pad_range run data merge entity @s {block_state:{Properties:{lit:"true"}}}
execute if data storage rc_lilypads:item {selected:"minecraft:fire_charge"} align xyz as @e[type=minecraft:block_display,tag=lilyPadLight,distance=..0.2] store success score soundCandleLightCharge lily_pad_range run data merge entity @s {block_state:{Properties:{lit:"true"}}}

# play sound
execute align xyz if score soundCandleLightSteel lily_pad_range matches 1 run playsound minecraft:item.flintandsteel.use block @a[distance=..10] ~.5 ~.1 ~.5
execute align xyz if score soundCandleLightCharge lily_pad_range matches 1 run playsound minecraft:item.firecharge.use block @a[distance=..10] ~.5 ~.1 ~.5

# decrease durability for flint and steel or decr fire charge count
execute unless entity @s[gamemode=creative] if score soundCandleLightSteel lily_pad_range matches 1 run item modify entity @s weapon.mainhand rc_lilypads:durability_decr
execute unless entity @s[gamemode=creative] if score soundCandleLightCharge lily_pad_range matches 1 run item modify entity @s weapon.mainhand rc_lilypads:count_decr

# update light block
execute if score soundCandleLightSteel lily_pad_range matches 1 align xyz as @e[type=minecraft:block_display,tag=lilyPadLight,distance=..0.2] run function rc_lilypads:candle_light_block
execute if score soundCandleLightCharge lily_pad_range matches 1 align xyz as @e[type=minecraft:block_display,tag=lilyPadLight,distance=..0.2] run function rc_lilypads:candle_light_block

# reset sound score
scoreboard players reset soundCandleLightSteel lily_pad_range
scoreboard players reset soundCandleLightCharge lily_pad_range





