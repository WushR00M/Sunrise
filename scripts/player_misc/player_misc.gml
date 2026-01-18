function player_misc(){
	//Subtract timers
	control_lock = max(control_lock-1, 0);
	ceiling_lock = max(ceiling_lock-1, 0);
}