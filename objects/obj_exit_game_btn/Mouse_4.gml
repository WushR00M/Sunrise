toast_dismiss();
audio_play_sound(snd_select_yes, 0, false);

var btns = [
	{label:"Let me out already!", action: dummyscript()},
	{label:"Just a little more...",  action: dummyscript()},
];

scr_show_dialog("Are you sure you want to exit Sunrise?", spr_dialog_warning, btns);