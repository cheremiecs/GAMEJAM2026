// Draw dark overlay
draw_set_alpha(alpha);
draw_set_color(c_black);
draw_rectangle(0, 0, gui_width, gui_height, false);

// Draw text if fully visible
if (alpha >= 0.8)
{
    draw_set_color(c_white);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    
    // Death message
    draw_text(gui_width / 2, gui_height / 2 - 40, "YOU DIED");
    
    // Smaller text
    draw_set_alpha(alpha * 0.7);
    draw_text(gui_width / 2, gui_height / 2 + 20, "Press SPACE to try again");
}

// Reset draw settings
draw_set_alpha(1);
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);