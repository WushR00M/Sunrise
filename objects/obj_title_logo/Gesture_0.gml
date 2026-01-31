if click == false {
	click = true;
	audio_play_sound(snd_select_yes, 0, false);
	instance_create_depth(0, 0, -1, obj_partialflash_routine);
	
	if global.mobile {
		if !file_exists("settings.ini") {
			var btns = [
				{label:"I understand.", action: dummyscript()}
			];

			scr_show_dialog("Please note that while Sunrise was\nported to Android for more user availability,\nsome features may not be available or are broken.", spr_dialog_warning, btns);	
		}
	}
}