if timer == 22
	phase = 2;
	
if timer == 34
	phase = 3;
	
if timer == 45 {
	notify("Music - Now Playing:", "WushR00M - On The Horizon");
	room_goto(rm_title_screen);
}

timer++;