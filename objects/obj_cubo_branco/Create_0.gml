event_inherited()

counter = 0

size = 4 //largura e altura são iguais (é um cubo ne krai kkkkkkkk)


depth_offset = 1 * tile_size

function interact(hit_by_bullet)
{
	if not hit or hit_by_bullet
	{
		counter += 1
		obj_carteira_RB.quantidade +=1
			//ParticleSystem1
		var _ps = part_system_create();
		part_system_draw_order(_ps, true);

		//Emitter
		var _ptype1 = part_type_create();
		part_type_sprite(_ptype1, runes, false, true, true)
		part_type_size(_ptype1, 1, 1, 0, 0);
		part_type_scale(_ptype1, 0.3, 0.3);
		part_type_speed(_ptype1, 0.3, 0.6, 0, 0);
		part_type_direction(_ptype1, 0, 360, 0, 0);
		part_type_gravity(_ptype1, 0, 58);
		part_type_orientation(_ptype1, 0, 0, 0, 0, false);
		part_type_colour3(_ptype1, $FFFFFF, $FFFFFF, $FFFFFF);
		part_type_alpha3(_ptype1, 1, 0.4, 0);
		part_type_blend(_ptype1, false);
		part_type_life(_ptype1, 20, 60);
	
		part_system_depth(_ps, -center_y - depth_offset - 1);

		var _pemit1 = part_emitter_create(_ps);
		part_emitter_region(_ps, _pemit1, -32, 32, -32, 32, ps_shape_rectangle, ps_distr_linear);
		part_emitter_burst(_ps, _pemit1, _ptype1, 1);
	
		part_system_position(_ps, x + size*tile_size/2, y + size*tile_size/2);
	}
	if not hit_by_bullet
	{
		hit = true
	}
}

tiled_size_x = size
tiled_size_y = size


function update_matrix()
{
	var tile_size = self.tile_size
	var tiled_x = x div tile_size
	var tiled_y = y div tile_size
	
	for (var i = 0; i < size; i++)	//confere o eixo X
	{
		for (var j = 0; j <= size; j++)	//confere o eixo Y
		{
			obj_wall_manager.matrix_update(tiled_y + j, tiled_x + i, 10)
		}
	}
}


update_matrix(10)
