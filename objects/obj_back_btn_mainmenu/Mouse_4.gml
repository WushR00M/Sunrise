if !clicked {
	if !global.op_legacytitle {
		audio_play_sound(snd_cancel_return_back, 0, false);
		instance_create_depth(0,0,-1,obj_fadein_routine_mainmenu);
	} else {
		audio_play_sound(snd_cancel_return_back, 0, false);
		instance_create_depth(0,0,-1,obj_fadein_routine_mainmenu_legacy);
	}
	clicked = true;
}