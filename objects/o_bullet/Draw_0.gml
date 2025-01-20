//If the bullet was just created
if(created == true){
	
	//Draw a flash
	draw_sprite(s_flash, 0, x, y);
	
	//Set created to false
	created = false;
}


draw_self();


//If the projectile is a bomb
if(type = "Bomb"){
	
	//Speed up the animation the closer the bomb to exploding
	image_speed += 2 / bomb_timer;

	
}