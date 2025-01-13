draw_self();

if(jet){

	repeat(3){
		
		var _offset = random_range(-6, 6);
	
		var _y = 20;
		
		draw_sprite(s_fire, 0, x + _offset, y + _y + _offset);
	}

}