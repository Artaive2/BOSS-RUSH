draw_self();

draw_text(10, 10, string(attacking_duration));

//Draw gear
draw_sprite(s_gear, gear_image_num, gear_x, gear_y + 5);


if(attacking == false){
	
	sprite_index = s_smoke_boss;
	
	//Draw hands
	draw_sprite(s_smoke_hand, hands_image_num, hands_x + 16, hands_y + 5);
	draw_sprite_ext(s_smoke_hand, hands_image_num, hands_x - 16, hands_y + 5, -1, 1, 0, c_white, 1);

}

//If the attack timer is less than or equal to 0
if(attacking == true){
	
	sprite_index = s_smoke_boss_attack;
	
	//Draw hands
	draw_sprite(s_hands_attack, hands_attack_image_num, hands_x + 16, hands_y + 5);
	draw_sprite_ext(s_hands_attack, hands_attack_image_num, hands_x - 16, hands_y + 5, -1, 1, 0, c_white, 1);
	
}