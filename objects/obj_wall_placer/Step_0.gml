rad = obj_wall_manager
if instance_exists(rad)
{
	rad.matrix_update(row, col, value);
}

//se mata
instance_destroy(self)