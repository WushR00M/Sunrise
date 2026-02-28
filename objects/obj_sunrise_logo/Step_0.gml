image_xscale = lerp(image_xscale, 1.5, 0.05);
image_yscale = lerp(image_yscale, 1.5, 0.05);

x = room_width / 2;
y = room_height / 2;

if global.input_finished {
	if string_length(global.input_result) == 4 {
		var year = global.input_result;
		global.input_result = "";
		
		year = string_digits(year);
		year = real(year);
		
		if (year < (current_year - 100)) or (year >= (current_year)) {
			year = "";
			toast_dismiss();
			toast_create("FAILURE: Invalid birth year provided", 4);
			global.input_finished = false;
			global.input_result = "";
				scr_show_input_dialog(
				"Please enter a valid birth year.\nOnce this is provided, it cannot be edited.",
				spr_dialog_account
			);	
		} else {
			global.input_finished = false;
			ini_open("settings.ini")
			ini_write_real("other","agreement",1)
			instance_create_depth(0, 0, -1, obj_slowtitlefadein);
		}
	} else {
		toast_dismiss();
		toast_create("FAILURE: Invalid birth year provided", 4);
		global.input_finished = false;
		global.input_result = "";
			scr_show_input_dialog(
			"Please enter a valid birth year.\nOnce this is provided, it cannot be edited.",
			spr_dialog_account
		);	
	}
}