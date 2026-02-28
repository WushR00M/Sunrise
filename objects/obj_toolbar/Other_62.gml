if ds_map_find_value(async_load, "id") == download
{
    var status = ds_map_find_value(async_load, "status");
    if status == 0
    {
        var path = ds_map_find_value(async_load, "result");
		ini_open(path);
		log("Level file opened!");
		if ini_section_exists("info") {
			log("Valid [1]");
			if ini_key_exists("info","name") {
				log("Valid [2]");
				global.newlvl = ini_read_string("info","name","Unnamed Level")
				if ini_key_exists("info","author") {
					log("Valid [3]");
					global.lvlauthor = ini_read_string("info","author","Unknown");
										
					layer_destroy_instances("Objects");
										
							ini_open(path);
							var index = 0;

							while (true) {
								var section_name = "Object_" + string(index);
								if (!ini_section_exists(section_name)) {
							break; // No more entries
						}
						var obj_name = ini_read_string(section_name, "name", "");
						var obj_x = ini_read_real(section_name, "x", 0);
						var obj_y = ini_read_real(section_name, "y", 0);
											
					    var obj_index = asset_get_index(obj_name);
					    if (obj_index != -1) {
					        instance_create_layer(obj_x, obj_y, "Objects", obj_index);
						}
					    index += 1;
					}
	
					ini_close();
					log("Level parsed successfully!");
					toast_dismiss();
					toast_create("Level successfully opened!", 2);
					window_set_caption("Sunrise Editor - " + global.newlvl);
				} else {
					ini_close();
					log("Error: author not found");
					toast_dismiss();
					toast_create("FAILURE: We couldn't open your level file!", 4);
				}
			} else {
				ini_close();
				log("Error: level title not found");
				toast_dismiss();
				toast_create("FAILURE: We couldn't open your level file!", 4);
			}
		} else {
			ini_close();
			log("Error: info section not found");
			toast_dismiss();
			toast_create("FAILURE: We couldn't open your level file!", 4);
		}
    } else {
		toast_dismiss();
		toast_create("FAILURE: Your level download failed with error code: " + string(status), 4);
	}
}