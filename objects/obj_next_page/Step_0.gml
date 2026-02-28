if hover == true {
	image_xscale = lerp(image_xscale, 1.1, 0.25);
	image_yscale = lerp(image_yscale, 1.1, 0.25);
} else {
	image_xscale = lerp(image_xscale, 1, 0.25);
	image_yscale = lerp(image_yscale, 1, 0.25);
}