x = lerp(x, 0, 0.05);

if global.input_finished {
	global.input_result = global.current_user;
	ini_open("settings.ini");
	ini_write_string("user", "name", global.current_user);
	toast_dismiss();
	toast_create("Logged in as: " + global.current_user);
	ini_close();
}