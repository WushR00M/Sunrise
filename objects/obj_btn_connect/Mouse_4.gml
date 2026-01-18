audio_play_sound(snd_select_yes, 0, false);
var btns = [
	{label:"Alright...", action: dummyscript()},
];

scr_show_dialog("Online features are delayed to Sunrise's\nBeta phase. Sorry!", spr_dialog_restricted, btns);