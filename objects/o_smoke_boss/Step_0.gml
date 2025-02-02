//var _change_phase = keyboard_check(ord("C"));


if(instance_exists(o_player)){

	switch(phase){

		#region First phase
	
		case smoke_phases.first:
	

		#region Manually animating hands and gear

		//If the image speed is higher than 0
		if(other_image_speed > 0){
	
			//Reduce by 1
			other_image_speed--;

		}else{//If it's 0 or less, trigger animation
	
			#region Gear
			//If the image number is less than the max image number
			if(gear_image_num < gear_image_max_num){

				//Increase by 1
				gear_image_num++;

			}else{//If the image number is equal or higher than the max number

				//Reset it to 0
				gear_image_num = 0;

			}
			#endregion Gear
	
	
			#region Hands
	
			//Normal hands animation
			if(ultimate == false){
			
				scr_animate_hands();
		
			}
	
	
			//Ultimate hands animation
			if(ultimate == true){
		
				//If the image number is less than the max image number
				if(hands_attack_image_num < hands_attack_image_max_num){

					//Increase by 1
					hands_attack_image_num++;

				}
		
		
				//If the image number is equal or higher than the max number or less 4
				if(hands_attack_image_num >= hands_attack_image_max_num || hands_attack_image_num < 4){

					//Reset it to the fifth frame
					hands_attack_image_num = 4;

				}
		
			}
	
		#endregion
	
			//Reset the image speed to 4
			other_image_speed = 4;

		}

		#endregion


		#region Making the gear follow the smoke boss

		//If the x of the gear does not equal the x of the object
		if(gear_x != x){
	
			//Slowly move the x position of the gear to the x of the object
			gear_x = lerp(gear_x, x, .09);
	
		}

		//If the y of the gear does not equal the y of the object
		if(gear_y != y){
	
			//Slowly move the y position of the gear to the y of the object
			gear_y = lerp(gear_y, y, .09);

		}

		#endregion Making the gear follow the smoke boss


		#region Picking a projectile


	
		//If the chance is less than or equal to 10
		if(chance >= 80){

			//Set type to bomb
			type = "Bomb";
	
			//Reset chance pick
			chance = irandom(200 - the_health);

		}

		//If the chance is greater than 10 or less than 50
		if(chance >= 50 && chance < 80){

			//Set type to tracker
			type = "Tracker";
	
			//Reset chance pick
			chance = irandom(200 - the_health);

		}

		//If the chance is greater than or equal to 50
		if(chance >= 0 && chance < 50){

			//Set type to straight
			type = "Straight";
	
			//Reset chance pick
			chance = irandom(200 - the_health);

		}



		#endregion Picking a projectile


		//Check if the player is close
		var _col = collision_circle(x, y, range_player, o_player, 0, 1);

		//If the ultimate attack has not been triggered
		if(ultimate_timer > 0){
	
			#region Movement
		
			//If player gets closer or boss gets too close to player
			if(_col){

				//Move away
				x_speed += sign(x - o_player.x) * easing;
				y_speed += sign(y - o_player.y) * easing;
	
				//Make sure instance does not go higher or lower than max speed when easing
				x_speed = clamp(x_speed, -max_spd, max_spd);
				y_speed = clamp(y_speed, -max_spd, max_spd);

			}

			//If the player is not in the range of the boss
			if(distance_to_object(o_player) > good_range){

				//Get closer to the player
				x_speed += sign(o_player.x - x) * easing;
				y_speed += sign(o_player.y - y) * easing;
	
				//Make sure instance does not go higher or lower than max speed when easing
				x_speed = clamp(x_speed, -max_spd, max_spd);
				y_speed = clamp(y_speed, -max_spd, max_spd);

			}
	
			if(!_col && distance_to_object(o_player) < good_range){
	
				x_speed = 0;
				y_speed = 0;
		
			}
		
			#endregion Movement


		#region Attacking


		#region Normal attacks
		
			//If the attack timer is less than or equal to 0
			if(attack_timer <= 0){
		
				//Type to pass to the bullet
				var _type = type;
				var _angle = point_direction(x, y, o_player.x, o_player.y);
		
				//Create a bullet
				var _bullet_object = instance_create_layer(x, y + 7, "layer_instances", o_bullet);
			
				//Go to the previously created bullet object
				with(_bullet_object){
		
					//Set the type to the type picked by the smoke boss
					type = _type;
			
					//Set shooter
					target = o_player;
			
					//Set sprite index to gear
					sprite_index = s_gear;
			
					angle = _angle;
				
		
				}
			
				//Pick a random number for the attack timer
				attack_timer = random_range(50, 100);
		
	
			}
	
			//If the attack timer is greater than 0, reduce by 1
			if(attack_timer > 0){
	
				attack_timer--;
	
			}
		
			//Reduce the ultimate attack timer
			ultimate_timer--;
	
			#endregion Normal attacks
	
		}
	

		#region Ultimate attack

		//If the ultimate timer is less than or equal to 0
		if(ultimate_timer <= 0){
	
			#region Movement to ultimate attack spot
	
			//Variable to check if the boss is at the x and y position before changing ultimate to true
			var x_done = false;
			var y_done = false;
	
			if(x_done == false && y_done == false){
		
				//If x is not equal to the ultimate attack x
				if(x != ultimate_spot_x){
			
					//Keep moving the instance to the spot 
					x_speed += (ultimate_spot_x - x) * .1;
		
					//Make sure the x movement does not go higher or lower than the max speed
					x_speed = clamp(x_speed, -3, 3);
		
			
				}
	
				//If y is not equal to the ultimate attack y
				if(y != ultimate_spot_y){
	
					//Keep moving the instance to the spot 
					y_speed += (ultimate_spot_y - y) * .1;
		
					//Make sure the x movement does not go higher or lower than the max speed
					y_speed = clamp(y_speed, -3, 3);
	
				}
	
				//If the x is in the x spot for the attack
				if( (x < ultimate_spot_x + 2) && (x > ultimate_spot_x - 2) ){
		
					//Stop x movement
					x_speed = 0;
		
					x_done = true;
		
				}
	
				//If the y is in the x spot for the attack
				if( (y < ultimate_spot_y + 2) && (y > ultimate_spot_y - 2) ){
		
					//Stop y movement
					y_speed = 0;
		
					y_done = true;
	
				}
	
			}
	
			//If instance at the right position
			if(x_done && y_done){
		
				//Change ultimate to true
				ultimate = true;
	
			}
	
			#endregion Movement to ultimate attack spot
	
	
			//Use timer variable for the attacks
			if(timer > 0){
	
				timer--;
	
			}
	
		}


		//The amount to add to the angle
		var _incr = 0;
	
		//If the boss is idle
		if(ultimate == true){
		
			//Type to pass to the bullet
			var _type = choose("Spread", "Explosive");
			var _angle = 0;
		
			//Create a bullet
			var _bullet_object = 0;
		
			//If the duration is greater than 0
			if(duration > 0){
			
				//If the attack timer is equal to or less than 0
				if(timer <= 0){
		
					//Get the direction of the player - 40
					_angle = point_direction(x, y, o_player.x, o_player.y) - 40;
			
					//Create 3 projectiles at once
					repeat(3){
			
						//Assign created projectile to local variable
						_bullet_object = instance_create_layer(x, y + 7, "layer_instances", o_bullet);
				
				
			
						//Go to the previously created bullet object
						with(_bullet_object){
		
							//Set the type to the type picked by the smoke boss
							type = _type;
			
							//Set sprite index to gear
							sprite_index = s_gear;
			
							angle = _angle;
						
		
						}
				
						//Increase angle by 40 for spread
						_angle += 40;
				
					}
			
					//Reset timer
					timer = 100;

					//Decrease the duration of the attack
					duration--;
			
				}
		
		
			}
		
			//If the duration of the ultimate attack is less than or equal to 0
			if(duration <= 0){
		
				//Reset ultimate timer
				ultimate_timer = random_range(500, 800);
			
				//Reset duration
				duration = 10;
			
				//Set ultimate to false
				ultimate = false;
		
			}
		
		}
	
	
		#endregion Ultimate attack
	
		#endregion Attacking
	
		break;
	
		#endregion First phase


		#region Second phase
	
		case smoke_phases.second:
	
		
			//If the image speed is higher than 0
		if(other_image_speed > 0){
	
			//Reduce by 1
			other_image_speed--;

		}else{//If it's 0 or less, trigger animation
	
			//Normal hands animation
			scr_animate_hands();
		
			//Reset the image speed to 4
			other_image_speed = 4;

		}
	
		
	
		break;
	
		#endregion Second phase
	}

}

#region Making the hands follow the smoke boss

//Hands

//If the x of the hands does not equal the x of the object
if(hands_x != x){
	
	//Slowly move the x position of the hands to the x of the object
	hands_x = lerp(hands_x, x, .2);
}

//If the y of the hands does not equal the y of the object
if(hands_y != y){
	
	//Slowly move the y position of the hands to the y of the object
	hands_y = lerp(hands_y, y, .2);

}

#endregion Making the hands follow the smoke boss


#region Moving

if(y_speed == 0){

	//x_speed = 0;
	y_speed += bobbing;
	
	//Clamp speed for bobbing
	y_speed = clamp(y_speed, -bobbing, bobbing);
	
	
}

x += x_speed;
y += y_speed;

#endregion


#region Confining instance to room

	//Horizontal checking
	if(bbox_left < 0 || bbox_right > room_width){
	
		x = xprevious;
	
	}
	
	//Vertical checking
	if(bbox_top < 0 || bbox_bottom > (room_height / 2) ){
	
		y = yprevious;
	
	}

#endregion

