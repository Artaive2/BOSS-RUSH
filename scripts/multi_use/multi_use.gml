


//Knockback code

/// @param _damaged_object
/// @param _damage_amount
function scr_knockback(_damaged_object, _damage_amount){

		//Checking for collision with the boss
		var _boss_col = place_meeting(x + x_movement, y + y_movement, o_par_boss);
			
		//If there's a collision with the boss
		if(_boss_col){
		
			//Reduce object health by the passed amount
			_damaged_object.the_health -= _damage_amount;
			
			
			//Move the player in the oppesite direction (Y axis)
			y_movement = knockback_amount * sign(-y_movement);
			
			
			//If the player is on the ground
			if(y_movement == 0){
			
				//Give the player a little hop
				y_movement = -5;
			
			}
			
			//If the x movement is 0
			if(x_movement == 0){
			
				//Pick randomely between moving slightly left or right so if the player is touching the top of the boss they don't get stuck hopping on the boss
				x_movement = choose(-1, 1);
			
			}
			
			//Move the player in the opposite direction (X axis)
			x_movement = knockback_amount * sign(-x_movement);
			
			//Save the current state to go back to after the knockback is over
			prev_state = my_state;
			
			//Change state to knockback
			my_state = player_states.knockback;
		
		}

}



#region Bullet functions

//Function for destroying the instance in case of colliding with a wall or the player, and damaging the player
function scr_col(_target){
	
		//If the bullet collides with the ground, destroy it
		if(collision_point(x, y, o_floor, false, true)){
				
			instance_destroy();
			
			//Create an effect
			var _effect = instance_create_layer(x, y, "layer_effects", o_animations);
			
			_effect.sprite_index = s_flash;
				
		}
				
		//Check for collision with an instance
		var _col_target = collision_point(x, y, _target, true, true);
				
		//If the bullet collides an instance, destroy the bullet and reduce the instance's health
		if(_col_target){
				
			instance_destroy();
			
			//Reduce the target's health
			_col_target.the_health -= bullet.damage;
			
			//Set to damaged to apply flash
			_col_target.damaged = true;
			
			//Create an effect
			var _effect = instance_create_layer(x, y, "layer_effects", o_animations);
			
			_effect.sprite_index = s_flash;
				
		}

}

//Collision and explosion
function scr_col_explosion(_target, _range){
	
	//Check for collision with an instance
	var _col_target = collision_point(x, y, _target, true, true);
	
	//The sprite to draw when the instance is destroyed
	var _sprite = -1;
	
	//Choose a sound for the explosion
	var _sound = choose(Explosion_1, Explosion_2, Explosion_3);
	
	//Bomb
	if(type == "Bomb"){
	
		_sprite = s_explosion;
	
	}
	
	//Explosive
	if(type == "Explosive"){
	
		_sprite = s_big_explosion;
	
	}
	
	
	//If the bullet collides with the ground, destroy it
	if(collision_point(x, y, o_floor, false, true)){
				
		instance_destroy();
			
		//Create an effect
		var _effect = instance_create_layer(x, y, "layer_effects", o_animations);
		
		with(_effect){
		
			//Pass sprite
			sprite_index = _sprite;
		
			//Pass sound id
			sound_id = _sound;
		
		}
		
		//Check for collision with the target (explosion collision)
		var _col_range = collision_circle(x, y, _range, _target, true, true);
		
		//If the explosion is colliding with the target
		if(_col_range){
		
			//Reduce health
			_col_range.the_health -= bullet.damage;
		
		}
		
				
	}
				
	//If the bullet collides an instance, destroy the bullet and reduce the instance's health
	if(_col_target){
				
		instance_destroy();
			
		//Reduce the target's health
		_col_target.the_health -= bullet.damage;
			
		//Set to damaged to apply flash
		_col_target.damaged = true;
		
		//Create an effect
		var _effect = instance_create_layer(x, y, "layer_effects", o_animations);
			
		
		with(_effect){
		
			//Pass sprite
			sprite_index = _sprite;
		
			//Pass sound id
			sound_id = _sound;
		
		}
			
				
	}

}


/// @ param _angle
/// @ param _distance
//Bullet moving
function scr_bullet_move(_distance, _angle, _target){

	//Moving the bullet closer to the player direction
	x += _distance * dcos(_angle);
	y += _distance * -dsin(_angle);

	
	//Check if the bullet is an explosive/bomb or normal projectile
	if(type == "Bomb" || type == "Explosive"){
	
		//Destroying the instance when the bullet collides with the walls or player + damaging the player
		scr_col_explosion(_target, explosion_area);
	
	}else{
	
		//Destroying the instance when the bullet collides with the walls or player + damaging the player
		scr_col(_target);
		
	}

}

#endregion Bullet functions

