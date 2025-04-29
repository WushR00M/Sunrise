function scredit_init() {
	// ok so this is where all of the functions are!! they are explained in detail

	////////// VARIABLES
	///// Color Vars
	var blue = c_blue;
	var red = c_red;
	var green = c_green;
	var yellow = c_yellow;
	var orange = c_orange;
	var purple = c_purple;
	var white = c_white;
	var black = c_black;
	var cyan = c_aqua

	///// Custom GUI Positions
	var top_y = 64;
	var center_y = view_hport[0]/2;
	var bottom_y = view_hport[0] - 164;

	var left_x = 64;
	var center_x = view_wport[0]/2;
	var right_x = view_wport[0] - 164;

	var top_left = false;
	var top_center = false;
	var top_right = false;

	var center_left = false;
	var center = false;
	var center_right = false;

	var bottom_left = false;
	var bottom_center = false;
	var bottom_right = false;

	///// Controls

	var plrkeyboard = false;
	var plrcontroller = false;

	var kb_w = false;
	var kb_a = false;
	var kb_s = false;
	var kb_d = false; // WASD controls

	var kb_l = false;
	var kb_r = false;
	var kb_u = false;
	var kb_d = false; // arrow keys

	var kb_sp = false; // space
	var kb_sh = false; // sprint / shift

	var kb_int = false; // interact (doors, objects, etc.)

	var cn_a = false; // A on a Controller (cross for PlayStation)
	var cn_b = false; // B on a Controller (circle for PlayStation)
	var cn_x = false; // X on a Controller (square for PlayStation)
	var cn_y = false; // Y on a Controller (triangle for PlayStation), this is interact too

	var cn_l = false;
	var cn_r = false;
	var cn_u = false;
	var cn_d = false; // dpad controls

	var cn_jl = 0;
	var cn_jr = 0;
	var cn_ju = 0;
	var cn_jd = 0; // joystick, they are pressure sensetive, so that's why it's a number
				   // instead of a boolean (true / false)

	///// Custom Player Vars

	var cstplrspd = 5; // 5 is the default!
	var cstplrpos_x = 0;
	var cstplrpos_y = 0;
	
	// 14 Variables can be used in one level, with each being number, string, or bool!
	
	var varint1 = 0;
	var varint2 = 0;
	var varint3 = 0;
	var varint4 = 0;
	var varint5 = 0;
	var varint6 = 0;
	var varint7 = 0;
	var varint8 = 0;
	var varint9 = 0;
	var varint10 = 0;
	var varint11 = 0;
	var varint12 = 0;
	var varint13 = 0;
	var varint14 = 0;
	
	var varstr1 = "";
	var varstr2 = "";
	var varstr3 = "";
	var varstr4 = "";
	var varstr5 = "";
	var varstr6 = "";
	var varstr7 = "";
	var varstr8 = "";
	var varstr9 = "";
	var varstr10 = "";
	var varstr11 = "";
	var varstr12 = "";
	var varstr13 = "";
	var varstr14 = "";
	
	var varbool1 = false;
	var varbool2 = false;
	var varbool3 = false;
	var varbool4 = false;
	var varbool5 = false;
	var varbool6 = false;
	var varbool7 = false;
	var varbool8 = false;
	var varbool9 = false;
	var varbool10 = false;
	var varbool11 = false;
	var varbool12 = false;
	var varbool13 = false;
	var varbool14 = false;
	
	/////////////////////////////////////////////////////////////////////////


	//// All Definitions & Function IDs
	/// When Commands:
	var on_interact = false;
	var on_death = false;
	var on_hurt = false;
	var on_collide = false;
	var on_heal = false;

	var on_level_start = false;
	var on_level_complete = false;
	
	// Equal to When Commands:

	var on_equal_to = false;
	var on_greater_than = false;
	var on_less_than = false;
	var on_great_or_equal_to = false;
	var on_less_or_equal_to = false;
	var on_not_equal_to = false;
	
	// And / Or / Anything Similar to that When Commands:
	
	var that_and = false;
	var that_or = false;
	var isnot = false;

	/// Do Commands:
	var setplrspd = false;
	var showcst_health = false;
	var setplrpos = false;
	var endlvl = false;
	var restlvl = false;
	var stopmovement = false;
}