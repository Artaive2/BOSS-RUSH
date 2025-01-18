
//Smoke boss variables
x_speed = 0;
y_speed = 0;
spd = 2;
max_spd = .5;
easing = .1;
phase = 1;

//The range used to detect if player is getting closer
range_player = 150;

//The maxmimum pixels the boss can get closer to the player
range_limit = 200;



//Gear variables
gear_image_num = 0;
gear_image_max_num = 32;
gear_x = x;
gear_y = y;


//Hands variables
hands_image_num = 0;
hands_image_max_num = 7;
hands_x = x;
hands_y = y;

hands_attack_image_num = 0;
hands_attack_image_max_num = 8;

//Animation variables
other_image_speed = 4;
bobbing = .1;
alarm[0] = 1;

//Attack variables
attack_timer = random_range(50, 100);

ultimate_timer = random_range(250, 300);
ultimate_spot_x = room_width / 2;
ultimate_spot_y = (room_height / 2) - 30;
ultimate = false;
timer = 0;

duration = 10;

type = "";
chance = irandom(100);