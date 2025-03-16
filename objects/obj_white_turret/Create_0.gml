attack_speed = 1
steps_per_second = 60
resting = true

orientation = "right"

alarm[0] = attack_speed * steps_per_second;

depth = -y

//altera a dimensão da torreta

image_xscale = 0.7499999
image_yscale = 0.7499999

function set_orientation(orientation)
{
	self.orientation = orientation
	
	//atualiza o sprite
	if orientation == "right"
		sprite_index = spr_white_turret_right
	else if orientation == "up"
		sprite_index = spr_white_turret_up
	else if orientation == "left"
		sprite_index = spr_white_turret_left
	else if orientation == "down"
		sprite_index = spr_white_turret_down
}


//offset das balas para que suas cordenadas estejam corretas
//pass