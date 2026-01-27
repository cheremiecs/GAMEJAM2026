// Set up the camera
camera = view_camera[0];
view_w = camera_get_view_width(camera);
view_h = camera_get_view_height(camera);

// Smooth camera settings (optional)
follow_speed = 0.1; // Lower = smoother, higher = snappier (0.1 to 1)