audio_stop_all();
audio_play_sound(snd_select_yes, 0, false);
audio_play_sound(snd_notification_failure, 0, false);

if global.fromeditor == true {
	global.fromeditor = false;
	global.fromgo = true;
	room_goto(rm_create);
} else {
	
}