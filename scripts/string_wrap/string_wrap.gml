function string_wrap(argument0, argument1){
	/// @function string_wrap(str, max_width)
	/// @desc Word-wrap a string to fit within a maximum pixel width.
	/// @param str
	/// @param max_width
	/// @return Wrapped string with line breaks ("\n")

	var str = argument0;
	var max_width = argument1;

	var words = string_split(str, " ");
	var wrapped = "";
	var line = "";

	for (var i = 0; i < array_length(words); i++) {
	    var word = words[i];
	    var test_line = line;
    
	    if (line != "") {
	        test_line += " ";
	    }
	    test_line += word;

	    if (string_width(test_line) > max_width) {
	        // Commit current line and start a new one
	        if (wrapped != "") wrapped += "\n";
	        wrapped += line;
	        line = word;
	    } else {
	        line = test_line;
	    }
	}

	// Add the final line
	if (line != "") {
	    if (wrapped != "") wrapped += "\n";
	    wrapped += line;
	}

	return wrapped;
}