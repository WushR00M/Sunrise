function player_get_input(){
	
	//Button holds
	hold_up = InputCheck(INPUT_VERB.UP);
	hold_down = InputCheck(INPUT_VERB.DOWN);
	hold_left = InputCheck(INPUT_VERB.LEFT);
	hold_right = InputCheck(INPUT_VERB.RIGHT);
	hold_a = InputCheck(INPUT_VERB.ACCEPT);
	hold_b = InputCheck(INPUT_VERB.ACCEPT);
	hold_c = InputCheck(INPUT_VERB.ACCEPT);
	hold_action = InputCheck(INPUT_VERB.ACTION);
	
	//Button holds
	press_up = InputPressed(INPUT_VERB.UP);
	press_down = InputPressed(INPUT_VERB.DOWN);
	press_left = InputPressed(INPUT_VERB.LEFT);
	press_right = InputPressed(INPUT_VERB.RIGHT);
	press_a = InputPressed(INPUT_VERB.ACCEPT);
	press_b = InputPressed(INPUT_VERB.ACCEPT);
	press_c = InputPressed(INPUT_VERB.ACCEPT);
	press_action = InputPressed(INPUT_VERB.ACTION)
	
	//Disable inputs
	if(input_disable)
	{
		//Button holds
		hold_up = false;
		hold_down = false;
		hold_left = false;
		hold_right = false;
		hold_a = false;
		hold_b = false;
		hold_c = false;
		hold_action = false;
	
		//Button holds
		press_up = false;
		press_down = false;
		press_left = false;
		press_right = false;
		press_a = false;
		press_b = false;
		press_c = false;
		press_action = false;	
	}
}