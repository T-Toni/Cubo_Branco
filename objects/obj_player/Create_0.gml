velocidade = 1.2  //obs: quando existem casas decimais a colisão fica com a quantidade decimal de distancia 
				//para numeros inteiros fica perfeito
				
interacting = false

//para a colisão
collided_right = false
collided_left = false
collided_up = false
collided_down = false

//para interação
target_x = 0
target_y = 0

interaction_range = 8
interacted = false
looking_direction = "right"


//cria as mãos (hand_manager)
hand_manager = instance_create_layer(x, y, "Instances_1", obj_hand_manager);

/*
var left_hand = instance_create_layer(x, y, "Instances_1", obj_left_hand);
var right_hand = instance_create_layer(x, y, "Instances_1", obj_right_hand);
*/

//define a velocidade das mãos
interaction_speed = 0.6

top_interaction_speed = 2	//limite de velocidade



//modo de construção
construction_mode = false
obj_to_build = noone


//lista de objetos com colisão
//collidable_objs = [obj_wall, obj_cubo_branco, obj_white_turret]	
collidable_objs = [obj_parent_interactable]	

//posições no tile
tiled_x = 0
tiled_y = 0

//correção
image_xscale = 0.5
image_yscale = 0.5
