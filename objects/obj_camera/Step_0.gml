if (instance_exists(obj_frog))
{
    // Target position (center on frog)
    var _target_x = obj_frog.x - view_w / 2;
    var _target_y = obj_frog.y - view_h / 2;
    
    // Current camera position
    var _cam_x = camera_get_view_x(camera);
    var _cam_y = camera_get_view_y(camera);
    
    // Smooth movement (lerp)
    var _new_x = lerp(_cam_x, _target_x, follow_speed);
    var _new_y = lerp(_cam_y, _target_y, follow_speed);
    
    // Apply camera position
    camera_set_view_pos(camera, _new_x, _new_y);
}