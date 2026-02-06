if obj_dialog.visible != true {
	if clicked {
		if click_inc == 0 {
			click_begin = false;
			click_end = true;
			clicked = false;
			click_inc = 1;
			audio_stop_all();
			room_goto(rm_create);
		}
	}
}