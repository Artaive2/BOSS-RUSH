//Bullet variables
type = "";
angle = 0; //point_direction(x, y, o_player.x, o_player.y);
damage = 1;
spd = 0;
bullet = 0;
created = true;
target = noone;


//Tracker variables
tracker_timer = 250;

//Bomber variables
bomb_timer = 250;
explosion_area = 30;
flash_timer = 2 * (bomb_timer / 4);

//Creating bullet structs	
straight_bullet = new str_bullets(2,3, angle);
tracker_bullet = new str_bullets(5, 2, 0);
bomb_bullet = new str_bullets(10, 1, 0);
spread_bullet = new str_bullets(1, 3, 0);
explosive_bullet = new str_bullets(7, 3, 0);