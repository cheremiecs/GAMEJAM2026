target_x = x;
target_y = y;
alarm[0] = 60;
tilemap = layer_tilemap_get_id("Tile_col");

// Knockback
kb_x = 0;
kb_y = 0;

// Boss HP - Add this!
hp = 15; // Change this number to whatever you want (e.g., 200, 500, 1000)
hp_total = hp; // Store max HP for health bar if you want one later