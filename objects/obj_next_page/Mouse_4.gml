audio_play_sound(snd_select_yes, 0, false);
if !instance_exists(obj_fadeout_routine) {
	if !clicked {
		instance_create_depth(0, 0, -1, obj_fadein_routine);
		clicked = true;
	}
}