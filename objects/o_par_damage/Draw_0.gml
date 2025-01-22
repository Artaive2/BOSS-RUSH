draw_self();

//If the instance has been damaged
if(damaged == true){

	//Make it flash
	shader_set(sh_flash);
	draw_self();
	shader_reset();

	//Set damaged to false
	damaged = false;
}