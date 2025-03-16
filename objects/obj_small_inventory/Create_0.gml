//vetor dos espaços do inventário
scale = 5
image_xscale = scale
image_yscale = scale

slots_vector = []

//instance_create_layer(0, 0, "UI", obj_item)
//preenche o vetor com valores vazios
slots_vector[0] = noone
slots_vector[1] = noone
slots_vector[2] = noone
slots_vector[3] = noone
slots_vector[4] = noone
slots_vector[5] = noone
slots_vector[6] = noone


//define a definição
y = view_get_hport(0) - sprite_get_height(sprite_index) * scale
x = view_get_wport(0) / 3


//função que retorna caso exista o item no inventário	(definido pelo sprite)
function item_type_on_inventory(spr_item)	//retorna o slot do inventário que contem o item
{
	for (var i = 0; i < array_length(self.slots_vector); i++)
	{
		if self.slots_vector[i] != noone
			if self.slots_vector[i].sprite_index == spr_item
			{
				//show_message(i)
				return i
			}
	}
	//show_message(-1)
	return -1
}

//função para adicionar item ao inventário
function add_item(source, slot, quantity)
{
	if slot > -1
	{
		self.slots_vector[slot].quantity += quantity
		instance_destroy(source)
	}
	else	//adiciona o item que invocou ao menor slot disponível
	{
		for (var i = 0; i < array_length(self.slots_vector); i++)
		{
			if self.slots_vector[i] == noone
			{
				//show_message("entrei" + string(i))
				self.slots_vector[i] = source
				source.on_inventory = true	
				source.slot = i
				break
			}
		}
	}
}

/*
//desenha os itens
function draw_itens(slot)	//usar no draw gui
{
	var diagonal_gap = 3 * self.scale
	var gap = (9 + 10) * self.scale 		//gap between itens
	var y_pos = y + diagonal_gap
	var x_pos = x + diagonal_gap
	
	var scale = self.scale
	
	x_pos += gap * slot
	
	for (var i = 0; i < array_length(self.slots_vector); i++)
	{
		if self.slots_vector[i].item_sprite 
		{
			//show_message("entrei meo")
			draw_sprite_ext(self.slots_vector[i].sprite_index, -1, x_pos, y_pos, scale, scale, 0, c_white, 1)
		}
		
		//atualiza a posição x
		x_pos += gap * slot
	}
	
}
*/
