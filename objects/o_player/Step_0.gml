//Control
var _right = keyboard_check(vk_right) || keyboard_check(ord("D"));
var _left = keyboard_check(vk_left) || keyboard_check(ord("A"));
_jump = keyboard_check_pressed(vk_space);
var _grapple = mouse_check_button(mb_left);

//Calculating movement
x_movement = (_right - _left) * spd;

//Checking if player is gonna collide with the ground
var _floor_col = place_meeting(x, y + y_movement, o_wall);

//Finite machine
switch(my_state){
	
	#region Moving
	
	case player_states.moving:
	
		//If the jump button is pressed and the player can jump
		if(_jump && jumps > 0){

			//Increase the y position
			y_movement += jump_height;
			
			//Reduce the number of jumps
			jumps = 0;

		}
		
		//If player is not on the ground	
		if( !_floor_col ){

			//Apply gravity
			y_movement += grv;
			
			//Apply coyote timing
			scr_coyote_time();

		}
		
		//If the player touches the ground
		if(_floor_col){
			
			//If the player is on the ground reset the number of jumps
			jumps = 1;
			
			//Reset coyote timing
			coyote_time = true;

		}

		//If the grapple button is pressed and there isn't already a grapple hook
		if(_grapple && !instance_exists(o_grapple_hook) ){
		
			//Create a grapple hook
			instance_create_layer(x, y, "layer_items", o_grapple_hook);
			
			//Change state to pulled
			//my_state = player_states.pulled;
			
			
		}
		
		
		//Apply pixel perfect collision
		move(o_wall);

		break;
		
		#endregion
		
		
		#region Being pulled
		
		case player_states.pulled:
		
			var _solid_col = place_meeting(x + 5, y + 5, o_wall);
			
			if(!_solid_col){
			
				x += (o_grapple_hook.x - x) * .5;
				y += (o_grapple_hook.y - y) * .5;
				
				
			
			}
			
			if(_solid_col){
			
				my_state = player_states.grapple;
				instance_destroy(o_grapple_hook);
			}
		
		break;
		
		#endregion
		
		
		#region Grapple
		
		case player_states.grapple:
			
			//Stop movement
			y_movement = 0;
			x_movement = 0;
			
			/*
			//If the jump button is pressed
			if(_jump || _grapple){
				
				
				//Destroy the grapple
				instance_destroy(o_grapple_hook);
				
				//Change state to moving
				my_state = player_states.moving;
				
				//Reset jumps
				jumps = 1;
			
			}
			
			*/
			
			
			
			//If the hook does not exist anymore
			if(!instance_exists(o_grapple_hook)){
			
				//Change player state to moving
				my_state = player_states.moving;
			
			}
		
		break;

		#endregion
		

}
