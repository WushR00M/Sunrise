window_set_fullscreen(!window_get_fullscreen());
if window_get_fullscreen() == true {
	global.op_fullscreen = true;
	ini_open("settings.ini");
	ini_write_real("options", "Fullscreen Mode", 1);
	ini_close();
	log("Fullscreen was set to true!");
} else {
	global.op_fullscreen = false;
	ini_open("settings.ini");
	ini_write_real("options", "Fullscreen Mode", 0);
	ini_close();
	log("Fullscreen was set to false!");
}