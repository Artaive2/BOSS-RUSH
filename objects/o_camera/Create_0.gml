
if(room == RM_main_menu){

	camera_width = room_width;
	camera_height = room_height;

}else{

	camera_width = 600;
	camera_height = 360;

}
//Camera properties
target = 0;
camera_width = 600;
camera_height = 360;
camera_x = 0;
camera_y = 0;

//Camera effects
camera_shake = 0;
shake_amount = 4;


//Enabling camera
//view_enabled = true;
//view_visible[0] = true;

//View properties
scale = 2;
viewport_width = camera_width * scale;
viewport_height = camera_height * scale;

//Setting window size
window_set_size(viewport_width, viewport_height);

//Resize the surface to fit the view
surface_resize(application_surface, viewport_width, viewport_height);

//An alarm to center the window after 1 step
alarm[0] = 1;