function sunrise_init(){
	global.gameLoaded = false;
	var browserm = false;
	
	// OPERATING SYSTEM SPECIFIC MEASURES
	if os_type == os_linux {
		// Prevent the game from running in SUDO mode as this can cause serious security risks!!
		
	}
	
	if os_browser == browser_not_a_browser {
		browserm = false;
	} else { browserm = true; 
	// Check which browser is being used!
		var browsertype = os_browser;
		if browsertype == browser_ie {
			show_message("Sorry! Internet Explorer is no longer supported for Sunrise! The game will not continue.");
			game_end();
		} else if browsertype == browser_ie_mobile {
			show_message("Sorry! Internet Explorer Mobile is no longer supported for Sunrise! The game will not continue.");
			game_end();
		}
	}
	
	// FOR DEVELOPMENT PURPOSES ONLY. USUALLY COMMENTED OUT UNLESS BETA TESTING
	var devmode = true;
	
	// EXTRA VARIABLES TO LOAD BEFORE WE LOAD AUDIO AND INI DATA
	global.collision_array = [obj_solid_cm]; // Solid blocks to load for the level editor
	
	// LOAD AUDIO GROUPS AND ASSETS
	audio_group_load(audiogroup_default);
	
	if browserm == false {
		// LOAD USER DATA (unless it's nonexistant)
		if file_exists("user.ini") {
			ini_open("user.ini");
			global.username = ini_read_string("info","uname","Guest");
			global.userid = ini_read_string("info","uid","Guest");
			global.pw = ini_read_string("info","upass","Guest");
			ini_close();
		} else {
			// Init Guest System if User Data INI File is missing
			ini_open("user.ini");
			ini_write_string("info","uname","Guest");
			global.username = ini_read_string("info","uname","Guest");
			ini_write_string("info","uname","Guest");
			global.userid = ini_read_string("info","uid","Guest");
			ini_write_string("info","uname","Guest");
			global.pw = ini_read_string("info","upass","Guest");
			ini_close();
		}
	
		// LOAD USER SET SETTINGS
		ini_open("user.ini");
		if ini_section_exists("settings") {
			global.opt_fscr = ini_read_string("settings","fullscreen","0");
			global.opt_debug = ini_read_real("settings","debug", 0);
			global.opt_psmode = ini_read_real("settings","photosen", 0);
			global.opt_palmode = ini_read_real("settings","pal", 0);
			global.opt_extcam = ini_read_real("settings","extcam", 0);
			global.opt_bbars = ini_read_real("settings","blackbars", 0);
			global.opt_mastervol = ini_read_real("settings","volume", 1);
			global.languageopt = ini_read_real("settings","language", noone);
			ini_close();
		} else {
			// Set factory default values
			global.opt_fscr = ini_write_real("settings","fullscreen", 0);
			global.opt_debug = ini_write_real("settings","debug", 0);
			global.opt_psmode = ini_write_real("settings","photosen", 0);
			global.opt_palmode = ini_write_real("settings","pal", 0);
			global.opt_extcam = ini_write_real("settings","extcam", 0);
			global.opt_bbars = ini_write_real("settings","blackbars", 0);
			global.opt_mastervol = ini_write_real("settings","volume", 1);
			
			global.opt_fscr = 0;
			global.opt_debug = 0;
			global.opt_psmode = 0;
			global.opt_palmode = 0;
			global.opt_extcam = 0;
			global.opt_bbars = 0;
			global.opt_mastervol = 1;
			
			ini_close();
			room_goto(rm_setup);
		}
	 } else {
		show_message("You are running Sunrise in your browser. As such, most save functionality will be disabled as it is impossible.");	
	}
	
	// LOAD DEBUG UTILITES & TEXT IF DEBUG OPTIONS ARE ENABLED
	if (global.opt_debug == 1 or devmode == true ) {
		global.vertext = true;
		global.debugmenu = true;
		global.debugcur = true;
	} else { 
		global.vertext = false;
		global.debugmenu = false;
		global.debugcur = false;
	}
	
	if file_exists("menuconfig.ini") {
		ini_open("menuconfig.ini");
	} else {
		ini_open("menuconfig.ini");
		ini_write_real("mainmenu","playbuttonx",1120)
		ini_write_real("mainmenu","playbuttony",216)
		ini_write_real("mainmenu","createbuttonx",960)
		ini_write_real("mainmenu","createbuttony",680)
		ini_write_real("mainmenu","connectbuttonx",1040)
		ini_write_real("mainmenu","connectbuttony",472)
		ini_write_real("mainmenu","screensaverx",0)
		ini_write_real("mainmenu","screensavery",0)
		ini_write_string("mainmenu","screensaverenabled","true")
	}
	
	global.playbx = ini_read_real("mainmenu","playbuttonx",1120)
	global.playby = ini_read_real("mainmenu","playbuttony",216)
	global.createbx = ini_read_real("mainmenu","createbuttonx",960)
	global.createby = ini_read_real("mainmenu","createbuttony",680)
	global.connectbx = ini_read_real("mainmenu","connectbuttonx",1040)
	global.connectby = ini_read_real("mainmenu","connectbuttony",472)
	global.screensavx = ini_read_real("mainmenu","screensaverx",0)
	global.screensavy = ini_read_real("mainmenu","screensavery",0)
	global.ssenabled = ini_read_string("mainmenu","screensaverenabled","true")
	
	ini_close()
	
	// INIT OPTIONS
	
	global.loadinglvl = false;
	
	global.gameLoaded = true;
}