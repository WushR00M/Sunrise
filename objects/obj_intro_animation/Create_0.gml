if global.op_legacytitle {
	audio_play_sound(mus_titlescreen, 0, false);
} else {
	room_goto(rm_title_screen);
}