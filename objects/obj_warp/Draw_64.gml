//the animation before to mo switch ug map / room 

var _gui_width = display_get_gui_width();
var _gui_height = display_get_gui_height();

// Draw your WHITE sprite stretched to cover entire screen first
draw_sprite_stretched(spr_warp, image_index, 0, 0, _gui_width, _gui_height);
