move_speed = 1;
tilemap = layer_tilemap_get_id("Tile_col");
hp = 10;
hp_total = hp;
damage = 1;
facing = 0; 

// Health regeneration
hp_regen_rate = 0.3;
hp_regen_timer = 0;
hp_regen_delay = 180;

// Stamina system for attacking
stamina = 100;
max_stamina = 100;
attack_stamina_cost = 25;
stamina_regen = 0.8;
stamina_regen_delay = 30;
stamina_delay_timer = 0;