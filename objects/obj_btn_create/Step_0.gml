if global.titleanim
	y = lerp(y, 680, 0.05);

if hover == true {
	image_xscale = lerp(image_xscale, 1.1, 0.05);
	image_yscale = lerp(image_yscale, 1.1, 0.05);	
} else {
	image_xscale = lerp(image_xscale, 1, 0.05);
	image_yscale = lerp(image_yscale, 1, 0.05);
}