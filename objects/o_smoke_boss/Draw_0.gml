//Inherit parent draw event;
event_inherited();

//Draw gear
draw_sprite(s_gear, gear_image_num, gear_x, gear_y + 5);


if(ultimate == false){
	
	sprite_index = s_smoke_boss;
	
	//Draw hands
	draw_sprite(s_smoke_hand, hands_image_num, hands_x + 16, hands_y + 5);
	draw_sprite_ext(s_smoke_hand, hands_image_num, hands_x - 16, hands_y + 5, -1, 1, 0, c_white, 1);

}



//If the attack timer is less than or equal to 0
if(ultimate == true){
	
	sprite_index = s_smoke_boss_attack;
	
	//To apply shaking effect
	var _hands_x = choose(15, 16);
	var _hands_y = choose(5, 6);
	
	//Draw hands
	draw_sprite(s_hands_attack, hands_attack_image_num, hands_x + _hands_x, hands_y + _hands_y);
	draw_sprite_ext(s_hands_attack, hands_attack_image_num, hands_x -_hands_x, hands_y + _hands_y, -1, 1, 0, c_white, 1);
	
	
	
}

