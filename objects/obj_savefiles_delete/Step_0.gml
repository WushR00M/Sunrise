if global.storymenu_deletemode {
	image_xscale = lerp(image_xscale, 1.6, 0.25);	
	image_yscale = lerp(image_yscale, 1.6, 0.25);
	
	image_index = 2;
} else {
	image_xscale = lerp(image_xscale, 1.5, 0.25);	
	image_yscale = lerp(image_yscale, 1.5, 0.25);
}