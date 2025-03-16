//constroi o objeto

if colour == c_green
{
	//tira o valor do objeto da carteira
	obj_carteira_RB.quantidade -= price
	
	//cria o objeto real
	var obj = instance_create_layer(x, y, "constructions", obj_to_build)
	//atualiza a orientação do objeto real
	obj.set_orientation(orientation)
	
	//atualiza a matriz
	update_matrix()

	//cancela o modo de construção, atualiza "obj_to_build" e se destroi
	obj_player.construction_mode = false
	obj_player.obj_to_build = noone
	instance_destroy(self)
}
