//collision wen enemy get touched w  frog rtognue
if (alarm[1] < 0)
{
    hp -= other.damage; //enemy hp  minus damage of attack
    image_blend = c_red;
    
    kb_x = sign(x - other.x);
    kb_y = sign(y - other.y);
    alarm[1] = 20; //knconback 20 frames
}