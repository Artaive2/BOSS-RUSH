/*
if(type == "Tracker"){

	
	
	if(tracker_timer > 0){
	
		bullet.angle = point_direction(x, y, o_player.x, o_player.y);
		tracker_timer--;
	
	}
	
	if(tracker_timer <= 0){
	
		
	
	}

}
*/

bullet = straight_bullet;

scr_bullet_move(bullet.spd, bullet.angle);
