//atualiza a profunidade
depth = -y;

//atualiza se está interagindo ou não 
if !obj_left_hand.resting or !obj_right_hand.resting
{
	interacting = true
}
else
{
	interacting = false
}

// Inicializa variáveis de movimento
var mov_x = 0;
var mov_y = 0;



// Checa as teclas pressionadas e define os vetores de movimento
if !interacting
{
if (obj_input_manager.up_pressed()) {
	looking_direction = "up"
    sprite_index = spr_player_up;
	image_xscale = 0.5
	image_yscale = 0.5
    mov_y = -1;
}
if (obj_input_manager.down_pressed()) {
	looking_direction = "down"
	if interacting
		sprite_index = spr_player_down_interacting
	else
		sprite_index = spr_player_down;
	image_xscale = 0.5
	image_yscale = 0.5
    mov_y = 1;
}
if (obj_input_manager.left_pressed()) {
	looking_direction = "left"
	if interacting
		sprite_index = spr_player_side_interacting
	else
		sprite_index = spr_player_side;
		
    mov_x = -1;
	image_yscale = 0.5
    image_xscale = -0.5;
}
if (obj_input_manager.right_pressed()) {
    looking_direction = "right"
	if interacting
		sprite_index = spr_player_side_interacting
	else
		sprite_index = spr_player_side;	
    mov_x = 1;
	image_xscale = 0.5
	image_yscale = 0.5
}
}

// Normaliza o vetor de movimento se necessário
if (mov_x != 0 || mov_y != 0) {
    var magnitude = sqrt(mov_x * mov_x + mov_y * mov_y);
    mov_x /= magnitude;
    mov_y /= magnitude;
}

// Evento de Colisão 
{
if place_meeting(x + mov_x * velocidade, y, collidable_objs) 
{
	//confere se ja colidiu pixelperfect
	if !place_meeting(x + mov_x, y, collidable_objs) 
	{
		x += mov_x	//incrementa 1 toda vez que entrar até a colisão estar perfeita
	}
	//confere MAIS PERFECT EITA PORRA
	else
	{
		if !place_meeting(x + mov_x/10, y, collidable_objs) 
		{
			x += mov_x/10	//incrementa 0.1 toda vez que entrar até a colisão estar perfeita
		}
	}
    mov_x = 0; // Bloqueia o movimento no eixo X
}
if place_meeting(x, y + mov_y * velocidade, collidable_objs)
{
	//confere se ja colidiu pixelperfect
	if !place_meeting(x, y + mov_y, collidable_objs) 
	{
		y += mov_y	//incrementa 1 toda vez que entrar até a colisão estar perfeita
	}
	//confere MAIS PERFECT EITA PORRA
	else
	{
		if !place_meeting(x, y + mov_y/10, collidable_objs) 
		{
			y += mov_y/10	//incrementa 0.1 toda vez que entrar até a colisão estar perfeita
		}
	}
    mov_y = 0; // Bloqueia o movimento no eixo Y
}
}


//INTERAÇÃO

if interacting == true
{
	mov_x = 0
	mov_y = 0
}

// Move o personagem com base na velocidade ajustada
x += mov_x * velocidade;
y += mov_y * velocidade;


if !construction_mode
{
	//COM ERROS
	/*
	if obj_input_manager.interact_pressed()
	{
		if looking_direction = "right"
		{
			sprite_index = spr_player_side_interacting
			image_xscale = 0.5;
		}
		if looking_direction = "left"
		{
			sprite_index = spr_player_side_interacting
			image_xscale = -0.5;
		}
		if looking_direction = "down"
		{
			sprite_index = spr_player_down_interacting
		}
	}
	else
	if obj_input_manager.interact_released() and !interacting
	{
		if looking_direction = "right"
		{
			sprite_index = spr_player_side
			image_xscale = 0.5;
		}
		if looking_direction = "left"
		{
			sprite_index = spr_player_side
			image_xscale = -0.5;
		}
		if looking_direction = "down"
		{
			sprite_index = spr_player_down
		}
	}
	*/
}
else
{
	if obj_to_build 
	{
		if instance_number(obj_to_build) == 0
		{
			instance_create_layer(0, 0, "UI", obj_to_build)
		}
	}
	else
	{
		construction_mode = false
	}
}
	
//atualiza as coordenadas em relação a matriz
tiled_x = x div obj_cubo_branco.tile_size
tiled_y = y div obj_cubo_branco.tile_size

