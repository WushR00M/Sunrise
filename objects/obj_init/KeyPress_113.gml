if global.op_jpegscreenie
	var screenie = screen_save("Screenshot_" + string(current_month) + string(current_day) + string(current_year) + "_" + string(current_hour) + string(current_minute) + string(current_second) + ".jpeg");
else
	var screenie = screen_save("Screenshot_" + string(current_month) + string(current_day) + string(current_year) + "_" + string(current_hour) + string(current_minute) + string(current_second) + ".png");

audio_play_sound(snd_screenshot, 0, false);
instance_create_depth(0, 0, -1, obj_flashout_routine);
log("Screenshot taken!");

if steam_initialised() {
	steam_send_screenshot(screenie, window_get_width(), window_get_height());	
}