if hover == true {
	image_xscale = lerp(image_xscale, 1.1, 0.25);	
	image_yscale = lerp(image_yscale, 1.1, 0.25);	
} else {
	image_xscale = lerp(image_xscale, 1, 0.25);	
	image_yscale = lerp(image_yscale, 1, 0.25);
}

if saveslot == 1 {
	if file_exists("slot1.ini") {
		ini_open("slot1.ini")
		if ini_section_exists("slot") or ini_key_exists("slot", "chapter")
			prog = ini_read_real("slot", "chapter", 256);
		else
			prog = 256;
			
		if prog >= 7
			corrupted = true;
		else if prog <= -1
			corrupted = true;
			
		ini_close();
		
		if prog == 0
			sprite_index = spr_saveslot_blank;
		else if prog == 1
			sprite_index = spr_saveslot_chapter1;
		else if prog == 2
			sprite_index = spr_saveslot_chapter2;
		else if prog == 3
			sprite_index = spr_saveslot_chapter3;
		else if prog == 4
			sprite_index = spr_saveslot_chapter4;
		else if prog == 5
			sprite_index = spr_saveslot_chapter5;
		else if prog == 6
			sprite_index = spr_saveslot_complete;
	} else {
		sprite_index = spr_saveslot_blank;
		prog = 0;
	}
} else if saveslot == 2 {
	if file_exists("slot2.ini") {
		ini_open("slot2.ini")
		if ini_section_exists("slot") or ini_key_exists("slot", "chapter")
			prog = ini_read_real("slot", "chapter", 256);
		else
			prog = 256;
			
		if prog >= 7
			corrupted = true;
		else if prog <= -1
			corrupted = true;
			
		ini_close();
		
		if prog == 0
			sprite_index = spr_saveslot_blank;
		else if prog == 1
			sprite_index = spr_saveslot_chapter1;
		else if prog == 2
			sprite_index = spr_saveslot_chapter2;
		else if prog == 3
			sprite_index = spr_saveslot_chapter3;
		else if prog == 4
			sprite_index = spr_saveslot_chapter4;
		else if prog == 5
			sprite_index = spr_saveslot_chapter5;
		else if prog == 6
			sprite_index = spr_saveslot_complete;
	} else {
		sprite_index = spr_saveslot_blank;
		prog = 0;
	}
} else if saveslot == 3 {
	if file_exists("slot3.ini") {
		ini_open("slot3.ini")
		if ini_section_exists("slot") or ini_key_exists("slot", "chapter")
			prog = ini_read_real("slot", "chapter", 256);
		else
			prog = 256;
			
		if prog >= 7
			corrupted = true;
		else if prog <= -1
			corrupted = true;
			
		ini_close();
		
		if prog == 0
			sprite_index = spr_saveslot_blank;
		else if prog == 1
			sprite_index = spr_saveslot_chapter1;
		else if prog == 2
			sprite_index = spr_saveslot_chapter2;
		else if prog == 3
			sprite_index = spr_saveslot_chapter3;
		else if prog == 4
			sprite_index = spr_saveslot_chapter4;
		else if prog == 5
			sprite_index = spr_saveslot_chapter5;
		else if prog == 6
			sprite_index = spr_saveslot_complete;
	} else {
		sprite_index = spr_saveslot_blank;
		prog = 0;
	}
} else if saveslot == 4 {
	if file_exists("slot4.ini") {
		ini_open("slot4.ini")
		if ini_section_exists("slot") or ini_key_exists("slot", "chapter")
			prog = ini_read_real("slot", "chapter", 256);
		else
			prog = 256;
			
		if prog >= 7
			corrupted = true;
		else if prog <= -1
			corrupted = true;
			
		ini_close();
		
		if prog == 0
			sprite_index = spr_saveslot_blank;
		else if prog == 1
			sprite_index = spr_saveslot_chapter1;
		else if prog == 2
			sprite_index = spr_saveslot_chapter2;
		else if prog == 3
			sprite_index = spr_saveslot_chapter3;
		else if prog == 4
			sprite_index = spr_saveslot_chapter4;
		else if prog == 5
			sprite_index = spr_saveslot_chapter5;
		else if prog == 6
			sprite_index = spr_saveslot_complete;
	} else {
		sprite_index = spr_saveslot_blank;
		prog = 0;
	}
} else if saveslot == 5 {
	if file_exists("slot5.ini") {
		ini_open("slot5.ini")
		if ini_section_exists("slot") or ini_key_exists("slot", "chapter")
			prog = ini_read_real("slot", "chapter", 256);
		else
			prog = 256;
			
		if prog >= 7
			corrupted = true;
		else if prog <= -1
			corrupted = true;
			
		ini_close();
		
		if prog == 0
			sprite_index = spr_saveslot_blank;
		else if prog == 1
			sprite_index = spr_saveslot_chapter1;
		else if prog == 2
			sprite_index = spr_saveslot_chapter2;
		else if prog == 3
			sprite_index = spr_saveslot_chapter3;
		else if prog == 4
			sprite_index = spr_saveslot_chapter4;
		else if prog == 5
			sprite_index = spr_saveslot_chapter5;
		else if prog == 6
			sprite_index = spr_saveslot_complete;
		
	} else {
		sprite_index = spr_saveslot_blank;
		prog = 0;
	}
} else {
	instance_destroy();
}