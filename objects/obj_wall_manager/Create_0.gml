// Evento Create do obj_wall_manager
built_walls = false;

tile_width = 16;  
tile_height = 16;

// Calcula o tamanho da matriz baseado na sala
cols = room_width div tile_width;  
rows = room_height div tile_height;  

// Cria a matriz com arrays independentes para cada linha 
matrix = array_create(rows); 

for (var i = 0; i < rows; i++) { 
    matrix[i] = array_create(cols, 0); 
}

function is_tile_free(row, col)	//retorna true caso livre
{
	if row > rows - 1 or col > cols - 1 or row < 0 or col < 0	//confere caso esteja fora dos limites
		return false
	
	var value = matrix[row][col] 
	
	if value != 0
		return false
		
	return true
}

// Função para atualizar a matriz
function matrix_update(row, col, value) {
    matrix[row][col] = value;
	
	if instance_number(obj_wall_placer) == 0 
		print_matrix(matrix)
}

// Função otimizada para obter o sprite correto baseado na vizinhança
function get_wall_sprite(row, col) {
    var up = (row > 0 && matrix[row - 1][col] == 1);
    var down = (row < rows - 1 && matrix[row + 1][col] == 1);
    var left = (col > 0 && matrix[row][col - 1] == 1);
    var right = (col < cols - 1 && matrix[row][col + 1] == 1);

    var all_sides = up && down && left && right;
    if (all_sides) {
        return spr_wall_all;
    }
    if (up && down) {
        if (left) return spr_wall_up_down_left;
        if (right) return spr_wall_up_down_right;
        return spr_wall_up_down;
    }
    if (left && right) {
        if (up) return spr_wall_up_left_right;
        if (down) return spr_wall_down_left_right;
        return spr_wall_left_right;
    }
    if (up) {
        if (left) return spr_wall_up_left;
        if (right) return spr_wall_up_right;
        return spr_wall_up;
    }
    if (down) {		
        if (left) return spr_wall_down_left_between;
        if (right) return spr_wall_down_right_between;
        return spr_wall_down;
    }
    if (left) return spr_wall_left;
    if (right) return spr_wall_right;
    return spr_wall;
}


// Função para criar paredes a partir da matriz
function create_walls_from_matrix(matrix) {
    // Percorre a matriz
    for (var row = 0; row < rows; row++) {
        for (var col = 0; col < cols; col++) {
            if (matrix[row][col] == 1) {  // Valor que representa uma parede
                // Calcula a posição no mundo
                var x_pos = col * tile_width;
                var y_pos = row * tile_height;

                // Obtém o sprite correto
                var wall_sprite = get_wall_sprite(row, col);

                // Cria o objeto parede na posição com o sprite correto
                var wall_instance = instance_create_layer(x_pos, y_pos, "walls", obj_wall);
                wall_instance.sprite_index = wall_sprite;
            }
        }
    }
}

// Cria as paredes a partir da matriz
create_walls_from_matrix(matrix);

function print_matrix(matrix) {
    for (var row = 0; row < array_length(matrix); row++) {
        var linha = ""; // Cria uma string para armazenar a linha atual
        for (var col = 0; col < array_length(matrix[row]); col++) {
            linha += string(matrix[row][col]) + " "; // Adiciona o valor atual à string
        }
        show_debug_message (linha); // Exibe a linha no terminal
    }
}
