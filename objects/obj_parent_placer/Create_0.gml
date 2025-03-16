tile_size = 16

tiled_x = 0
tiled_y = 0

range = 2

colour = c_green

price = 0

//quantidade de tiles que o objeto ocupa
tiled_size_x = 0
tiled_size_y = 0

matrix_index = 3

//objeto a ser construído
obj_to_build = obj_white_turret	//passo objeto por padrão pra nn dar erro

//ajuste nas dimensões
x_scale = 1
y_scale = 1

orientation = "right"


function update_matrix()
{
	for (var i = 0; i < tiled_size_x; i++)	//confere o eixo X
	{
		for (var j = 0; j < tiled_size_y; j++)	//confere o eixo Y
		{
			obj_wall_manager.matrix_update(tiled_y + j, tiled_x + i, matrix_index)
		}
	}
}

