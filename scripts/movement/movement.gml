function move(_collision_object){
	
	if(place_meeting(x + x_movement, y, _collision_object) ){
	
		
		while(!place_meeting(x + sign(x_movement), y, _collision_object) ){
		
			x += sign(x_movement);
		}
		
		
		x_movement = 0;
		
	}
	
	
	if(place_meeting(x, y + y_movement, _collision_object) ){
		
		
		while(!place_meeting(x, y + sign(y_movement), _collision_object) ){
		
			y += sign(y_movement);
		}
		
		
		y_movement = 0;
		
	}
	
	x += x_movement;
	
	y += y_movement;

	
}

//Coyote timing
function scr_coyote_time(){
	
	//If the jump button is pressed and coyote time is true
	if(_jump && coyote_time && jumps > 0){
		
		//Set coyote time to false
		coyo_jump = false;
		
		//Set the y to the jump height
		y_movement = jump_height;
		
		//Reset jumps
		jumps = 1;
	
	}


}