extends Node2D

@export var clack_ball_spawn_1 : Node2D
@export var clack_ball_spawn_2 : Node2D

var default_clack_ball = preload("res://Clack Ball/clack_ball.tscn")

func _ready() -> void:
	var spawns = [clack_ball_spawn_1, clack_ball_spawn_2]
	var clack_balls = [default_clack_ball.instantiate(), default_clack_ball.instantiate()]
	for i in spawns.size():
		clack_balls[i].position = spawns[i].position
		add_child(clack_balls[i])
