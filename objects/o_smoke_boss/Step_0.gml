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
	
	if(attack_timer > 0){
		
		//If the image number is less than the max image number
		if(hands_image_num < hands_image_max_num){

			//Increase by 1
			hands_image_num++;

		}else{//If the image number is equal or higher than the max number

			//Reset it to 0
			hands_image_num = 0;

		}
		
		if(attack_timer <= 0){
		
			
			//If the image number is less than the max image number
			if(hands_attack_image_num < hands_attack_image_max_num){

				//Increase by 1
				hands_attack_image_num++;

			}else{//If the image number is equal or higher than the max number

				//Reset it to 0
				hands_attack_image_num = 0;

			}
		
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


#region Attacking

	//If the attack timer is less than or equal to 0
	if(attack_timer <= 0){
		
		if(attacking_time > 0){
			
			//Type to pass to the bullet
			var _type = type;
		
			//Create a bullet
			var _bullet_object = instance_create_layer(x, y, "layer_instances", o_bullet);
		
			//Go to the previously created bullet object
			with(_bullet_object){
		
				//Set the type to the type picked by the smoke boss [TO CHANGE]
				type = _type;
			
				//Set sprite index to gear
				sprite_index = s_gear;
		
			}
			
			attacking_time--;
		
		}
		//Pick a random number for the attack timer
		attack_timer = random_range(50, 100);
		
		if(attacking_time <= 0){
		
			attacking_time = 50;
		
		}
	
	}
	
	//If the attack timer is greater than 0, reduce by 1
	if(attack_timer > 0){
	
		attack_timer--;
	
	}

#endregion