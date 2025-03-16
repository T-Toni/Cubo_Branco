//dispara projéti
depth = -y - 8

image_index = 1		//para deixar a animação correta

//cria a bala na posição correta
if orientation == "right"
	var obj = instance_create_layer(x + 23, y + 3, "walls", obj_white_bullet)
else if orientation == "left"
	var obj = instance_create_layer(x, y + 3, "walls", obj_white_bullet)
else if orientation == "up"
	var obj = instance_create_layer(x + 6, y - 5, "walls", obj_white_bullet)
else 
	var obj = instance_create_layer(x + 6, y + 20, "walls", obj_white_bullet)


//atualiza a direção da bala
obj.set_direction(orientation)

//ajusta animação
resting = false
//reseta o alarme
alarm_set(0, attack_speed * steps_per_second)