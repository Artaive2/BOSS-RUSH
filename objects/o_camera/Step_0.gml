//Calculating how far right / up the camera can go
var _cam_width = room_width - camera_width;
var _cam_height = room_height - camera_height;

//If the player exists
if( instance_exists(o_player) ){

	//Set player as target
	target = o_player;
	
	//Set camera x and y
	camera_x = target.x - (camera_width / 2);
	camera_y = target.y - (camera_height / 2);

	//Make sure the camera does not go outside room
	camera_x = clamp(camera_x, 0, _cam_width);
	camera_y = clamp(camera_y, 0, _cam_height);
	
}

//Set the position of the camera while flooring the x and y to view pixels properly
camera_set_view_pos(view_camera[0], 
floor(camera_x), 
floor(camera_y) );
