// Verifica se o alvo existe
if not instance_exists(target) exit;

// Suaviza o movimento da câmera ao centralizar no alvo
x = lerp(x, target.x, 0.3);
y = lerp(y, target.y, 0.3);

// Centraliza a câmera no alvo
camera_set_view_pos(view_camera[0], x - width / 2, y - height / 2);
