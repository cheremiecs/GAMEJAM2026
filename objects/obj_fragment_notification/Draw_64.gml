var _gui_width = display_get_gui_width();
var _gui_height = display_get_gui_height();

// Save current font
var _old_font = draw_get_font();
draw_set_font(Font2);

// Position at bottom center
var _x = _gui_width / 2;
var _y = _gui_height - 100; // 100 pixels from bottom

// Draw text with fade
draw_set_alpha(alpha);
draw_set_color(c_yellow);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_text(_x, _y, "Fragment Collected!");
draw_text(_x, _y + 30, string(fragment_count) + " / " + string(fragment_total));

// Reset draw settings
draw_set_alpha(1);
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(_old_font);