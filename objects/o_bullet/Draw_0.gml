//If the bullet was just created
if(created == true){
	
	
	//Draw a flash
	draw_sprite_ext(creation_effect, 0, x, y, effect_scale_x, effect_scale_y, 0, c_white, 1);
	
	//Set created to false
	created = false;
	
}


draw_self();


//If the projectile is a bomb
if(type = "Bomb"){
	
	//If the flashing timer is greater than 0, reduce it by 1
	if(flash_timer > 0){
	
		flash_timer--;
	
	}
	
	//If the flashing timer is less than or equals 0
	if(flash_timer <= 0){
		
		//Apply flashing effect
		shader_set(sh_flash);
		draw_self();
		shader_reset();
		
		//Reset timer based on how close the bomb is to exploding
		flash_timer = 2 * (bomb_timer / 4);
	
	}
	
	
}