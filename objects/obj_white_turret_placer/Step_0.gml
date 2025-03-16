// Inherit the parent event
event_inherited();

//ajusta a diração do sprite
{
	if orientation == "right"
	{

		if sprite_index != spr_white_turret_right
		{
			sprite_index = spr_white_turret_right	//ajusta o sprite
			//ajusta as dimensões
			tiled_size_x = 2
			tiled_size_y = 1
		}
	}
	else if orientation == "up"
	{

		if sprite_index != spr_white_turret_up
		{
			sprite_index = spr_white_turret_up	//ajusta o sprite
			//ajusta as dimensões
			tiled_size_x = 1
			tiled_size_y = 2
		}
	}
	else if orientation == "left"
	{
	
		if sprite_index != spr_white_turret_left
		{
			sprite_index = spr_white_turret_left	//ajusta o sprite
			//ajusta as dimensões
			tiled_size_x = 2	//TESTE: valor negativo
			tiled_size_y = 1
		}
	}
	else
	{
		if sprite_index != spr_white_turret_down
		{
			sprite_index = spr_white_turret_down	//ajusta o sprite
			//ajusta as dimensões
			tiled_size_x = 1	//TESTE: valor negativo
			tiled_size_y = 2
		}
	}
}

