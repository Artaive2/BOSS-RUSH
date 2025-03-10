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

	//If it is not the tutorial room, end the game
	if(room != Roomtutorial){
		
		game_end();
	
	}

}

//If the room is not the main menu or the tutorial room
if(room != RM_main_menu && room != Roomtutorial){
	
	//If the character does not exist anymore
	if(!instance_exists(o_player) ){

		//Reduce timer
		if(timer > 0){
		
			timer--;
			
		}
		
		//If the timer finally reaches 0, restart game
		if(timer <= 0){
		
			game_restart();
		
		}

	}
	
}


if(_test){

	room_goto(RM_second_boss);

}


window_set_cursor(cr_none);

cursor_sprite = Scursor;


#region Assigning health of the current boss to the boss health variable

//If it's the first boss's room
if(room == RM_first_boss){

	//If the boss still exists
	if( instance_exists(o_smoke_boss) ){
	
		//Pass the health to the variable
		boss_health = o_smoke_boss.the_health;

	
	}

	//
	if( !instance_exists(o_smoke_boss) ){
	
		//Pass the health to the variable
		boss_health = 0;
		
		room_goto(RM_second_boss);

	
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
		
		game_restart();
	
	}


}


#endregion Assigning health of the current boss to the boss health variable


#region Calculating boss health to animate health bar (10 frames)


//If it's a room with a boss
if(room != RM_main_menu && room != Roomtutorial){

	//If the variable has not been set
	if(boss_full_health == -1){
		
		//Get full boss health
		boss_full_health = boss_health;
	
	}
	
	

}
	
	
#endregion Calculating boss health to animate health bar (10 frames)



#region Music and sound


//Player the theme music if the room is the arena (battle room)
if(room != RM_main_menu && room != Roomtutorial){
	
	//If the audio is not already playing, play it	
	if( !audio_is_playing(Fight_theme) ){
		
		audio_play_sound(Fight_theme, 3, 1);
			
	}
			
	
	
	#region Old
	
	/*
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
	
	*/
	
	#endregion Old

}


#endregion Music and sound
