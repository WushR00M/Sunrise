if (show == false) {
    show = true;
	global.titleanim = true;
    audio_stop_all();
    audio_play_sound(snd_select_yes, 0, false);
    
    audio_stop_all();
    audio_play_sound(snd_startgame_jingle, 0, false);
    instance_create_depth(0, 0, -1, obj_flashout_routine);
	instance_create_depth(0, 0, -1, obj_slowtitlefadein);
	instance_destroy(obj_start_game);
}