draw_self();
// Show different message based on enemies
var _enemies_alive = instance_number(obj_enemy_parent_maze) + instance_number(obj_enemy_parent_boss);
if (place_meeting(x, y, obj_frog_maze))
{
    draw_set_color(c_white);
    draw_set_halign(fa_center);
    
    if (_enemies_alive > 0)
    {
        draw_set_color(c_red);
        // Scale: 0.5 = half size, 1 = normal, 1.5 = 1.5x bigger, 2 = double size
        draw_text_transformed(x, y - 40, "Defeat all enemies first!", 0.8, 0.8, 0);
        draw_text_transformed(x, y - 20, "Enemies remaining: " + string(_enemies_alive), 0.8, 0.8, 0);
    }
    else
    {
        draw_set_color(c_lime);
        draw_text_transformed(x, y - 20, "Path unlocked!", 0.8, 0.8, 0);
    }
    
    draw_set_halign(fa_left);
    draw_set_color(c_white);
}