// Define o objeto que a câmera seguirá
target = obj_player;

// Obtém as dimensões da câmera
width = camera_get_view_width(view_camera[0]);
height = camera_get_view_height(view_camera[0]);

// Define a posição inicial da câmera
x = target.x;
y = target.y;