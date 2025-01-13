//Control
var _right = keyboard_check(vk_right) || keyboard_check(ord("D"));
var _left = keyboard_check(vk_left) || keyboard_check(ord("A"));
var _run = keyboard_check(vk_shift);
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
			
			y_movement = 0;

		}
		
		/*
		
		//If the run button is pressed
		if(_run){
		
			//Set speed to run speed
			spd = run_spd;
			
			//Change sprite to running
			sprite_index = player_sprite[player_move_states.running];
		
		}else{//If the run button isn't pressed
		
			//Change speed to walk speed
			spd = walk_spd;
		
		}
		
		*/

		/*
		
		//If the grapple button is pressed and there isn't already a grapple hook
		if(_grapple && !instance_exists(o_grapple_hook) && grapple_timer <= 0){
		
			//Create a grapple hook
			instance_create_layer(x, y, "layer_items", o_grapple_hook);
			
			//Change state to pulled
			//my_state = player_states.pulled;
			grapple_timer = 10;
			
			
		}
		
		if(grapple_timer > 0){
		
			grapple_timer--;
		
		}
		
		*/
		
		//Apply pixel perfect collision
		move(o_wall);
		
		//Mirroring sprite when the player is moving
		if(x_movement != 0){
		
			image_xscale = sign(x_movement);
			sprite_index = player_sprite[player_move_states.running];
		
		}
		
		
		/*
		
		//If the player is not pressing the run button
		if(!_run){
		
			//Change sprite to walking sprite
			sprite_index = player_sprite[player_move_states.walking];
		
		}
		
		*/
		
		//If the player is not moving
		if(x_movement = 0){
		
			//Change the sprite to idle
			sprite_index = player_sprite[player_move_states.idle];
		
		}
		
		
		
		//If the
		
			
		//If the player is falling down
		if(y_movement > 0){
		
			//Change sprite to falling
			sprite_index = player_sprite[player_move_states.falling];
		
		}
			
			
		if(y_movement < 0){
			
			sprite_index = player_sprite[player_move_states.jumping];
		
		}
			
		
		
		

		break;
		
		#endregion
		

}
