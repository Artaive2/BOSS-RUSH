var _test = keyboard_check(ord("T"));

//Controls
var _quit = keyboard_check( vk_escape );


//Get the current camera x
var _camera_x = camera_get_view_x(view_camera[0]);

//Applying parallax effect
layer_x("layer_backgound", _camera_x * .05);
layer_x("layer_foreground", _camera_x * .25);


//If the escape button has been pressed, quit game
if(_quit){

	if(room != Roomtutorial){
		
		game_end();
	
	}

}


if(room != RM_main_menu && room != Roomtutorial){
	
	if(!instance_exists(o_player) ){

		if(timer > 0){
		
			timer--;
			
		}

	}
	
}


if(_test){

	instance_destroy(o_player);

}

window_set_cursor(cr_none);

cursor_sprite = Scursor;




//If it's the first boss's room
if(room == RM_first_boss){

	//If the boss still exists
	if( instance_exists(o_smoke_boss) ){
	
		//Pass the health to the variable
		boss_health = o_smoke_boss.the_health;

	
	}

	if( !instance_exists(o_smoke_boss) ){
	
		//Pass the health to the variable
		boss_health = 0;

	
	}


}

//If it's the second boss's room
if(room == RM_second_boss){

	//If the boss still exists
	if( instance_exists(o_clock_boss) ){
	
		//Pass the health to the variable
		boss_health = o_clock_boss.the_health;
	
	}
	
	
	if( !instance_exists(o_clock_boss) ){
	
		//Pass the health to the variable
		boss_health = 0;
	
	}


}



#region Music and sound


//Player the theme music if the room is the arena (battle room)
if(room != RM_main_menu && room != Roomtutorial){
	
	
	var _play_music = false;
	
	if(intro_played == false && !audio_is_playing(Fight_intro_theme) ){
		
		//Play the intro
		audio_play_sound(Fight_intro_theme, 3, 0);
		
		intro_played = true;
		
	
	}
	
	
	if( intro_played == true && !audio_is_playing(Fight_intro_theme)){
			
		if( !audio_is_playing(Fight_theme) ){
		
			audio_play_sound(Fight_theme, 3, 1);
			
		}
			
	}
	

}


#endregion Music and sound
