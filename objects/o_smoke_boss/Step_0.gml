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
	#endregion
	
	
	#region Hands
	
	//Normal hands animation
	if(ultimate == false){

		//If the image number is less than the max image number
		if(hands_image_num < hands_image_max_num){

			//Increase by 1
			hands_image_num++;

		}else{//If the image number is equal or higher than the max number

			//Reset it to 0
			hands_image_num = 0;

		}
		
	}
	
	
	//Ultimate hands animation
	if(ultimate == true){
		
		//If the image number is less than the max image number
		if(hands_attack_image_num < hands_attack_image_max_num){

			//Increase by 1
			hands_attack_image_num++;

		}else{//If the image number is equal or higher than the max number

			//Reset it to 0
			hands_attack_image_num = 0;

		}
		
	}
	
#endregion
	
	//Reset the image speed to 4
	other_image_speed = 4;

}

#endregion


#region Making the hands and gear follow the smoke boss

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


//Gear

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

#endregion


#region Picking a projectile

//If the chance is less than or equal to 10
if(chance <= 10){

	//Set type to bomb
	type = "Bomb";
	
	//Reset chance pick
	chance = irandom(100);

}

//If the chance is greater than 10 or less than 50
if(chance > 10 && chance < 50){

	//Set type to tracker
	type = "Tracker";
	
	//Reset chance pick
	chance = irandom(100);

}

//If the chance is greater than or equal to 50
if(chance >= 50){

	//Set type to straight
	type = "Straight";
	
	//Reset chance pick
	chance = irandom(100);

}


#endregion


#region Movement


//Check if the player is close
var _col = collision_circle(x, y, range_player, o_player, 0, 1);
var _player_dir = point_direction(x, y, o_player.x, o_player.y);


//Apply bobbing
y += bobbing;

//If the ultimate attack has not been triggered
if(ultimate_timer > 0){
	
	//If player gets closer or boss gets close to player
	if(_col || distance_to_object(o_player) < range_limit ){

		//Move away
		//x_speed += (x - o_player.x) * easing;
		//y_speed += (y - o_player.y) * easing;
	
		x_speed += sign(x - o_player.x) * easing;
		y_speed += sign(-_player_dir) * easing;
	
		//Make sure instance does not go higher or lower than max speed when easing
		x_speed = clamp(x_speed, -max_spd, max_spd);
		y_speed = clamp(y_speed, -max_spd, max_spd);

	}


	if(!_col){

		x_speed += sign(o_player.x - x) * easing;
		y_speed += sign(_player_dir) * easing;
	
		x_speed = clamp(x_speed, -max_spd, max_spd);
		y_speed = clamp(y_speed, -max_spd, max_spd);

	}

#endregion


#region Attacking


#region Normal attacks
		
	//If the attack timer is less than or equal to 0
	if(attack_timer <= 0){
		
		//Type to pass to the bullet
		var _type = type;
		
		//Create a bullet
		var _bullet_object = instance_create_layer(x, y, "layer_instances", o_bullet);
		
		//Go to the previously created bullet object
		with(_bullet_object){
		
			//Set the type to the type picked by the smoke boss
			type = _type;
			
			//Set sprite index to gear
			sprite_index = s_gear;
		
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
	
	//If x is not equal to the ultimate attack x
	if(x != ultimate_spot_x){
			
		//Keep moving the instance to the spot slowly
		x_speed += (ultimate_spot_x - x) * .1;
		
		//Make sure the x movement does not go higher or lower than the max speed
		x_speed = clamp(x_speed, -max_spd, max_spd);
		
			
	}
	
	//If y is not equal to the ultimate attack y
	if(y != ultimate_spot_y){
	
		//Keep moving the instance to the spot slowly
		y_speed += (ultimate_spot_y - y) * .1;
		
		//Make sure the x movement does not go higher or lower than the max speed
		y_speed = clamp(y_speed, -max_spd, max_spd);
	
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
		//y_speed = 0;
		
		y_done = true;
	
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
		
	//If the duration is greater than 0
	if(duration > 0){
			
			
		if(timer <= 0){
	
			//Type to pass to the bullet
			var _type = type;
		
			//Spawn 3 projectiles at once
			repeat(3){
			
				//Set x and y for the angle
				var _x = 16 * dcos(240 + _incr);
				var _y = 16 * -dsin(240 + _incr);
			
				//Create projectile
				var _bull = instance_create_layer(x + _x, y + _y, "layer_instances", o_bullet);
		
				//Change projectile variables
				with(_bull){
		
					//Pass type
					type = _type;
			
					//Set sprite index to gear
					sprite_index = s_gear;
				
				}
			
				//Increase the amount to add to the angle by 30
				_incr += 30;
		
			}
	
			//Reset timer
			timer = 100;

			
			duration--;
			
		}
		
		
	}
		
	//If the duration of the ultimate attack is less than or equal to 0
	if(duration <= 0){
		
		//Reset ultimate timer
		ultimate_timer = random_range(250, 300);
			
		//Reset duration
		duration = 10;
			
		//Set ultimate to false
		ultimate = false;
		
	}
		
}
	
	
#endregion Ultimate attack
	
#endregion Attacking


#region Moving

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