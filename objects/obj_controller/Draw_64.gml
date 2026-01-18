if InputPlayerUsingGamepad(0) {
	var pr_y = room_width - 32;
	
	draw_set_color(c_white);
	draw_set_alpha(1);
	draw_set_font(Font8);
	
	draw_set_halign(fa_left);
	draw_set_valign(fa_center);
	
	if prompt_action != "" {
		draw_sprite(spr_generic_face1, 0, 32, pr_y);
		draw_text(72, pr_y, prompt_action);
	} 
	pr_y -= 72;
	if prompt_cancel != "" {
		draw_sprite(spr_generic_face2, 0, 32, pr_y);
		draw_text(72, pr_y, prompt_cancel);
	} 
	pr_y -= 72;
	if prompt_special != "" {
		draw_sprite(spr_generic_face3, 0, 32, pr_y);
		draw_text(72, pr_y, prompt_special);
	} 
	pr_y -= 72;
	if prompt_triangle != "" {
		draw_sprite(spr_generic_face4, 0, 32, pr_y);
		draw_text(72, pr_y, prompt_triangle);
	}
}