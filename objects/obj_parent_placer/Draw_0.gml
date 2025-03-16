//draw_self()

var tiled_player_x = obj_player.x div tile_size
var tiled_player_y = obj_player.y div tile_size

colour = c_green

/*
draw_text(obj_player.x, obj_player.y + 20, tiled_x)
draw_text(obj_player.x + 50, obj_player.y + 20, tiled_y)
*/

//confere a distancia do player até onde se quer por o objeto
if tiled_x < tiled_player_x - range or tiled_x > tiled_player_x + range or tiled_y < tiled_player_y - range or tiled_y > tiled_player_y + range
{
	colour = c_red
}

//confere se algo ja ocupa esse(s) tiles
for (var i = 0; i < tiled_size_x; i++)	//confere o eixo X
{
	for (var j = 0; j < tiled_size_y; j++)	//confere o eixo Y
	{
		//confrere na matriz
		if !obj_wall_manager.is_tile_free(tiled_y + j, tiled_x + i)
		{
			colour = c_red
		}
		
		/*
		//confere para o player
		if tiled_y + j == obj_player.tiled_y && tiled_x + i == obj_player.tiled_x
		{
			colour = c_red
		}
		*/
		
		//confere para o player
		if place_meeting(x, y, obj_player)
		{
			colour = c_red
		}
	}
}

draw_sprite_ext(sprite_index, image_index, x, y, x_scale, y_scale, 0, colour, 0.5);

