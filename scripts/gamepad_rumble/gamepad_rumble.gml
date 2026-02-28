function gamepad_rumble(timer, strenght){
	InputVibratePulse(strenght, 0, false, timer*1000, 0);
}