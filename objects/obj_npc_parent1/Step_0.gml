if (instance_exists(obj_dialogue)) exit;
    
if (instance_exists(obj_frog_parkour) && distance_to_object(obj_frog_parkour) < 8)
{
    can_talk = true;
    if (keyboard_check_pressed(input_key))
    {
        create_dialog(dialog);
    }
}

else 
{
    can_talk = false; 
}