function log(info) {
	var log_file = file_text_open_append("latest_log.txt");
	file_text_write_string(log_file, string_concat("\n", string(info)));
	file_text_close(log_file);
	show_debug_message(info);
}