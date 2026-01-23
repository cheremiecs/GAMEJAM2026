if (instance_exists(obj_dialogue)) exit; //check if instance exists para mawala dialog if not talking ADD THIS TO ENEMY OBJ IF EVER MAGENEMY TA

/*if (keyboard_check_pressed(vk_space))
{
    create_dialog([
    {
        name: "Test dialog!",
        msg: "It works!"
    }
    ])
}*/

var _hor = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var _ver = keyboard_check(ord("S")) - keyboard_check(ord("W"));

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

//attacking
if (mouse_check_button_pressed(mb_left)) //left btn to attack
{
    var _inst = instance_create_depth(x, y, depth, obj_attack);
    _inst.image_angle = facing;
    _inst.damage *= damage;
}