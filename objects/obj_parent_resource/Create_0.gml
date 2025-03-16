// Inherit the parent event
event_inherited();

tiled_size_x = 0
tiled_size_y = 0

drop_sprite = noone

drop_range = 0

drop_amount = 0

hp = 1

function set_variables(drop_sprite, size)
{
	self.drop_sprite = drop_sprite
	
	self.drop_range = sprite_get_width(sprite_index) / 2
	
	if size == "big"
	{
		self.drop_amount = irandom_range(8, 15)
		self.hp = 50
	}
	else if size == "medium"
	{
		self.drop_amount = irandom_range(6, 11)
		self.hp = 38
	}
	else if size == "small"
	{
		self.drop_amount = irandom_range(4, 8)
		self.hp = 25
	}
}

function interact(hit_by_bullet)
{
	if not self.hit or hit_by_bullet
	{
		if self.hp>1
		{
			self.hp = self.hp - 1
			//chance de dropar um item ao bater OBS: a quantidade de itens que serão dropados não muda
			if self.drop_amount > 0
			{
				if irandom(4) == 0	//um quinto de chance
				{
					self.drop_amount -= 1
					var angle = irandom_range(0, 359)
					
					var gap = (sprite_get_width(self.drop_sprite) / 2) * 0.5		//gap para que o item saia do centro do objeto de fato
					
					var obj = instance_create_layer(self.center_x - gap, self.center_y - gap, "items", obj_item)
					obj.set_item(1, self.drop_sprite)
					obj.set_cords(self.center_x + lengthdir_x(self.drop_range, angle) ,self.center_y + lengthdir_y(self.drop_range, angle))
					show_debug_message(string(self.center_x + lengthdir_x(self.drop_range, angle)))
				}
			}
		}
		else
		{
			//atualiza a matriz
			obj_wall_manager.matrix_update(row, col, 0)
	
			//dropa os demais itens
			for (var i = 0; i<self.drop_amount; i++)
			{
				var angle = irandom_range(0, 359)
				var obj = instance_create_layer(self.center_x, self.center_y, "items", obj_item)
				
				var rand = irandom_range(-20, 10)	//para tornar o ponto de queda mair organico
				
				obj.set_item(1, self.drop_sprite)
				obj.set_cords(self.center_x + lengthdir_x(self.drop_range, angle) + rand , self.center_y + lengthdir_y(self.drop_range, angle) + rand)
			}
	
			instance_destroy(self)
		}
		if not hit_by_bullet
		{
			self.hit = true;
		}
	}
}


