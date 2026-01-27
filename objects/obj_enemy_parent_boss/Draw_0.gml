// Draw the sprite first
draw_self();

// Health bar above boss
var _bar_width = 64;
var _bar_height = 8;
var _bar_x = x - _bar_width / 2;
var _bar_y = y - sprite_height / 2 - 16;

// Background (black border)
draw_set_color(c_black);
draw_rectangle(_bar_x - 1, _bar_y - 1, _bar_x + _bar_width + 1, _bar_y + _bar_height + 1, false);

// Health bar (red)
var _health_width = _bar_width * (hp / hp_total);
draw_set_color(c_red);
draw_rectangle(_bar_x, _bar_y, _bar_x + _health_width, _bar_y + _bar_height, false);

// Background (gray for missing health)
draw_set_color(c_gray);
draw_rectangle(_bar_x + _health_width, _bar_y, _bar_x + _bar_width, _bar_y + _bar_height, false);

draw_set_color(c_white); // Reset color