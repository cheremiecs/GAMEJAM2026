move_speed = 1; // Speed set to 1
tilemap = layer_tilemap_get_id("Tile_col");
hp = 10;
hp_total = hp;
damage = 1;
facing = 1;

// Platformer physics
grav = 0.25;
vel_y = 0;
vel_x = 0;
jump_speed = -5;
max_fall_speed = 8;
on_ground = false;

// Double jump
max_jumps = 2;
jumps_left = max_jumps;

// Stamina system
stamina = 100;
max_stamina = 100;
jump_stamina_cost = 20;
stamina_regen = 0.5;
stamina_regen_delay = 50;
stamina_delay_timer = 0;

// Coyote time
coyote_time = 6;
coyote_timer = 0;