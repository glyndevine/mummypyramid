if (place_meeting(x,y,obj_wall) || place_meeting(x,y,obj_ceiling)) { 
	if (obj_player.hookflying == true) { 
		speed = 0; 
		obj_player.hookflying = false; 
		obj_player.speed = 0;
		obj_player.vsp = 0;
		obj_player.grv = 0; 
	}
}
