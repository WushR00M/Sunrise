if global.setup == true {
	instance_create_depth(0, 0, -1, obj_splash_screen_alt);
	instance_destroy();
}

fade = false;
fulload = false;
phase = 1;
randomnum = irandom_range(15, 30);
alarm_set(0, (5 * 60));
alarm_set(1, randomnum);