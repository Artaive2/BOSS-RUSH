//Inherit parent create event
event_inherited();

walk_spd = 1.2;
run_spd = 2;
spd = run_spd;
x_movement = 0;
y_movement = 0;
grv = .5;

//Jumping
jump_height = -9;
jumps = 1;
coyote_time = true;

//Grapple variables
pulled = false;
grapple_timer = 0;


the_health = 30;

//Player state for finite machine
my_state = player_states.moving;


player_sprite[player_move_states.idle] = s_player_idle;
player_sprite[player_move_states.running] = s_player_running;
player_sprite[player_move_states.walking] = s_player_walking;
player_sprite[player_move_states.falling] = s_player_falling;
player_sprite[player_move_states.jumping] = s_player_jumping;