if !global.cmplay {
	if global.inputtype {
		x = mouse_x;
		y = mouse_y;

		move_snap(32, 32);

		if global.cmselection == 0 {
			sprite_index = spr_cm_empty_grid_slot;
		} else if global.cmselection == 1 {
			sprite_index = spr_solid_block_icon;
	
			if mouse_check_button(mb_left) && place_free(x, y)
				instance_create_layer(x, y, "Objects", obj_solid_block);
		} else if global.cmselection == 2 {
			sprite_index = spr_autoterrain_icon;
	
			if mouse_check_button(mb_left) && place_free(x, y)
				instance_create_layer(x, y, "Objects", obj_autoterrain);
		} else if global.cmselection == 3 {
			sprite_index = spr_text_icon;
	
			if mouse_check_button_pressed(mb_left) && place_free(x, y) {
				scr_show_input_dialog("What is to be displayed?", spr_dialog_rename);
				if global.input_finished {
					global.input_finished = !global.input_finished;
			
					if global.input_result != "" {
						global.input_result = global.cmtextinput;
						instance_create_layer(x, y, "Objects", obj_text_display);
						global.cmtextinput = "";
						global.input_result = "";
					} else {
						toast_dismiss();
						toast_create("No text was entered, placement cancelled...", 3);
					}
				}
			}
		} else if global.cmselection == 4 {
			sprite_index = spr_bit_icon;
	
			if mouse_check_button_pressed(mb_left) && place_free(x, y)
				instance_create_layer(x, y, "Objects", obj_bit);
		} else if global.cmselection == 5 {
			sprite_index = spr_autoterrain_icon;
	
			if mouse_check_button(mb_left) && place_free(x, y)
				instance_create_layer(x, y, "Objects", obj_grass_terrain);
		} else if global.cmselection == 6 {
			sprite_index = spr_autoterrain_icon;
	
			if mouse_check_button(mb_left) && place_free(x, y)
				instance_create_layer(x, y, "Objects", obj_mansion_terrain);
		} else if global.cmselection == 7 {
			sprite_index = spr_autoterrain_icon;
	
			if mouse_check_button(mb_left) && place_free(x, y)
				instance_create_layer(x, y, "Objects", obj_metal_terrain);
		} else if global.cmselection == 8 {
			sprite_index = spr_autoterrain_icon;
	
			if mouse_check_button(mb_left) && place_free(x, y)
				instance_create_layer(x, y, "Objects", obj_stage_terrain);
		} else if global.cmselection == 9 {
			sprite_index = spr_invisible_block_icon;
	
			if mouse_check_button_pressed(mb_left) && place_free(x, y)
				instance_create_layer(x+16, y+16, "Objects", obj_solid_object);	
		}
	}
} else {
	image_alpha = 0;	
}