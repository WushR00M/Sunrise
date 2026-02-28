audio_play_sound(snd_scroll, 0, false);
if room != rm_create {
	if global.mastervol > 0
		global.mastervol -= 1;
	
	audio_master_gain(global.mastervol / 100);
	volume_slider_show = true;
	volume_slider_time = 5*60;
} else {
	if global.cmsetup == true {
		if global.mastervol > 0
			global.mastervol -= 1;
	
	audio_master_gain(global.mastervol / 100);
	volume_slider_show = true;
	volume_slider_time = 5*60;	
	}
}