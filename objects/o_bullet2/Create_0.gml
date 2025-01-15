//Bullet variables
type = "";
angle = point_direction(x, y, o_player.x, o_player.y);
damage = 1;
spd = 0;
bullet = 0;

//Tracker variables
tracker_timer = 250;
offset = 0;


//Creating bullet structs	
straight_bullet = new str_bullets(1, 50, 3, angle);
tracker_bullet = new str_bullets(5, 20, 1, 0);
	