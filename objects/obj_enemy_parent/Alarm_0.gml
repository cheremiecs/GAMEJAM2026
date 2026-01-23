if (instance_exists(obj_frog) &&  distance_to_object(obj_frog) < distance_to_attack_player)
{
    target_x = obj_frog.x;
    target_y = obj_frog.y;
}
else
{
    target_x = random_range(xstart - 100, xstart + 100);
    target_y = random_range(ystart - 100, ystart + 100);
}

alarm[0] = 60;