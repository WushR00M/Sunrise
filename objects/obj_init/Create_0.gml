// Initialize Global Variables

global.connected = false;
global.gamejoltlogin = 0;
global.gj_user = "";
global.gj_token = "";
global.menuindex = 0;
global.gamejoltlogin1 = false;
global.gamejoltlogin2 = false;
global.online_user = false;
global.setup = false;
global.titleanim = false;
global.mobile = false;
global.server_socket = "";
global.client_sockets = "";
global.client_socket = "";
global.party_list = "";
global.op_language = 0;
global.playtestfin = false;
global.exiting = false;
global.input_result = "";
global.input_finished = false;
global.controllertype = 0;
global.current_user = "Guest";
global.setup = true;
global.gamerestart = false;
global.creditschaptermode = false;
global.fromeditor = false;
global.fromgo = false;

	global.op_discordrp = false;
	global.op_showhud = false;
	global.op_progdisp = false;
	global.op_cardskip = false;
	global.op_keystroke = false;
	global.op_bgdimming = false;
	global.op_leaderboard = false;
	global.op_casualmode = false;
	global.op_collidetag = false;
	global.op_pathfind = false;
	global.op_debughud = false;
	global.op_fullscreen = false;
	global.op_borderless = false;
	global.op_letterbox = false;
	global.op_shaders = false;
	global.op_colorblind = false;
	global.op_titlesnow = false;
	global.op_parallax = false;
	global.op_titlecolors = false;
	global.op_jpegscreenie = false;
	global.op_showfps = false;
	global.op_tablet = false;
	global.op_rawinput = false;
	global.op_virtkey = false;
	global.op_haptics = false;
	global.op_buttonguide = false;
	global.op_lightbar = false;
	global.op_japcontrol = false;
	global.op_legacytitle = false;
	global.op_mouseconfine = false;
	global.op_halfsize = false;
	global.op_musicat = false;

global.object_timer = 0;
global.window_width = window_get_width();
global.window_height = window_get_height();

global.lvl_transition = false;
global.rotation_type = 0;				//This changes player's visual rotation 
global.use_airroll = true;				//Flag that allows rolling while air-borne
global.chaotix_dust_effect = false;		//Flag that disables classic spindash/skid dust effect
global.camera_type = 1;					//Vertical camera scrolling type
global.stage_timer = 0;

global.boostpad_contact = false;

global.character = 0; // Placeholder, character switching will come later!

global.bits = 0;
global.score = 0;

global.levelname = "Level Name"

global.col_tile = ["CollisionMain", "CollisionSemi", "CollisionA", "CollisionB"];
global.hud_number = font_add_sprite(spr_hudnumbers, ord("0"), false, 0);

global.openfromfile = "";

volume_slider_show = false;
volume_slider_time = 5*60;
volume_slider_y = view_hport[0] + 64;
volume_slider_y2 = view_hport - 16;
global.mastervol = 60;

#macro WINDOW_WIDTH 1366
#macro WINDOW_HEIGHT 768

fpswarn = false;

init_var();

// Finish Preloading + Load Options and Definitions

audio_group_load(audiogroup_default);
audio_master_gain(global.mastervol / 100);

if file_exists("latest_log.txt")
	file_delete("latest_log.txt");
	
logfile = file_text_open_write("latest_log.txt");
file_text_write_string(logfile, "Sunrise Client Log (latest): \n ");
file_text_close(logfile); 

if os_type == os_android
	global.mobile = true;	
	
if os_type == os_windows
	window_command_hook(window_command_close);

	if InputPlayerUsingGamepad(0) {
		var _type = InputPlayerGetGamepadType(_player_index);
	    switch(_type)
	    {
	        case INPUT_GAMEPAD_TYPE_UNKNOWN:
	            global.controllertype = 4;
	        break;

	        case INPUT_GAMEPAD_TYPE_PS4:
				global.controllertype = 1;
			break;
	        case INPUT_GAMEPAD_TYPE_PS5:
	            global.controllertype = 2;
	        break;

	        case INPUT_GAMEPAD_TYPE_SWITCH:
	            global.controllertype = 3;
	        break;
		
			case INPUT_GAMEPAD_TYPE_XBOX:
				global.controllertype = 0;
			break;

	        default:
	            global.controllertype = 5;
	        break;
	    }
	}
	
//////////////////////////////////////////////////////////////////////////

if file_exists("settings.ini") {
	global.setup = false;
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
	global.op_musicat = ini_read_real("options", "Music Attenution", 0);
	
	ui_english();
	ini_close();
	global.current_user = "Guest";
} else {
	global.current_user = "Guest";
	ui_english();
	global.setup = true;
}

//////////////////////////////////////////////////////////////////////////

if global.op_borderless == 1 {
	window_enable_borderless_fullscreen(true);
	log("Borderless Fullscreen enabled");
}
	
if global.op_fullscreen == 1 {
	window_set_fullscreen(true);
	log("Fullscreen active");
}
	
if global.op_discordrp == 1 && !global.mobile {
	instance_create_depth(0, 0, -1, obj_richpres);
	log("Starting Discord Rich Presence...");
}

//////////////////////////////////////////////////////////////////////////

room_goto_next();