//Control
var _right = keyboard_check(vk_right) || keyboard_check(ord("D"));
var _left = keyboard_check(vk_left) || keyboard_check(ord("A"));
var _run = keyboard_check(vk_shift);
_jump = keyboard_check_pressed(vk_space);

var _shoot = mouse_check_button_pressed(mb_left);
var _reload = keyboard_check_pressed( ord("R") );



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
		
		//Apply pixel perfect collision
		move(o_wall);
		
		
		#region Changing sprite and mirroring
		
		//Mirroring sprite when the player is moving
		if(x_movement != 0){
		
			image_xscale = sign(x_movement);
			
		
		}
		
		//If the speed is walking speed, change sprite to walking
		if(spd == walk_spd){
		
			sprite_index = player_sprite[player_move_states.walking];
		
		}
		
		//If the speed is running speed, change sprite to running
		if(spd == run_spd){
		
			sprite_index = player_sprite[player_move_states.running];
		
		
		}
		
		//If the player is not moving
		if(x_movement = 0){
		
			//Change the sprite to idle
			sprite_index = player_sprite[player_move_states.idle];
		
		}
		
			
		//If the player is falling down
		if(y_movement > 0){
		
			//Change sprite to falling
			sprite_index = player_sprite[player_move_states.falling];
		
		}
			
			
		if(y_movement < 0){
			
			sprite_index = player_sprite[player_move_states.jumping];
		
		}
		
		#endregion Changing sprite and mirroring
		
		
		#region Attacking
		
		
		//Shooting
		
		if(_shoot){
			
			//If there's still ammo, and the player is not reloading
			if (ammo >= 1 && reloading = false){
			
				var _type = type;
			
				//Reduce ammo
				ammo -= 1
	
				//Create a bullet and edit its code
				with(instance_create_layer(x + (image_xscale * 10), y - 15, "layer_instances", o_bullet) ){
				
					//Pass the type
					type = _type;
					
					//Set target to all bosses
					target = o_par_boss;
					
					//Set speed
					spd = 15;
				
					//Set angle to be the mouse cursor
					angle = point_direction(x, y, mouse_x, mouse_y);
		
					//Change image angle to face mouse
					image_angle = angle;
					
					//Set sprite of the bullet
					sprite_index = s_bullet;
					
					effect_scale_x = .5;
					effect_scale_y = .5;
				
				}
				
			}
		
		}
		
		
		#endregion Attacking
		
		
		#region Reloading
		
		//If the reload button is pressed
		if(_reload){
			
			//If the ammo is less than the maximum
			if(ammo < ammo_max){
				
				//Set movement speed to walking speed
				spd = walk_spd;
				
				//Trigger alarm if has not been triggered
				if(alarm[0] <= 0){
					
					
					alarm[0] = reload_time
					
				}
				
			}
			
		}
		
		#endregion Reloading
		

		break;
		
		#endregion
		

}

//Clamping ammo
ammo = clamp(ammo, 0, ammo_max);

#region Confining instance to room

	//Horizontal checking
	if(bbox_left < 0 || bbox_right > room_width){
	
		x = xprevious;
	
	}
	
	//Vertical checking
	if(bbox_top < 0 || bbox_bottom > room_height){
	
		y = yprevious;
	
	}

#endregion