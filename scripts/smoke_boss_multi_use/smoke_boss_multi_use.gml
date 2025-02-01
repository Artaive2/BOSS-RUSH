
function scr_animate_hands(){
	
	//If the image number is less than the max image number
			if(hands_image_num < hands_image_max_num){

				//Increase by 1
				hands_image_num++;

			}else{//If the image number is equal or higher than the max number

				//Reset it to 0
				hands_image_num = 0;

			}
	

}