global.cmspawn_x = x;
global.cmspawn_y = y;

if rcm == true {
	if keyboard_check_pressed(ord("A")) {
		x -= 32;
	}
	if keyboard_check_pressed(ord("D")) {
		x += 32;
	}
	if keyboard_check_pressed(ord("W")) {
		y -= 32;
	}
	if keyboard_check_pressed(ord("S")) {
		y += 32;
	}
} else { }