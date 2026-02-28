image_angle += 4;

if fade == true {
	if image_alpha != 0 {
		image_alpha -= 0.1;
	} else {
		if global.setup == true
			instance_create_depth(0, 0, -1, obj_splash_screen_alt);
		else
			instance_create_depth(0, 0, -1, obj_splash_screen);
		instance_destroy();
	}
}