// Save current font
var _old_font = draw_get_font();

// Health bar
var _dx = 16;
var _dy = 16;
var _barw = 256;
var _barh = 32;
draw_set_font(Font2);

var _health_barw = _barw * (hp / hp_total);
draw_sprite_stretched(spr_box, 0, _dx, _dy, _barw, _barh);
draw_sprite_stretched_ext(spr_box, 1, _dx, _dy, _health_barw, _barh, c_red, 0.6);

draw_set_color(c_white);
draw_set_halign(fa_center);
draw_text(_dx + _barw / 2, _dy + 8, "Health");
draw_set_halign(fa_left);


// Stamina bar
var _stamina_y = _dy + _barh + 40;
var _stamina_barw = _barw * (stamina / max_stamina);

draw_sprite_stretched(spr_box, 0, _dx, _stamina_y, _barw, _barh);

var _stamina_color = c_yellow;
if (stamina < attack_stamina_cost) _stamina_color = c_red;
else if (stamina < 50) _stamina_color = c_orange;

draw_sprite_stretched_ext(spr_box, 1, _dx, _stamina_y, _stamina_barw, _barh, _stamina_color, 0.6);

draw_set_color(c_white);
draw_set_halign(fa_center);
draw_text(_dx + _barw / 2, _stamina_y + 8, "Stamina") ;
draw_set_halign(fa_left);

// Restore font
draw_set_font(_old_font);