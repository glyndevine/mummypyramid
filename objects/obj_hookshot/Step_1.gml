/// @description Insert description here
// You can write your code in this editor
if (obj_player.hooking == false){ 
	obj_player.speed = 0;
	obj_player.grv = 1;
	instance_destroy(); 
}
if (point_distance(x,y, obj_player.x, obj_player.y) > 140){
	obj_player.hookflying = false;
	obj_player.hooking = false;
	obj_player.grv = 1;
	obj_player.speed = 0;
	obj_player_gun.hookcooldown = 5;
	instance_destroy();
}