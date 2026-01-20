var _hor = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var _ver = keyboard_check(ord("S")) - keyboard_check(ord("W"));

move_and_collide(_hor * move_speed, _ver * move_speed, tilemap);

if (_hor != 0 or _ver != 0)
{
    if (_ver > 0) sprite_index = spr_frog_hop_down; 
        else if (_ver < 0) sprite_index = spr_frog_hop_up;
            else if (_hor > 0) sprite_index = spr_frog_hop_right;
                else if (_hor < 0) sprite_index = spr_frog_hop_left;
}
else 
{
if (sprite_index == spr_frog_hop_right)	sprite_index = spr_frog_idle_right;
    else if (sprite_index == spr_frog_hop_left) sprite_index = spr_frog_idle_left;
        else if (sprite_index == spr_frog_hop_up) sprite_index = spr_frog_idle_up;
            else if (sprite_index == spr_frog_hop_down) sprite_index = spr_frog_idle_down;
}