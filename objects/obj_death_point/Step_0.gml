timer += 1;

if timer = 30 {
	notres_fade = true;
	log("Game Over - NotResFade True");
	window_set_caption(window_get_caption() + " (Not Responding)");
}

if timer = 30*2 {
	error = true;
	audio_play_sound(snd_notification_failure, 0, false);
	log("Game Over - ErrorAppear True");
}

if timer == 30*3 {
	audio_play_sound(snd_glass_shatter, 0, false);
	audio_play_sound(mus_capslock, 0, true, 1, 0, 0.85);
	// audio_play_sound(, 0, true);
	global.cmplay = false;
	log("Game Over - Sequence End");
	window_set_caption("Sunrise");
	room_goto(rm_gameover);
}

if notres_fade == true {
	notres_alpha += 0.05;
	
	if notres_alpha >= 0.5
		notres_alpha = 0.5;
}