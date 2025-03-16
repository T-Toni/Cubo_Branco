x = obj_player.x
y = obj_player.y

if hat
{
	if obj_player.direction == "down"
	{
		hat.sprite_index = 0
	}
	if obj_player.direction == "right"
	{
		
		hat.sprite_index = 1
	}
	//pass
	
}

hat = spr_cubo_branco

draw()