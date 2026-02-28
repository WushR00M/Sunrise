audio_play_sound(snd_select_yes, 0, false);
toast_create("This feature is coming soon, stand by!", 1);
if !instance_exists(obj_fadeout_routine) {
	if !clicked {
		clicked = true;
	}
}