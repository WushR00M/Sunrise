if fade_timer_start == 0 {
	if fade_timer_wait == 0 {
		if fade_timer_end == 0 {
			instance_create_depth(0, 0, -1, obj_fadein_routine);
		} else {
			fade -= 0.01;
			fade_timer_end--;
		}
	} else {
		fade_timer_wait--;
	}
} else {
	fade_timer_start--;;	
	fade += 0.005;
}