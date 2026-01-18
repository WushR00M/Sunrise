scroll_y -= scroll_speed;

// Optionally reset or destroy object when done
if (scroll_y + array_length(credit_text) * line_height < 0) {
    scroll_y = display_get_height(); // Reset to start from the bottom again
}