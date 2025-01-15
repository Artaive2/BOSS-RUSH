//Function for destroying the instance in case of colliding with a wall or the player, and damaging the player
function scr_col(){
	
		//If the bullet collides with anything, destroy it
		if(collision_point(x + spd, y + spd, o_wall, false, true)){
				
			instance_destroy();
				
		}
				
		//Check for collision with player
		var _col_player = collision_point(x, y, o_player, true, true);
				
		//If the bullet collides with the player, destroy it and reduce the player's health
		if(_col_player){
				
			instance_destroy();
					
			_col_player.the_health -= damage;
				
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

