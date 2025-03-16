//clique do mouse

if is_inside(tab_x1, tab_x2, tab_y1, tab_y2)
{
	
	if (mouse_check_button_pressed(mb_left)) {  
		if open
		{
			open = false
			y = viewport_height 
			tab_y1 += y_gap
			tab_y2 += y_gap
			update_constructions_pos(0)
		}
		else
		{
			open = true
			y = viewport_height - y_gap
			tab_y1 -= y_gap
			tab_y2 -= y_gap
			update_constructions_pos(0)
		}	 		
	}
}



