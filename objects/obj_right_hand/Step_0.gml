/*
//codigo para estado em repouso
if resting 
{

	if obj_player.looking_direction == "left"
	{
	    x = lerp(x, obj_player.x - body_gap + 1, approach_rate);
	    y = lerp(y, obj_player.y + arm_gap, approach_rate);
	    depth = obj_player.depth + 1;
	}

	if obj_player.looking_direction == "right"
	{
	    x = lerp(x, obj_player.x - body_gap , approach_rate);
	    y = lerp(y, obj_player.y + arm_gap, approach_rate);
	    depth = obj_player.depth - 1;
	}

	if obj_player.looking_direction == "up"
	{								
	    x = lerp(x, obj_player.x + body_gap, approach_rate);
	    y = lerp(y, obj_player.y + arm_gap, approach_rate);
	    depth = obj_player.depth + 1;
	}

	if obj_player.looking_direction == "down"
	{								//um a mais por assimetria do player
	    x = lerp(x, obj_player.x - body_gap + 1 , approach_rate);
	    y = lerp(y, obj_player.y + arm_gap, approach_rate);
	    depth = obj_player.depth - 1;
	}
}
else
{
	self.interact(obj_player.target_x, obj_player.target_y, obj_player.interaction_speed)
	self.check_and_interact(interaction_range, interaction_range);
}
*/