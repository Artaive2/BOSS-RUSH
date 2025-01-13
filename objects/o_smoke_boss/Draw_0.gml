
//draw_line(x, y, hands_x + 16, hands_y + 10);
//draw_line(x, y, hands_x - 16, hands_y + 10);

draw_self();

//Draw gear
draw_sprite(s_gear, gear_image_num, gear_x, gear_y + 5);



//Draw hands
draw_sprite(s_smoke_hand, hands_image_num, hands_x + 16, hands_y + 5);
draw_sprite_ext(s_smoke_hand, hands_image_num, hands_x - 16, hands_y + 5, -1, 1, 0, c_white, 1);



