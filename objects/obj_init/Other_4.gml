if room == rm_intro_animation {
	window_set_cursor(cr_default);	
} else if room == rm_main_menu {
	if !audio_is_playing(mus_mainmenu) {
		audio_play_sound(mus_mainmenu, 0, false);	
	}
}