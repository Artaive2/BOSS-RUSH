var _camera_x = camera_get_view_x(view_camera[0]);

//Applying parallax effect
layer_x("layer_backgound", _camera_x * .05);
layer_x("layer_foreground", _camera_x * .25);