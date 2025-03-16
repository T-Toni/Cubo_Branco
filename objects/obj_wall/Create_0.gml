event_inherited()

hp = 5



function interact(hit_by_bullet)
{
	if not hit or hit_by_bullet
	{
		if hp>1
		{
			hp = hp - 1
		}
		else
		{
			//atualiza a matriz
			obj_wall_manager.matrix_update(row, col, 0)
	
			// Cria um vetor para armazenar as paredes adjacentes
		    targets = [];

		    // Adiciona as paredes adjacentes ao vetor
		    targets[0] = instance_position(x, y - tile_size/2, obj_wall); // Parede acima
		    targets[1] = instance_position(x, y + tile_size*1.5, obj_wall); // Parede abaixo
		    targets[2] = instance_position(x - tile_size, y + tile_size/2, obj_wall); // Parede à esquerda
		    targets[3] = instance_position(x + tile_size, y + tile_size/2, obj_wall); // Parede à direita

		    // Loop para conferir cada parede (target) e executar a função redraw, caso exista
		    for (var i = 0; i < array_length(targets); i++) {
		        if (targets[i] != noone) { // Se o target existe
		            if (is_undefined(targets[i].redraw) == false) {
		                targets[i].redraw(); // Chama a função redraw da parede
		            }
		        }
		    }
	
	
			instance_destroy(self)
		}
		if not hit_by_bullet
		{
			hit = true;
		}
	}
}

function redraw()
{
	sprite_index = obj_wall_manager.get_wall_sprite(row, col)
	show_debug_message("parede redesenhada: " + string(row) + string(col));
}