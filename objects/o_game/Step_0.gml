//Controls
var _quit = keyboard_check( vk_escape );

var _camera_x = camera_get_view_x(view_camera[0]);

//Applying parallax effect
layer_x("layer_backgound", _camera_x * .05);
layer_x("layer_foreground", _camera_x * .25);


//If the escape button has been pressed, quit game
if(_quit){

	game_end();

}