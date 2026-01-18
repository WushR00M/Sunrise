global.cmselection = 1;
init_var();

	if !audio_is_playing(mus_yourwelcome_74) or !audio_is_playing(mus_capslock) {
		audio_stop_all();
		mustrack = irandom_range(1,2);
		if mustrack == 1
			audio_play_sound(mus_yourwelcome_74, 1, true, 0.5);
		else if mustrack == 2
			audio_play_sound(mus_capslock, 1, true, 0.5); // play other create mode track
	} else {
			
	}

instance_create_depth(view_get_xport(view_current),view_get_yport(view_current),-1,obj_flashout_routine);

lvlprop = false;

filemenu = false;
objmenu = false;
logicmenu = false;