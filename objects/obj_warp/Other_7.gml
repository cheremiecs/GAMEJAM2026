room_goto(target_rm);

if (instance_exists(obj_frog_parkour))
{
    obj_frog_parkour.x = target_x;
    obj_frog_parkour.y = target_y;
}

image_speed = -1;
