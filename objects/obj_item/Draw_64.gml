if on_inventory
{	
	draw_on_inventory(slot)
	depth = obj_small_inventory.depth - 10 
}


draw_text(10, 10, string(x))
draw_text(10, 50, string(y))
/*
draw_text(10, 100, string(subindo))

draw_text(100, 10, string(obj_player.x))
draw_text(100, 50, string(obj_player.y))
*/