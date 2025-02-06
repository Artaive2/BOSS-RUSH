//Inherit parent create event
event_inherited();

depth = -4000;


//Player variables
the_health = 30;
x_movement = 0;
y_movement = 0;
prev_state = 0;
damage = 50;

//Movement variables
walk_spd = 1.2;
run_spd = 2;
spd = run_spd;
grv = .4;


//Jumping
jump_height = -9;
jumps = 1;
coyote_time = true;


#region Saw variables

mouse_direction = 0;

//Arrow
arrow_opacity = 0;
arrow_frame = 0;
arrow_max_frame = 5;
arrow_animation_speed = 8;


//Saw
saw_duration = 300;
saw_speed = 5;
saw_damage = 3;
saw_bounce = 1;
saw_charge_time = 60;


//Energy
saw_energy_cost = 5;
energy = 30;
energy_max = 30;
energy_regain = 0.01;


#endregion Saw variables


//Knockback
knockback_time = 24;
knockback_amount = 3;
knockback = false;


//Gun variables
ammo_max = 30;
ammo = 30;
reload_time = 120;
shoot_time = 0;
reloading = false;
type = "Straight";


//Player state for finite machine
my_state = player_states.moving;


//Setting sprites to array for easy reference
player_sprite[player_move_states.idle] = s_player_idle;
player_sprite[player_move_states.running] = s_player_running;
player_sprite[player_move_states.walking] = s_player_walking;
player_sprite[player_move_states.falling] = s_player_falling;
player_sprite[player_move_states.jumping] = s_player_jumping;