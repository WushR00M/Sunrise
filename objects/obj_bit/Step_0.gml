if room == rm_create {
	if collect == true && global.cmplay {
		image_alpha = 0;	
	} else if collect == true && !global.cmplay {
		image_alpha = 1;
		collect = false;
	}
} else {
	if collect == true {
		audio_play_sound(snd_musicnote_collect_plus1, 0, false);
		instance_destroy();
	}
}