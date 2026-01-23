//if i hit ta sa enemy
if (alarm[0] < 0)
{
    hp -= other.damage;
    alarm[0] = 60;
    image_blend = c_red; 
    
    if (hp <= 0) //if u die restart ka
    {
        room_restart();
    }
}