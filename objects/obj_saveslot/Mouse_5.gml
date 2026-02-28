if global.storymenu_deletemode {
	if prog == 0 {
		toast_dismiss();
		toast_create("FAILURE: You can't delete an empty save file!", 4);
	} else {
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
		toast_dismiss();
		toast_create("SUCCESS: Save file was deleted successfully!", 2);
	}
} else {
	audio_play_sound(snd_disabled, 0, false);	
}