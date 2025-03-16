// confere se foi clicado


if obj_construction_tab.is_inside(x, x2, y, y2) && visible 
{
	if (mouse_check_button_pressed(mb_left)) 
	{  
		count += 1
	}
	if count == 2
	{
		//debug
		//show_message("vai toma: " + name + " " + string(visible))
		
		//Ação
		obj_player.obj_to_build = obj_white_turret_placer
		obj_player.construction_mode = true
		
		count = 0
	}
}
else
{
	count = 0
}

if price > obj_carteira_RB.quantidade
{
	sprite_index = spr_constructions_insuficient
}
else
	sprite_index = spr_constructions


/*
//atualiza a posição do objeto a ser construído
if obj_player.obj_to_build
{
	obj_player.obj_to_build.image_index = 0

	var mx = device_mouse_x(0);
	var my = device_mouse_y(0);

	obj_player.obj_to_build.tiled_x = mx div tile_size
	obj_player.obj_to_build.tiled_y = my div tile_size

	obj_player.obj_to_build.x = obj_player.obj_to_build.tiled_x * tile_size
	obj_player.obj_to_build.y = obj_player.obj_to_build.tiled_y * tile_size
}
*/