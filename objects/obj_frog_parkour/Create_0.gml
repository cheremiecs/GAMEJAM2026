/*move_speed = 1;

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
 */

move_speed = 1;
tilemap = layer_tilemap_get_id("Tile_col");
hp = 10;
hp_total = hp;
damage = 1;
facing = 1;

// Platformer physics - USE CUSTOM NAMES, NOT hspeed/vspeed
grav = 0.25;
vel_y = 0; // Changed from vspeed
vel_x = 0; // Changed from hspeed
jump_speed = -5;
max_fall_speed = 8;
on_ground = false;

// Double jump
max_jumps = 2;
jumps_left = max_jumps;