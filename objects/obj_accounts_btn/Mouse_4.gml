audio_play_sound(snd_select_yes, 0, false);
toast_dismiss();

if global.current_user == "Guest" {
	var btns = [
		{label:"Login with GameJolt", action: dummyscript()},
		{label:"Achievements", action: dummyscript()},
		{label:"Exit",  action: dummyscript()},
	];

	scr_show_dialog("Manage your account:", spr_dialog_account, btns);
} else {
	var btns = [
		{label:"Log Out", action: dummyscript()},
		{label:"Exit",  action: dummyscript()},
	];

	scr_show_dialog("Manage your account:", spr_dialog_account, btns);
}