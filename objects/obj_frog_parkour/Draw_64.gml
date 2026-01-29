// Save current font
var _old_font = draw_get_font();

// Stamina bar
var _dx = 16;
var _dy = 16;
var _barw = 256;
var _barh = 32;

var _stamina_barw = _barw * (stamina / max_stamina);

// Background box
draw_sprite_stretched(spr_box, 0, _dx, _dy, _barw, _barh);

// Stamina bar - changes color based on stamina level
var _stamina_color = c_yellow;
if (stamina < jump_stamina_cost) _stamina_color = c_red;
else if (stamina < 50) _stamina_color = c_orange;

draw_sprite_stretched_ext(spr_box, 1, _dx, _dy, _stamina_barw, _barh, _stamina_color, 0.6);

// Display stamina text with correct font
draw_set_font(Font2); // Set your stamina font
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_text(_dx + _barw / 2, _dy + 8, "STAMINA");
draw_set_halign(fa_left);

// Restore original font
draw_set_font(_old_font);