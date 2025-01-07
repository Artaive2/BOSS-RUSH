//Check for a collision with the walls
var _col_solid = place_meeting(x, y, o_wall);

var _dis_to_player = sqrt( ( (o_player.x - x) * (o_player.x - x) ) + ( (o_player.y - y) * (o_player.y - y) ) );
	
	/*
	if( _dis_to_player > max_length){
	
		//Move the hook closer to the target x and y
		x += (o_player.x - x) * .5;
		y += (o_player.y - y) * .5;
		
	
	
	}
	
	*/
	
//If the target of where the hook should be has not been reached
if(out){

	//If the hook is not colliding with a wall
	if(!_col_solid || _dis_to_player < max_length){
		
		//Move the hook closer to the target x and y
		x += (target_x - x) * .5;
		y += (target_y - y) * .5;
	
	}
	
	if(_col_solid){//If the hook is colliding with a wall
	
		//Change variable to true
		target_reached = true;
		
		//Change the player's state to pulled
		//o_player.my_state = player_states.pulled;
		
	}
	
	//If the hook is too far from the player
	if(_dis_to_player >= max_length){
		
		//Reduce the timer
		if(in_timer > 0){
		
			in_timer--;
		
		}
		
		//If the timer reaches 0
		if(in_timer <= 0){
			
			//Turn out to false
			out = false;
			
			//Turn in to true
			in = true;
		
		
		}
	
	}
	
}

//If in is true
if(in){

	//Move the hook closer to the target x and y
	x += (o_player.x - x) * .5;
	y += (o_player.y - y) * .5;
	
	//If the hook collides with the player
	if( place_meeting(x, y, o_player) ){
	
		//Destroy the grapple hook
		instance_destroy();
	
	}
	
}