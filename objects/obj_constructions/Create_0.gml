construction_sprite = spr_white_turret_right
price = 0
name = "noone"

tile_size = 16

multiplier = obj_construction_tab.multiplier

x2 = x + 10 * multiplier
y2 = y + 14 * multiplier

depth = obj_construction_tab.depth - 1	//garante que estará sobre

count = 0	//serve para contar os cliques para garantir o bom funcionamento

function insert_data(data)
{
	construction_sprite = data.sprite
	price = data.price
	name = data.name
	
	
	//show_message("nome: " + name + " preco: " + string(price));
}

image_xscale = multiplier
image_yscale = multiplier

visible = false

function test()
{
	show_message(name)
}