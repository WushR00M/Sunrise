audio_stop_all();
video_close();
if global.op_legacytitle
	room_goto(rm_intro_animation_legacy);
else
	room_goto(rm_intro_animation);