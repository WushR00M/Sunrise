if clicked {
	click_begin = false;
	click_end = true;
	clicked = false;
	audio_stop_all();
	room_goto(rm_create);
}