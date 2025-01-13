//Function for destroying the instance in case of colliding with a wall or the player, and damaging the player
function scr_col(){
	
		//If the bullet collides with anything, destroy it
		if(collision_point(x + spd, y + spd, o_wall, false, true)){
				
			instance_destroy();
				
		}
				
		//Check for collision with player
		var _col_player = collision_point(x, y, o_player, true, true);
				
		//If the bullet collides with the player, destroy it and reduce the player's health
		if(_col_player){
				
			instance_destroy();
					
			_col_player.the_health -= damage;
				
		}

}


/// @ param _angle
/// @ param _distance
//Bullet moving
function scr_bullet_move(_distance, _angle){

	//Moving the bullet closer to the player direction
	x += _distance * dcos(_angle);
	y += _distance * -dsin(_angle);

	//Destroying the instance when the bullet collides with the walls or player + damaging the player
	scr_col();

}


var _total = 0;
var _candidates = {};

global.chance_struct = {
	
	_total,
	_candidates,
	
}


/// @param asset {string}
/// @param votes {real}
function scr_candidate_add(_candid, _votes){
	
	//If the candid already exists
	if( struct_exists(global.chance_struct._candidates, _candid) ){
		
		//Subtract the candid votes from the total votes variable so the new input is added to the total instead
		global.chance_struct._total -= global.chance_struct._candidates[$ _candid];
	
	}
	
	//The $ is the struct accessor, _candidates is a struct and will keep variabels
	global.chance_struct._candidates[$ _candid] = _votes;
	global.chance_struct._total += _votes;

}

//Getting from the ballot

function scr_candidate_get(){
	
	
	//Select a random number between 0 and our current total
	var _draw_num = irandom(global.chance_struct._total);
	
	//Get an array with the variable names (candidate names as strings)
	var _var_names = variable_struct_get_names(global.chance_struct._candidates);
	
	//Go through each vote
	for(var i = 0, cursor = 0; i < array_length(_var_names); i++){
	
		//Get the candidate name that = i and store it in variable 'candidate'
		var _candidate = _var_names[i];
		
		//Put the cursor at the end of the current candidate's segment
		cursor += global.chance_struct._candidates[$ _candidate];
		
		//if the random number selected is behind the current candidate's limit or is at the cursor then the number picked current candidate
		if(_draw_num <= cursor){
		
			//Get the asset index (exm: o_enemy, s_sprite etc) that has the same name as the string of the candidate 
			var _return = asset_get_index(_candidate);
			
			return _return;
			
		}
		
	}
	
}