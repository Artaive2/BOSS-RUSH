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
	//If the image number is less than the max image number
	if(hands_image_num < hands_image_max_num){

		//Increase by 1
		hands_image_num++;

	}else{//If the image number is equal or higher than the max number

		//Reset it to 0
		hands_image_num = 0;

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

#region Attacking

	if(attack_timer <= 0){
	
		var _bullet_object = instance_create_layer(x, y, "layer_instances", o_bullet2);
		
		var _angle = point_direction(x, y, o_player.x, o_player.y);
		
		with(_bullet_object){
		
			type = "Tracker";
			sprite_index = s_gear;
		
		}
		
		attack_timer = random_range(50, 100);
	
	}
	
	if(attack_timer > 0){
	
		attack_timer--;
	
	}

#endregion