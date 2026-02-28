if corrupted {
	toast_create("FAILURE: This save file was detected as corrupted and as such, has been auto-deleted.", 4);
	
	if saveslot == 1
		file_delete("slot1.ini");
	else if saveslot == 2
		file_delete("slot2.ini");
	else if saveslot == 3
		file_delete("slot3.ini");
	else if saveslot == 4
		file_delete("slot4.ini");
	else if saveslot == 5
		file_delete("slot5.ini");
		
	prog = 0;
} else {
	if prog == 0 {
		prog = 1;
		if saveslot == 1
			ini_open("slot1.ini");
		else if saveslot == 2
			ini_open("slot2.ini");
		else if saveslot == 3
			ini_open("slot3.ini");
		else if saveslot == 4
			ini_open("slot4.ini");
		else if saveslot == 5
			ini_open("slot5.ini");

		ini_write_real("slot", "chapter", 1);
		ini_close();
		
		var btns = [
			{label:"Yes, please...", action: dummyscript()},
			{label:"I already know!!.", action: dummyscript()},
		];

		scr_show_dialog("Since this is a new save file, would\nyou like to play the tutorial?", spr_dialog_question, btns);
	}
}