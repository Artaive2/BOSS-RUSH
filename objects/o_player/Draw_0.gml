// Inherit the parent event
event_inherited();

//Draw saw arrow
draw_sprite_ext(s_arrow, arrow_frame, x, y, 1, 1, mouse_direction, c_white, arrow_opacity);


draw_text(x, y - 50, string(energy));
