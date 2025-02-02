#region Controls

//Movement
var _right = keyboard_check(vk_right) || keyboard_check(ord("D"));
var _left = keyboard_check(vk_left) || keyboard_check(ord("A"));
var _run = keyboard_check(vk_shift);
_jump = keyboard_check_pressed(vk_space);


//Gun
var _shoot = mouse_check_button(mb_left);
var _reload = keyboard_check_pressed( ord("R") );


//Saw
var _saw = mouse_check_button(mb_right);
var _saw_release = mouse_check_button_released(mb_right);


#endregion Controls

//Checking if player is gonna collide with the ground
var _floor_col = place_meeting(x, y + y_movement, o_floor);




//Finite machine
switch(my_state){
	
	#region Moving
	
	case player_states.moving:
		
		//Calculating movement
		x_movement = (_right - _left) * spd;

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
		move(o_par_walls_and_floor);
		
		
		#region Collision with boss and knockback
		
		//Apply collidion with the boss and knockback followed by the passed (parameter 1) damage to the passed object (parameter 2)
		scr_knockback(self, 1);
		
		
		#endregion Collision with boss
		
		
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
			
			//If there's still ammo, and the player is not reloading, and the shooting time is less than or equals 0
			if (ammo >= 1 && reloading = false && shoot_time <= 0){
			
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
					spd = 20;
				
					//Set angle to be the mouse cursor
					angle = point_direction(x, y, mouse_x, mouse_y);
					
					//Create a new straight bullet and set its stats
					straight_bullet = new str_bullets(1, spd, angle);
		
					//Change image angle to face mouse
					image_angle = angle;
					
					//Set sprite of the bullet
					sprite_index = s_bullet;
					
					//Reduce the size of the while circle by half since the player bullet is small
					effect_scale_x = .5;
					effect_scale_y = .5;
				
				}
				
				//Reset shooting time
				shoot_time = 10;
				
			}
			
			//Reduce shooting time if it's greater than 0
			if(shoot_time > 0){
			
				shoot_time--;
			
			}
		
		}
		
		
		//Set shoot time to 0 if the shoot button's been released
		if( mouse_check_button_released(mb_left) ){
			
				shoot_time = 0;
			
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
					
					//Set a time until it's triggered
					alarm[0] = reload_time;
					
				}
				
			}
			
		}
		
		#endregion Reloading
		
		
		#region Saw
		
		//Get mouse direction
		mouse_direction = point_direction(x, y, mouse_x, mouse_y);
		
		
		//If the saw button is pressed
		if(_saw){
		
			//If the arrow opacity is less than 1, slowly increase opacity
			if(arrow_opacity < 1){
			
				arrow_opacity += .05;
				
			
			}
			
			
			#region Animating arrow 
			
			//If the arrow is fully visible
			if(arrow_opacity >= 1){
				
				//If the animation speed is greater than 0, reduce by 1
				if(arrow_animation_speed > 0){
			
					arrow_animation_speed--;
			
				}else{//If the animation speed is 0
					
					//If the frame is less than the max frame, increase by 1
					if(arrow_frame < arrow_max_frame){
				
						arrow_frame++;
				
					}
					
					//Reset animation speed
					arrow_animation_speed = 10;
			
				}
		
			}
			
			#endregion Animating arrow 
			
		}
		
		
		//If the saw button has been released
		if(_saw_release){
		
			//If there's enough energy and the arrow is fully visible
			if(energy >= saw_energy_cost && arrow_frame == arrow_max_frame){
			
				//Subtract from energy the cost of the saw
				energy -= saw_energy_cost;
				
				//Stop x and y movement
				x_movement = 0;
				y_movement = 0;
				
				//Move player toward mouse
				y_movement += lengthdir_y(saw_speed, mouse_direction);
				
				//Give the player a little hop as they turn into a saw
				y -= 3;
				
				//Change player state
				my_state = player_states.saw;
			
			}
			
			//Turn arrow invisible
			arrow_opacity = 0;
			
			//Reset arrow frame
			arrow_frame = 0;
		
		}
		
		
		#endregion Saw
		
		
	break;
		
	#endregion Moving
		
		
	#region Saw state
		
	case player_states.saw:
		
		//Change sprite into saw
		sprite_index = s_saw;
		
		//Change mask to the saw mask
		mask_index = s_saw;
		
		#region Rotating Saw
		
		//Rotate image base on the opposite of where the saw is moving
		image_angle += -(x_movement * saw_speed * 3);
		
		
		#endregion Rotating Saw
		
		#region Collision
		
		#region Y axis
		
		//If the saw is going to collide with the ground
		if( place_meeting(x, y + sign(y_movement), o_floor ) ){
		
			//While it isn't colliding after it moves one pixel closer
			while( !place_meeting(x, y + sign(y_movement), o_floor ) ){
			
				//Move one pixel closer
				y += sign(y_movement);
			
			}
			
			//If saw speed is still greater than 0
			if( saw_speed > 0){
				
				//Stop y movement
				y_movement = 0;
				
				//Decrease saw speed by 1
				saw_speed--;
				
				//Bounce back in random speed between 1 and the current saw speed which is decreasing to make the bounce shorter each time
				y_movement -= random_range(1, saw_speed) * saw_bounce;
			
			}else{//If the saw speed reaches 0 or less
			
				//Stop y movement
				y_movement = 0;
			
			
			}
		
		}
		
		#endregion  Y axis
		
		
		#region X axis
		
		//If the player is colliding with the wall
		if( place_meeting(x + x_movement, y, o_wall ) ){
		
			//Move in the opposite direction and add a push (* 3)
			x_movement = 3 * sign(-x_movement);
			
			
			mouse_direction -= 180;
		
		}
		
		#endregion X axis
		
		
		
		#endregion Collision
		
		//Move the saw in 
		x_movement = lengthdir_x(saw_speed, mouse_direction);
		
		
		
		//Apply movement
		x += x_movement;
		y += y_movement;
		
		
		
		//If player is not on the ground	
		if( !_floor_col ){
			
			//Apply gravity
			y_movement += .2;

		}
		
		
		//Apply collidion with the boss and knockback followed by the passed (parameter 1) damage to the passed object (parameter 2)
		scr_knockback(o_par_boss, saw_damage);
		
		//If the saw button has been pressed or the duration of the saw has run out, turn player back to normal
		if(_saw || saw_duration <= 0){ // || saw_speed <= 0
			
			//Set mask to player sprite
			mask_index = s_player_idle;
			
			//Reset the image angle
			image_angle = 0;
			
			//Reset saw speed
			saw_speed = 5;
			
			//Give the player a little hop as they turn back to normal
			y_movement -= 4;
			
			//Change state
			my_state = player_states.moving;
			
			//Reset saw duration
			saw_duration = 300;
			
		}
		
		//Reduce from saw duration
		saw_duration--;
		
	break;
		
	#endregion Saw state
	
	
	#region Knockback State
	
	case player_states.knockback:
		
		//If player is not on the ground	
		if( !_floor_col ){
			
			//Apply gravity
			y_movement += grv;
			
		}
	
		//Apply movement
		move(o_par_walls_and_floor);
		
		//If the player touches the ground
		if(_floor_col){
		
			//Go back to previous state
			//my_state = player_states.moving;
			
			//Go back to the previous state
			my_state = prev_state;
			
			//Reset knockback time
			//knockback_time = 24;
			
			//Reset jumps, just in case the player jumped before changing state
			jumps = 1;
		
		}
		
		//Reduce from knockback time by 1
		knockback_time--;
		
	
	break;
		
	#endregion Knockback State

}

//Death
if(the_health <= 0){
	
	instance_destroy();

}

#region Energy recharge

//Recharging energy if the energy is less than max and the player is not reloading
if(energy < energy_max && alarm[0] <= 0){

	energy += energy_regain;
	
	//Make sure energy amount doesn't go higher than the maximum or lower than 0
	energy = clamp(energy, 0, energy_max);

}

#endregion Energy recharge

//Clamp health so it doesn't go below 0
the_health = clamp(the_health, 0, 999);

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