hover = false;
slideout = false;
click = false;
temp = false;

timer = 0;
timer2 = 0;
duration = 60;
basey = y;
finy = -360;

if global.titleanim {
	y = -360;
	instance_create_depth(0, 0, -1, obj_fadeout_routine);
} else {
	instance_create_depth(0, 0, -1, obj_flashout_routine);	
}

if !audio_is_playing(mus_newtitle) && !audio_is_playing(mus_starrise) {
	var e = irandom_range(1, 2);
	
	if e == 1 {
		audio_play_sound(mus_newtitle, 0, false);
		notify("Music - Now Playing:", "WushR00M - On The Horizon");
	} else if e == 2 {
		audio_play_sound(mus_starrise, 0, false);
		notify("Music - Now Playing:", "Soba Noodles - Star Rise");
	}
}

window_set_caption("Sunrise");