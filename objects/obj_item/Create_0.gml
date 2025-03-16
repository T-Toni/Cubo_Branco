//para quando no inventário
quantity = 0
inventory_scale = obj_small_inventory.scale
slot = 0

//para quando fora
world_scale = 0.5
move_spd = 0.05
cord_x = -1
cord_y = -1

floating = false
float_range = 7
float_bottom = y
float_top = y - float_range
float_spd = 0.01
subindo = true		//para controlar o movimento quando parado

on_inventory = false

scale = 5


function set_item(quantity, item_sprite)
{
	sprite_index = item_sprite
	self.quantity = quantity
}

//atualiza a quantidade de um item
function set_quantity(quantity, slot_number)
{
	self.quantity = quantity
}

function set_cords(x_cord, y_cord)
{
	self.cord_x = x_cord
	self.cord_y = y_cord
}

//desenha
function draw_on_inventory(slot)	//usar no draw gui
{
	var diagonal_gap = 3 * self.scale
	var gap = (9 + 10) * self.scale 		//gap between itens
	var y_pos = obj_small_inventory.y + diagonal_gap
	var x_pos = obj_small_inventory.x + diagonal_gap
	
	var scale = self.scale
	var text_scale = 2
	
	x_pos += gap * slot
	
	draw_sprite_ext(sprite_index, 0, x_pos, y_pos, scale, scale, 0, c_white, 1)
	draw_text_transformed(x_pos , y_pos, string(self.quantity), text_scale, text_scale, 1)
}


//função que determina o movimento do item fora do inventário
function move(cord_x, cord_y)
{
	//move o item até a coordenada
	if (abs(x - cord_x) > 1 or abs(y - cord_y) > 1) and !self.floating
	{
		x = lerp(x, cord_x, self.move_spd)
		y = lerp(y, cord_y, self.move_spd)
		
		float_bottom = y
		float_top = y - float_range
	}
	else	//caso esteja na coordenada
	{
		floating = true
		//self.set_item(1, spr_icon_wood)
		if subindo
			y = lerp(y, self.float_top, self.float_spd)
		else
			y = lerp(y, self.float_bottom, self.float_spd)
			
		if y <= self.float_top + self.float_range / 4
			subindo = false
		else if y >= self.float_bottom - self.float_range / 4
			subindo = true
	}
}