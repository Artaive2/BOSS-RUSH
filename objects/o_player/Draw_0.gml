// Inherit the parent event
event_inherited();

//Draw gun arm
//draw_sprite_ext(s_gun, 0, x, y, sign(x_movement), 1, point_direction(x, y, mouse_x, mouse_y), c_white, 1);

//Draw saw arrow
draw_sprite_ext(s_arrow, arrow_frame, x, y, 1, 1, mouse_direction, c_white, arrow_opacity);


draw_text(x, y - 50, string(energy));
