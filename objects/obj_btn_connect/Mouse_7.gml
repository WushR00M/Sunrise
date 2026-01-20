if clicked {
	click_begin = false;
	click_end = true;
	clicked = false;
	audio_play_sound(snd_mainmenu_btn, 0, false);
	instance_create_depth(0, 0, -1, obj_fadein_routine_connectmenu);
}