//Getting the direction of the player
var _player_direction = point_direction(x, y, direction_x, direction_y);

var _dir = point_direction(x, y, o_player.x, o_player.y);


//Swtich functionality based on bullet type
switch(type){
		
			#region Bouncy
			case "Bouncy":
				
				/*
				var _bounce_num = 3;
				var _momentum = .5;

				
				
				//Moving the bullet closer to the player direction
				x += x_speed * dcos(_player_direction);
				y += y_speed * -dsin(_player_direction);
				
				if(place_meeting(x + x_speed, y, o_wall)){
				
					x = xprevious;
					
					x_speed = -x_speed * _momentum;
					
					
					if(y_speed = 0){
						
						y_speed = irandom_range(-1, 1);
						
					}else{
					
						y_speed = -y_speed * _momentum;
					
					}
					
					
				
				}
				
				
				if(place_meeting(x, y + y_speed, o_wall)){
				
					y = yprevious;
					
					y_speed = -y_speed * _momentum;
					
					if(x_speed = 0){
						
						x_speed = irandom_range(-1, 1);
					
					}else{
					
						x_speed = -x_speed * _momentum;
					
					}
				
				}
				*/
			
			break;
			
			#endregion
			
			#region Straight
			
			case "Straight":
				
				
				damage = 1;
				
				//Moving the bullet closer to the player direction
				scr_bullet_move(.3, _player_direction);
				
				//Destroying the instance when the bullet collides with the walls or player + damaging the player
				//scr_col();
			
			
			break;
			
			#endregion
			
			#region Tracker bullet
			
			case "Tracker":
				
				damage = 5;
			
				
				
				
				//Moving the bullet closer to the player direction
				scr_bullet_move( (distance_to_object(o_player) / 2), _player_direction);
				
				//Destroying the instance when the bullet collides with the walls or player + damaging the player
				//scr_col();
			
			break;
			
			#endregion
			
			
			#region Exploding bullet
			
			case "Bomb":
			
				damage = 10;
	
				x_speed = 4;
				y_speed = 4;
		
				bomb_timer = 20;
				
				
				
			
			break;
			
			#endregion
		
		
}

x += x_movement;
y += y_movement;

//If the bullet goes beyond room edges, destroy it
if((x < 0) || (x > room_width) || (y < 0) || (y > room_height) ){

	instance_destroy();
	
}