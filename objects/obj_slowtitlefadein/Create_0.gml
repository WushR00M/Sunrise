if audio_is_playing(mus_titlescreen)
	audio_play_sound(snd_startgame_jingle, 0, false);
	
instance_destroy(obj_start_game);
fadeal = 0;