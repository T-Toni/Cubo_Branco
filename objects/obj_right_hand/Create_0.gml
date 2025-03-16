resting = true
resting_change_count = 0

//confere se a mão colidiu com algo
collided = false

/*
//se posiciona
body_gap = 5
arm_gap = 5

//estados
resting = true
resting_change_count = 0

//movimento

//taxa de aproximação
approach_rate = 0.7;

//taxa de interação
//interaction_speed = 0.6

//range para contar a interação com algum objeto
interaction_range = 4

//confere se a mão colidiu com algo
collided = false


//função para mover o braço até a posição x
function interact(target_x, target_y, interaction_speed)
{
	//atualiza a profundidade: 
	depth = -y;
	
    // Verifica colisão no eixo x e define a nova posição x
    x = lerp(x, target_x, interaction_speed);

    // Verifica colisão no eixo y e define a nova posição y
    y = lerp(y, target_y, interaction_speed);

    // Verifica se o objeto chegou ao destino
    if (x == target_x and y == target_y) {
        resting = true;
	}

	
}


//colisões
// Função para verificar colisões e chamar "interact"
function check_and_interact(x_collision, y_collision) {
	
    var collided_object;

	//corrige a posição do ponto a ser conferido
	if (obj_player.looking_direction == "right") { // Direção para a direita
	    collided_object = instance_position(x + x_collision, y, obj_wall);
	} else if (obj_player.looking_direction == "left") { // Direção para a esquerda
	    collided_object = instance_position(x - x_collision, y, obj_wall);
	} else if (obj_player.looking_direction == "down") { // Direção para baixo
	    collided_object = instance_position(x, y + y_collision, obj_wall);
	} else if (obj_player.looking_direction == "up") { // Direção para cima
	    collided_object = instance_position(x, y - y_collision, obj_wall);
	}

		
    if (collided_object != noone) {
		collided = true
        with (collided_object) {
            if (!is_undefined(collided_object.interact)) {
                collided_object.interact(); // Chama a função "interact" do objeto colidido
            }
        }
    }
	else
	{
		collided = false
	}
}
*/