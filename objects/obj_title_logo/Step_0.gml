if hover == true {
	image_xscale = lerp(image_xscale, 1.35, 0.05);	
	image_yscale = lerp(image_yscale, 1.35, 0.05);	
} else {
	image_xscale = lerp(image_xscale, 1.25, 0.05);	
	image_yscale = lerp(image_yscale, 1.25, 0.05);		
}

if click == true {
	hover = false;
	if temp == false {
		image_xscale = 1;
		image_yscale = 1;
		temp = true;
	}
	image_xscale = lerp(image_xscale, 1.35, 0.05);
	image_yscale = lerp(image_yscale, 1.35, 0.05);
	if timer2 == 30 {
		slideout = true;
		obj_title_text.slideout = true;
	} else {
		timer2++;
	}
}

if slideout == true {
	timer += 1;
	var _perc = clamp(timer / duration, 0, 1);
	var _easeVal = easeInOutQuad(_perc);
	y = basey + (finy - basey) * _easeVal;
	
	if y < -120 {
		global.titleanim = true;	
	}
}

x = room_width / 2;

if !instance_exists(obj_fadeout_close_game_routine) {
	if !audio_is_playing(mus_newtitle) && !audio_is_playing(mus_starrise) {
		audio_play_sound(mus_starrise, 0, false);
		notify("Music - Now Playing:", "Soba Noodles - Star Rise");
	} else if !audio_is_playing(mus_starrise) && !audio_is_playing(mus_newtitle) {
		audio_play_sound(mus_newtitle, 0, false);
		notify("Music - Now Playing:", "WushR00M - On The Horizon");
	}
}