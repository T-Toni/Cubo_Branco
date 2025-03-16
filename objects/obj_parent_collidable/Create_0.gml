hit = false 

tile_size = 16

depth_offset = 0

// Calcula a posição na matriz
col = floor(x / tile_size)
row = floor(y / tile_size)

// calcula o centro do objeto
center_x = x + sprite_get_width(sprite_index) / 2
center_y = y + sprite_get_height(sprite_index) / 3

function update_matrix(value)
{
	for (var i = 0; i < tiled_size_x; i++)
	{
		for (var j = 0; i < tiled_size_y; j++)
		{
			obj_wall_manager.matrix_update(row + j, col + i, value)
		}
	}
}
