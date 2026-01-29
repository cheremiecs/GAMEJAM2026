move_speed = 1;

tilemap = layer_tilemap_get_id("Tile_col"); // cehck collision against sa ato wall

hp = 10;
hp_total = hp;
damage = 1;

facing = 0; 

//jumping mechanics trial run
is_jumping = false;
jump_timer = 0;
jump_duration = 15; 
jump_distance = 32;

mask_index = spr_frog_collision;