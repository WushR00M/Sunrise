function ui_english() {
	try {
		if file_exists("UI_English.json") {
			var file_text = file_text_open_read("UI_English.json");
			var json_string = "";

		    while (!file_text_eof(file_text)) {
		        json_string += file_text_read_string(file_text);
		        file_text_readln(file_text);
		    }
		    file_text_close(file_text);
	    } else {
			log( "--------------------------------------------------------------");
			log( "A required datafile was not found! Sunrise will now close:");
		    log( "Missing file: \"UI_English.json\"" );
		    log( "--------------------------------------------------------------");

		    if file_exists("crash.log") file_delete("crash.log");
		    var _f = file_text_open_write("crash.log");
		    file_text_write_string(_f, "Sunrise: CRITICAL Error Report" + "\n \n" + "Missing required datafile: \"UI_English.json\"");
		    file_text_close(_f);

		    show_message("A serious error has occured and Sunrise needs to close. We apologise for the inconvience! You can view the crash log in \"crash.txt\".");	
			game_end();
	    }
		
		var ui_data = json_parse(json_string);

		try {
		    var keys = variable_struct_get_names(ui_data);
	        for (var i = 0; i < array_length(keys); i++) {
	            var key = keys[i];
	            var value = variable_struct_get(ui_data, key);
	            log(string_concat("Localization Setup - ", $"Key: {key}, Value: {string(value)}"));
				
				variable_global_set(key, value);
	        }
		} catch(ex) {
			if global.op_errorep
				toast_create("FAILURE: An internal error has occured and has been reported to WushR00M Studios.", 4);
			else
				toast_create("FAILURE: An internal error has occured. Error data has been dumped to a debug file.", 4);
		
			if file_exists("error_rep.log") file_delete("error_rep.log");
			var _f = file_text_open_write("error_rep.log");
			file_text_write_string(_f, "Sunrise: Error Report\n \n" + ex.longMessage);
			file_text_close(_f);
	
			log( "--------------------------------------------------------------");
			log( "An error has occured:" );
		    log( string(ex.longMessage) );
		    log( "--------------------------------------------------------------");	
		}
		
		// Accounts Data
		
		
	} catch(ex) {
		log( "--------------------------------------------------------------");
		log( "A CRITICAL Error has occured, Sunrise will now close:" );
	    log( string(ex.longMessage) );
	    log( "--------------------------------------------------------------");

	    if file_exists("crash.log") file_delete("crash.log");
	    var _f = file_text_open_write("crash.log");
	    file_text_write_string(_f, "Sunrise: CRITICAL Error Report" + "\n \n" + string(ex));
	    file_text_close(_f);

	    show_message("A serious error has occured and Sunrise needs to close. We apologise for the inconvience! You can view the crash log in \"crash.txt\".");	
		game_end();
	}
}

function ui_spanish() {
	try {
		if file_exists("UI_Spanish.json") {
			var file_text = file_text_open_read("UI_Spanish.json");
			var json_string = "";

		    while (!file_text_eof(file_text)) {
		        json_string += file_text_read_string(file_text);
		        file_text_readln(file_text);
		    }
		    file_text_close(file_text);
	    } else {
			log( "--------------------------------------------------------------");
			log( "A required datafile was not found! Sunrise will now close:");
		    log( "Missing file: \"UI_English.json\"" );
		    log( "--------------------------------------------------------------");

		    if file_exists("crash.log") file_delete("crash.log");
		    var _f = file_text_open_write("crash.log");
		    file_text_write_string(_f, "Sunrise: CRITICAL Error Report" + "\n \n" + "Missing required datafile: \"UI_English.json\"");
		    file_text_close(_f);

		    show_message("A serious error has occured and Sunrise needs to close. We apologise for the inconvience! You can view the crash log in \"crash.txt\".");	
			game_end();
	    }
		
		var ui_data = json_parse(json_string);

		try {
		    var keys = variable_struct_get_names(ui_data);
	        for (var i = 0; i < array_length(keys); i++) {
	            var key = keys[i];
	            var value = variable_struct_get(ui_data, key);
	            log(string_concat("Localization Setup - ", $"Key: {key}, Value: {string(value)}"));
				
				variable_global_set(key, value);
	        }
		} catch(ex) {
			if global.op_errorep
				toast_create("FAILURE: An internal error has occured and has been reported to WushR00M Studios.", 4);
			else
				toast_create("FAILURE: An internal error has occured. Error data has been dumped to a debug file.", 4);
		
			if file_exists("error_rep.log") file_delete("error_rep.log");
			var _f = file_text_open_write("error_rep.log");
			file_text_write_string(_f, "Sunrise: Error Report\n \n" + ex.longMessage);
			file_text_close(_f);
	
			log( "--------------------------------------------------------------");
			log( "An error has occured:" );
		    log( string(ex.longMessage) );
		    log( "--------------------------------------------------------------");	
		}
		
		// Accounts Data
		
		
	} catch(ex) {
		log( "--------------------------------------------------------------");
		log( "A CRITICAL Error has occured, Sunrise will now close:" );
	    log( string(ex.longMessage) );
	    log( "--------------------------------------------------------------");

	    if file_exists("crash.log") file_delete("crash.log");
	    var _f = file_text_open_write("crash.log");
	    file_text_write_string(_f, "Sunrise: CRITICAL Error Report" + "\n \n" + string(ex));
	    file_text_close(_f);

	    show_message("A serious error has occured and Sunrise needs to close. We apologise for the inconvience! You can view the crash log in \"crash.txt\".");	
		game_end();
	}
}