//Function for destroying the instance in case of colliding with a wall or the player, and damaging the player
function scr_col(){
	
		//If the bullet collides with a wall, destroy it
		if(collision_point(x + spd, y + spd, o_wall, false, true)){
				
			instance_destroy();
			
			//Create an effect
			var _effect = instance_create_layer(x, y, "layer_effects", o_animations);
			
			_effect.sprite_index = s_flash;
				
		}
				
		//Check for collision with an instance
		var _col_player = collision_point(x, y, o_par_damage, true, true);
				
		//If the bullet collides an instance, destroy the bullet and reduce the instance's health
		if(_col_player){
				
			instance_destroy();
					
			_col_player.the_health -= bullet.damage;
			
			//Set to damaged to apply flash
			_col_player.damaged = true;
			
			//Create an effect
			var _effect = instance_create_layer(x, y, "layer_effects", o_animations);
			
			_effect.sprite_index = s_flash;
				
		}

}


/// @ param _angle
/// @ param _distance
//Bullet moving
function scr_bullet_move(_distance, _angle){

	//Moving the bullet closer to the player direction
	x += _distance * dcos(_angle);
	y += _distance * -dsin(_angle);

	//Destroying the instance when the bullet collides with the walls or player + damaging the player
	scr_col();

}
