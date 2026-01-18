audio_play_sound(snd_select_yes, 0, false);
toast_dismiss();

if global.current_user == "Guest" {
	var btns = [
		{label:"Login with GameJolt", action: dummyscript()},
		{label:"Offline Login", action: dummyscript()},
		{label:"Exit",  action: dummyscript()},
	];

	scr_show_dialog("Select an authorization method:", spr_dialog_account, btns);
} else {
	if global.online_user {
		var btns = [
			{label:"Achievements", action: dummyscript()},
			{label:"Friends List", action: dummyscript()},
			{label:"Backup Data", action: dummyscript()},
			{label:"Download Data", action: dummyscript()},
			{label:"Account Settings", action: dummyscript()},
			{label:"Exit",  action: dummyscript()},
		];

		scr_show_dialog("Manage your account:", spr_dialog_account, btns);
	} else {
		var btns = [
			{label:"Achievements", action: dummyscript()},
			{label:"Link Online", action: dummyscript()},
			{label:"Account Settings", action: dummyscript()},
			{label:"Exit",  action: dummyscript()},
		];

		scr_show_dialog("Manage your account:", spr_dialog_account, btns);
	}
}