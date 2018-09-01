/// @description Insert description here
// You can write your code in this editor

// key checks
key_left = keyboard_check(vk_left) || keyboard_check(ord("A"));
key_right = keyboard_check(vk_right) || keyboard_check(ord("D"));;
key_jump = keyboard_check_pressed(vk_space);


// movement + gravity
var move = key_right - key_left;
var prev_hsp = hsp;
var prev_vsp = vsp;
hsp = move * walksp;
vsp = vsp + grv;

// Jump
if(place_meeting(x, y+1, obj_wall) && key_jump){
		vsp = jump_height * -1;
		audio_play_sound(effect_jump, 10, false);
}

// update animation if movement speed changes frame to frame
if (prev_hsp != hsp || prev_vsp != vsp){
	update_animation = 1;
    if (hsp > 0) { facing = 1; }
	if (hsp < 0) { facing = -1; }
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
	update_animation = 1;
}
// Actually move vertically
y = y + vsp;


// Animation
if (hsp == 0 && vsp == 0 && update_animation == 1){
	if (facing == 1){
		sprite_index = spr_player_stand_right;
		update_animation = 0;
	}
	if (facing == -1){
		sprite_index = spr_player_stand_left;
		update_animation = 0;
	}
}
if (!place_meeting(x, y+1, obj_wall) && update_animation == 1) {
	if (facing == 1){
		sprite_index = spr_player_jump_right;
		update_animation = 0;
	}
	if (facing == -1){
		sprite_index = spr_player_jump_left;
		update_animation = 0;
	}
} else {
	if (facing == 1 && update_animation == 1){
		sprite_index = spr_player_walk_right;
		update_animation = 0;
	}
	if (facing == -1 && update_animation == 1){
		sprite_index = spr_player_walk_left;
		update_animation = 0;
	}
	
}



