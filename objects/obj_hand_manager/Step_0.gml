

//controle das mãos, pode ser otimizado
{

//código para controlar a mão direita
if right_hand.resting 
{
    if obj_player.looking_direction == "left"
    {
        right_hand.x = lerp(right_hand.x, obj_player.x + body_gap, approach_rate);
        right_hand.y = lerp(right_hand.y, obj_player.y + arm_gap, approach_rate);
        right_hand.depth = obj_player.depth + 1;
    }

    if obj_player.looking_direction == "right"
    {
        right_hand.x = lerp(right_hand.x, obj_player.x + body_gap , approach_rate);
        right_hand.y = lerp(right_hand.y, obj_player.y + arm_gap, approach_rate);
        right_hand.depth = obj_player.depth + 1;
    }

    if obj_player.looking_direction == "up"
    {                               
        right_hand.x = lerp(right_hand.x, obj_player.x - body_gap , approach_rate);
        right_hand.y = lerp(right_hand.y, obj_player.y + arm_gap, approach_rate);
        right_hand.depth = obj_player.depth - 1;
    }

    if obj_player.looking_direction == "down"
    {
        right_hand.x = lerp(right_hand.x, obj_player.x + body_gap, approach_rate);
        right_hand.y = lerp(right_hand.y, obj_player.y + arm_gap, approach_rate);
        right_hand.depth = obj_player.depth + 1;
    }
}
else
if right_hand != noone
{
    interact(interaction_speed, right_hand)
    check_and_interact(interaction_range, interaction_range, right_hand);
}

//código para controlar a mão esquerda
if left_hand.resting 
{
    if obj_player.looking_direction == "left"
    {
        left_hand.x = lerp(left_hand.x, obj_player.x - body_gap, approach_rate);
        left_hand.y = lerp(left_hand.y, obj_player.y + arm_gap, approach_rate);
        left_hand.depth = obj_player.depth + 1;
    }

    if obj_player.looking_direction == "right"
    {
        left_hand.x = lerp(left_hand.x, obj_player.x - body_gap, approach_rate);
        left_hand.y = lerp(left_hand.y, obj_player.y + arm_gap, approach_rate);
        left_hand.depth = obj_player.depth + 1;
    }

    if obj_player.looking_direction == "up"
    {                               //um a mais por assimetria do player
        left_hand.x = lerp(left_hand.x, obj_player.x + body_gap, approach_rate);
        left_hand.y = lerp(left_hand.y, obj_player.y + arm_gap, approach_rate);
        left_hand.depth = obj_player.depth - 1;
    }

    if obj_player.looking_direction == "down"
    {
        left_hand.x = lerp(left_hand.x, obj_player.x - body_gap, approach_rate);
        left_hand.y = lerp(left_hand.y, obj_player.y + arm_gap, approach_rate);
        left_hand.depth = obj_player.depth + 1;
    }
}
else
if left_hand != noone
{
    interact(interaction_speed, left_hand)
    check_and_interact(interaction_range, interaction_range, left_hand);
}

}

//conntrole da interação
{	
if obj_input_manager.interact_pressed()
{	

	var hand = noone
	
	//escolhe a mão
	if left_hand.resting
	{
		hand = left_hand
		//descansa a outra mão
		right_hand.resting = true
		target_reached = true
	}
	else
	{
		hand = right_hand
		//descansa a outra mão
		left_hand.resting = true
		target_reached = true
	}
	
	var height_gap = 4
	
	/*
	//bate na direção onde o player clicou dentro de um range
	target_x = obj_player.x
	target_y = obj_player.y - height_gap
	*/
	   
	/*
	//define a posição da interação baseado na direção do personagem
	if obj_player.looking_direction == "right"
		target_x = obj_player.x + interaction_range
	else if obj_player.looking_direction == "left"
		target_x = obj_player.x - interaction_range
	else if obj_player.looking_direction == "up"
		target_y = obj_player.y - interaction_range - height_gap
	else if obj_player.looking_direction == "down"
		target_y = obj_player.y + interaction_range - height_gap
	*/

		
	//move o braço
	hand.resting = false
	hand.resting_change_count += 1
}

}