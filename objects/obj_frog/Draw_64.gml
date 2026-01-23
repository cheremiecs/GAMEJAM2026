//for health related stuff

var _dx = 16;
var _dy = 16;
var _barw = 256;
var _barh = 32;

draw_set_font(Font1); //font sa health bar

//healthbar
var _health_barw = _barw* (hp / hp_total);

draw_sprite_stretched(spr_box, 0, _dx, _dy, _barw, _barh);
draw_sprite_stretched_ext(spr_box, 1, _dx, _dy, _health_barw, _barh, c_red, 0.6);
