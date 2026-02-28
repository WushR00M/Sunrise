if os_is_network_connected() {
	audio_play_sound(snd_select_yes, 0, false);
	steam_activate_overlay(ov_community);
} else {
	var btns = [
		{label:"Ok", action: dummyscript()},
	];

	scr_show_dialog("Failed to connect to Steam!\nAre you connected to the internet?", spr_dialog_nointernet, btns);
}