extends MeshInstance2D

func set_size(radius : float):
	mesh.radius = radius
	mesh.height = radius * 2
