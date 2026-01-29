// Check if all enemies are dead before allowing teleport
var _enemies_alive = instance_number(obj_enemy_parent_maze) + instance_number(obj_enemy_parent_boss);

if (place_meeting(x, y, obj_frog_maze) && !instance_exists(obj_warp) && _enemies_alive == 0)
{
    var inst = instance_create_depth(0, 0, -9999, obj_warp);
    inst.target_x = target_x;
    inst.target_y = target_y;
    inst.target_rm = target_rm;
}