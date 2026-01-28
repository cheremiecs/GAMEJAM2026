if (instance_exists(obj_dialogue)) exit;

// Horizontal movement
var _hor = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var _hspd = _hor * move_speed;

// Check if on ground
on_ground = place_meeting(x, y + 1, tilemap);

// Coyote time logic
if (on_ground)
{
    coyote_timer = coyote_time;
    jumps_left = max_jumps;
}
else
{
    if (coyote_timer > 0) coyote_timer--;
}

// Apply gravity ONLY after coyote time expires
if (coyote_timer <= 0)
{
    vel_y += grav;
    if (vel_y > max_fall_speed) vel_y = max_fall_speed;
}
else
{
    vel_y = 0;
}

// Stamina regeneration
if (stamina_delay_timer > 0)
{
    stamina_delay_timer--;
}
else if (on_ground && stamina < max_stamina)
{
    stamina += stamina_regen;
    if (stamina > max_stamina) stamina = max_stamina;
}

// Double Jump with stamina check
if (keyboard_check_pressed(vk_space) && jumps_left > 0 && stamina >= jump_stamina_cost)
{
    vel_y = jump_speed;
    jumps_left--;
    stamina -= jump_stamina_cost;
    stamina_delay_timer = stamina_regen_delay;
    coyote_timer = 0;
}

// HORIZONTAL COLLISION - check BEFORE vertical
if (_hspd != 0)
{
    // Check if we can move the full distance
    if (!place_meeting(x + _hspd, y, tilemap))
    {
        x += _hspd;
    }
    else
    {
        // Move pixel by pixel until we hit a wall
        var _step_x = sign(_hspd);
        while (!place_meeting(x + _step_x, y, tilemap))
        {
            x += _step_x;
        }
    }
}

// VERTICAL COLLISION
if (vel_y != 0)
{
    // Check if we can move the full distance
    if (!place_meeting(x, y + vel_y, tilemap))
    {
        y += vel_y;
    }
    else
    {
        // Move pixel by pixel
        var _step_y = sign(vel_y);
        while (!place_meeting(x, y + _step_y, tilemap))
        {
            y += _step_y;
        }
        vel_y = 0;
    }
}

// Sprite handling
if (_hor != 0) facing = sign(_hor);

if (!on_ground && coyote_timer <= 0)
{
    if (vel_y < 0)
    {
        sprite_index = spr_frog_hop_up;
    }
    else
    {
        sprite_index = spr_frog_hop_down;
    }
}
else
{
    // Show tired sprite when low stamina
    if (stamina < jump_stamina_cost)
    {
        sprite_index = spr_frog_tired;
    }
    else if (_hor != 0)
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

// Camera follow
camera_set_view_pos(view_camera[0], x - camera_get_view_width(view_camera[0]) / 2, y - camera_get_view_height(view_camera[0]) / 2);