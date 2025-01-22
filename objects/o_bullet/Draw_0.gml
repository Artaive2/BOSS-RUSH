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
	

	
	if(flash_timer > 0){
	
		flash_timer--;
	
	}
	
	if(flash_timer <= 0){
		
		shader_set(sh_flash);
		draw_self();
		shader_reset();
		
		//Reset timer based on how close the bomb is to exploding
		flash_timer = 2 * (bomb_timer / 4);
	
	}
	
	
}