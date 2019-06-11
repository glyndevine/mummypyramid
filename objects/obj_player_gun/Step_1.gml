/// @description Insert description here
// You can write your code in this editor

// Make the gun stick to the player
x = obj_player.x;
y = obj_player.y;

// Update the gun's angle
image_angle = point_direction(x, y, mouse_x, mouse_y);

//Gun firing
firingdelay = firingdelay - 1;
recoil = max(0, recoil - 1);
if(mouse_check_button(mb_left)) && (firingdelay < 0) {
	recoil = 4;
	firingdelay = 5;
	if (!obj_player.firing) { obj_player.firing = true; };
	with(instance_create_layer(x,y,"Bullets",obj_bullet)){
		speed = 25;
		direction = other.image_angle;
		image_angle = direction;
	}
}
if (!mouse_check_button(mb_left) && obj_player.firing == true){
	obj_player.firing = false;
}


//Hookshot
hookrecoil = max(0, recoil - 1);

if(mouse_check_button(mb_right) && obj_player.hookflying == false && obj_player.hooking == true) {
	hookcooldown = 5;
	obj_player.hooking = false;
}

if(mouse_check_button(mb_right) && hookcooldown == 0 && obj_player.hooking == false) {
	obj_player.hooking = true;
	obj_player.hookflying = true;
	hookrecoil = 4;
	with(instance_create_layer(x,y,"Bullets",obj_hookshot)){
		speed = 25;
		direction = other.image_angle;
		image_angle = direction;
	}
}


if (hookcooldown > 0) { hookcooldown = hookcooldown - 1; }

// Bounce the gun based on the recoil value
x = x - lengthdir_x(recoil+hookrecoil, image_angle);
y = y - lengthdir_y(recoil+hookrecoil, image_angle);