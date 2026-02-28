if !instance_exists(obj_fadeout_close_game_routine) {
	if obj_dialog.visible != true {
		if !clicked {
			audio_play_sound(snd_select_yes, 0, false);
			click_begin = true;
			click_end = false;
			clicked = true;
		}
	}
}