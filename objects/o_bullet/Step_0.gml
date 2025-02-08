//Change bullet attributes base on type
switch(type){


	#region Straight bullet
	
	case "Straight":
	
		//Set bullet to be the straight bullet created in the create event
		bullet = straight_bullet;
		
		bullet.angle = angle;
	
	break;
	
	#endregion
	
	
	#region Tracker
	
	case "Tracker":
		
		//Set bullet to be the tracker bullet created in the create event
		bullet = tracker_bullet;
		
		//If the player still exists
		if(instance_exists(o_player) ){
			
			//If the tracker time is greater than 0
			if(tracker_timer > 0){
			
				//Get the current direction of the player
				bullet.angle = point_direction(x, y, o_player.x, o_player.y);
			
				//Reduce tracker timer
				tracker_timer--;
		
			}
			
		}
		
		//If the tracker timer is less than or equal 0
		if(tracker_timer <= 0){
		
			//Do nothing
		
		}
		
	break;
	
	#endregion
	
	
	#region Bomb
	
	case "Bomb":
		
		//Set bullet to be the tracker bullet created in the create event
		bullet = bomb_bullet;
		
		//Set damage area
		explosion_area = 32;
		
		if(instance_exists(o_player) ){
			
			//Get the current direction of the player
			bullet.angle = point_direction(x, y, o_player.x, o_player.y);
			
		}
			
		//If the tracker time is greater than 0
		if(bomb_timer > 0){
			
			//Reduce tracker timer
			bomb_timer--;
		
		}
		
		//If the tracker timer is less than or equal 0, the projectile explodes
		if(bomb_timer <= 0){
		
			//Checking for collision with the player in the area of the explosion
			var _col = collision_circle(x, y, explosion_area, o_player, 1, 1);
			
			//If there's a collision with the player
			if(_col){
			
				//Damage the player
				_col.the_health -= bullet.damage;
			
			}
			
			//Create an explosion animation instance
			var _exp = instance_create_layer(x, y, "layer_effects", o_animations);
			
			//Pass a sprite
			_exp.sprite_index = s_explosion;
			
			_exp.sound_id = choose(Explosion_1, Explosion_2, Explosion_3);
			
			//Destroy this instance
			instance_destroy();
			
		
		}
	
	break;
	
	#endregion
	
	
	#region Spread
	
	case "Spread":
	
		//Set bullet to be the tracker bullet created in the create event
		bullet = spread_bullet;
		
		bullet.angle = angle;
		
		
	
	break;
	
	#endregion
	
	
	#region Explosive
	
	case "Explosive":
	
		//Set bullet to be the tracker bullet created in the create event
		bullet = explosive_bullet;
		
		bullet.angle = angle;
		
		//Set damage area
		explosion_area = 42;
		
	
	break;
	
	#endregion

}

//Moving the bullet
scr_bullet_move(bullet.spd, bullet.angle, target);


//Destroying bullet when it leaves the room
if(x < 0 || y < 0 || x > room_width || y > room_height){

	instance_destroy();

}
