if room == rm_create {
	if collect == true && global.cmplay {
		image_alpha = 0;	
	} else if collect == true && !global.cmplay {
		image_alpha = 1;
		collect = false;
	}
} else {
	if collect == true
		instance_destroy();
}