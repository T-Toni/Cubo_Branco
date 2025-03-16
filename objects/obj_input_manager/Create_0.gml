
//datermina aqui quais os botões de todas as ações
b_interact = mb_left


b_up = "W"
b_down = "S"
b_left = "A"
b_right = "D"

//interação
function interact_pressed()
{
	return mouse_check_button_pressed(self.b_interact)
}

function interact_released()
{
	return mouse_check_button_released(self.b_interact)
}

//moviment
function up_pressed()
{
	return keyboard_check(ord(b_up))
}

function down_pressed()
{
	return keyboard_check(ord(b_down))
}
function left_pressed()
{
	return keyboard_check(ord(b_left))
}
function right_pressed()
{
	return keyboard_check(ord(b_right))
}
















