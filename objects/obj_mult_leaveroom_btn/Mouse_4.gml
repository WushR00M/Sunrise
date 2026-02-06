if clicked == false {
	audio_play_sound(snd_select_yes, 0, false);
	steam_lobby_leave();
	toast_dismiss();
	toast_create("SUCCESS: Left the online lobby!", 2);
	instance_destroy(obj_steam_lobby_handler);
	instance_create_depth(0, 0, -1, obj_fadein_routine_backwards);	
		
	if !instance_exists(obj_fadeout_routine) {
		if !clicked {
			clicked = true;
		}
	}
}