//Change bullet attributes base on type
switch(type){


	#region Straight bullet
	
	case "Straight":
	
		//Set bullet to be the straight bullet created in the create event
		bullet = straight_bullet;
	
	break;
	
	#endregion
	
	
	#region Tracker
	
	case "Tracker":
		
		//Set bullet to be the tracker bullet created in the create event
		bullet = tracker_bullet;
		
		//If the tracker time is bigger than 0
		if(tracker_timer > 0){
			
			//Get the current direction of the player
			bullet.angle = point_direction(x, y, o_player.x, o_player.y);
			
			//Reduce tracker timer
			tracker_timer--;
		
		}
		
		//If the tracker timer is less than or equal 0
		if(tracker_timer <= 0){
		
			//Do nothing
		
		}
		
	break;
	
	#endregion

}

//Moving the bullet
scr_bullet_move(bullet.spd, bullet.angle);
