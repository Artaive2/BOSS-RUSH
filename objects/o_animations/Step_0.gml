//If the animation ends, destroy this instance
if(image_index == ( image_number - 1) ){
	
	instance_destroy();

}

//Play explosion sound if the animation is an explosion and the sound has not been played yet
if(sprite_index == s_explosion && !sound_played){

	//Play exposion sound
	audio_play_sound(choose(Explosion_1, Explosion_2, Explosion_3), 5, 0);
	
	//Sound played
	sound_played = true;

}