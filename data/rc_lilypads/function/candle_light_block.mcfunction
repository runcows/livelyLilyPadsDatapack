# is executed as the block display
execute at @s if entity @s[nbt={block_state:{Properties:{lit:"true",candles:"4"}}}] run setblock ~ ~1 ~ minecraft:light[level=12] keep
execute at @s if entity @s[nbt={block_state:{Properties:{lit:"true",candles:"4"}}}] run fill ~ ~1 ~ ~ ~1 ~ minecraft:light[level=12] replace minecraft:light
execute at @s if entity @s[nbt={block_state:{Properties:{lit:"true",candles:"3"}}}] run setblock ~ ~1 ~ minecraft:light[level=9] keep
execute at @s if entity @s[nbt={block_state:{Properties:{lit:"true",candles:"3"}}}] run fill ~ ~1 ~ ~ ~1 ~ minecraft:light[level=9] replace minecraft:light
execute at @s if entity @s[nbt={block_state:{Properties:{lit:"true",candles:"2"}}}] run setblock ~ ~1 ~ minecraft:light[level=6] keep
execute at @s if entity @s[nbt={block_state:{Properties:{lit:"true",candles:"2"}}}] run fill ~ ~1 ~ ~ ~1 ~ minecraft:light[level=6] replace minecraft:light
execute at @s if entity @s[nbt={block_state:{Properties:{lit:"true",candles:"1"}}}] run setblock ~ ~1 ~ minecraft:light[level=3] keep