	function player_animation_list(){
		animation_add(ANIM_STAND, spr_dash_idle, 0.2)
		animation_add(ANIM_WAIT, spr_dash_idle, 6, 2, true, true);
		animation_add(ANIM_WALK, spr_dash_walking, 3, 0, true, true);
		animation_add(ANIM_RUN, spr_dash_running, 2, 0, true, true);
		animation_add(ANIM_MAXRUN, spr_dash_flight, 0, 0, true, true);
		animation_add(ANIM_JUMP, spr_dash_jumping, 0, 0, true, true);
		animation_add(ANIM_ROLL, spr_dash_roll, 0, 0, true, true);
		animation_add(ANIM_SKID, spr_dash_skid, 0.4, 0, false, false);
		animation_add(ANIM_SKIDTURN, spr_dash_skidturn, 0.3, 0, false, false);
		animation_add(ANIM_HURT, spr_dash_idle, 0.3, 0, false, false);
		animation_add(ANIM_DIE, spr_dash_idle, 0.3, 0, false, false);
		animation_add(ANIM_DROWN, spr_dash_idle, 0.3, 0, false, false);
		animation_add(ANIM_BREATHE, spr_dash_idle, 16, 0, false, true);
		animation_add(ANIM_PUSH, spr_dash_idle, 0.1, 0, true, false);
		animation_add(ANIM_LEDGE1, spr_dash_idle, 0.1, 0, true, false);
		animation_add(ANIM_LEDGE2, spr_dash_idle, 0.1, 0, true, false);
		animation_add(ANIM_VICTORY, spr_dash_idle, 0.1, 1, true, false);
	}