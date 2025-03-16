// Inherit the parent event
event_inherited();

/*
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
					var obj = instance_create_layer(x, y, "items", obj_item)
					obj.set_item(1, self.drop_sprite)
					obj.set_cords(x + lengthdir_x(self.drop_range, angle) , y + lengthdir_y(self.drop_range, angle))
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
*/
