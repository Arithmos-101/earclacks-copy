extends Area2D
class_name ClackBallHurtArea

@export var clack_ball_hurt_box : CollisionShape2D

func set_size(radius : float) -> void:
	clack_ball_hurt_box.shape.radius = radius
