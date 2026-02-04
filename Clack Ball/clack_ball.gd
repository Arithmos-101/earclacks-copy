extends Node2D

@export var ball_radius := 5.0
@export var weight := 1.0
@export var gravity := 1.0

@export var clack_ball_mesh : MeshInstance2D
@export var clack_ball_collision : ClackBallCollider 

func _ready() -> void:
	clack_ball_mesh.set_size(ball_radius)
