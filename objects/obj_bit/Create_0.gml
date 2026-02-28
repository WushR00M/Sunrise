collect = false;

randomise();
temp = irandom_range(1, 3);

if temp == 1
	sprite_index = spr_bit_circle;
else if temp == 2
	sprite_index = spr_bit_square;
else if temp == 3
	sprite_index = spr_bit_cross;