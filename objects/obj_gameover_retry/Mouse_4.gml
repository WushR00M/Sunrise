if global.fromeditor {
	audio_play_sound(snd_select_yes, 0, false);
	toast_create("You cannot retry when playtesting in Create Mode!", 0)
} else {
	audio_stop_all();
	audio_play_sound(snd_select_yes, 0, false);
	audio_play_sound(snd_notification_success, 0, false);
}