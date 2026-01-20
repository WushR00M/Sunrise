if !levelsread
	read_levels("levels");

function read_levels(sub_dir) {
	var file_list = ds_list_create();
	var path = working_directory + sub_dir + "/*";
	var file_name = file_find_first(path, 0);
	
	while (file_name != "") {
		if string_count(".srlvl", file_name) >= 1 {
			ds_list_add(file_list, string_concat(file_name));
			show_debug_message(string_concat("Level File Found: ", file_name));
		}
			
		file_name = file_find_next();
	}
	
	file_find_close();
	
	for (var i = 0; i < ds_list_size(file_list); i++) {
		var current_file = ds_list_find_index(file_list, i);
		var full_file_path = string_concat(working_directory, sub_dir, "/", current_file);
		
		var file_id = ini_open(full_file_path);
		if (file_id != -1) {
			var level_name = ini_read_string("info", "levelname", "Unknown Level Name");
			ini_close();
			ds_list_add(level_list, string_concat(level_name, " (", file_name, ")"));
		} else {
			ds_list_add(level_list, "Corrupted Data");
		}
	}
	
	ds_list_destroy(file_list);
	levelsread = true;
}