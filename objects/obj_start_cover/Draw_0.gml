var scale = 3;

draw_sprite(spr_game_cover, 0, x, y); 

draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);
draw_text(room_width/2, room_height - 100, "Press SPACE to Start");