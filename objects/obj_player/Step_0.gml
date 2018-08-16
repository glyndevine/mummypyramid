/// @description Insert description here
// You can write your code in this editor

// key checks
key_left = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);
key_jump = keyboard_check_pressed(vk_space);

// movement + gravity
var move = key_right - key_left;
hsp = move * walksp;
vsp = vsp + grv;

// Jump
if(place_meeting(x, y+1, obj_wall) && key_jump){
		vsp = jump_height * -1;
		audio_play_sound(effect_jump, 10, false);
}

// Horizontal Collision
if(place_meeting(x+hsp, y, obj_wall)){
	while(!place_meeting(x+sign(hsp), y, obj_wall)){
		x = x + sign(hsp);
	}
	hsp = 0;
}
// Actually move horizontally
x = x + hsp;

// Vertical Collision
if(place_meeting(x, y+vsp, obj_wall)){
	while(!place_meeting(x, y+sign(vsp), obj_wall)){
		y = y + sign(vsp);
	}
	vsp = 0;
}
// Actually move vertically
y = y + vsp;


