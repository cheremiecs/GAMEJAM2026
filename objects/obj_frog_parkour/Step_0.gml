/*if (instance_exists(obj_dialogue)) exit; //check if instance exists para mawala dialog if not talking ADD THIS TO ENEMY OBJ IF EVER MAGENEMY TA


var _hor = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var _ver = keyboard_check(ord("S")) - keyboard_check(ord("W"));

//jumping part

if (keyboard_check_pressed(vk_space) && !is_jumping)
{
    is_jumping = true;
    jump_timer = 0;
    
    // Store jump direction based on current facing or input
    if (_hor != 0 || _ver != 0)
    {
        jump_dir_x = _hor;
        jump_dir_y = _ver;
    }
    else
    {
        // Jump in facing direction if no input
        jump_dir_x = lengthdir_x(1, facing);
        jump_dir_y = lengthdir_y(1, facing);
    }
}

// Handle jumping
if (is_jumping)
{
    jump_timer++;
    
    // Move during jump
    var _jump_speed = jump_distance / jump_duration;
    move_and_collide(jump_dir_x * _jump_speed, jump_dir_y * _jump_speed, tilemap, undefined, undefined, undefined, move_speed, move_speed);
    
    // Update sprite based on jump direction
    if (jump_dir_y > 0) sprite_index = spr_frog_jp_down;
    else if (jump_dir_y < 0) sprite_index = spr_frog_hop_up;
    else if (jump_dir_x > 0) sprite_index = spr_frog_hop_right;
    else if (jump_dir_x < 0) sprite_index = spr_frog_hop_left;
    
    // End jump
    if ( keyboard_check_released(vk_space) || jump_timer >= jump_duration)
    {
        is_jumping = false;
        jump_timer = 0;
        
        //idle movements if done jumping 
        if (sprite_index == spr_frog_hop_right) sprite_index = spr_frog_idle_right;
        else if (sprite_index == spr_frog_hop_left) sprite_index = spr_frog_idle_left;
        else if (sprite_index == spr_frog_hop_up) sprite_index = spr_frog_idle_up;
        else if (sprite_index == spr_frog_hop_down) sprite_index = spr_frog_idle_down;
    }
}
else // Normal movement (only when not jumping)
{
    move_and_collide(_hor * move_speed, _ver * move_speed, tilemap, undefined, undefined, undefined, move_speed, move_speed);
    
    // Movements
    if (_hor != 0 or _ver != 0)
    {
        if (_ver > 0) sprite_index = spr_frog_hop_down; 
        else if (_ver < 0) sprite_index = spr_frog_hop_up;
        else if (_hor > 0) sprite_index = spr_frog_hop_right;
        else if (_hor < 0) sprite_index = spr_frog_hop_left;
                        
        facing = point_direction(0, 0, _hor, _ver);
    }
    else 
    {
        if (sprite_index == spr_frog_hop_right) sprite_index = spr_frog_idle_right;
        else if (sprite_index == spr_frog_hop_left) sprite_index = spr_frog_idle_left;
        else if (sprite_index == spr_frog_hop_up) sprite_index = spr_frog_idle_up;
        else if (sprite_index == spr_frog_hop_down) sprite_index = spr_frog_idle_down;
    }
}

/*
//i watched the tutorial ani and i added the undef undef undef after tilemap
move_and_collide(_hor * move_speed, _ver * move_speed, tilemap, undefined, undefined, undefined,move_speed, move_speed);


//movements
if (_hor != 0 or _ver != 0)
{
    if (_ver > 0) sprite_index = spr_frog_hop_down; 
        else if (_ver < 0) sprite_index = spr_frog_hop_up;
            else if (_hor > 0) sprite_index = spr_frog_hop_right;
                else if (_hor < 0) sprite_index = spr_frog_hop_left;
                    
    facing = point_direction(0, 0, _hor, _ver);
}
else 
{
if (sprite_index == spr_frog_hop_right)	sprite_index = spr_frog_idle_right;
    else if (sprite_index == spr_frog_hop_left) sprite_index = spr_frog_idle_left;
        else if (sprite_index == spr_frog_hop_up) sprite_index = spr_frog_idle_up;
            else if (sprite_index == spr_frog_hop_down) sprite_index = spr_frog_idle_down;
}

*/



/*
//attacking
if (mouse_check_button_pressed(mb_left)) //left btn to attack
{
    var _inst = instance_create_depth(x, y, depth, obj_attack);
    _inst.image_angle = facing;
    _inst.damage *= damage;
} */

if (instance_exists(obj_dialogue)) exit;

// Horizontal movement
var _hor = keyboard_check(ord("D")) - keyboard_check(ord("A"));
vel_x = _hor * move_speed; // Changed

// Apply gravity
vel_y += grav; // Changed
if (vel_y > max_fall_speed) vel_y = max_fall_speed; // Changed

// Check if on ground BEFORE moving
var _was_on_ground = on_ground;
on_ground = place_meeting(x, y + 1, tilemap);

// Reset jumps when landing
if (on_ground && !_was_on_ground)
{
    jumps_left = max_jumps;
}

// Double Jump
if (keyboard_check_pressed(vk_space) && jumps_left > 0)
{
    vel_y = jump_speed; // Changed
    jumps_left--;
}

// Move vertically FIRST
if (place_meeting(x, y + vel_y, tilemap)) // Changed
{
    while (!place_meeting(x, y + sign(vel_y), tilemap)) // Changed
    {
        y += sign(vel_y); // Changed
    }
    vel_y = 0; // Changed
}
y += vel_y; // Changed

// Move horizontally AFTER
if (place_meeting(x + vel_x, y, tilemap)) // Changed
{
    while (!place_meeting(x + sign(vel_x), y, tilemap)) // Changed
    {
        x += sign(vel_x); // Changed
    }
    vel_x = 0; // Changed
}
x += vel_x; // Changed

// Sprite handling
if (_hor != 0) facing = sign(_hor);

if (!on_ground)
{
    if (vel_y < 0) // Changed
    {
        sprite_index = (facing > 0) ? spr_frog_hop_up : spr_frog_hop_up;
    }
    else
    {
        sprite_index = (facing > 0) ? spr_frog_hop_down : spr_frog_hop_down;
    }
}
else
{
    if (_hor != 0)
    {
        sprite_index = (facing > 0) ? spr_frog_hop_right : spr_frog_hop_left;
    }
    else
    {
        sprite_index = (facing > 0) ? spr_frog_idle_right : spr_frog_idle_left;
    }
}

// Attacking
if (mouse_check_button_pressed(mb_left))
{
    var _inst = instance_create_depth(x, y, depth, obj_attack);
    _inst.image_angle = (facing > 0) ? 0 : 180;
    _inst.damage *= damage;
}