//faz com que as suas coordenadas sejam as mesmas do mouse

image_index = 0

var mx = device_mouse_x(0);
var my = device_mouse_y(0);

tiled_x = mx div tile_size
tiled_y = my div tile_size

x = tiled_x * tile_size
y = tiled_y * tile_size

//depth = -y
