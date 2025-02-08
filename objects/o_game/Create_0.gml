randomize();

global.menutheme = audio_play_sound(sound_menu, 1, 1);

//Audio variables
intro_played = false;

//Boss health to draw to the screen
boss_health = 0;
boss_full_health = -1;
boss_health_percentage = 100;

//Timer used to restart game
timer = 180;