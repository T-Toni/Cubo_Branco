//VARIÁVEIS
{
//estados
open = false

//dimensões da viewport 
viewport_width = view_get_wport(0)
viewport_height = view_get_hport(0)


//ajuste das coordenadas
y = viewport_height 
x = viewport_width / 10

//ajuste da imagem
multiplier = 10
image_xscale = multiplier; 
image_yscale = multiplier;


//tamanho da abertura
y_gap = 32 * multiplier


//INFORMAÇÕES PARA CLIQUE (colocadas manualmente)
width = 25 * multiplier
//height = 39 * multiplier

}
//DIMENSÕES DOS BOTÕES
{
	
	//área da aba
	{
	tab_x1 = x
	tab_x2 = x + width

	tab_y1 = y - 32 * multiplier / 4
	tab_y2 = y 	//pega a parte superior ao y
	}
	
	//vetor de criação (OBS:  adicionar em grupos de quatro ((la ele)) se não vai dar pau)
	building_options = [
    { 
	sprite: spr_white_turret_right, 
	price: 100, 
	name: "white turret1" 
	},
	{ 
	sprite: spr_white_turret_right, 
	price: 100, 
	name: "white turret2" 
	},
	{ 
	sprite: spr_white_turret_right, 
	price: 100, 
	name: "white turret3" 
	},
	{ 
	sprite: spr_white_turret_right, 
	price: 100, 
	name: "white turret4" 
	},

    // ...adicionar demais construções
	];
	
}


//FUNÇÃO PARA CONFERIR SE O MOUSE ESTÁ SOBRE AREA NA !!TELA!!
function is_inside(x1, x2, y1, y2)
{
	//posições do mouse em relação a tela
	var mx = device_mouse_x_to_gui(0);
	var my = device_mouse_y_to_gui(0);
	
	if (mx > x1 &&  mx < x2)
	{
	   if (my > y1 && my < y2) 
	   {
		   return true
	   }
   }
   return false
}

//cria os objetos de cada tab
function create_construction_tab(_build1, _build2, _build3, _build4) {
	
	var multiplier = self.multiplier
	var x_gap = 11*multiplier
	var y_gap = 15*multiplier
	
	//cria struct com os objetos
    var tab = {
        construcao1: instance_create_layer(self.x + 2*multiplier, self.y + multiplier - self.y_gap, "UI", obj_constructions),
        construcao2: instance_create_layer(self.x + 2*multiplier + x_gap, self.y + multiplier - self.y_gap, "UI", obj_constructions),
        construcao3: instance_create_layer(self.x + 2*multiplier, self.y + multiplier + y_gap - self.y_gap, "UI", obj_constructions),
        construcao4: instance_create_layer(self.x + 2*multiplier + x_gap, self.y + multiplier + y_gap - self.y_gap, "UI", obj_constructions),
    };
	
	//adiciona o valor aos objetos
	tab.construcao1.insert_data(_build1)
	tab.construcao2.insert_data(_build2)
	tab.construcao3.insert_data(_build3)
	tab.construcao4.insert_data(_build4)
	
	return tab
}

function update_constructions_pos(tab_number)		//pode ser otimizado 
{
	
	if open
	{
		for (var i=0; i<array_length(tabs); i++)
		{
			if i == tab_number
			{
				//show_message(string(tabs[i].construcao4.visible))
				tabs[i].construcao1.visible = true
				tabs[i].construcao2.visible = true
				tabs[i].construcao3.visible = true
				tabs[i].construcao4.visible = true
				//show_message(string(tabs[i].construcao4.visible))
			}
		}
	}
	else
	{
		for (var i=0; i<array_length(tabs); i++)
		{
			if i == tab_number
			{
				tabs[i].construcao1.visible = false
				tabs[i].construcao2.visible = false
				tabs[i].construcao3.visible = false
				tabs[i].construcao4.visible = false
			}
		}
	}
	
		
	//implentação antiga e cringe
	{
	/*
	if open
	{
		for (var i=0; i<array_length(tabs); i++)
		{
			tabs[i].construcao1.y -= y_gap
			tabs[i].construcao2.y -= y_gap
			tabs[i].construcao3.y -= y_gap
			tabs[i].construcao4.y -= y_gap
			
			tabs[i].construcao1.y2 -= y_gap
			tabs[i].construcao2.y2 -= y_gap
			tabs[i].construcao3.y2 -= y_gap
			tabs[i].construcao4.y2 -= y_gap
		}
	}
	else
	{
		for (var i=0; i<array_length(tabs); i++)
		{
			tabs[i].construcao1.y += y_gap
			tabs[i].construcao2.y += y_gap
			tabs[i].construcao3.y += y_gap
			tabs[i].construcao4.y += y_gap
			
			tabs[i].construcao1.y2 += y_gap
			tabs[i].construcao2.y2 += y_gap
			tabs[i].construcao3.y2 += y_gap
			tabs[i].construcao4.y2 += y_gap
		}
	}
	*/
	}
}

tabs = []	//guarta todas as opções de construção em gfpos de 4

//função para criar as opções de construção
function create_construction_options(building_options)
{
	var tamanho = array_length(building_options);
	
	for (var i = 0; i < tamanho / 4; i++)
	{
		var new_tab = create_construction_tab(
		building_options[0 + i * 4],
		building_options[1 + i * 4],
		building_options[2 + i * 4],
		building_options[3 + i * 4]
		)
		
		array_push(tabs, new_tab)
	}
	
	//show_message("criados")
}

function make_visible(tab_number)
{
	//percorre todo o vetor tabs tornando os itens desejados visiveis e os demais insiviveis
	for (var i=0; i<array_length(tabs); i++)
	{
		if i == tab_number
		{
			tabs[i].construcao1.visible = true
			tabs[i].construcao2.visible = true
			tabs[i].construcao3.visible = true
			tabs[i].construcao4.visible = true
		}
		else
		{
			tabs[i].construcao1.visible = false
			tabs[i].construcao2.visible = false
			tabs[i].construcao3.visible = false
			tabs[i].construcao4.visible = false
		}
	}
}


//executa a função
create_construction_options(building_options)