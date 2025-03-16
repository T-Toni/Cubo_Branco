var movX = 0
var movY = 0

depth = -y

//caso tenha colidido
if collided
{
	if image_index == sprite_get_number(sprite_index) - 1
	instance_destroy(self);
}
else
{
	image_index = 0 //inibe a animação
	
	//detecta colisão
	var collided_obj = instance_place(x + move_speed, y, obj_parent_interactable)

	if collided_obj
	{
		collided_obj.interact(true)
		collided = true
		/*
		if !is_undefined(collided_obj.interact()) // confere se a função existe
		{
			collided_obj.interact(true);
			instance_destroy(self);
		}
		*/
	}

	//destroi caso limite de distancia atingido
	if travaled_distance > max_distance
		collided = true


	//aplica a movimentação
	if atk_direction == "right"
	{
		movX += move_speed	
	}
	else if atk_direction == "left"
	{
		movX -= move_speed
	}
	else if atk_direction == "up"
	{
		movY -= move_speed
	}
	else if atk_direction == "down"
	{
		movY += move_speed
	}

	travaled_distance += move_speed	//atualiza a distancia percorrida

	//atribui o movimento
	x += movX
	y += movY

}