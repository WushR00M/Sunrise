audio_play_sound(snd_select_yes, 0, false);
if steam_initialised() {
	steam_activate_overlay(ov_friends);
} else {
	toast_create("This feature is coming soon to GameJolt users!");
}