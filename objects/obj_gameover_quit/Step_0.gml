if hover == true {
	image_xscale = lerp(image_xscale, 1.6, 0.5);
	image_yscale = lerp(image_yscale, 1.6, 0.5);
} else if hover == false {
	image_xscale = lerp(image_xscale, 1.5, 0.5);
	image_yscale = lerp(image_yscale, 1.5, 0.5);
}