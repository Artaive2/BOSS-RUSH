//Control
var _right = keyboard_check(vk_right) || keyboard_check(ord("D"));
var _left = keyboard_check(vk_left) || keyboard_check(ord("A"));
jet = keyboard_check(vk_space);


//Calculating movement
x_movement = (_right - _left) * spd;


//Checking if player is gonna collide with the ground
var _floor_col = place_meeting(x, y + y_movement, o_wall);

//If player is not on the ground	
if( !_floor_col  && !jet){

	//Apply gravity
	y_movement += grv;

}


if(jet){
	
	var _ground = y;
	y_movement -= jet_speed;
	
	var _offset = random_range(-2, 2);
	
	x_movement += _offset;


}


if(jet_speed > jet_max_speed){

		jet_speed = jet_max_speed;
}

//Apply pixel perfect collision
move(o_wall);