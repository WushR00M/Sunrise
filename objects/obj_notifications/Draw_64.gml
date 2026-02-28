for (var i = 0; i < array_length(notifications); i++)
{
    var n = notifications[i];
    var progress = clamp(n.timer / n.max_time, 0, 1);
	
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
    
    draw_set_color(make_color_rgb(28,28,28));
    draw_roundrect(n.x, n.y, n.x + box_width, n.y + n.height, false);
    
    var text_x = n.x + 16;
    var text_y = n.y + 14;
    
    // Title
    draw_set_font(fnt_default_bold);
    draw_set_color(c_white);
    draw_text(text_x, text_y, n.title);
    
    text_y += string_height(n.title) + 6;
    
    // Description
    draw_set_font(fnt_default);
    draw_set_color(c_ltgray);
    draw_text(text_x, text_y, n.wrapped_desc);
    
    // Progress bar
    var bar_y = n.y + n.height - 6;
    
    draw_set_color(make_color_rgb(40,80,160));
    draw_rectangle(
        n.x,
        bar_y,
        n.x + box_width * progress,
        bar_y + 6,
        false
    );
}
