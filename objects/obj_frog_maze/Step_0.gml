if (instance_exists(obj_dialogue)) exit;

// Health regeneration
if (hp_regen_timer > 0)
{
    hp_regen_timer--;
}
else if (hp < hp_total)
{
    hp += hp_regen_rate / 60;
    if (hp > hp_total) hp = hp_total;
}

// Stamina regeneration
if (stamina_delay_timer > 0)
{
    stamina_delay_timer--;
}
else if (stamina < max_stamina)
{
    stamina += stamina_regen;
    if (stamina > max_stamina) stamina = max_stamina;
}

var _hor = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var _ver = keyboard_check(ord("S")) - keyboard_check(ord("W"));

// IMPROVED MOVEMENT - prevents getting stuck
var _hspd = _hor * move_speed;
var _vspd = _ver * move_speed;

// Horizontal movement
if (_hspd != 0)
{
    if (!place_meeting(x + _hspd, y, tilemap))
    {
        x += _hspd;
    }
    else
    {
        // Pixel-perfect collision
        while (!place_meeting(x + sign(_hspd), y, tilemap))
        {
            x += sign(_hspd);
        }
    }
}

// Vertical movement
if (_vspd != 0)
{
    if (!place_meeting(x, y + _vspd, tilemap))
    {
        y += _vspd;
    }
    else
    {
        // Pixel-perfect collision
        while (!place_meeting(x, y + sign(_vspd), tilemap))
        {
            y += sign(_vspd);
        }
    }
}

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

// Attacking with stamina check
if (mouse_check_button_pressed(mb_left) && stamina >= attack_stamina_cost)
{
    var _inst = instance_create_depth(x, y, depth, obj_attack);
    _inst.image_angle = facing;
    _inst.damage *= damage;
    
    // Use stamina
    stamina -= attack_stamina_cost;
    stamina_delay_timer = stamina_regen_delay;
}