//se posiciona
body_gap = 5.5
arm_gap = -2

//estados
resting = true
resting_change_count = 0

//taxa de aproximação
approach_rate = 0.4

//taxa de interação
//interaction_speed = 0.6

//range para contar a interação com algum objeto
interaction_range = 16


//controle de interação
target_x = 0
target_y = 0

target_reached = true


//variaveis para as mãos
left_hand = noone
right_hand = noone

//define a velocidade das mãos
interaction_speed = 0.6

//função para criar as mãos
function create_hands()
{
	left_hand = instance_create_layer(x, y, "Instances_1", obj_left_hand);
	right_hand = instance_create_layer(x, y, "Instances_1", obj_right_hand);
}

//função para mover o braço até a posição x
function interact(interaction_speed, hand)
{
	var punch_gap = arm_gap - 4
	if target_reached	//gera a posição do alvo uma unica vez
	{
		
		if point_distance(obj_player.x, obj_player.y + punch_gap, mouse_x, mouse_y) > interaction_range
		{
			var angle = point_direction(obj_player.x, obj_player.y + punch_gap, mouse_x, mouse_y)
			self.target_x = obj_player.x + lengthdir_x(interaction_range , angle)
			self.target_y = obj_player.y + punch_gap + lengthdir_y(interaction_range , angle)
		}
		else
		{
			self.target_x = mouse_x
			self.target_y = mouse_y
		}
		target_reached = false
	}
	
	
    //atualiza a profundidade: 
    hand.depth = -hand.y;
    
    // Verifica colisão no eixo x e define a nova posição x
    hand.x = lerp(hand.x, self.target_x, interaction_speed);

    // Verifica colisão no eixo y e define a nova posição y
    hand.y = lerp(hand.y, self.target_y, interaction_speed);

    // Verifica se o objeto chegou ao destino
    if (point_distance(hand.x, hand.y, self.target_x, self.target_y) < 0.0001) {
		target_reached = true
        hand.resting = true;
    }
	
	//atualiza o sprite do player
	{
	//calcula as distancias separadas por eixo
	var dist_x = abs(target_x - obj_player.x);
	var dist_y = abs(target_y - obj_player.y + punch_gap);	
		
	//define o sprite a partir da maior distancia
	if dist_y > dist_x
	{
		if target_y < obj_player.y + punch_gap	//cima
		{
			obj_player.looking_direction = "up"
		    obj_player.sprite_index = spr_player_up;
			obj_player.image_xscale = 0.5
			obj_player.image_yscale = 0.5
		    obj_player.mov_y = -1;
		}
		else	//baixo
		{
			obj_player.looking_direction = "down"
		    obj_player.sprite_index = spr_player_down_interacting;
			obj_player.image_xscale = 0.5
			obj_player.image_yscale = 0.5
		    obj_player.mov_y = -1;
		}
	}
	else
	{
		obj_player.sprite_index = spr_player_side_interacting;
		obj_player.image_yscale = 0.5
		if target_x < obj_player.x	//esquerda
		{
			obj_player.looking_direction = "left"
		    obj_player.mov_y = -1;
			obj_player.image_xscale = -0.5
		}
		else
		{
			obj_player.looking_direction = "right"
		    obj_player.mov_y = 1;
			obj_player.image_xscale = 0.5
		}
	}
	
	}
}

interactable_obj = obj_parent_interactable
//colisões
// Função para verificar colisões e chamar "interact"
function check_and_interact(x_collision, y_collision, hand) {
    
    var collided_object;

	collided_object = instance_position(target_x, target_y, interactable_obj)

	/*
    //corrige a posição do ponto a ser conferido
    if (obj_player.looking_direction == "right") { // Direção para a direita
        collided_object = instance_position(obj_player.x + x_collision, obj_player.y, interactable_obj);
    } else if (obj_player.looking_direction == "left") { // Direção para a esquerda
        collided_object = instance_position(obj_player.x - x_collision, obj_player.y, interactable_obj);
    } else if (obj_player.looking_direction == "down") { // Direção para baixo
        collided_object = instance_position(obj_player.x, obj_player.y + y_collision, interactable_obj);
    } else if (obj_player.looking_direction == "up") { // Direção para cima
        collided_object = instance_position(obj_player.x, obj_player.y - y_collision, interactable_obj);
    }
	*/
	
    if (collided_object != noone) {
        hand.collided = true
        with (collided_object) {
            if (!is_undefined(collided_object.interact)) {
                collided_object.interact(); // Chama a função "interact" do objeto colidido
            }
        }
    } else {
        hand.collided = false
    }
}


//cria as mãos
self.create_hands()
