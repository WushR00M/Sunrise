if show == false {
    show = true;
    audio_stop_all();
    audio_play_sound(snd_select_yes, 0, false);
    
    audio_stop_all();
    audio_play_sound(snd_startgame_jingle, 0, false);
    instance_create_depth(0, 0, -1, obj_flashout_routine);
    if file_exists("settings.ini") {
		ini_open("settings.ini")
		if ini_key_exists("other", "agreement") {
			if ini_read_real("other", "agreement", 0) == 1 {
			    instance_create_depth(0, 0, -1, obj_slowtitlefadein);
			    instance_destroy(obj_start_game);
			} else {
		
				var btns = [
					{label:"Terms of Service", action: dummyscript()},
					{label:"Privacy Policy", action: dummyscript()},
					{label:"I Agree", action: dummyscript()},
					{label:"I Disagree", action: dummyscript()},
				];

				scr_show_dialog("In order to play this game, you\nmust agree to the following:", spr_dialog_banned, btns);	
				instance_destroy(obj_start_game);
			}
		} else {
		
			var btns = [
				{label:"Terms of Service", action: dummyscript()},
				{label:"Privacy Policy", action: dummyscript()},
				{label:"I Agree", action: dummyscript()},
				{label:"I Disagree", action: dummyscript()},
			];

			scr_show_dialog("In order to play this game, you\nmust agree to the following:", spr_dialog_banned, btns);
			instance_destroy(obj_start_game);
		}
	} else {
		
		var btns = [
			{label:"Terms of Service", action: dummyscript()},
			{label:"Privacy Policy", action: dummyscript()},
			{label:"I Agree", action: dummyscript()},
			{label:"I Disagree", action: dummyscript()},
		];

		scr_show_dialog("In order to play this game, you\nmust agree to the following:", spr_dialog_banned, btns);
		instance_destroy(obj_start_game);
	}
}