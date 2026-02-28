function rescan_options(){
	ini_open("settings.ini")
	
	global.op_discordrp = ini_read_real("options", "Discord Rich Presence", 0);
	global.op_legacytitle = ini_read_real("options", "Legacy Title Sequence", 0);
	global.op_showhud = ini_read_real("options", "Show HUD", 0);
	global.op_progdisp = ini_read_real("options", "Progress Display", 0);
	global.op_cardskip = ini_read_real("options", "Skip Title Cards", 0);
	global.op_keystroke = ini_read_real("options", "Always Show Key Strokes", 0);
	global.op_bgdimming = ini_read_real("options", "Level Background Dimming", 0);
	global.op_leaderboard = ini_read_real("options", "Show Leaderboard during Gameplay", 0);
	global.op_casualmode = ini_read_real("options", "Casual Mode", 0);
	global.op_collidetag = ini_read_real("options", "Show Collision Tags", 0);
	global.op_pathfind = ini_read_real("options", "Show Path Finders", 0);
	global.op_debughud = ini_read_real("options", "Show Debug HUD", 0);
	global.op_fullscreen = ini_read_real("options", "Fullscreen Mode", 0);
	global.op_borderless = ini_read_real("options", "Borderless Fullscreen", 0);
	global.op_mouseconfine = ini_read_real("options", "Confine Mouse to Window", 0);
	global.op_letterbox = ini_read_real("options", "Letterbox Mode", 0);
	global.op_shaders = ini_read_real("options", "Shaders", 0);
	global.op_colorblind = ini_read_real("options", "Colorblind Icons", 0);
	global.op_titlesnow = ini_read_real("options", "Title Screen Snow", 0);
	global.op_parallax = ini_read_real("options", "Menu Parallax Effects", 0);
	global.op_titlecolors = ini_read_real("options", "Seasonal Title Screen Colors", 0);
	global.op_jpegscreenie = ini_read_real("options", "Web-Friendly Screenshot Format (JPEG)", 0);
	global.op_showfps = ini_read_real("options", "Show FPS", 0);
	global.op_tablet = ini_read_real("options", "Tablet Mode", 0);
	global.op_rawinput = ini_read_real("options", "Raw Input", 0);
	global.op_virtkey = ini_read_real("options", "Always Use Virtual Keyboard", 0);
	global.op_haptics = ini_read_real("options", "Haptics", 0);
	global.op_buttonguide = ini_read_real("options", "In-Game Button Guide", 0);
	global.op_lightbar = ini_read_real("options", "Custom Light Bar Color", 0);
	global.op_japcontrol = ini_read_real("options", "Switch ACCEPT and CANCEL Mappings", 0);
	global.op_halfsize = ini_read_real("options", "x0.5 Windowed Scale", 0);
	
	ini_close();
}